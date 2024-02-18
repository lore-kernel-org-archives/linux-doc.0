Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54166EB56
	for <linux-doc@vger.kernel.org>; Sun, 18 Feb 2024 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708286243; cv=none; b=STn1LSDB3nNcv8wScwqvCoI4RrFsisT6Vz+ae8qiKAZneARz3ryNQN52XSV3Ii4CGyshZDuiln53s9DyPAwJllqcD0LIxODYhYsI2cw8wGXbM7Q+7Bsns+YRSYcqsLshnKWcs3BI8j4hxCg4C3+BvQ8dYi1V6t7g+/A/0Kk3w7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708286243; c=relaxed/simple;
	bh=XaHiPj0dlJWbU+Xjosg+49aGtkp0Z43b9PqZVrRioiE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2WLtjwiD3rfGvnhg94/VBHTIXoC5k8Skp6VpiY8ppMIWwoap19fC4/HoxzdfuZG+W6QctmzrV/B4V0XF3rcgcoox62eVswfXlwnuE7LUycs4n09zB4wM7Has1KLvIxrxtePy9jCw0bGAltgtMG01o4sQMJqx2S+UAkfPzh283s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F57rPajO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F57rPajO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609B2C433C7;
	Sun, 18 Feb 2024 19:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708286242;
	bh=XaHiPj0dlJWbU+Xjosg+49aGtkp0Z43b9PqZVrRioiE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F57rPajON7eN58dL2MGtWfcRnpq6Yraiz4F49iFASATITllCGAqhtYigr2w8ixmFZ
	 v4yEWIoM5DnzUGXSPlZA29Nz61+WNuE9alh8FPw1IiMVxn2Q/PD/2K5JPIzlvYckKF
	 JAt5YgVa/pLYXez9sa9uRrO5zdUkvJa9wb97o0+IBdYKtCfFrrYb6N9YDnNuK+hdIb
	 dGD2do5huZ8hR0WvZQsOxJIEILXumZq0aaF4jaYjXFz1yZVaXqa3JrcKEA+YGcrlXN
	 WT1JdGfZpBpjtxSio7czMUfdI589PdJ82OzcPzVh1HGaD49gPYN4d2xcV28hdmwu34
	 wWcHiY23xqlZQ==
Date: Sun, 18 Feb 2024 20:57:17 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum
 <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org
Subject: Re: PDF misery
Message-ID: <20240218205717.77763c22@coco.lan>
In-Reply-To: <67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
	<67f6ac60-7957-4b92-9d72-a08fbad0e028@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 Feb 2024 00:49:08 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi,
> 
> On 2024/02/18 6:29, Jonathan Corbet wrote:
> ...
> > One is the dreaded Latex "too deeply nested" message that causes
> > everything to explode while generating filesystems.pdf.  The problem,
> > specifically, is .../filesystems/xfs/xfs-online-fsck-design.rst, which
> > blows the limits in two ways.  This patch "fixes" it - this clearly
> > isn't something to apply, it's just a demonstration of the problem:  
> 
> So, there is a handy answer in the Sphinx documentation.
> 
> Just look at https://www.sphinx-doc.org/en/master/latex.html
> and search 'maxlistdepth'.

Hmm... there are some other interesting options there, like the
verbatim ones. One of the problems that required lots of changes at
the media uAPI part of the docs is because code blocks are reproduced
as-is, without wrapping, making them to either be truncated or going
past the margin. That's specially painful on code blocks inside tables.

The way it was solved was this this patch:

	3b4c963243b1 ("docs: conf.py: adjust the LaTeX document output")

plus several changes on media docs with redesign changes (before and after
the above patch), plus several and several macros at the .rst files to
change font size and carefully adjusting columns sizes on tables.

It sounds that since then other verbatim options got added. So, perhaps
the PDF output could be improved on newer Sphinx versions.

> 
> You can set this variable in conf.py, say,
> 
>     'maxlistdepth': '9',

Good catch!

> 
> Now the deep lists in xfs-online-fsck-design.rst can be built
> into PDF.
> 
> Problem solved.
> 
> It's getting late here, so can anybody prepare a proper patch
> with my
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> 
> ?
> 
>         Thanks, Akira



Thanks,
Mauro
