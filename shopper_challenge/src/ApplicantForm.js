import React, { Component } from "react";
import styled from "styled-components";

import Form from "./Form";
import WelcomePage from "./WelcomePage";

const Container = styled.div`
  display: flex;
  justify-content: center;

  margin: 50px auto;

  width: 500px;
  min-height: 300px;

  background-color: white;
  border-radius: 4px;
`;

class ApplicantForm extends Component {
  constructor(props) {
    super(props);

    this.state = {
      stateOfApplicationProcess: "applying",
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      zipCode: ""
    }
  }

  updateProcessingStatus(status) {
    this.setState({
      stateOfApplicationProcess: status
    });
  }

  determineCurrentView() {
    switch(this.state.stateOfApplicationProcess) {
      case "applying": {
        return <Form
          {...this.state}
          handleInputChange={(attribute, input) => this.updateAttribute(attribute, input)}
        />
      }

      default: {
        return <WelcomePage
          handleProcessingStatusChange={(status) => this.updateProcessingStatus(status)}
        />
      }
    }
  }

  updateAttribute(attribute, input) {
    this.setState({
      [attribute]: input
    });
  }

  render() {
    return (
      <Container>
        {this.determineCurrentView()}
      </Container>
    );
  }
}

export default ApplicantForm;
