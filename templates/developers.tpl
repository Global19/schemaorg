<!DOCTYPE html>
<html lang="en">
<head>
  {% include 'headtags.tpl' with context %}
    <title>Developers - schema.org</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Schema.org is a set of extensible schemas that enables webmasters to embed
    structured data on their web pages for use by search engines and other applications." />
</head>
<body onload="updatetext()">

{% include 'docsBasicPageHeader.tpl' with context %}


  <div id="mainContent" class="faq">


<h2>Schema.org for Developers</h2>

<p>
This is a placeholder page for developer-oriented information about schema.org. In particular it gives access to machine-readable representations of our schemas.
</p>


<h2 id="conneg">Machine Readable Term Definitions</h2>

<p>Machine-readable definitions of individual terms are available as RDFa, embedded into the term page html. </p>

<h2 id="defs">Vocabulary Definition Files</h2>

<p>To assist developers, files containing the definition of the current version of the Schema.org vocabulary is available for download in common RDF formats.</p>

<p>Older release versions can be found (under <code>data/releases/</code>) in <a href="https://github.com/schemaorg/schemaorg">GitHub</a>.

<h3>Term Definition Downloads </h3>
<p>Select the file and format required and click Download.  The CSV format downloads are split across two files: <em>Types</em> includes definitions of Types and Enumeration Values, including lists of associated properties; <em>Properties</em> contains property definitions.<br/>
<br/>
File <em>schemaorg-current-http</em> contains the definition of all terms in, all sections of, the vocabulary.  The file <em>schemaorg-all-http</em> contains the definition of all terms in, all sections of, the vocabulary, <strong>plus</strong> terms retired from the vocabulary (<em>See the <a href="/docs/attic.home.html">attic section</a> for details</em>).</p>

<p>For those preferring to use https based definitions of Schema.org terms, these equivalent definitions are available in the <em>schemaorg-current-https</em> and <em>schemaorg-all-https</em> files. For more information on using http or https based terms see the <a href="https://schema.org/docs/faq.html#19">FAQ</a> for details.</p>
<br/>

	<table style="padding: 2px; width:700px;margin-left: auto;margin-right: auto;">
	<tr><td style="width: 40%;">
			File: <br/>
            <select id="filename"  onchange="updatetext()">
				<option value="/version/latest/schemaorg-current-http">schemaorg-current-http</option>
				<option value="/version/latest/schemaorg-all-http">schemaorg-all-http</option>
				<option value="/version/latest/schemaorg-current-https">schemaorg-current-https</option>
				<option value="/version/latest/schemaorg-all-https">schemaorg-all-https</option>
                <!--  Remove from V9.0 as only schema & all0-layers versions built
				{% for ext in extensions %}
					<option value="/version/latest/ext-{{ ext | safe }}">{{ ext | safe }}</option>
				{% endfor %}
                -->
			</select>
	</td>
	<td style="width: 30%;">
		Format: <br/> 
        <select id="fileext" onchange="updatetext()">
				<option value=".jsonld">JSON-LD</option>
				<option value=".ttl">Turtle</option>
				<option value=".nt">Triples</option>
				<option value=".nq">Quads</option>
				<option value=".rdf">RDF/XML</option>
				<option value=".csv">CSV</option>
		</select>
	</td>
	<td style="width: 30%;">
		<div id ="csvsel">
			For: <br/><select id="csvfmt" onchange="updatetext()">
				<option value="-types">Types</option>
				<option value="-properties">Properties</option>
				<!-- <option value="-enumvalues">Enumeration Values</option> -->
			</select>
		</div>
	</td>
	</tr>
	<tr><td colspan="3">
		<div id="label"  style="padding: 5px;"></div>
	<tr><td colspan="3" style="text-align: center;">
		<input type="button" onclick="dowloadfunc();" value="Download"/>
	</td></tr>

	</table>
    <h3>HTTP - HTTPS Term Definition Mappings </h3>
    <p>
        As Schema.org supports both <em>http</em> and <em>https</em> URIs for definition identifiers, developers may need to map or inference between them to 
        operate within a mixed environment.  To aid in that process, a RDF mapping file has been made available below for download.  Within the file each
        <em>http</em> defined <em>Property</em> in the current version of the vocabulary is related to its <em>https</em> equivalent using <a href="http://www.w3.org/2002/07/owl#equivalentProperty">owl:equivalentProperty<a>, and vice versa. All other terms are related to their <em>https</em> equivalent using <a href="http://www.w3.org/2002/07/owl#equivalentClass">owl:equivalentClass<a>
            <br/>
           
        	<table style="padding: 2px; width:700px;margin-left: auto;margin-right: auto;">
        	<tr><td style="width: 50%;">
        			File: <br/>schemaorg-http-https-equivalents
        	</td>
        	<td style="width: 50%;">
        		Format: <br/> 
                <select id="fileext2" onchange="updatetext()">
        				<option value=".jsonld">JSON-LD</option>
        				<option value=".ttl">Turtle</option>
        				<option value=".nt">Triples</option>
         			<option value=".rdf">RDF/XML</option>
        		</select>
        	</td>
     </tr>
        	<tr><td colspan="2">
        		<div id="label2"  style="padding: 5px;"></div>
        	<tr><td colspan="3" style="text-align: center;">
        		<input type="button" onclick="dowloadfunc2();" value="Download"/>
        	</td></tr>

        	</table>
           
    
    <h2  id="experiments">Experimental/Unsupported</h2>

   <p>The following representations are <em>experimental</em> and may change or be removed in future releases.</p>
   
   <h3 style="margin-left: 50px;" id="d3rdfs">D3 RDFS in JSON-LD</h3>

   <p>
    A simplification of the Schema.org type hierarchy, in which each type has at most one super-type, represented
    in a hybrid format that combines JSON-LD, <a href="https://en.wikipedia.org/wiki/RDF_Schema">RDFS</a> and <a href="https://d3js.org/">D3</a>: <a href="{{staticPath}}/docs/tree.jsonld">tree.jsonld</a>.
  </p>
  <p>
    This file is made available to support developers using the <a href="https://d3js.org/">D3</a> JavaScript library for manipulating documents based on data.
    It uses JSON-LD to declare that D3's default "children" JSON field represents "subClassOf" relationships, but expressed in the
    reverse direction (<a href="https://bl.ocks.org/danbri/1c121ea8bd2189cf411c">example usage</a>).




   <h3 style="margin-left: 50px;" id="owl">OWL</h3>
    <p>As an experimental feature, an <a href="https://en.wikipedia.org/wiki/Web_Ontology_Language">OWL</a> definition file <a href="{{staticPath}}/docs/schemaorg.owl">schemaorg.owl</a> is available. It includes
        the core and all current extensions to the vocabulary.</p>
    <p>The structure of the file differs from the above vocabulary definition files, in that <code>schema:domainIncludes</code> and <code>schema:rangeIncludes</code>
        values are converted into <code>rdfs:domain</code> and <code>rdfs:range</code> values using <code>owl:unionOf</code> to capture the multiplicity of values.
        Included in the range values are the, implicit within the vocabulary, default values of <a href="{{staticPath}}/Text">Text</a>, <a href="{{staticPath}}/URL">URL</a>,
        and <a href="{{staticPath}}/Role">Role</a>.</p>
    <p>This file has been made available to enable the representation of the vocabulary in some OWL-based modeling tools.
      The mapping into OWL is an approximation, and should not be considered an authoritative definition for Schema.org's terms; see <a href="{{staticPath}}/docs/datamodel.html">datamodel page</a> for details.
      As an experimental feature, there are no expectations as to its interpretation by any third party tools.</p>
    <br/>

  </div>


<div id="footer"><p>
  <a href="../docs/terms.html">Terms and conditions</a></p>
</div>
<script>
    function getschemafilename(){
    	path = document.getElementById("filename").value;
    	ext = document.getElementById("fileext").value;
    	csvfmt = ""
    	if( ext == ".csv"){
    		csvfmt = document.getElementById("csvfmt").value;
    	}
    	return (path + csvfmt + ext);
    }
    function getschemafilename2(){
    	path = "/version/latest/schemaorg-http-https-equivalents";
    	ext = document.getElementById("fileext2").value;
    	return (path +  ext);
    }

function updatetext(){

	if(document.getElementById("fileext").value == ".csv"){
		document.getElementById("csvsel").style.display = 'block';
	}
	else{
		document.getElementById("csvsel").style.display = 'none';
	}
	
	port = window.location.port
	if(port == "" || port == 0){
		port = "";
	}
	else{
		port = ":" + port;
	}
	
	host = window.location.protocol + "//" + window.location.hostname + port;
	filepath = host + getschemafilename();
	filepath2 = host + getschemafilename2();

	document.getElementById("label").innerHTML = '<a href="' + filepath + '">' + filepath +'</a>';
	document.getElementById("label2").innerHTML = '<a href="' + filepath2 + '">' + filepath2 +'</a>';
}

function dowloadfunc(){
	//alert(path + ext);
	window.location.href = getschemafilename();
}
function dowloadfunc2(){
	//alert(path + ext);
	window.location.href = getschemafilename2();
}


</script>
</body>
</html>
