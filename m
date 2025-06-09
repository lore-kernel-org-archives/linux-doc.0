Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94925CC73
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479834; cv=none; b=cCl+1Fk4PBfuiu+fm/xK8Ituei31fN8DHvIAIy9sz2iSDI2f38/jM/aszCxGpp1h4GO2sAeDOE5HKa483efqmvn1ypwxgso3FKyQsZ4g02NCClJvuJfwQb9bfEfzhBTTzhbYxdI6bCxW2K0hazyeKPmi9T3LHjrao++/84XwCeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479834; c=relaxed/simple;
	bh=qhlHa/QrqCpSVlVuKTBHOJBNMmHHFOGGDAdPl8EHwy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=InajVdkNniWHfC3jVCqO0ThDs9OxnY8sgJaugorx+VmMMetkgNYExjb/OSd+7Vvdm7mugXOLmskbhv8p709eHJlRXmDA/w7NRdjN8AZ8pLD8RDP1EMqqMENwwYap8rGgawu9KKLRTh4oKZm4OVm6tEVUaRaR/Hlox9fw4WiXiaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=a/c+9jAh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="a/c+9jAh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7198F41ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749479826; bh=tCjrd7v0CjU1fk0ELWtE4rusx7upatPMznc3T7GaX/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a/c+9jAhzXW8u7v8h7fKlHvvH9dmoWdf2jQ0Rc90bNT1REaA5ZDvzc5t3aCBxs2kl
	 7417WM8mk/qewpbgVbwxy51FPdm/6AFlELnJsnNRacKBwWSxhcIX5/zNfH8sWcPyQ+
	 ObipgNt3S8fRQ1KGR9GSfvCQPHaxmNgjCNiiCs5ky0EMOksjQNr3AfeIFLT0Ts7aYl
	 l3u001suq1L7JzPKccgNezmLV3Cq/wVpobk0ZsKzj7J3pwIEV70xaE1cUWR/LKcrxT
	 mOjqW/1NyFAe4OlHLES796SqETffPpKehsS8KqiXc0C6hqXiivDJvgKl5AtVKXYL4C
	 kh+Jkp+4T7fdQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7198F41ECC;
	Mon,  9 Jun 2025 14:37:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dante Strock <dantestrock@hotmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify
  terms; added note.
In-Reply-To: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
Date: Mon, 09 Jun 2025 08:37:05 -0600
Message-ID: <87ecvtc772.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thanks for working to improve our documentation!

Naturally, I have some comments, the first of which being to run
scripts/get_maintainer.pl on your patches to get the list of people you
should send them to.  Then cut-and-paste it rather then typoing it by
hand :)

Dante Strock <dantestrock@hotmail.com> writes:

> From 1fbe3d56d604a0f8a87ed1d3f092b84c2fab4392 Mon Sep 17 00:00:00 2001
> From: Dante Strock <dantestrock@hotmail.com>
> Date: Sat, 7 Jun 2025 09:29:36 +0100
> Subject: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify
>  terms; added note.
>
> From: Dante Strock <dantestrock@hotmail.com>
>
> As a possible suggestion, might it be worthwhile adding a terminology
> section specific to each section of the kernel documentation? That way
> developers have a handy reference to refer back to for terms they might
> not understand.
>
> ---
>
> Documentation/process/2.Process.rst:
>
> - Changed some instances of 5.x to 6.x(though kept some instances of 5.x
> that are used in examples).
> - Clarified the term "rc" in brackets.
> - Added a notice for people installing Git or Mercurial to check their
> distribution repository for the latest version of the software.
>
> Signed-off-by: Dante Strock <dantestrock@hotmail.com>
> ---
>  Documentation/process/2.Process.rst | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)

This is backward - the changelog goes above the "---" line, any
additional comments go below.

A bulleted list like the above is a good sign that the patch should be
split up - patches should do one thing.

> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> index ef3b116492df..70f8a6603454 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -18,17 +18,17 @@ major kernel release happening every two or three months.  The recent
>  release history looks like this:
>  
>  	======  =================
> -	5.0	March 3, 2019
> -	5.1	May 5, 2019
> -	5.2	July 7, 2019
> -	5.3	September 15, 2019
> -	5.4	November 24, 2019
> -	5.5	January 6, 2020
> +	6.10	July 14, 2024
> +	6.11	September 15, 2024
> +	6.12	November 17, 2024
> +	6.13	January 20, 2025
> +	6.14	March 24, 2025
> +	6.15	May 25, 2025
>  	======  =================
>  
> -Every 5.x release is a major kernel release with new features, internal
> +Every 6.x release is a major kernel release with new features, internal
>  API changes, and more.  A typical release can contain about 13,000
> -changesets with changes to several hundred thousand lines of code.  5.x is
> +changesets with changes to several hundred thousand lines of code.  6.x is
>  the leading edge of Linux kernel development; the kernel uses a
>  rolling development model which is continually integrating major changes.

I do not object to these change and could apply this, but it might be
nice at some point to rephrase this stuff so that we don't end up doing
these updates repeatedly.  After all, we'll be at 7.x within a year...  

> @@ -48,9 +48,9 @@ detail later on).
>  
>  The merge window lasts for approximately two weeks.  At the end of this
>  time, Linus Torvalds will declare that the window is closed and release the
> -first of the "rc" kernels.  For the kernel which is destined to be 5.6,
> +first of the "rc"("release candidate") kernels.  For the kernel which is destined to be 6.16,

This is a separate change.  But, of course, yesterday's 6.16-rc1 is in
no way a "release candidate".  It's really just the naming scheme that
Linus uses for his testing releases, calling them "release candidates"
muddies the water and risks reigniting old debates.

> +Note that not all Linux distributions have the latest version of Git
> +or Mercurial available in their repositories. Consult the package
> +maintainer for your distribution to get the package updated or
> +download it directly from the website.

I almost wonder if the references to Mercurial shouldn't just come out;
I am not aware of anybody using it for kernel work at this point.

I'm also not aware of anybody who has run into trouble because their
distribution lacked a shiny new version of Git.  I'm not sure we want to
encourage people to bug their distributors to accelerate updates?  Is
this paragraph solving a specific problem that you have encountered?

Thanks,

jon
