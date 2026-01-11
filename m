Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76F150997
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174544; cv=none; b=JsPYxPSMxuVDivsuTujtKIsndI3MSrgUhLLOsNk6fgPYG2iV99b75r6fNGQn8VsezSRt2BopZLom2F4Wrr/j4NtTsEvKp22aZvj69uQLofviHtCYgLBOyavmF7tQqcTFf6jMX35I1M1kp8UHpY3p5lb4UXKhDyTkVVREmw+WUEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174544; c=relaxed/simple;
	bh=lxamfO5wYFZta2wOXXAT7AIfC82zuC/cT8kW6bQ97Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQ9pjqJEsV1QYgRZvD2UuhQylS5zVw2pfKRqc+Pt3RjNoUS26N6jHd9alUtR8sOeXAl/G/zqxyLDLHj3ZVvicyoCvp5A/q6+0lysBtUOTOJWgWwUWvHjhTSfOnkZ9eJYbN8yWXdU/qckYh/Qk461CQEa1UGKqXWUQSCmZxk+QSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 910BB336B3;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65CA23EA65;
	Sun, 11 Jan 2026 23:35:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IPXmF80zZGkCFwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Sun, 11 Jan 2026 23:35:41 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk  <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH v2 1/3] Documentation: sp_SP: Add missing man page section
Date: Mon, 12 Jan 2026 00:35:30 +0100
Message-ID: <20260111233534.183272-2-pvorel@suse.cz>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 910BB336B3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2.

 Documentation/translations/sp_SP/process/adding-syscalls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst b/Documentation/translations/sp_SP/process/adding-syscalls.rst
index f21504c612b25..28f680652383d 100644
--- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
+++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
@@ -172,7 +172,7 @@ describiendo un describiendo un movimiento dentro de un archivo, ponga de
 tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
 incluso en arquitecturas de 32-bit.
 
-Si su nueva llamada de sistema  :manpage:`xyzzy` involucra una
+Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra una
 funcionalidad privilegiada, esta necesita ser gobernada por la capability
 bit linux apropiada (revisado con una llamada a ``capable()``), como se
 describe en el man page :manpage:`capabilities(7)`. Elija una parte de
-- 
2.51.0

