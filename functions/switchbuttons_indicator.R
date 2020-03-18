
switchbuttons_indicator <- function(inputId){
  HTML(glue(
  "<div class='form-group shiny-input-container shiny-input-radiogroup shiny-input-container-inline'>
    <label class='control-label' for='{inputId}'>Choose an indicator:</label>
    <br>
    <div id='{inputId}' class='radioGroupButtons shiny-bound-input' style='width: 100%;'>
        <div aria-label='...' class='btn-group btn-group-justified btn-group-container-sw' data-toggle='buttons' role='group'>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default active'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='score' checked='checked'>
                    <i class='fa fa-star'></i>
                </button>
            </div>
                        <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-economy active'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='economy' >
                    <i class='fa fa-hand-holding-usd'></i>
                </button>
            </div>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-family'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='family'>
                    <i class='fa fa-child'></i>
                </button>
            </div>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-health'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='health'>
                    <i class='fa fa-heartbeat'></i>
                </button>
            </div>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-freedom'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='freedom'>
                    <i class='fa fa-dove'></i>
                </button>
            </div>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-generosity'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='generosity'>
                    <i class='fa fa-hand-holding-heart'></i>
                </button>
            </div>
            <div class='btn-group btn-group-toggle' role='group'>
                <button class='btn radiobtn btn-default color-trust'>
                    <input type='radio' autocomplete='off' name='{inputId}' value='trust'>
                    <i class='fa fa-handshake'></i>
                </button>
            </div>
        </div>
    </div>
</div>"))
}
