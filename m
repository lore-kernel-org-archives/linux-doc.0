Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5CF29A9F9
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304188; cv=none; b=TT+jxxuT/Jzzv52cwO+ng7lBRY1akjTQ7gEktK+XMrG6mzdQBylXT2v/ik/WAqKW7mAd1DuRKQwd3ALJ18xcJyol1cUkykDTaVbiXULpFRg6ZW1MFvJ3VpTW60IQ126vEEp5bZILhMsFHZVeaSddHN6yK3SreYuiUkUwPAc7cY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304188; c=relaxed/simple;
	bh=PFEtPKQfwK0Nua1xUFf3YUJONdxvfIbT9RJxbCSyx/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIkCEXaxctJR3qzHrBDr9ebey26HnaLDdl4FKACA/TOfjajcvwbqAs+ZIgAY5LIA9UsSF5XJQDCxuWcyOvHslhr8thiVNNU4ajOqMZMOKWm8DBWw8KIKEFbI0/khi8w8dNl5BMKX9XYg6PaEI6Ge5w1enBOG0uB5ynLvzzLMJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FaGSj/8d; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9ppr5/I3; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FaGSj/8d; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9ppr5/I3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FaGSj/8d";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9ppr5/I3";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FaGSj/8d";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9ppr5/I3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 93E9D3369C;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbUViOZ/zxHQCWsQfQwBY5HGJleJf+l/H1dtZ8m0OVQ=;
	b=FaGSj/8dOec5Rxnp9UryULIA5C1fnffiz5R2QVr+cNNoOUBJGcqGGd+Dknedc5kApfG6T7
	40YLEGUcTVQPKPa1g4r4vMO3rmwY4VWMumZ3W09AwA8Wdig22QaCIQDgP68elTq1JwmjR2
	OHCCdC7xvJFPbBOXLVbQJjETa/IQem0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbUViOZ/zxHQCWsQfQwBY5HGJleJf+l/H1dtZ8m0OVQ=;
	b=9ppr5/I3R805tIHfgFx1XysUcpI7RLFTmDvEWxC3BZaA7LLxcb+rBuCBOUjvCqmcxWABPf
	qvrP7Dpn3RO4l+CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbUViOZ/zxHQCWsQfQwBY5HGJleJf+l/H1dtZ8m0OVQ=;
	b=FaGSj/8dOec5Rxnp9UryULIA5C1fnffiz5R2QVr+cNNoOUBJGcqGGd+Dknedc5kApfG6T7
	40YLEGUcTVQPKPa1g4r4vMO3rmwY4VWMumZ3W09AwA8Wdig22QaCIQDgP68elTq1JwmjR2
	OHCCdC7xvJFPbBOXLVbQJjETa/IQem0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbUViOZ/zxHQCWsQfQwBY5HGJleJf+l/H1dtZ8m0OVQ=;
	b=9ppr5/I3R805tIHfgFx1XysUcpI7RLFTmDvEWxC3BZaA7LLxcb+rBuCBOUjvCqmcxWABPf
	qvrP7Dpn3RO4l+CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 703563EA66;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yIBRGjkuZmnDHwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 11:36:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v3 2/3] Documentation: Link man pages to https://man7.org/
Date: Tue, 13 Jan 2026 12:36:09 +0100
Message-ID: <20260113113612.315748-3-pvorel@suse.cz>
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
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[man7.org:url,sphinx-doc.org:url,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email,man7.org:url];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

Configure manpages_url to link man pages to https://man7.org/.
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

Acked-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v2.

 Documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276c..16d025af1f304 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -51,6 +51,9 @@ else:
     dyn_exclude_patterns.append("devicetree/bindings/**.yaml")
     dyn_exclude_patterns.append("core-api/kho/bindings/**.yaml")
 
+# Link to man pages
+manpages_url = 'https://man7.org/linux/man-pages/man{section}/{page}.{section}.html'
+
 # Properly handle directory patterns and LaTeX docs
 # -------------------------------------------------
 
-- 
2.51.0

