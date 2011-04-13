SET @t4=0;
SELECT (@t4:=configuration_group_id) as t4 
FROM configuration_group
WHERE configuration_group_title= 'JQLightbox';
DELETE FROM configuration WHERE configuration_group_id = @t4;
DELETE FROM configuration_group WHERE configuration_group_id = @t4;

INSERT INTO configuration_group VALUES ('', 'JQLightbox', 'Set JQLightbox Options', '1', '1');
UPDATE configuration_group SET sort_order = last_insert_id() WHERE configuration_group_id = last_insert_id();

SET @t4=0;
SELECT (@t4:=configuration_group_id) as t4 
FROM configuration_group
WHERE configuration_group_title= 'JQLightbox';



INSERT INTO configuration (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
('Enable JQLightbox', 'JQLIGHTBOX_STATUS', 'false', 'Enable JQLightbox?', @t4, 1, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
('Pages to enable JQLightbox', 'JQLIGHTBOX_PAGES', 'product_info', 'Enter product pages you want to enable JQLightbox, separated by comma. (Example: \'product_info,document_product_info,product_music_info\')', @t4, 2, NOW(), NOW(), NULL, NULL),
('Overlay Background Color', 'JQLIGHTBOX_OVERLAYBGCOLOR', '#000000', 'Used to define the overlay background color.', @t4, 3, NOW(), NOW(), NULL, NULL),
('Overlay Opacity', 'JQLIGHTBOX_OVERLAYOPACITY', '0.8', 'Used to define the overlay opacity.', @t4, 10, NOW(), NOW(), NULL, NULL),
('Container Border Size', 'JQLIGHTBOX_CONTAINERBORDERSIZE', '10', 'The padding CSS information used in the container image box.', @t4, 4, NOW(), NOW(), NULL, NULL),
('Container Resize Speed', 'JQLIGHTBOX_CONTAINERRESIZESPEED', '400', 'The duration of resize effect in the container image box.', @t4, 5, NOW(), NOW(), NULL, NULL),
('Fixed Navigation', 'JQLIGHTBOX_FIXEDNAVIGATION', 'false', 'Should the navigation (next and prev button) will be fixed or not in the interface.
?', @t4, 6, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');