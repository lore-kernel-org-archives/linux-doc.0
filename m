Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C92D9780
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 04:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782449306; cv=none; b=qvlW+UInHVBD9XjHfEnJPrJSyGlNKUOz7eJe9MPlMVy9wCdVxgBuB2G2e9B2YdqY72fq4mdXfzqFJ56ieC39ImGyQrnsTIDPjDv0YKLecAHPURPvbvZNzLZ+0gZi/0n+z8p00jngqavdfLmQyZhiy1OXNIvmCSMjBPdvtRsYwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782449306; c=relaxed/simple;
	bh=AunHrsJyjHZaURSe+qQ9MNGUQtVOUdWHzhzhYGGgTKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hl01dqtT5667EdBzECupAb9lVLi0Z4qCsls1f3l/jzW1wHl70Z4Qre9W3KK1yolD09EgKb+2ZvTQk8mKJJ6QxLlbCXQRl07sJOP7pSXPoneUgfCgltUb7temf13NKDtfCLEWWzT10blUIfAt0F5H6jthY/kWp0IQIhq47aHEQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hq3Mfsvx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V/Sx0rkZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hq3Mfsvx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V/Sx0rkZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hq3Mfsvx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V/Sx0rkZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hq3Mfsvx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V/Sx0rkZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A95576196;
	Fri, 26 Jun 2026 04:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782449303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H0HJSzE2cfuCoW+yS8Yhrccm1Xo0dOpvLIvHakZGY44=;
	b=Hq3MfsvxaF3+VskB14Jh2BsEPk5EV5OwLeqFW4Dn+da5ogSBeFYyEQcZ0dmWzIomJl1TC9
	W0NzgRs+6y2rmacUec2WIEitZZXCL2611ypxnrkVLn5TMundBg6NcHYFBR/N42ZaOpvhHk
	HindacvPp1wy92OugHuLYDoxhz4ja+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782449303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H0HJSzE2cfuCoW+yS8Yhrccm1Xo0dOpvLIvHakZGY44=;
	b=V/Sx0rkZq+7xpd42AYOzNLhhrcgh9YYPaOaAU3uXNqT3rO60l+xLM0dBdZa+geIzcjnMCP
	hj51v7h5c5tvvcCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Hq3Mfsvx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="V/Sx0rkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782449303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H0HJSzE2cfuCoW+yS8Yhrccm1Xo0dOpvLIvHakZGY44=;
	b=Hq3MfsvxaF3+VskB14Jh2BsEPk5EV5OwLeqFW4Dn+da5ogSBeFYyEQcZ0dmWzIomJl1TC9
	W0NzgRs+6y2rmacUec2WIEitZZXCL2611ypxnrkVLn5TMundBg6NcHYFBR/N42ZaOpvhHk
	HindacvPp1wy92OugHuLYDoxhz4ja+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782449303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=H0HJSzE2cfuCoW+yS8Yhrccm1Xo0dOpvLIvHakZGY44=;
	b=V/Sx0rkZq+7xpd42AYOzNLhhrcgh9YYPaOaAU3uXNqT3rO60l+xLM0dBdZa+geIzcjnMCP
	hj51v7h5c5tvvcCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 655DD779A8;
	Fri, 26 Jun 2026 04:48:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id l1A7CJYEPmqZNgAAD6G6ig
	(envelope-from <ddiss@suse.de>); Fri, 26 Jun 2026 04:48:22 +0000
From: David Disseldorp <ddiss@suse.de>
To: linux-doc@vger.kernel.org
Cc: David Disseldorp <ddiss@suse.de>
Subject: [PATCH] docs: fix openSUSE libelf-devel package name
Date: Fri, 26 Jun 2026 14:48:04 +1000
Message-ID: <20260626044804.14258-1-ddiss@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,opensuse.org:url,suse.de:email,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8A95576196
X-Spam-Score: -3.01

The proposed "zypper install ... libelf-dev" invocation results in an
error:
  'libelf-dev' not found in package names. Trying capabilities.
  No provider of 'libelf-dev' found.

openSUSE and derivitives (Tumbleweed, Leap and SLES) use a "devel"
suffix instead of "dev".

Link: https://build.opensuse.org/projects/openSUSE:Factory/packages/elfutils/files/elfutils.spec
Signed-off-by: David Disseldorp <ddiss@suse.de>
---
 Documentation/admin-guide/quickly-build-trimmed-linux.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb178e0a62084..f6b31d7207ff6 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -446,7 +446,7 @@ distributions:
  * openSUSE and derivatives::
 
      sudo zypper install bc binutils bison dwarves flex gcc git make perl-base \
-       openssl openssl-devel libelf-dev
+       openssl openssl-devel libelf-devel
 
 In case you wonder why these lists include openssl and its development headers:
 they are needed for the Secure Boot support, which many distributions enable in
-- 
2.54.0

