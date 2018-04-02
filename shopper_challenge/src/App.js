import React, { Component } from "react";
import styled from "styled-components";

import ApplicantForm from "./ApplicantForm";

const AppContainer = styled.div`
  width: 100%;
`;

class App extends Component {
  render() {
    return (
      <AppContainer>
        <ApplicantForm />
      </AppContainer>
    );
  }
}

export default App;
