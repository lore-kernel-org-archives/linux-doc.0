Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C761E4AB
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174544; cv=none; b=NgQMRtds5HL7zRP5YEAPw+x2yGwNpop6l6Kf5n2x4dsbsWTeO9fA6XfnZC/mkMwsYbgQELAd0IzZwNl6SpcdJCIModqJ16ImjnBm6Z5XQ9+ph9fRvn7vqTyWW48TLXSBjGr6BhL4ry3s1jwZN9bDcm44WyR+icpT/LBTC+PxrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174544; c=relaxed/simple;
	bh=rVERajV+Y56+uLFDdffjnlxp3Cxv7TfHVDntSyofl/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I4p0VQTPCM7isuJeiKHe+kRCSfRp5jM5Vr81bw2DnlItjLVSRjJB8HyGrM6+p6OeBG+5YKxTkGXs15IRMESNYp7BQ4FHSxZqzUUlnhavNeZjLk5X4E/M/V3956q8P3DepSnmnyuIWTZkrIfJOlPk27mBDm6/UppZ/yyNhY6pP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bWikBc1D; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=NbiYZTbg; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=bWikBc1D; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=NbiYZTbg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bWikBc1D";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NbiYZTbg";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="bWikBc1D";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NbiYZTbg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6039E5BCFB;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0//8sOgfSLnAlvmX31x2U0W5iw6skv7Kl/lt3E/SmDY=;
	b=bWikBc1DbTmQzjCRVVBTqNctcjQ6mVzFYVSTj5i/ZPn+GWCs61dbKgxAknj5ADYQ/bcC1N
	z9Rw7GRmy9JtGA3kzJy6B9QUyDeUq9IVgaKGku+78FpbbDmhcULleKyjcKFV7xMJUzDhkI
	fy1QO4kuaulNZa+8hNFYzZnYA8byd/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0//8sOgfSLnAlvmX31x2U0W5iw6skv7Kl/lt3E/SmDY=;
	b=NbiYZTbg92V16VMDfJqC2Y09m3cK464s1MCyAV1tqIms8j98AecxdlHUOWjxKGAZS9XMsj
	ztbwNvkR6z4Z3uDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768174541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0//8sOgfSLnAlvmX31x2U0W5iw6skv7Kl/lt3E/SmDY=;
	b=bWikBc1DbTmQzjCRVVBTqNctcjQ6mVzFYVSTj5i/ZPn+GWCs61dbKgxAknj5ADYQ/bcC1N
	z9Rw7GRmy9JtGA3kzJy6B9QUyDeUq9IVgaKGku+78FpbbDmhcULleKyjcKFV7xMJUzDhkI
	fy1QO4kuaulNZa+8hNFYzZnYA8byd/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768174541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=0//8sOgfSLnAlvmX31x2U0W5iw6skv7Kl/lt3E/SmDY=;
	b=NbiYZTbg92V16VMDfJqC2Y09m3cK464s1MCyAV1tqIms8j98AecxdlHUOWjxKGAZS9XMsj
	ztbwNvkR6z4Z3uDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A2833EA63;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VRMdDc0zZGkCFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:35:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk  <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v2 0/3] Documentation: Link man pages to https://man7.org/
Date: Mon, 12 Jan 2026 00:35:29 +0100
Message-ID: <20260111233534.183272-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[man7.org:url,imap1.dmz-prg2.suse.org:helo,suse.cz:mid,sphinx-doc.org:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Changes v1->v2:
* Use :manpages_url: (a proper sphinx syntax)
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-manpages_url
* 2 new cleanup commits
  -  Documentation: sp_SP: Add missing man page section
  - Documentation: Remove :manpage: from non-existing man pages

Link to v1:
https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.cz/

Petr Vorel (3):
  Documentation: sp_SP: Add missing man page section
  Documentation: Remove :manpage: from non-existing man pages
  Documentation: Link man pages to https://man7.org/

 Documentation/conf.py                              |  3 +++
 Documentation/process/adding-syscalls.rst          | 14 +++++++-------
 .../translations/it_IT/process/adding-syscalls.rst | 14 +++++++-------
 .../translations/sp_SP/process/adding-syscalls.rst | 14 +++++++-------
 4 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.51.0

