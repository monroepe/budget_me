categories = Category.create([{name: "Bills"}, {name: "Food/Groceries"}, {name: "Clothes"}, {name: "Transportation"}, {name: "Recreation"}, {name: "Pay"}, {name: "Other"}])
transactions = Transaction.create([
                                    { name: "Rent",
                                      amount: -1600,
                                      description: "Gotta pay rent",
                                      category_id: 1,
                                      date: DateTime.parse("01/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Internet",
                                      amount: -55,
                                      description: "High speed",
                                      category_id: 1,
                                      date: DateTime.parse("03/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Lunch",
                                      amount: -8.50,
                                      description: "Lunch special",
                                      category_id: 2,
                                      date: DateTime.parse("02/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Paycheck",
                                      amount: 2000,
                                      category_id: 6,
                                      date: DateTime.parse("11/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Toothpaste",
                                      amount: -2,
                                      category_id: 2,
                                      date: DateTime.parse("10/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Gas",
                                      amount: -45,
                                      description: "Should have taken the T",
                                      category_id: 4,
                                      date: DateTime.parse("18/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Oil change",
                                      amount: -25,
                                      category_id: 4,
                                      date: DateTime.parse("20/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Movies",
                                      amount: -23.50,
                                      description: "Guardians of Galaxy",
                                      category_id: 5,
                                      date: DateTime.parse("30/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Movies",
                                      amount: -23.50,
                                      description: "Guardians of Galaxy (again)",
                                      category_id: 5,
                                      date: DateTime.parse("15/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Paycheck",
                                      amount: 2000,
                                      category_id: 6,
                                      date: DateTime.parse("05/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Lunch",
                                      amount: -11,
                                      description: "Tacos",
                                      category_id: 2,
                                      date: DateTime.parse("04/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "New jacket",
                                      amount: -89.78,
                                      category_id: 3,
                                      date: DateTime.parse("08/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Groceries",
                                      amount: -97,
                                      category_id: 2,
                                      date: DateTime.parse("30/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Electrity",
                                      amount: -65,
                                      category_id: 1,
                                      date: DateTime.parse("22/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Gas bill",
                                      amount: -75,
                                      category_id: 1,
                                      date: DateTime.parse("25/10/2014"),
                                      user_id: 1
                                    },
                                    { name: "Sold couch",
                                      amount: 80,
                                      category_id: 7,
                                      date: DateTime.parse("10/10/2014"),
                                      user_id: 1
                                    }
                                  ])
budget = Budget.create(name: "Peter's Budget", user_id: 1)

budget_items = BudgetItem.create([
                                    { amount: 1600,
                                      description: "Rent",
                                      category_id: 1,
                                      date: DateTime.parse("01/10/2014"),
                                      budget_id: 1
                                    },
                                    { amount: 55,
                                      description: "Internet",
                                      category_id: 1,
                                      date: DateTime.parse("01/10/2014"),
                                      budget_id: 1
                                    },
                                    { amount: 250,
                                      description: "Groceries",
                                      category_id: 2,
                                      budget_id: 1
                                    },
                                    { amount: 65,
                                      description: "Electric bill",
                                      category_id: 1,
                                      date: DateTime.parse("01/10/2014"),
                                      budget_id: 1
                                    },
                                    { amount: 75,
                                      description: "Bus pass",
                                      category_id: 4,
                                      date: DateTime.parse("01/10/2014"),
                                      budget_id: 1
                                    },
                                    { amount: 80,
                                      description: "Lunch",
                                      category_id: 2,
                                      budget_id: 1
                                    },
                                    { amount: 60,
                                      description: "For fun",
                                      category_id: 5,
                                      budget_id: 1
                                    },
                                    { amount: 80,
                                      description: "Gas Bill",
                                      category_id: 1,
                                      date: DateTime.parse("01/10/2014"),
                                      budget_id: 1
                                    },
                                    { amount: 4000,
                                      description: "Paychecks",
                                      category_id: 6,
                                      budget_id: 1
                                    }
                                  ])
