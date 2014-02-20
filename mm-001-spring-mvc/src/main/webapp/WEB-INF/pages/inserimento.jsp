<html>
<head>

	<script type="text/javascript" src="/SpringMVC3/js/jquery-1.10.2.js" ></script>
	<script type="text/javascript" src="/SpringMVC3/js/jquery-ui-1.10.4.custom.min.js" ></script>
	<script type="text/javascript" src="/SpringMVC3/js/jquery.dataTables.min.js" ></script>
	
	<link rel="stylesheet" href="/SpringMVC3/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
	
	<style>
	    body { font-size: 62.5%; }
	    label, input { display:block; }
	    input.text { margin-bottom:12px; width:95%; padding: .4em; }
	    fieldset { padding:0; border:0; margin-top:25px; }
	    h1 { font-size: 1.2em; margin: .6em 0; }
	    div#movies-contain { width: 350px; margin: 20px 0; }
	    div#movies-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
	    div#movies-contain table td, div#movies-contain table th 
	      { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
	    .ui-dialog .ui-state-error { padding: .3em; }
	    .validateTips { border: 1px solid transparent; padding: 0.3em; }
	  </style>
	  
	  <script>
	  $(function() {
	    var title = $( "#title" ),
	      genre = $( "#genre" ),
	      year = $( "#year" ),
	      location = $( "#location" ),
	      status = $( "#status" ),
	      allFields = $( [] ).add( title ).add( genre ).add( year ).add( location ).add( status ),
	      tips = $( ".validateTips" );
	 
	    function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    }
	 
	    function checkLength( o, n, min, max ) {
	      if ( o.val().length > max || o.val().length < min ) {
	        o.addClass( "ui-state-error" );
	        updateTips( "Length of " + n + " must be between " +
	          min + " and " + max + "." );
	        return false;
	      } else {
	        return true;
	      }
	    }
	    
	    function checkLengthOrZero( o, n, value ) {
		      if ( o.val().length != value && o.val().length != 0 ) {
		        o.addClass( "ui-state-error" );
		        updateTips( "Length of " + n + " must be between " +
		          min + " and " + max + "." );
		        return false;
		      } else {
		        return true;
		      }
		    }
	 
	    function checkRegexp( o, regexp, n ) {
	      if ( !( regexp.test( o.val() ) ) ) {
	        o.addClass( "ui-state-error" );
	        updateTips( n );
	        return false;
	      } else {
	        return true;
	      }
	    }
	 
	    $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      buttons: {
	        "Create a movie": function() {
	          var bValid = true;
	          allFields.removeClass( "ui-state-error" );
	 
	          bValid = bValid && checkLength( title, "title", 3, 16 );
	          bValid = bValid && ( checkLengthOrZero( year, "year", 4) );
	 
	          bValid = bValid && checkRegexp( title, /^[a-z]([0-9a-z_])+$/i, "Title may consist of a-z, 0-9, underscores, begin with a letter." );
	          // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
	          // bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
	          // bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
	 
	          if ( bValid ) {
	            $( "#movies tbody" ).append( "<tr>" +
	              "<td>" + title.val() + "</td>" +
	              "<td>" + genre.val() + "</td>" +
	              "<td>" + year.val() + "</td>" +
	              "<td>" + location.val() + "</td>" +
	              "<td>" + status.val() + "</td>" +
	            "</tr>" );
	            $( this ).dialog( "close" );
	          }
	        },
	        Cancel: function() {
	          $( this ).dialog( "close" );
	        }
	      },
	      close: function() {
	        allFields.val( "" ).removeClass( "ui-state-error" );
	      }
	    });
	 
	    $( "#insert-movie" )
	      .button()
	      .click(function() {
	        $( "#dialog-form" ).dialog( "open" );
	      });
	  });
	  </script>
  
 	<script>
	    $( document ).ready(function() {
	        console.log( "document loaded" );
	        
	        $('#demo').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="example"></table>' );
	        $('#example').dataTable( {
	            "bProcessing": true,
	            "bServerSide": true,
	            "sAjaxSource": "/SpringMVC3/rest/kfc/brands/kfc-kampar"
	        } );
	    });
	 
	    $( window ).load(function() {
	        console.log( "window loaded" );
	    });
    </script>
    
    
</head>
<body>
	<h2>Pagina : ${message}</h2>	
	
	<div id="dialog-form" title="Insert new movie">
	  <p class="validateTips">Title form field are required.</p>
	 
	  <form>
	  <fieldset>
	    <label for="title">Title</label>
	    <input type="text" name="title" id="title" class="text ui-widget-content ui-corner-all">
	    <label for="genre">Genre</label>
	    <input type="text" name="genre" id="genre" value="" class="text ui-widget-content ui-corner-all">
	    <label for="year">Year</label>
	    <input type="text" name="year" id="year" value="" class="text ui-widget-content ui-corner-all">
	    <label for="location">Location</label>
	    <input type="text" name="location" id="location" value="" class="text ui-widget-content ui-corner-all">
	  </fieldset>
	  </form>
	</div>
	 
	 
	<div id="movies-contain" class="ui-widget">
	  <h1>Existing Movies:</h1>
	  <table id="movies" class="ui-widget ui-widget-content">
	    <thead>
	      <tr class="ui-widget-header ">
	        <th>Title</th>
	        <th>Genre</th>
	        <th>Year</th>
	        <th>Location</th>
	        <th>Status</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>-</td>
	        <td>-</td>
	        <td>-</td>
	        <td>-</td>
	        <td>-</td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<button id="insert-movie">Insert new movie</button>

	<br>
	<div id="demo">
	</div>
	
</body>
</html>