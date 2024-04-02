Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B61E480
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 15:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712072377; cv=none; b=ZO9bhaOIRaJGWaCdsVWMPFmIASTWUr0Nif4QfvW+M9hAO57qdzSQafD0FcisqmDU0FkgfcVcUmVgWpmMYT0250dVj1EZU605VVYossBeCqgFzt3NFkdepyKo4grT8rhYP2VFMexGgZINiv4F+Jeu1IOPjqTJ5uFAUV50OEmvwgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712072377; c=relaxed/simple;
	bh=TvCTuR37VDznXX4uy4jt6v3UIyMmdCkzMOHr00aqXgY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SrSPB431kHya6qaw5Lh7ugAThlySsz3d9y1pRGBZevSd4ztkUNeFDVzQfLVjmtAgctSvglwSs85biuYZSw7w8+u0UBavOXQIgrDH163+b6xzeHOvOKL/Hy1C/unqlzZjfb3p/l30fNjDiVPTViZmUY+WmwCLkEZsbJqRf4m+ciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VgzxYymQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VgzxYymQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EC59647C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1712072375; bh=I5bluI8am7b4ncISO+lPNcbJAJNAODYYQTLKx2UDnCI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VgzxYymQghSOLRBT0kbN+VmOyYuvCstbqv+qit9YmcxcKBj0yaCLfVNQDyoHeC04b
	 lfDMb6gVcPXyQUYUfb+nGXNkH120N3EeG95vp5AyqEPylliZwjt6Cnva2KIqJQ0YzC
	 chA7nOxJgfjkrR1nKJjDP9hCMCmDa2PMrsR1ppkiyFTEYMM/m/Xxb4XLqBUQYKprbi
	 OXPRxgD8TzVmWhNgPpiFVAusF0CJKFDMHjie9ZZ9iI0eOnTryal55pe4+3+9VxN82J
	 Q/SFaNGlJvXCViYC18ZhxMTK8OYMa6Eaysw1wjS1WCp4/RD+I6C4fyMQGtSCH8tkvb
	 3lARjX3OMKNjA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EC59647C1D;
	Tue,  2 Apr 2024 15:39:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linem Davton <linemdavton@gmail.com>, linux-doc@vger.kernel.org
Cc: trivial@kernel.org
Subject: Re: Trivial patch for "A guide to the Kernel Development Process"
In-Reply-To: <CAHAQYrOpe1wMecUFsMoiXZYzakErB_F-fvprng1mHUBp=SKgRg@mail.gmail.com>
References: <CAHAQYrOpe1wMecUFsMoiXZYzakErB_F-fvprng1mHUBp=SKgRg@mail.gmail.com>
Date: Tue, 02 Apr 2024 09:39:34 -0600
Message-ID: <87h6gjwz7t.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Linem Davton <linemdavton@gmail.com> writes:

> --This is my first patch, so kindly let me know if my setup has gone wrong. --

Thank you for working to improve our documentation.  Sorry for the slow
response, you caught me at a busy time.

I do indeed have some suggestions.  To begin with, comments like the
above belong below the "---" line so that the maintainer does not have
to remove them.

Please do not send HTML mail; among other things, the lists will
probably filter them out.

> Added mailing list link - https://subspace.kernel.org/lists.linux.dev.html
> process/2.Process.rst lists - http://vger.kernel.org/vger-lists.html, but the subscribe button on the
> page uses older system i.e Majordomo. Chapter 2 of "A guide to the Kernel Development
> Process" now has the susbspace link mentioned above and users are encouraged to subscribe via
> this link. 

The process documentation has a bunch of text on how to write
changelogs.  Here something like:

	The vger-lists page is obsolete with the recent move of many
	kernel lists; replace the link to that page with the current
	link on subspace.kernel.org

> Signed-off-by: Linem Davton <linemdavton@gmail.com>
> ---
>  Documentation/process/2.Process.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> index 613a01da4717..8d8fff825590 100644
> --- a/Documentation/process/2.Process.rst
> +++ b/Documentation/process/2.Process.rst
> @@ -397,6 +397,11 @@ be found at:
>  
>   http://vger.kernel.org/vger-lists.html
>  
> +To subscribe or unsubscribe to lists, please visit:
> +
> +  https://subspace.kernel.org/vger.kernel.org.html
> +
> +and use the "sub/unsub" links next to the list you want.

This is good but ... I wonder if there is still value in the old
vger-lists link?  Perhaps it should just come out.

Thanks,

jon
