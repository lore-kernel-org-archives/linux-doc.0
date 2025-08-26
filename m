Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488726C3A4
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756195246; cv=none; b=BR18wP58oSRsihzqIsMsx56Q8HGhAa5TA948oEudn6lM3j0YT9YVTdLntkimHR/GPlUBNR9CFUoP8QNJSwlnzvWWHSBtFDSgbjGi58dKLVBsjX+ABWLod/BKaGqx/yziju3MKE0Ls1jwcNrwtVsVkPiyIk2XeCtoyz62CetxvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756195246; c=relaxed/simple;
	bh=xBmYDn4mwsQkvGNxsWLtR5GuvTQpf29AlfueyFz5JUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDOxnLo+ZYQceeSXZjHVAQD2aBmf1fpWkQeEko0xjgcQgN0mfmJohcAl2Wk+ZgFqIpJ5DZTMAMrpVt5xShAPyaJeec4ciF4YJUt8VaWvFYBkCfptxoNo32zdMxv3AcdzbzNeakMpJqWuPlUkAMCkGWQhyG7ZiPnq1NrQV0dvBm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kaxo/Lh3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t/ahbiHn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kaxo/Lh3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t/ahbiHn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kaxo/Lh3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t/ahbiHn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kaxo/Lh3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t/ahbiHn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1E74021989;
	Tue, 26 Aug 2025 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756195237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QOxlQW2BFq9UzD3uwYettd8IKssbDWwKj5tP/NeqaHw=;
	b=kaxo/Lh3cZc8LrW+T1Pxo10djMNGzndOXjGa2HduIjsuiSKJbrFr4Stw15PrQQT3xnn0Nu
	ToieAmPsQNotAVQEcwF/ur7CMrQaY+9m1HELolDdqLoHMo4zyWN5fRAl/JrFkazeF4T613
	NvWFSVaonyLxFxeMvFQ3breIetLpQ+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756195237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QOxlQW2BFq9UzD3uwYettd8IKssbDWwKj5tP/NeqaHw=;
	b=t/ahbiHnGkGSREgXQ5rMFI09DPF+Z2i/ywoCJ1Sm+ACwTfRIsAPzLQ76Ynj4jYi8VqEC9D
	Wel6SZnWTyp2nBAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="kaxo/Lh3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="t/ahbiHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756195237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QOxlQW2BFq9UzD3uwYettd8IKssbDWwKj5tP/NeqaHw=;
	b=kaxo/Lh3cZc8LrW+T1Pxo10djMNGzndOXjGa2HduIjsuiSKJbrFr4Stw15PrQQT3xnn0Nu
	ToieAmPsQNotAVQEcwF/ur7CMrQaY+9m1HELolDdqLoHMo4zyWN5fRAl/JrFkazeF4T613
	NvWFSVaonyLxFxeMvFQ3breIetLpQ+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756195237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QOxlQW2BFq9UzD3uwYettd8IKssbDWwKj5tP/NeqaHw=;
	b=t/ahbiHnGkGSREgXQ5rMFI09DPF+Z2i/ywoCJ1Sm+ACwTfRIsAPzLQ76Ynj4jYi8VqEC9D
	Wel6SZnWTyp2nBAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D23013479;
	Tue, 26 Aug 2025 08:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lcRBFaNprWh1RQAAD6G6ig
	(envelope-from <ddiss@suse.de>); Tue, 26 Aug 2025 08:00:35 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-doc@vger.kernel.org
Cc: dan.j.williams@intel.com,
	David Disseldorp <ddiss@suse.de>
Subject: [PATCH] Documentation/filesystem/dax: remove brd as a DAX reference
Date: Tue, 26 Aug 2025 18:00:06 +1000
Message-ID: <20250826080006.22610-1-ddiss@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 1E74021989
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01

This reference is outdated; DAX support was removed from brd via commit
7a862fbbdec66 ("brd: remove dax support").

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 Documentation/filesystems/dax.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
index 08dd5e254cc53..1e50d4af84385 100644
--- a/Documentation/filesystems/dax.rst
+++ b/Documentation/filesystems/dax.rst
@@ -205,9 +205,7 @@ implement direct_access.  Equally, if your device can occasionally
 stall the CPU for an extended period, you should also not attempt to
 implement direct_access.
 
-These block devices may be used for inspiration:
-- brd: RAM backed block device driver
-- pmem: NVDIMM persistent memory driver
+The NVDIMM persistent memory (pmem) driver may be used for inspiration.
 
 
 Implementation Tips for Filesystem Writers
-- 
2.43.0

