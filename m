Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820822A4FC
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304194; cv=none; b=MHgu85NXdow56h846HZIMS15GUdgRrw6vLZ7GW8KdVVqbqcHubZGFZjHDipgCaVfe7gDgpbl6S/M2bG74zXWdLG4Rw60hCWY+TRHsYMXcPLmKQ7t5lhcJ6JgPG3Rkv2ik92MPxMM2+8TbgYtee1u//Vu+A4so6vm0Ck1WO5tDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304194; c=relaxed/simple;
	bh=LkuabeRvOqwnBE2Wgh1zq5p1ZB9yb4MO6HscZDk4fjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBn0zcEKmDf1x8Z796dTW2jFZpOUOJD2ndbIjNS7EWV6Ny0z+bZuMZDQODycjyqobOog+7/w/4oXNbvZbswzL6Wt+czkkCqgtkkpZGTPav9JFmR/QUttTKBNsWXrNRIDglEcs7SIlHWwycabLK3HaYIk9AUtIWLC5E/j+qYhG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nXV1TAnB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=oGzB9v51; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=exvu94ZG; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gcUryMiU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nXV1TAnB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="oGzB9v51";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="exvu94ZG";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gcUryMiU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41B13336A0;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hzymDT9SpqCW6EaUDKnFn81tcENLGkkbJ6VziVoLZ7Y=;
	b=nXV1TAnB1+h5evj9nrAgbwvW3OMYhQk8raz2y3S5mh63xCo0Z6txUOnIq7rfVDNPvtLi/M
	uJTeCwDcr+eDNiqo0DuCCV0i4OkxwIaEm2gc6PG2Zhldl5E2WfshOn34bl9qoZa8SPkcWX
	1DPT0ll6trLZokb+bF032q6aDgCpVqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304186;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hzymDT9SpqCW6EaUDKnFn81tcENLGkkbJ6VziVoLZ7Y=;
	b=oGzB9v51FPAQ6m/IZjLlH2uCexZrxqLR7G6BLtjJHa6srgiH/lo7TrcO882vQSOYVCL+Hx
	6oUlOPRXmUaYqvAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768304185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hzymDT9SpqCW6EaUDKnFn81tcENLGkkbJ6VziVoLZ7Y=;
	b=exvu94ZGTgUBPYDXxmfN23lmeheNC4yMYiP7yBj3eEt0vsUTqY7g5PqdKZl8Ps+N3zH2MD
	Y2DUkUGl0NGbyGWSUI9YI1kAvpq+TFoveXgphTL7onbE6O6Q6BSOTFek0tD/tnauWatPDY
	d1jj7nKWfyOjyh90iWJUjp4o8Lj/lWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768304185;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hzymDT9SpqCW6EaUDKnFn81tcENLGkkbJ6VziVoLZ7Y=;
	b=gcUryMiUDtx7kvVzeZwYoLYdYKjv7NbFbFJirk88rLS7ixx6b0zQkRhuS9bxcPH4exaCRE
	AGE32jkh2qlqCFBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B0E63EA63;
	Tue, 13 Jan 2026 11:36:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yaEWBTkuZmnDHwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 11:36:25 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
Date: Tue, 13 Jan 2026 12:36:07 +0100
Message-ID: <20260113113612.315748-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	URIBL_BLOCKED(0.00)[man7.org:url,suse.cz:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,man7.org:url,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

Changes v1->v2:
* Remove `...` (italic) from non-existing man pages (Jonathan).
* Squash fix for sp_SP to following commit (Jonathan).
* Remove :manpage: also from fxyzzy(3) (non-existing man page).
* Add CSS for man page.

Link to v2:
https://lore.kernel.org/linux-doc/20260111233534.183272-1-pvorel@suse.cz/

Link to v1:
https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.cz/

Petr Vorel (3):
  Documentation: Remove :manpage: from non-existing man pages
  Documentation: Link man pages to https://man7.org/
  Documentation: CSS: Improve man page font

 Documentation/conf.py                            |  3 +++
 Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
 Documentation/sphinx-static/custom.css           |  8 +++++++-
 .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
 .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
 5 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.51.0

