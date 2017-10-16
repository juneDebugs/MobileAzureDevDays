
import { Container, Header, Content, Footer, Title, Button, Spinner } from 'native-base';
import React, { Component } from 'react';
import { StyleSheet, Text, TextInput, View } from 'react-native';
import config from './config';
import Prompt from 'react-native-prompt';

import Analytics from "mobile-center-analytics";
import Crashes from "mobile-center-crashes";

export default class SentimentApp extends Component {
  constructor(props) {
    super(props);

    // add in to test crash reports with mobile centre
    //Crashes.generateTestCrash();
    
    this.state = { text: '', emoji: '' };
    this.onPressLearnMore = this.onPressLearnMore.bind(this);
  }

  componentWillMount() {
    Analytics.trackEvent("app.js - componentWillMount", {});

    this.setState({
      text: '',
      bgColor: '#FF6F69',
      emoji: '',
      busy: false,
    });
  }

  onPressLearnMore() {
    Analytics.trackEvent("app.js - onPressLearnMore", {});

    this.setState({busy: true});

    var data = {
      "documents": [
        {
          "language": "en",
          "id": "text input placeholder",
          "text": this.state.text
        }
      ]
    };

    return fetch('https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': config.key,
      },
      body: JSON.stringify(data)
    })
      .then((response) => response.json())
      .then((responseJson) => {
        var score = responseJson.documents[0].score;
        this.setState({
          bgColor: this.getBackgroundColor(score),
          emoji: this.getEmoji(score),
        });
      })
      .catch((error) => {
        console.log(error);
      })
      .finally(() => this.setState({busy: false}));
  }

  getEmoji(score) {
    Analytics.trackEvent("app.js - getEmoji", { Score: score });

    if (score < 0.4) {
      return '🙁';
    } else if (score <= 0.6) {
      return '😐';
    } else /* score > 0.6 */ {
      return '😃';      
    }
  }

  getBackgroundColor(score) {
    Analytics.trackEvent("app.js - getBackgroundColor", { Score: score });

    if (score < 0.2) {
      return '#7F1437';
    } else if (score < 0.3) {
      return '#B01C41';
    } else if (score < 0.4) {
      return '#CC2C66';
    } else if (score <= 0.6 /* neutral is 0.4 - 0.6 inclusive */) {
        return '#3D81DF';
    } else if (score < 0.8) {
      return '#208946';
    } else if (score < 0.9) {
      return '#2E9C5F';
    } else if (score < 1) {
      return '#31C774';
    } else /* score == 1, seems unlikely */ {
      return '#29EB94';    
    }
  }

  render() {
    Analytics.trackEvent("app.js - render", {});

    let emojiOrLoading;
    if (!this.state.busy) {
      emojiOrLoading = (
        <View style={styles.emoji}>
          <Text style={{ flex: 1, textAlign: 'center', fontSize: 90 }}>
            {this.state.emoji}
          </Text>
        </View>
      );
    } else {
      emojiOrLoading = (
        <View style={styles.busyContainer}>
          <Spinner color='white' />
          <Text style={styles.busyText}>Calculating Sentiment...</Text>
        </View>
      );
    }

    return (
      <Container style={{
        backgroundColor: this.state.bgColor, flex: 1,
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center'
      }}>

        <Content style={{ flex: 1 }}>
          <Text style={styles.title}>Sentiment</Text>
          <View style={styles.textBorderStyle}>
            <TextInput
              style={styles.textarea}
              onChangeText={(text) => this.setState({ text })}
            />
          </View>
          
          <Button bordered light
            onPress={this.onPressLearnMore}
            style={styles.submit}
            disabled={this.state.busy}
          >
            <Text style={{ color: 'white', textAlign: 'center', flex: 1 }}>Submit</Text>
          </Button>
          {emojiOrLoading}
        </Content>

        <Prompt
          title="Enter analytics subscription key."
          placeholder="key"
          visible={true}
          onCancel={() => this.setState({ promptVisible: false, message: "You cancelled" })}
          onSubmit={(value) => { 
            config.key = value; 
          }}/>
      </Container>
    );
  }
}

const styles = StyleSheet.create({
  title: {
    fontSize: 30,
    color: 'white',
    textAlign: 'center',
    padding: 50,
    fontFamily: 'Courier',
  },
  textBorderStyle: {
    flex: 1,
    justifyContent: 'center',
    borderWidth: 1,
    borderStyle: 'solid',
    borderColor: '#ccc',
    borderRadius: 10,
    height: 120,
    width: 300,
    backgroundColor: 'white',
  },
  textarea: {
    fontFamily: 'Courier',
    fontSize: 15,
    padding: 20,
    color: 'black'
  },
  submit: {
    alignSelf: 'flex-start',
    justifyContent: 'center',
    alignItems: 'center',
    flex: 1,
    marginTop: 20,
    borderColor: 'white',
    borderWidth: 1,
  },
  emoji: {
    padding: 10
  },
  busyContainer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  busyText: {
    textAlign: 'center',
    color: 'white',
  },
});
