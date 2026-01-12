Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEAF358D09
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768224382; cv=none; b=eGHPqlgX8DHc6ZOItyVWDy7i+1jPsPFX6C4u5yPl+gPNIjSdnewaF0geDAD2Gyngu0kMNSvcvw3sK55RWEE/ZVgPkKwCNgcZ6A4sZzZWTa5SsKdHbNXCyvD+ORBBMinnrn+lYk/9/3KkKro42VIBzWfEjhuzH+jsiS1qdo0iOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768224382; c=relaxed/simple;
	bh=7H21RBFnjZZ3SgPcAMKtaLiecip3uHe5xNv0Md+jZys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhokHMf8lJfrpmXiO/rVzZGZ+HahZ617LXs1ojMR4SpWg10U8RUpbQPnE3AlMQiwEMIxsq9VpBiY79HpfoREMkYENuZrSEM/n0mGEsZ4R0FHll/EsiaBi1/YSTU/W0xxBHdzukoHkIWcyZv0tuBrYbosen8h4oO15/HiXmcHWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2baDV+8w; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GBfE2wDk; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=W8fMwDoz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3p6z8INZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2baDV+8w";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GBfE2wDk";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="W8fMwDoz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3p6z8INZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E9F313371F;
	Mon, 12 Jan 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768224379;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6TxRO+TFcGAluq5heA1F0KntRqj6bjo30RdRD/C/JcE=;
	b=2baDV+8w5LFmsqGUuyjKclSUBchzPXTHC2BzVyhqFU7IQgNxrWd7nlYzN6J13a2WMzoT8P
	NlEZr5sLMZMhHiI8L7mngQ4OnTBgI398CBsgCMEnY9rnmweuixxz6QtDNuEx4qt4QhhxRH
	QsL71xEiqN4nVq01zd1IVvwmviOCdZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768224379;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6TxRO+TFcGAluq5heA1F0KntRqj6bjo30RdRD/C/JcE=;
	b=GBfE2wDkVODft+YIh8RzPiqN4qKUZxC2Ms66CNDmezzsjNgrGj/Is9bRBWWpY6jdwyZitc
	34nVdFapAL4kAWDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768224378;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6TxRO+TFcGAluq5heA1F0KntRqj6bjo30RdRD/C/JcE=;
	b=W8fMwDoz9CEBqzuzpek/Q/UNZjrS/LRyhZxDIXVDPw4kibXqcGOxKQufG6draaCE0S558I
	45sjwk8nzjZ5xRGNDiYprJbc21OL56s0XkxqoEcrw6jbYW1bKkhR21rwHPZEXc8XzgD8fW
	hjHehZcFynwq9oJfC9BGH93OLQYGY1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768224378;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6TxRO+TFcGAluq5heA1F0KntRqj6bjo30RdRD/C/JcE=;
	b=3p6z8INZPM9m1CFQ3AoB/ls51ohGZZ1DOaEPcxOEFZd5cZzV98z7r3V6DjfkxUy36yhf51
	8lcZXz3YKN8tPEBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C044A3EA63;
	Mon, 12 Jan 2026 13:26:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LmMALnr2ZGl9KAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 12 Jan 2026 13:26:18 +0000
Date: Mon, 12 Jan 2026 14:26:13 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: Links to sources in docs
Message-ID: <20260112132613.GA266368@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109173112.GA105682@pevik>
 <7b0539f874af71c899c21acfd71288fe7a2d8246@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0539f874af71c899c21acfd71288fe7a2d8246@intel.com>
X-Spamd-Result: default: False [-3.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:email];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.50
X-Spam-Level: 

> On Fri, 09 Jan 2026, Petr Vorel <pvorel@suse.cz> wrote:
> > Hi Jonathan, all,

> > I wonder how links in sources work.

> > Documentation/userspace-api/check_exec.rst has:

> > `samples/check-exec/inc.c`_ example.

> There's this bit at the end of check_exec.rst that defines the link:

> .. _samples/check-exec/inc.c:
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c

> The content within the backticks is just the link text, and has no
> filename semantics. See [1] for details.

Thanks for a hint, I overlooked it.

We use in LTP sphinx.ext.extlinks [2]:

	'master': (f'{ltp_repo}/blob/master/%s', '%s')

to make file clickable [3]:

	:master:`include/lapi/posix_clocks.h`

then leads to file in git repository. I wonder if this could be useful for
kernel as well.

Kind regards,
Petr

> HTH,
> Jani.


> [1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#hyperlinks
[2] https://github.com/linux-test-project/ltp/blob/master/doc/conf.py
[3] https://linux-test-project.readthedocs.io/en/latest/developers/writing_tests.html#backwards-compatibility
[4] https://github.com/linux-test-project/ltp/blob/master/include/lapi/posix_clocks.h


> > which leads to link to the source [1]. But if i try to use the same pattern in
> > Documentation/trace/fprobe.rst:

> > -See Filter Commands in `Documentation/trace/ftrace.rst`.
> > +See Filter Commands in Documentation/trace/ftrace.rst.

> > it does not work:

> > Documentation/admin-guide/bug-hunting.rst:54: ERROR: Unknown target name: "scripts/decode_stacktrace.sh". [docutils]

> > Kind regards,
> > Petr

> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c
