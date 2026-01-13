Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB739443
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307528; cv=none; b=Q6TOG20SXXcg/Y86Bughp9/hqu5QSAsAIhJHtX+8iqvdko4j9kpepdBdnTppxAI6hVJL2gHnza5ZemRuRP/st+d49Lzm+LzS+k0oykPUHWJWsz5hTEzPD/yuKo5mZV8yDi0uHZAhX46jQ8rs4DqA3vyUuFGtTi3pxisM5OHJYO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307528; c=relaxed/simple;
	bh=vISdXRpqXbqifFN2WeL95FCCNgScAqAax4cpp7Ht9ow=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH6DNfe/S6vidTv7jl0p+PEshRcCtrtY74qsVnmssE/8QQamooFASLS+3AoB8aR3DdDnhFCQaJ7PtUMyDy4Je9Z8JbPcy+QJMvHDSz12VDM+b/90wtq9SghBmmSnVHSFgFz/YIF3JC1Nx9xPstcljAz3VnW0ndc6qkNNdde9p5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WbPkjO6Q; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8HYxmtkv; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xONkrTri; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=h1aLZ5Hw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WbPkjO6Q";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8HYxmtkv";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xONkrTri";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="h1aLZ5Hw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D76675BCE8;
	Tue, 13 Jan 2026 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768307525;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPCxYOCoUD7LQ6s/efUZC/2KbmJcD7VEtuXkdYYieLI=;
	b=WbPkjO6QAX9LA5uTP07SnMMKdzDZ92G3j3fd7eGZePC8DGKN4k689Svt60h5y5nwy6PGR2
	Fkq/QcRDVSICeAN2b8nlCHaoKvscdG1nki0TEg2WBo63X62H2Wnl6H8GTQMCk6whHqxCLZ
	T1i4h7kqz9O49ihBdeq5JbJJiePGev8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768307525;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPCxYOCoUD7LQ6s/efUZC/2KbmJcD7VEtuXkdYYieLI=;
	b=8HYxmtkvoMotCAUyPSNqNcF4rWL5bTPOZ/0EJ5iT//9TdXEix1Cfyu4bsFANW6l0He8nl0
	0WBLlCj9hK6bNtAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768307524;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPCxYOCoUD7LQ6s/efUZC/2KbmJcD7VEtuXkdYYieLI=;
	b=xONkrTriLfWQ1zkBREq/ylD1FlGMsOzI05dTwnnJkxETQY4g8tqvLKgHBZaWZqxioRqDlp
	QxLBwFWYwPUQj0N9oa5R/etJA6c2f4/0xcfLLyR66HqRCRiRVsXmvTXzgt/wGu/bQIh6Ai
	8mDKUzmF7AUNvBvd8J3NQblKjtesQFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768307524;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPCxYOCoUD7LQ6s/efUZC/2KbmJcD7VEtuXkdYYieLI=;
	b=h1aLZ5HwqDxKA5O6YWu+rh2lVao5fEjat25+6RyQWymiU6bRrCTc7/D6ynnyluZcumPZpT
	VUBML9X1psyMArCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B76FA3EA63;
	Tue, 13 Jan 2026 12:32:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xUmHK0Q7Zml0WAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 13 Jan 2026 12:32:04 +0000
Date: Tue, 13 Jan 2026 13:32:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: Links to sources in docs
Message-ID: <20260113123203.GA320708@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260109173112.GA105682@pevik>
 <7b0539f874af71c899c21acfd71288fe7a2d8246@intel.com>
 <20260112132613.GA266368@pevik>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112132613.GA266368@pevik>
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

> > On Fri, 09 Jan 2026, Petr Vorel <pvorel@suse.cz> wrote:
> > > Hi Jonathan, all,

> > > I wonder how links in sources work.

> > > Documentation/userspace-api/check_exec.rst has:

> > > `samples/check-exec/inc.c`_ example.

> > There's this bit at the end of check_exec.rst that defines the link:

> > .. _samples/check-exec/inc.c:
> >    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c

> > The content within the backticks is just the link text, and has no
> > filename semantics. See [1] for details.

> Thanks for a hint, I overlooked it.

And I also wonder what does clickable links (e.g. [1]) in
Documentation/process/adding-syscalls.rst [2]

    - commit 75069f2b5bfb ("vfs: renumber FMODE_NONOTIFY and add to uniqueness
      check")
    - commit 12ed2e36c98a ("fanotify: FMODE_NONOTIFY and __O_SYNC in sparc
      conflict")
    - commit bb458c644a59 ("Safer ABI for O_TMPFILE")

I haven't found anything in the document itself, nor in conf.py.

Kind regards,
Petr

[1] https://git.kernel.org/torvalds/c/75069f2b5bfb
[2] https://docs.kernel.org/process/adding-syscalls.html#references-and-sources
...
