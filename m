Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A418B06
	for <linux-doc@vger.kernel.org>; Mon, 15 Jan 2024 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gzatjZp8"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0F07F79CB;
	Mon, 15 Jan 2024 19:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0F07F79CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1705347519; bh=PqRDC2FNxWQCztUMekqzxlfzWWEiX8GbI4/0lkxHvjU=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=gzatjZp8jJrwlbRdOj5y5xFehi1zRHfrC1+mVCq3nP4XmGemv9+kVE4jTedX7KwHj
	 +GIcKP0PxYKXEqNY/9CekEyXo9VkOXr8X7UgWA68Y9IHljmbw75eUeFxlLxbSxKT2h
	 36ceGQOIrJPFF/xjSlMnLwjgmXSMaB0NZsMMSoo0GDBYD2I4Esa1cUKKOEtouuKc+q
	 q1sFtI1vpBKychmDvwSa5vph9jcQClTA67AGURVxIq5mDQYdlUCJIPNHVb8pR3LJ4n
	 qbsT2XTtUckyWGyjOnygBTfVZaA+mefqmRtSUaj2Jadg0E6d1H/7QH/zj0OH3ofeXL
	 lwWgkbxYtvcMw==
From: Jonathan Corbet <corbet@lwn.net>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>, linux-doc@vger.kernel.org
Subject: Re: Help required - kernel-doc, code block and backslash
In-Reply-To: <87y1cqbg01.fsf@somnus>
References: <87y1cqbg01.fsf@somnus>
Date: Mon, 15 Jan 2024 12:38:38 -0700
Message-ID: <87ttnee69t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> Hi,
>
> I'll try to integrate some documentation which is already written in
> code comments into the kernel documentation.
>
> There I face the problem with a backslash at the end of a line in a
> 'code block' and this ends up in removing the newline.

Yes, kernel-doc does that...looking at the history, that behavior was
added in 2012 (commit 65478428443) because otherwise multi-line macros
are not handled properly.

Fixing this properly is not going to be all that easy; the code reading
the source file is well before any sort of parsing, so it has no idea of
whether it's in a comment or not.

A really ugly workaround... put something relatively inconspicuous, like
"     .", after the backslash, and at least your formatting won't be
mangled.

> Another question: Is there an linux-doc irc channel to ask simple
> questions?

I don't really do IRC, just don't have the spare attention span for it.
Feel free to email me anytime though.

jon
