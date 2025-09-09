Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3131D36D
	for <linux-doc@vger.kernel.org>; Tue,  9 Sep 2025 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757446264; cv=none; b=q2uDtSb3zGtnSGmeVcZZPhw0rGfibf+Np8RYJOsGNrIWUSfnfOl+c/Cjp3N7LrZkGKfZ8DIiWRi/AuAcMsSli8JPNFE5ay71GRn+VWBNLqbkgcl2kfJhBuIGQxrpf5d9YmDZRb18q0H5IBdxVZjiV8+RZX9yXdubi2389hXnOnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757446264; c=relaxed/simple;
	bh=1c8BWIaotlPOvQTqdXkppJJEQif1aqXYFtUWjqrzXwE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uyJtCrR7yDWCDz7cHk58XdVqGeguNkiDTLChwnflNkJW6Mqe7fbaE+uc4hUsRenYkjwg+bKZbAoRSBSFtj0qQ7XgvEH4mLe8iXQsDe8JH6B7pWCAWkyh1YmRRNHSC7JNo1URHeDVDUQ4VNaXSQTUXXnvzZfknzlD2SY8C3kvraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PKrYl4dF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PKrYl4dF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4DFEB40AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1757446260; bh=XRjgOM2WZyxUtHyZrkgfNP1Hi3i2XvVqVNp5OJhVEU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PKrYl4dFY/eumkhBW4m4+aaXaQXy18f2UAlWsi+LcVZPTVajskF07x02h1bjnKj/Z
	 8Xt1/zRM8rVVQUn/jb+vw2bNDl1OGH69NfCd8PSNiLbgB2PywrG7+eJaQ7H+FXgHwc
	 3clSl4S/PA/ykooi+CejDUN1TGFZE2Zj3HstornschBmHd6z+v57uEbg330Ak36W62
	 BNDJICU7CLJBhd0c78D01HR6XVasFmhcdL4+sEgFVy9zoLDwA4j8Q55sx/qngTwdKs
	 yl/GM/UOQQYJPejfrw3drzzvMr+9TC6JDUIqbb+MlOVmW5086mmbj8dszOI3PuJaTm
	 cvcXujjwbmbSQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4DFEB40AF9;
	Tue,  9 Sep 2025 19:31:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zhixu Liu <zhixu.liu@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs: sphinx: handle removal of
 utils.error_reporting in docutils 0.22
In-Reply-To: <CALMA0xYMNcD8UN5ykJALMskFGnNaau3cxJ1E5=bDE_mGS+bZBQ@mail.gmail.com>
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net>
 <CALMA0xYMNcD8UN5ykJALMskFGnNaau3cxJ1E5=bDE_mGS+bZBQ@mail.gmail.com>
Date: Tue, 09 Sep 2025 13:30:59 -0600
Message-ID: <87plbzv2x8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zhixu Liu <zhixu.liu@gmail.com> writes:

> Hi Jonathan,
>
> How about the v3 patch? I still think try/except is more robust,
> but I can switch to version comparison if you prefer, e.g.:
>
> if docutils.__version_info__ >=3D (0, 22):
>     ...
> else:
>     ...
>
> My preference for try/except:
>
> 1. Reflects the actual runtime environment, while version checks can
> be broken by backported patches.
> 2. Avoids parsing non-standard version strings (e.g. 0.21a1,
> 0.21.dev0); try/except is simpler and has no extra dependencies.
> (__version_info__ mitigates this somewhat.)
> 3. More Pythonic and straightforward.
>
> I=E2=80=99m fine with either approach=E2=80=94please let me know which yo=
u=E2=80=99d like me to go with.

I've already been fairly clear on that, I think.  Exceptions mask bugs,
so I really don't want to spread random exception-handling code around.
A version check says exactly what we need to know, and lets us know when
the older code can be removed.

That said: I dug into this a bit and concluded that this approach is not
right.  ErrorString and SafeString() are old Python 2 compatibility
stuff; there really seems to be no need for them with Python >=3D 3.6.  So
the right fix is to do away with that import entirely.  I've put
together a patch with that approach, will post shortly.

(Incidentally, Sphinx has not caught up with this change, so how did you
test your change?)

Thanks,

jon
