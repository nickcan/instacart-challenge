import React, { Component } from "react";
import styled from "styled-components";

const WelcomeContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
`;

const ApplyButton = styled.div`
  padding: 10px 0;
  width: 100%;
  background-color: green;
  border-radius: 5px;
  text-align: center;
  cursor: pointer;
`;

class Welcome extends Component {
  render() {
    return (
      <WelcomeContainer>
        <h2>Get Paid to Shop for Instacart</h2>
        <ApplyButton
          onClick={() => this.props.handleProcessingStatusChange("applying")}
        >
          Apply Now
        </ApplyButton>
      </WelcomeContainer>
    );
  }
}

export default Welcome;
