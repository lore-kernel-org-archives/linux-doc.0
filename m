Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3B1134A1
	for <linux-doc@vger.kernel.org>; Tue, 16 Jan 2024 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZQlr8F3t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lKq0rWrs"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705398835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3frXCF5ODEhgr3ym4N4qufh4eaa3uGdFAbCWc/P1E9A=;
	b=ZQlr8F3tDho6LOfLURIJpDNqY3CMYeB4bBgpkiF7xnFMVnx9YJqetlmTAI3DMa1IJeJxiv
	EhkL1h6gALJIcZxhR0HaIzEheeG83yL4Z/VvPxnscaPZmM48jrORgzcK475V+zOGKe5JYd
	/tO/Fn+3Hcc9m6nRaDk78M4PTDUAOdpjiKLBFfslUfVI3yLZ1UCNoSf+G6kisnI05gohAZ
	PnpaXC2rH09YWalmdKrvRJ521EYaDARL4LifGc1ChOot11miFXu4CA3NpTIJp3Cce82VyV
	EZomPz/9YBZhmsDTVLnF7TZ5pGDaXOrQ1jn9eYDA4KnNhXzTJWS9m/fw8rRtVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705398835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3frXCF5ODEhgr3ym4N4qufh4eaa3uGdFAbCWc/P1E9A=;
	b=lKq0rWrs/Zt8BGlmwvFkPuY11E9DqfYsMzGzW5PH2TGhh/mC+zATOG2zCWVX+IWxPu8QCL
	d8q7UG0+Ae4R7DBg==
To: Matthew Wilcox <willy@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <ZaWSkvm8qsXgBVEP@casper.infradead.org>
References: <87y1cqbg01.fsf@somnus> <87ttnee69t.fsf@meer.lwn.net>
 <ZaWSkvm8qsXgBVEP@casper.infradead.org>
Date: Tue, 16 Jan 2024 10:53:55 +0100
Message-ID: <87o7dlsix8.fsf@somnus>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matthew Wilcox <willy@infradead.org> writes:

> On Mon, Jan 15, 2024 at 12:38:38PM -0700, Jonathan Corbet wrote:
>> Anna-Maria Behnsen <anna-maria@linutronix.de> writes:
>> 
>> > Hi,
>> >
>> > I'll try to integrate some documentation which is already written in
>> > code comments into the kernel documentation.
>> >
>> > There I face the problem with a backslash at the end of a line in a
>> > 'code block' and this ends up in removing the newline.
>> 
>> Yes, kernel-doc does that...looking at the history, that behavior was
>> added in 2012 (commit 65478428443) because otherwise multi-line macros
>> are not handled properly.
>> 
>> Fixing this properly is not going to be all that easy; the code reading
>> the source file is well before any sort of parsing, so it has no idea of
>> whether it's in a comment or not.
>> 
>> A really ugly workaround... put something relatively inconspicuous, like
>> "     .", after the backslash, and at least your formatting won't be
>> mangled.
>
> Well ... if we're into "ugly workaround" territory, we could use '^ *'
> as a marker for "we're in a comment, ignore the backslash".  My skills
> in this area are terrible, so would something like this work?
>
> while (!/^ \*/ && s/\\\s*$//) {

Thanks! A smoke test looks good (except of required clenaup of some
comments which use backslashes). But I'll have a deeper look at it to
verify it completely.

Thanks,

	Anna-Maria


