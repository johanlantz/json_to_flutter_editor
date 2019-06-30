
const firstPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xFF000000,
        "title": {
          "Text": {"data": "This is page 1."}
        }
      }
    },
    "body": {
      "Center": {
        "child": {
          "Column": {
            "mainAxisAlignment": "MainAxisAlignment.start",
            "children": [
              {
                "Text": {"data": "Hi there"}
              },
              {
                "Text": {
                  "textAlign": "TextAlign.right",
                  "data": "this is a right aligned text (but using min space so align not visible)"}
              },
              {
                "TextField": {"key": "a key for the textfield"}
              },
              {
                "Checkbox": {
                  "key": "checkbox1",
                }
              },
              {
                "ExternalWidget": {},
              },
              {
                "Radio": {"value": 1, "groupValue": "RadioGroup1Key"}
              },
              {
                "Radio": {"value": 2, "groupValue": "RadioGroup1Key"}
              },
              {
                "Radio": {"value": 3, "groupValue": "RadioGroup1Key"}
              },
              {
                "Align": {
                  "alignment": "Alignment.centerLeft",
                  "child": {
                    "Container": {
                      "color": 0xFFFF0000,
                      "child": {
                        "Text": {
                          "data": "child in container in Align widget"
                        }
                      }
                    }
                  }
                }
              },
              {
                "RaisedButton": {
                  "onPressed": {
                    "actions": [
                      {"type": "submit"},
                      {
                        "type": "navigate",
                        "data": {
                          "destination": "secondPage",
                          "setAsRoot": false
                        }
                      },
                    ]
                  },
                  "child": {
                    "Text": {"data": "Submit"}
                  }
                }
              }
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "secondPage", "setAsRoot": true}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe145}
        }
      }
    }
  }
};

const secondPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 2"}
        }
      }
    },
    "body": {
      "Center": {
        "child": {
          "Column": {
            "mainAxisAlignment": "MainAxisAlignment.end",
            "children": [
              {
                "Text": {"data": "there"}
              },
              {
                "Text": {"data": "there2"}
              },
               {
                "TextField": {"key": "a key for the textfield on page2"}
              },
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "thirdPage", "setAsRoot": false}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};

const thirdPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 3"}
        }
      }
    },
    "body": {
      "Center": {
        "child": {
          "Row": {
            "mainAxisAlignment": "MainAxisAlignment.start",
            "children": [
              {
                "Text": {"data": "Row child 1"}
              },
              {
                "Text": {"data": "Row child 2"}
              }
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "fourthPage", "setAsRoot": false}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};

const fourthPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 4"}
        }
      }
    },
    "body": {
      "Center": {
        "child": {
          "Column": {
            "mainAxisAlignment": "MainAxisAlignment.start",
            "children": [
              {
                "Expanded": {
                  "child": {
                    "Text": {"data": "This is an expanded text"}
                  }
                }
              },
              {
                "Text": {"data": "This is a text that gets whats left"}
              }
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "fifthPage", "setAsRoot": false}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};


const fifthPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 5 Container"}
        }
      }
    },
    "body": {
      "Center": {
        "child": {
          "Column": {
            "mainAxisAlignment": "MainAxisAlignment.start",
            "children": [
              {
                "Container": {
                  "color": 0xFFFF0000,
                  "child": {
                    "Text": {"data": "This is inside a container with no sizes"}
                  }
                }
              },
              {
                "Container": {
                  "color": 0xFFFF0000,
                  "width": 20,
                  "height": 20,
                  "child": {
                    "Text": {"data": "This is inside a container with width and height"}
                  }
                }
              },
              {
                "Container": {
                  "color": 0xFFFF0000,
                  "margin": {
                    "EdgeInsets": {
                      "all": 50
                    }
                  },
                  "child": {
                    "Text": {"data": "This is inside a container with margin"}
                  }
                }
              },
               {
                "Container": {
                  "color": 0xFFFF0000,
                  "padding": {
                    "EdgeInsets": {
                      "all": 50
                    }
                  },
                  "child": {
                    "Text": {"data": "This is inside a container with padding"}
                  }
                }
              },
            ]
          }
        }
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "sixthPage", "setAsRoot": false}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};

const sixthPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 6 Container"}
        }
      }
    },
    "body": {
      "Column": {
        "children": [
          {
            "Expanded": {
              "child": {
                "TouchRecorder": {}
              }
            }
          }
        ]
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {"destination": "seventhPage", "setAsRoot": false}
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};

const seventhPage = {
  "Scaffold": {
    "appBar": {
      "AppBar": {
        "backgroundColor": 0xCC000000,
        "title": {
          "Text": {"data": "This is page 7 Container"}
        }
      }
    },
    "body": {
      "Column": {
        "children": [
          {
            "Expanded": {
              "child": {
                "TouchRecorder": {}
              }
            }
          }
        ]
      }
    },
    "floatingActionButton": {
      "FloatingActionButton": {
        "tooltip": "this is a tooltip",
        "onPressed": {
          "actions": [
            {
              "type": "navigate",
              "data": {
                "destination": "nativePage3",
                "eject": true
              }
            },
          ]
        },
        "child": {
          "Icon": {"codePoint": 0xe146}
        }
      }
    }
  }
};
