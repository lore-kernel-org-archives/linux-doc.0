Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328D366DA9
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767979878; cv=none; b=N/Nbm66a8pAgK4QjrbeYzPNT6lh7yGNI5AY/WOGeC0CrFcD91nTiy6qpkrNfJwo8GaQp2FXPw2ksxvZpQWSAC6vTkzI6O9pCrFiWm3e9A84BEWIxj3LLqQRerubes8Qib2OawhJEHueQJ7zFKuJs/jkuZYUr43luMBWZyplC2wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767979878; c=relaxed/simple;
	bh=w1PlVmDzho5bi1ZyIpU1+ZlHTEvy82Krich1jk+ncMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXoAN5HHPQre5O9d9mTjaZ7cRO6EwJWJfg+XCAEIYA1qsMAtl7E0iuXcrju7++xiADE1jbxXV3vzvCiXjs9GgOoX4Mj4LDvfnutyG9amyukCORQARrTmUd/2VEtmOOEr/8zmZ5AFFNl4H0b7Uwu5c0eArmg0Su2Fn7/eVdUjbL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qwB48pfM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gxHkZ6LA; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qwB48pfM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gxHkZ6LA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qwB48pfM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gxHkZ6LA";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qwB48pfM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gxHkZ6LA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5292333B3A;
	Fri,  9 Jan 2026 17:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767979875;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w1PlVmDzho5bi1ZyIpU1+ZlHTEvy82Krich1jk+ncMY=;
	b=qwB48pfMDsx01IKpHfvpI9LtUf6koeOOendBh4WQCY1Xd/sNOdhjVFbnoOQsCHK5g7BCSS
	UnaeIZ+E6qz2qn5rIRBwcmVyPhKzCwZD/2xaiDjquxocVk8lkn3QhzY0QTAcXZ7CV/z16x
	be/FMotiJxUKixPyhLnR2MVH9kKvMnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767979875;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w1PlVmDzho5bi1ZyIpU1+ZlHTEvy82Krich1jk+ncMY=;
	b=gxHkZ6LA0V1VJXCjSG7DzCos8uRy31AfLVgyKiwXbshYsk6T7V1gnQiHlv7Goa0PeIBWTc
	9MIna1xOQtafigCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767979875;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w1PlVmDzho5bi1ZyIpU1+ZlHTEvy82Krich1jk+ncMY=;
	b=qwB48pfMDsx01IKpHfvpI9LtUf6koeOOendBh4WQCY1Xd/sNOdhjVFbnoOQsCHK5g7BCSS
	UnaeIZ+E6qz2qn5rIRBwcmVyPhKzCwZD/2xaiDjquxocVk8lkn3QhzY0QTAcXZ7CV/z16x
	be/FMotiJxUKixPyhLnR2MVH9kKvMnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767979875;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type;
	bh=w1PlVmDzho5bi1ZyIpU1+ZlHTEvy82Krich1jk+ncMY=;
	b=gxHkZ6LA0V1VJXCjSG7DzCos8uRy31AfLVgyKiwXbshYsk6T7V1gnQiHlv7Goa0PeIBWTc
	9MIna1xOQtafigCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5E223EA63;
	Fri,  9 Jan 2026 17:31:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pvb3IGI7YWnkYAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 09 Jan 2026 17:31:14 +0000
Date: Fri, 9 Jan 2026 18:31:12 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Links to sources in docs
Message-ID: <20260109173112.GA105682@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
X-Spam-Level: 

Hi Jonathan, all,

I wonder how links in sources work.

Documentation/userspace-api/check_exec.rst has:

`samples/check-exec/inc.c`_ example.

which leads to link to the source [1]. But if i try to use the same pattern in
Documentation/trace/fprobe.rst:

-See Filter Commands in `Documentation/trace/ftrace.rst`.
+See Filter Commands in Documentation/trace/ftrace.rst.

it does not work:

Documentation/admin-guide/bug-hunting.rst:54: ERROR: Unknown target name: "scripts/decode_stacktrace.sh". [docutils]

Kind regards,
Petr

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c
