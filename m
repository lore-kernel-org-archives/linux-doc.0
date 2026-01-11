Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3571150997
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174550; cv=none; b=ThYK2X8zC3yxBPJFBDgmNsA8L61RM2bWHEkQUXowSeaiREw90goLlKXvsdx7QFi0VK8dBKTlS0zG+UiP3X4QXlpl5aJaHZ0YQOCP9dlHo2On5VI8GqgZVnungf0sRPvzmXdo0nQrw8eUKybm614nymsg3PZv27ihZMHAenLCS08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174550; c=relaxed/simple;
	bh=29Z8bBCQ+y0DCPuyFndJ89/VWwksN/5wLAHFAg0FukM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADP7p1AxiAPMTa3FdhRj/RsCBQYIpvDWPVRkP+QEX7U/4r0XJn4nTUkEQqBFpeHGJ+pKzKv7VXFFm+3REit98zlGUWQTvnJkpAKW6nAgo3jU2MA0xbdYzO1IXjCBEC0U92PZ4yTC1nPeJ9IDLtqXnhC2I+Z99whLM+0VBnh0loI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dOhopWbE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XLjZ1zGs; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qlu4mLw6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ZAcYvzzN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dOhopWbE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XLjZ1zGs";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qlu4mLw6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ZAcYvzzN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8061336B6;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfKN6r1b3zFVp7lBqNbX2onlk7E8mfUSLeBIJiKUfg4=;
	b=dOhopWbEAZSjb+5q8nY5gmS94z4NxSuoHo17gTBemYqvMhUVGB1MC95aRlHSpY3y/sthQc
	GG0SKBtHs8dk3K7Kr+Z6NjbbQuOihzDanMQDJo/HCRhhzlbMcNuX0fEnZoCL1nLMtvdKPg
	2hiOAmO0RdtE+FJhrl8e724Vg97aefw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfKN6r1b3zFVp7lBqNbX2onlk7E8mfUSLeBIJiKUfg4=;
	b=XLjZ1zGsVNNpCzbRXGg2Mt5+tSz0RIBlJAxWOWbQQHHt9WvcGCyWvR+Qg3F1GNUqkM++wn
	rTvA9QCdZSnbsPCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfKN6r1b3zFVp7lBqNbX2onlk7E8mfUSLeBIJiKUfg4=;
	b=qlu4mLw6OlUuWmd1UIxC9tZS+kIBByadr87U39Zpd+qEzOi76Z4jjCD/uvT5jIAqnlPUFv
	WoZ7RoUbe0+GI4dAcGTAPb3WwYwk5lJbvxHXp5LEnuV6uIrhzRc0KqCKPQF4Vbfj1Bk55b
	24Q0iDALK8ocGbIdEujx6MkzPDcs69o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfKN6r1b3zFVp7lBqNbX2onlk7E8mfUSLeBIJiKUfg4=;
	b=ZAcYvzzNZXzQrhd8igQBozHKEHlPMJf1ql+wYxmo4rinBcXl0yPkgjRcxLLhreddDBcKpd
	WvRZY2/xlTayDAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C268D3EA65;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KLyILs0zZGkCFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:35:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk  <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v2 3/3] Documentation: Link man pages to https://man7.org/
Date: Mon, 12 Jan 2026 00:35:32 +0100
Message-ID: <20260111233534.183272-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111233534.183272-1-pvorel@suse.cz>
References: <20260111233534.183272-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email,sphinx-doc.org:url];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

Configure manpages_url to link man pages to https://man7.org/.
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Completely rewritten in v2.

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

