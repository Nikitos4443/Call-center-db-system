SELECT m.topic, m.text, c.email, mc.date FROM mail m
INNER JOIN mail_client mc ON mc.mail_id=m.id
INNER JOIN clients c ON c.id=mc.client_id
WHERE mc.date >= NOW() - INTERVAL '1 year';