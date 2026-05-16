package core

type StrictlyBetterError struct {
	IsStrictlyBetterError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewStrictlyBetterError(code string, msg string, ctx *Context) *StrictlyBetterError {
	return &StrictlyBetterError{
		IsStrictlyBetterError: true,
		Sdk:              "StrictlyBetter",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *StrictlyBetterError) Error() string {
	return e.Msg
}
