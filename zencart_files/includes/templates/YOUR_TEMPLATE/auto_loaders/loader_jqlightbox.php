<?php
/**
 * jqlightbox auto_loaders
 *
 * @author yellow1912 (RubikIntegration.com)
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 */
if(JQLIGHTBOX_STATUS == 'true'){
$pages = explode(',',JQLIGHTBOX_PAGES);

$loaders[] = array(
	'conditions' => array(
		'pages' => $pages
	),
	'libs' => array(
		'jquery' => array('min' => '1.4.2'),
		'jquery.lightbox' => array('min' => '0.5')
	),
	'jscript_files'	 => array(
		'jquery_noconflict.js' => 	2,                                                              
        'jqlightbox.php' =>	12                                   
	)
);  
}                                                              