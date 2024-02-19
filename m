Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C74594C
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708364954; cv=none; b=abrbTH+UxNURchezIw8YPiWu00f2xbIwNitUuY3ME8b6GvFcJmgvDgVuy+X3HeG+l7O2Ly0NKAX+MLbph/Oj0byua4YihF9BKmhJ1DXE79RCThIx6PwF+IfUaJWDFu5IeKlaUJ9VsqOyRctP5UDW1O2LYBrzcSFoN3rm3K3O2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708364954; c=relaxed/simple;
	bh=DVO+jRnXNM2fNyG21S7Do8wtW2JtWSp/FNj2kFkhtgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AcouNmOgKszVHCf0HdObcIyWrZF5AFO9Ep7FFNBEv0CuZxHuQYabUO34tPUAD3UqZf7DutAQ0J+kmovxr7AdHzNIEMwyccD3Df5KxtcpeVyVMgC3VDWYUFnsxfTdwuTSPuIwl2pOAY8F8F6bOsjqnzE2GLtRUWNXqOqFt7uvMYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DpRJNO+8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DpRJNO+8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 918C947AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708364949; bh=FtVnwR31igHIiTwvv3RkhIhcfh3YfK5jd6Pumsb23mU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DpRJNO+8dGblQSdrqxAZX5I1XDmRZjbnxYbLAX+IjwBO15IjfcCUWuAYxVFDtR885
	 HQKNl0NuXpNawVL5filMOMoenHQeD5/Jz7McM9kba+V6A+6Hg6srkgLAlobS1yWRWV
	 ylhPA9DO54DDCkERjuyzrNQ++YJ24/JMNqFCfPMzyJFhusvCJ6AtWzg5vD0xp4xWgs
	 MNxkV6Q3JNcNaNoQhp+azkCz7RH+iktgIlhG+vgKj4HEH2GjPZl5NLhCno9LhNAlWK
	 hQXnGYAYRob+34xb4IXVDEqE16dJOu3uORug6+REUuF1BULxkfTlLJR2zE/k2xW3/6
	 7mZUp3HpiRM8Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 918C947AAD;
	Mon, 19 Feb 2024 17:49:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: PDF misery
In-Reply-To: <64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com>
References: <8734tqsrt7.fsf@meer.lwn.net>
 <64908dd3-17c9-47e3-a076-d78105fb823b@gmail.com>
Date: Mon, 19 Feb 2024 10:49:08 -0700
Message-ID: <87o7ccpcob.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> It sounds like you have google-noto-sans-cjk-vf-fonts installed on your
> system besides google-noto-sans-cjk-fonts.
>
> What does
>
>     fc-list | grep NotoSansCJK-VF.ttc
>
> say?

No output at all, even though I had google-noto-sans-cjk-vf-fonts
installed.

> Uninstalling google-noto-sans-cjk-vf-fonts (and
> google-noto-serif-cjk-vf-fonts in case you have it) should resolve
> the issue for you, that is if you can safely uninstall it/them.

Getting rid of google-noto-sans-cjk-vf-fonts did indeed make the problem
go away.

> As the xeCJK package requires xelatex, variable fonts are not in
> our options, I guess.

So it seems.  I guess $WE should probably change
scripts/sphinx-pre-install to give a warning; I wonder if some defensive
changes to Documentation/sphinx/kerneldoc-preamble.sty would also make
sense?  My TeXpert days (such as they were) are decades behind me at
this point, so I'll be slow to do the latter part if it comes to that.

Thanks for your help on this!

jon
