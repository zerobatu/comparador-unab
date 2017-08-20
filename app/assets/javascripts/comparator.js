$(document).on("ready", function() {
  form = $('#comparator');

  form.steps({
    headerTag: "h3",
    bodyTag: "section",
    transitionEffect: "slideLeft",
    titleTemplate: '#title#',
    autoFocus: true,
    forceMoveForward: true,
    labels: {
      cancel: 'Cancelar',
      finish: 'Comparar',
      next: 'Siguiente',
      previous: 'Volver'
    },
    onStepChanging: function (event, currentIndex, newIndex)
    {
      form.validate().settings.ignore = ":disabled,:hidden";
      return form.valid();
    },
    onFinishing: function (event, currentIndex)
    {
      form.validate().settings.ignore = ":disabled";
      return form.valid();
    },
    onFinished: function (event, currentIndex)
    {
      alert("Submitted!");
    }
  })

  $('#new_user').validate();

  $('#datetimepicker').datetimepicker({
    viewMode: 'years',
    format: 'MM/dd/YYYY'
  });

});
