import React from 'react';

class Calculator extends React.Component {
  constructor() {
    super();
    this.state = {result: 0 , num1: "", num2: "" }
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
  }

  setNum1(e){
    parseInt(e.target.value);
    this.setState({ num1 });
  }

  setNum2(e){
    parseInt(e.target.value);
    this.setState({ num2 });
  }

  add(e){
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }


  render() {
    const {num1, num2, result} = this.state; 
    return (
      <div>
        <h1> we out here fr </h1> 
        <h1>{ result } </h1> 
        <input onChange={this.setNum1} value={num1}/>
        <input onChange={this.setNum2} value={num2}/>
        <button onClick={this.add}> + </button>
      </div>
    );
  }
}



export default Calculator;