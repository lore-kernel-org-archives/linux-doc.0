Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6922DB7B5
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 06:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459228; cv=none; b=DGa26IfKtfracUeFidfguyb6aBVP5yCHtcTANaV1FzQElhict5LI4oxr63CJtQchGnwj0p29XTXfPlQpUVZF6ALIUPlk+0gXg5JftLk6z9iEGPObWj6bSdXxDXm3p1xEzyGA8Ctl9H5cfl/rT+O7Xb+9FEwGkYG30pTf+oGtdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459228; c=relaxed/simple;
	bh=aWGh6ii1fU7P9ksdvy5QMsqK4qhfbY/CPvC5M/BF5zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgwvhXdHczhYkvfk1qcdoGM7kdeFbkW7YEdcArFTr00rNjAZIjxTP6VBxYcd5G6spsdCntNZ3o9RCybAbJ1BSp8snUaCt7cOSD9ruL5UhKKzfojSJHLgDBNkx9+EQdE1Kyiy1XV85MVmT/PTbJUOON0PDdOl4P1HZxXGZWdyEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=K45hrni6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=lHTQRBTL; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=qMBzJCye; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=OxDKJqK7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="K45hrni6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="lHTQRBTL";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="qMBzJCye";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="OxDKJqK7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBCD533694;
	Thu, 15 Jan 2026 06:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768459224;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzk2/uIjitYDVt3dGIcDQ+WU2RksEqN1dg/ZPD4iQc=;
	b=K45hrni6UEXNPOCZx6wNurhAXGq16xiDhwPlZQp6tSdn2ADpauZ/iiKj+SX2sKFEK/fZTM
	Bg4Ypp8NrMr4FQLE4PP54FEOEpTz5HQeGl63EiZa5g+vLXY3hwppc/8Z70l+ZJmKowTgVf
	M5KHvC45bArPNUwlNap4MX7EMdBoAls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768459224;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzk2/uIjitYDVt3dGIcDQ+WU2RksEqN1dg/ZPD4iQc=;
	b=lHTQRBTLRtzKqyTJyMuzJ0McWIGdbxPPi2CIP6HZ/6w/okdiZXLJZnpZSPvDsGsI2qQfbD
	FrMgd08aalzt0ECw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=qMBzJCye;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=OxDKJqK7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768459222;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzk2/uIjitYDVt3dGIcDQ+WU2RksEqN1dg/ZPD4iQc=;
	b=qMBzJCyeLA/FiDa60sszIKarSHb8854ghxKvYaW0vLWilx20/zhZNzLLZFvVwLOV3XQ38d
	TQjBxiUtAOXaMHvNaZ+aukaWUtg8A/n08MlBizGC5njyJU0V6U9IKgaSmqkEbh0nJ058o6
	CwCXV8atdxmxW5jHg4sg7gznzOf8dsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768459222;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNzk2/uIjitYDVt3dGIcDQ+WU2RksEqN1dg/ZPD4iQc=;
	b=OxDKJqK78TNnYSRf0SveTaqK4q9mMGY0vy/Py3a1hzdAoNFcWHW2D3WaDpNQjzn6WPCHzF
	4qxv9wM8RxSaZHAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86A0F3EA63;
	Thu, 15 Jan 2026 06:40:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mrj5HNaLaGmxHwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Thu, 15 Jan 2026 06:40:22 +0000
Date: Thu, 15 Jan 2026 07:40:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alejandro Colomar <alx@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, Michael Kerrisk <mtk@man7.org>,
	corbet@lwn.net, linux-doc@vger.kernel.org, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <20260115064021.GA436616@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <aWFnRcjl5SogBakq@devuan>
 <20260114195334.3958694-1-safinaskar@gmail.com>
 <aWf1cM9SsMuH-Rxi@devuan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWf1cM9SsMuH-Rxi@devuan>
X-Spam-Score: -2.71
X-Spamd-Result: default: False [-2.71 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	URL_IN_SUBJECT(1.00)[man7.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[archlinux.org:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:replyto,opensuse.org:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,man7.org,lwn.net,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: EBCD533694
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

> Hi Askar,

> On Wed, Jan 14, 2026 at 10:53:34PM +0300, Askar Safin wrote:
> > Alejandro Colomar <alx@kernel.org>:
> > > FWIW, Michael has been following recent releases of the project quite
> > > promptly (faster than distros), so it's reasonable to use it.

> Hmmm, he didn't publish 6.16 yet, indeed.  I hadn't realized.

Ah, pity. From my point was nice that man7.org is non-distro related.

> > I don't think so. There is still no open_tree(2) on man7.org .

> > I suggest using https://manpages.debian.org/unstable/ instead.

> That would be okay, although Debian is sometimes also a bit laggy.

> Arch might be more up-to-date when man7.org isn't.
> <https://man.archlinux.org/man/open_tree.2.en>


> IIRC, Arch has a good track of being the quickest distro to package new
> releases of the Linux man-pages project.

> In any case, I think either of man7/Debian unstable/Arch is a relatively
> good choice.

Also openSUSE Tumbleweed:
https://manpages.opensuse.org/Tumbleweed/man-pages/open_tree.2.en.html

@Jonathan any of these sites you would prefer? (if you like this change)

Kind regards,
Petr

> Have a lovely night!
> Alex


> > -- 
> > Askar Safin
