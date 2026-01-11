Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C292D47F1
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 22:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768171018; cv=none; b=qh7IJEpx4haU5uCLdLVNCrUdoPfS0C4wsRkxeBiNeQN9rjYfQrTyUX/ZrKd2T5xW5r+zFZYx8PbSQ3G0aYwRwVHyCJbw6JA24k8ZtN5ZW83raOcx7QF3LPRYK773JwBz2wys6zfvGUXOsSyF2SHAt/yRSJ5C9Kr4cKODKCC0dAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768171018; c=relaxed/simple;
	bh=Lk7AEljevLdvQ+AfRaWdbdrUzzJ4Ltm9cstGhqPCmHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7Tii7c88FSLI582TNvdKVfRUwFDSoR+e71e+p5ZTFDvBMjQZrampQN2YqwNX4R4qDRXAZ4jZyup3TxoGZZB72NdZHGSHHwZ6UFsTgEz9NYb03vGloAIFFWJXyEgHkmIiO+DHxwpJPFkSFiYsG0+TiwrOW1eZ8jxM0XwZ/LYF70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MY8hjUuG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=iFxQL6R6; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2CTgqC6O; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=lJ2NMUdw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MY8hjUuG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="iFxQL6R6";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2CTgqC6O";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="lJ2NMUdw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7CA3336B3;
	Sun, 11 Jan 2026 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768171010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O4UOj40rIMM0FJzGyx8ppWK13TD8lcTV5zVZDQAHYXo=;
	b=MY8hjUuGJ6/0oAQ37vshcXxQ3fCNF8zmmadsfnw9WxyRsIOhgR70LuYq3guQMTQliHFhQ5
	DWcnkPTCU2QJhcvgue1Ss2KcFfQmebqEgoHNO7Vz27Bi+3fhu83JEYRLZ/ycv5apkcdPDH
	xmQqZ6mx6k0Nt4gK896uR9dwkIZbvN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768171010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O4UOj40rIMM0FJzGyx8ppWK13TD8lcTV5zVZDQAHYXo=;
	b=iFxQL6R60bUsMTKkosfT0WETaCrnUCJ0rb6ZsGurc0kTyFRd9veZWOAe/LVoKoIXa6AX/X
	OBqdjoM6syQoiNBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=2CTgqC6O;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=lJ2NMUdw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768171009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O4UOj40rIMM0FJzGyx8ppWK13TD8lcTV5zVZDQAHYXo=;
	b=2CTgqC6OyW0cxCum9Cgaf0I/iIGf3pFWENYZ5DagqUpzyPrVxMV2C3s/nviA8Rqo4cVKl3
	KxSTBpiH7xE8psdwouymh+6mef32HGlvO2/do6P1oaxX/SM2LFqmiHKXyO4SKVA+WaCXIB
	z2NXpAEJMY6355Gm+wuJ8E/XpP5uZYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768171009;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=O4UOj40rIMM0FJzGyx8ppWK13TD8lcTV5zVZDQAHYXo=;
	b=lJ2NMUdwAzxkVR/pMs+bSOCdY7lXq4EVPfr8FIbsk8aOlRDY4sx6zu7sWFg70pD6+5GUAI
	paHn3p6FOqyRPXAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EF053EA63;
	Sun, 11 Jan 2026 22:36:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +mpxHQEmZGnIYQAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 22:36:49 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/2] Documentation: bug-hunting.rst: Remove wrong 'file:' syntax
Date: Sun, 11 Jan 2026 23:36:42 +0100
Message-ID: <20260111223643.174812-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:mid,suse.cz:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: C7CA3336B3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Link to another document does not require 'file:', therefore it was
shown in generated html.

Preformatted text requires just ``...``.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* Remove backticks (Jonathan Corbet)

Link to v1:
https://lore.kernel.org/linux-doc/20260109152336.84674-1-pvorel@suse.cz/

 Documentation/admin-guide/bug-hunting.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 7da0504388ece..3901b43c96df1 100644
--- a/Documentation/admin-guide/bug-hunting.rst
+++ b/Documentation/admin-guide/bug-hunting.rst
@@ -52,14 +52,14 @@ line is usually required to identify and handle the bug. Along this chapter,
 we'll refer to "Oops" for all kinds of stack traces that need to be analyzed.
 
 If the kernel is compiled with ``CONFIG_DEBUG_INFO``, you can enhance the
-quality of the stack trace by using file:`scripts/decode_stacktrace.sh`.
+quality of the stack trace by using ``scripts/decode_stacktrace.sh``.
 
 Modules linked in
 -----------------
 
 Modules that are tainted or are being loaded or unloaded are marked with
 "(...)", where the taint flags are described in
-file:`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
+Documentation/admin-guide/tainted-kernels.rst, "being loaded" is
 annotated with "+", and "being unloaded" is annotated with "-".
 
 
@@ -235,7 +235,7 @@ Dave Miller)::
          mov        0x8(%ebp), %ebx         ! %ebx = skb->sk
          mov        0x13c(%ebx), %eax       ! %eax = inet_sk(sk)->opt
 
-file:`scripts/decodecode` can be used to automate most of this, depending
+``scripts/decodecode`` can be used to automate most of this, depending
 on what CPU architecture is being debugged.
 
 Reporting the bug
-- 
2.51.0

