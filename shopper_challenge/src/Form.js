import React, { Component } from "react";
import styled from "styled-components";

const FormContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
`;

const InputField = styled.input`
  width: 100%;
  margin-bottom: 10px;
`;

class Form extends Component {
  render() {
    return (
      <FormContainer>
        <label>First Name:</label>
        <InputField
          value={this.props.firstName}
          onChange={(event) => this.props.handleInputChange("firstName", event.target.value)}
        />
        <label>Last Name:</label>
        <InputField
          value={this.props.lastName}
          onChange={(event) => this.props.handleInputChange("lastName", event.target.value)}
        />
        <label>Email:</label>
        <InputField
          type="email"
          value={this.props.email}
          onChange={(event) => this.props.handleInputChange("email", event.target.value)}
        />
        <label>Phone:</label>
        <InputField
          value={this.props.phone}
          onChange={(event) => this.props.handleInputChange("phone", event.target.value)}
        />
        <label>Zip Code:</label>
        <InputField
          value={this.props.zipCode}
          onChange={(event) => this.props.handleInputChange("zipCode", event.target.value)}
        />
      </FormContainer>
    );
  }
}

export default Form;

