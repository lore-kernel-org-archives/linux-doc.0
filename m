Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72EC318ED2
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972228; cv=none; b=BR87uEvyIc9tE8ol7lAgvUHL/HJ/V/oNisae5h7RNJPelKnbaGkoO6qfrMQ69zY/bQpDCkGzrat12ZlPntBHVUCY6S9cACDEx6s0zWGPTMuViARYpQSA/rjEKp2A6M7MlReBTi3OY5JQmyGuiP+GqC9FVEq05TTJ3ua5ha/JaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972228; c=relaxed/simple;
	bh=KvgyjOemJ50RXFBiAOH1+2D+N7PqIWXtEUDt9mMfZ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUsE2vynEMM6XRKzRa+1W23Rxh7BlDA55QFG5QpTRSgTqCyabGXo1jcAHFIARdVSqX5rcv/6dTAXL2euXSNYUoimZd1XIkX2P8Sbh3QJqGVOS1DJ8iWB5pjb6+RAUvDpyWMmplN9e8iD/JiziohJ1V3OhpK5TrtXzJ/GyzAxS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=RApIe3lm; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=G7Uuhzit; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=c+QCp7kH; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=J65Ui99/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="RApIe3lm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="G7Uuhzit";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="c+QCp7kH";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="J65Ui99/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EB23F33A95;
	Fri,  9 Jan 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767972225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PpavbzY+sfnUlPr/BX7pUi1RgrLiCM7QMp0GYd4n3mA=;
	b=RApIe3lmYVPOuAD/42+OyKcsKKemtDh5LTVt+ZeP5IzGfE+Kmwu+SynM9ET7VV06JjarVj
	Uc3TCAabT00NuSiPp16HU76lh9brnFj8VFu8n1Nbw1oAh0j/AbWO3CNrRIRFtXCFpIIzw3
	AkxwqzI+IY/qr/VbVB0dafPumi1X2Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767972225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PpavbzY+sfnUlPr/BX7pUi1RgrLiCM7QMp0GYd4n3mA=;
	b=G7UuhzitPVKxVdXaxugLUUlY87q7tkYvQiiTNgC27N5Tswx2HmKNcxvjk12kN0WcGHq8RU
	F8lcGOsiLwhDesCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=c+QCp7kH;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="J65Ui99/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767972224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PpavbzY+sfnUlPr/BX7pUi1RgrLiCM7QMp0GYd4n3mA=;
	b=c+QCp7kHsNkppuLbbA0kZvbJEJdHrtFhf9D/Hh5Qq1lIcy23WPTARmOhl5rfC1CsqkPQth
	ajREcolWkoaJbI4nZXyB8r/vdIZhOyNsOpAIvc9FLZCehanjDgabDp+Z9p1c3F6f7WBQHF
	HfbT/kfeGrnbYee7G3MDJU4Z03M8s9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767972224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PpavbzY+sfnUlPr/BX7pUi1RgrLiCM7QMp0GYd4n3mA=;
	b=J65Ui99/3Xq7aJTdgcWA4mkyFT0Ra4Xi5Pc0QIkH45M1WwfAermvLoqfjtRQhRnQpRX5NX
	9K3ZImo5DW5M9jCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B0DAD3EA63;
	Fri,  9 Jan 2026 15:23:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7pz6KIAdYWkVZAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 09 Jan 2026 15:23:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/2] Documentation: bug-hunting.rst: Remove wrong 'file:' syntax
Date: Fri,  9 Jan 2026 16:23:35 +0100
Message-ID: <20260109152336.84674-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim,suse.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: EB23F33A95
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Link to another document does not require 'file:', therefore it was
shown in generated html.

Preformatted text requires just ``...``.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 Documentation/admin-guide/bug-hunting.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/bug-hunting.rst b/Documentation/admin-guide/bug-hunting.rst
index 7da0504388ece..32b1b0c3d7ee4 100644
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
+`Documentation/admin-guide/tainted-kernels.rst`, "being loaded" is
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

