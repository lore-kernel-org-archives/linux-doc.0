Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34B33769C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 19:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419615; cv=none; b=jdE90qK5vaIlXg441dSQE/G3o8ho3zLy8wTvw7I2bt48gJBl1WYgJ4Hh/UG3NhexvNeqYVUNZ3cayPYLqONC195UlZAeHKUe1EuftYvHEew69GV0lZN9mImXMTTwT80oH6euQy1Fw0iwTp5YFc5pYRmKRaxpQizKtRJJP/eQKwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419615; c=relaxed/simple;
	bh=UZXash7GT+zKNLGZ/b7IAOi3awkxRZDrTqMOTmesLF8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzaHEPNqugW6mQUaty75mbdiXadpI13B7CSIzLqaQSFQ6Q8nIwzX5XNx5FsEs0RXwPlcizaloLAuVFdYoG9JLT/nR0KrEhb5V2OzyKu7RaAhzoU0HXJ7rm+7ILsXIYwXMkxJHTfC3X/fK4KX1LbenfxvS7AE3+IEwWJOulUXON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2LuUOa7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2LuUOa7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE26C4CEF7;
	Wed, 14 Jan 2026 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768419615;
	bh=UZXash7GT+zKNLGZ/b7IAOi3awkxRZDrTqMOTmesLF8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M2LuUOa7Mb0D/8aKDz8sVqgdkUY+EQ8M6DuplA1ubrdxH6HlgxjbrSwKrWahGkuxM
	 HIyExY/aJv7byWr+i3yBpTQ+fE1ScwAdEZcLUHHowU3gnItNoD70uJMLgONVRGN2zY
	 vymXIw4EsJEj2T+KVfmLXH35xzq/9G3rp+Qj+YUY5sTelHSAUUFLQtPuxCmUKWfJmH
	 KugdBT0uFBjANEVUhYJJ8D8nCq+Bd/Pag1ogi2+SYxyJi/lsYuzefJ6dMUfzB3Bayk
	 MPJnTOZ/e+4WT4nqBcpYnerl+JGcqfO4f7rb3nMbK1vciNXX5JuHtdEYuy6YNm4D0V
	 usjR0IF8kXYDw==
Date: Wed, 14 Jan 2026 20:40:10 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Changbin Du <changbin.du@huawei.com>
Subject: Re: [PATCH] Rework the jobserver open logic
Message-ID: <20260114204010.0ddc36fd@foz.lan>
In-Reply-To: <87h5soupog.fsf@trenco.lwn.net>
References: <871pjtxn13.fsf@trenco.lwn.net>
	<20260114102045.1c164472@foz.lan>
	<87h5soupog.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 14 Jan 2026 09:25:35 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > On all prints, please use file=sys.stderr.  
> 
> I was thinking, as I wrote all those, that I needed a warn() function,
> but then it slipped my mind.

well, you could logging. As this is called also inside kernel-doc,
this could be a good idea.

> 
> >> +            return
> >> +        fds = split_opt[1]
> >> +        #
> >> +        # As of GNU Make 4.4, we'll be looking for a named pipe
> >> +        # identified as fifo:path
> >> +        #
> >> +        if fds.startswith('fifo:'):
> >> +            path = fds[5:]  
> >
> > Hmm... moving from partition() to startswith might be problematic...
> > are we sure that "fifo:" can't be in the middle of the string?  
> 
> If we don't get fifo:file then it's something unexpected and it should
> complain.  At least with these changes it will actually complain.
> 
> > If so, instead of using "5" magic number, I would use len("fifo:")  
> 
> I guess, though that's just replacing one constant with another; if
> something changes, both have to be tweaked either way.

I meant:

	FIFO = "fifo:"
	if fds.startswith(FIFO):
	    path = fds[len(FIFO):]

(or encapsulate it on a function)

> 
> Thanks,
> 
> jon



Thanks,
Mauro
