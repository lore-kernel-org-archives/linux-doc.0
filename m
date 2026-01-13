Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90148346ADB
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304194; cv=none; b=L+Jga61yNPP5qx5MDhmVsV7rc5uxihJCLuBgUscQP4+DgZps9VQf5yplaqH+MM7nDmG27UJ0LMd9TKNPPUq2wgaAmBnCJiRxrYjyMurwWO2W/rp4PDFRuXvi6BVj0ufJ8OtJXPKP/gJn1BGYNW46btRHZ/H333Dpjl9H/39yLi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304194; c=relaxed/simple;
	bh=0ICapT+9Cjx1VZ7QGck2RybVoK7A651SI4DE4WphjGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0ajp+tO8koHpnoT8C5Y1ZnUH4+A87WPzwJ1n7bsq3Y0cakQCluRka4VLOISOdZfxyWb7B7a2f5pC9yH5F7jEIaW963uuzUfIcFu/+lRdWYGPvAPldEAkLdq1rB3dcI0iYZuZwu+ZPYo0fXfsCYWgjmMl7YCaNd4a9auyUaXZMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cAbRcIQf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7tvd0tdu; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cAbRcIQf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=7tvd0tdu; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cAbRcIQf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7tvd0tdu";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cAbRcIQf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="7tvd0tdu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4D485BCDC;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbcESVxUNpaUERzg1ykgT4DLBWeyzBUs4l/nXbNwu4=;
	b=cAbRcIQftRckk2ZbqdDYLJXZu9ou3tZZCsPvjY78doNhdqc+WEIUrldZDIaqtJO88oaSWM
	HPIK9pjxgEvH0tFdavSuJ9kSrE2/c94eLPP7/P1QPASzRCuMP7HdvxvPFv/bxwfTIuEg/M
	tsUSm/p2+eJXv+5Hl61aKjhMTq8mi8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbcESVxUNpaUERzg1ykgT4DLBWeyzBUs4l/nXbNwu4=;
	b=7tvd0tduDpSeiciO286FjM+Z82s8uMaeFlmmbnDN6GUWw/n7qNCreOkD3YXHsWWbSHAKDT
	GQDC1paUBj9peKAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbcESVxUNpaUERzg1ykgT4DLBWeyzBUs4l/nXbNwu4=;
	b=cAbRcIQftRckk2ZbqdDYLJXZu9ou3tZZCsPvjY78doNhdqc+WEIUrldZDIaqtJO88oaSWM
	HPIK9pjxgEvH0tFdavSuJ9kSrE2/c94eLPP7/P1QPASzRCuMP7HdvxvPFv/bxwfTIuEg/M
	tsUSm/p2+eJXv+5Hl61aKjhMTq8mi8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AbbcESVxUNpaUERzg1ykgT4DLBWeyzBUs4l/nXbNwu4=;
	b=7tvd0tduDpSeiciO286FjM+Z82s8uMaeFlmmbnDN6GUWw/n7qNCreOkD3YXHsWWbSHAKDT
	GQDC1paUBj9peKAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 932383EA67;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MBcOIzkuZmnDHwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 11:36:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v3 3/3] Documentation: CSS: Improve man page font
Date: Tue, 13 Jan 2026 12:36:10 +0100
Message-ID: <20260113113612.315748-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113113612.315748-1-pvorel@suse.cz>
References: <20260113113612.315748-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.78 / 50.00];
	BAYES_HAM(-2.98)[99.91%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.78
X-Spam-Level: 

Define man page font as monospace and bold, i.e. the same as what is
used for .code and <pre>.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v3.

 Documentation/sphinx-static/custom.css | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 06cedbae095c2..e7ddf3eae7ede 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -20,7 +20,7 @@ div.sphinxsidebar { font-size: inherit;
 		    overflow-y: auto; }
 /* Tweak document margins and don't force width */
 div.document {
-    margin: 20px 10px 0 10px; 
+    margin: 20px 10px 0 10px;
     width: auto;
 }
 
@@ -151,3 +151,9 @@ div.sphinxsidebar a:hover {
     text-decoration: underline;
     text-underline-offset: 0.3em;
 }
+
+a.manpage {
+	font-style: normal;
+	font-weight: bold;
+	font-family: "Courier New", Courier, monospace;
+}
-- 
2.51.0

