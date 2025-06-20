Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B55295D86
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427704; cv=none; b=CQBUmChHca/5cOgYZIJw6n4Go7sOUIHFOVNokhftk0YxyJqoUMI003ldhO4qA7hLKwCxHPVjsIypkyu0EtCh9QF649EQfZiwPsxOcsG9TLqN/ZEcDf4KeUl/h9vC8CyoKL/xuEONej1ULG12cUtisJLNoRQmJHPiSrQ7NaPU41Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427704; c=relaxed/simple;
	bh=c52Jn9E6U/luUL5hT6RSWBCfl93bwt4NMgrTSv+Pm9w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m5vSytq+LF/kE5CAgJ0PptqglaHBPS8b+pcKd0u7MdOgBvspssHTk5M9xmcHBJrBkvysRaxyY8MSnWo5iGZCuJJgb6eIPFQqYmjFRHA8p8UzLzzJFu1cVwGV/f+UThOpQ85R701SqtNZ16A+PYEAXPuk++2NsLilF79YSdc35HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kj8Q3vDc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kj8Q3vDc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DF0F941ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750427694; bh=ietLbs32Y6JRW2ugnY2w3JxdWAoCzq1MxdZiTtj5xGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kj8Q3vDctPxKORXDyFbREj6rkXlLWvH5+0Q/y4apRS3jsonssddHQINs3EhPM3vzn
	 3bwLi7jGEl1L7YCZmIbYW/lN+kSzBef45i8RfSBtssNDR6izOS68YFrY95NljnxCGx
	 59SjPVJerWgf9iVA05HpW8F03AIhmLitLpRj0R/Hg0cUNKYgEFemHzsJDRCciY/7B8
	 q/WYWbIdu+oY3sshAzdWxVl+c5LjXlahxHyYs4mG3qxb62KKhmRRJ+3e2GNNVNc5cJ
	 D+hDW2rC+3WLT+UYQ/Ik4vGCGiGs4zhi0aFAirDO74C2yN87BwiR3GmnKspCxkf85j
	 fQMA6ye6vrudw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DF0F941ED2;
	Fri, 20 Jun 2025 13:54:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
In-Reply-To: <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
References: <87wm97fmn3.fsf@trenco.lwn.net>
 <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
Date: Fri, 20 Jun 2025 07:54:53 -0600
Message-ID: <87frfufrgy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Thu, 19 Jun 2025 15:26:56 -0600, Jonathan Corbet wrote:
>> Docutils emits a deprecation warning when the set_class() element method is
>> used; that warning disappears into the ether, but it also causes a crash
>> with docutils 0.19 when combined with certain versions of Sphinx.
>
> To be accurate, I'd rather say:
>                                                 but it also causes a crash
>   with docutils 0.19 when combined with any version of Sphinx whose
>   requirement accepts it.

...or just "with docutils 0.19" and put the period there, perhaps?

>> Avoid the deprecated function and just append directly to the "classes"
>> attribute like the documentation says instead.
>
> Nice!  This is the kind of fix I wish I could have come up with by myself.

It helps to have broken it in the first place :)

> Tested OK against debian:12's Sphinx 5.3.0, as well as Sphinx 3.4.3 of
> debian:11 and almalinux:9, Sphinx 4.2.0 of Ubuntu 22.04 and other recent
> distro Sphinx packages.
>
>> 
>> Reported-by: Akira Yokosawa <akiyks@gmail.com>
>
> Closes: https://lore.kernel.org/de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com/
>
>> Fixes: d6d1df92c25f ("docs: automarkup: Mark up undocumented entities too")
>> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Tested-by: Akira Yokosawa <akiyks@gmail.com>

Thanks,

jon
