Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA6679CD
	for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774213560; cv=none; b=rHgOOjBLVe87HKPCtT4681xe7Pu+/yXAQG+hlUBekfJxGT/GBKgBapXG5Do+LlJxJsuypmXJTAA0oGieGd/TqURSL5VSJvaSO+kUiGCCs0B11LNoaFNqksS1Ej+wlwVZaf00m5EykoqAChfQOYfkBpKgTXJcr1orwjkUiU4kPHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774213560; c=relaxed/simple;
	bh=e8GFVVmfV1MBDJjw11veZKm+Hf1qHU+FS/6lamW3t34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mxAaG4TyLFH/VVnfBUvwBiaKFMkZbI5aOG6gOPLl71/zwaTkxgHNV2OtW5lbKsnWhx85UdQV7jA7E/ZDxoA8OsElDdccx6vM7LELN4NLEQ+2BQTmpbvEAEfRABt2Qqz1nxksj6fpQi8eJN6Y9XonkZIx8aVWdKjaVvM3fpjxVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iElUpjrb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iElUpjrb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0A23A411EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774213559; bh=aDt5/naeiSX09YJNRTyVvYGCvlKuxgZ+jp4sP8gL1No=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iElUpjrb6cXJGMtSVWoUbCBa6lHi3NB6OM8oawlNLwsMhhgF0vb5AKZHHh2mKPhQY
	 gyqNkKlyCFCaLtfGY1NbMag/ABoBhJl/iViNM6I/fJt8gQQNzf7JKoA/WjjXm+VFgH
	 e4QTPXszushk1rstrstDxsZL/8/s0CKo8TwUyZT6b/GFuU7g8HBOxM2CIIxNLtFCYV
	 DDnTdS4jJR9lhZZSbfpVG8i3HIZ0VcIB9k2mnXJNZ0oCEQZyGnqmh4yUAWKPK4LwOU
	 fJljvIGQZ4ixOk/VmQvugyOieJqWz/fFOLU1hyF9vInfDZSDmte2dh3rv3tYPRfi2d
	 XxADe70IdKW0w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0A23A411EA;
	Sun, 22 Mar 2026 21:05:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Invalid link generation for equations
In-Reply-To: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
Date: Sun, 22 Mar 2026 15:05:58 -0600
Message-ID: <875x6nd16x.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Hi,
>
> I have noticed that links to equation images are not generated correctly
> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst has:
>
> =C2=A0 =C2=A0 .. math::
> =C2=A0 =C2=A0=C2=A0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0NR\_MEM\_SECTIONS =3D 2 ^ {(MAX\_PHYSMEM\_BITS=
 - SECTION\_SIZE\_BITS)}
>
> The generated HTML [1] shows the source code instead of the rendered
> equation because the link to the image [2] is broken. [3] does however
> exist. The issue seems to be that the link is relative to the root, even
> though we are in a subfolder (mm/ here).
>
> Given my non-existent knowledge of Sphinx I have no idea what the fix
> might be, but I thought I'd report this at least :)
>
> - Kevin
>
> [1] https://docs.kernel.org/mm/memory-model.html#sparsemem
> [2]
> https://docs.kernel.org/mm/_images/math/d99368220bfdedf1a888b1c09eb7236a8=
c87d079.png
> [3]
> https://docs.kernel.org/_images/math/d99368220bfdedf1a888b1c09eb7236a8c87=
d079.png

Thanks for the report.

We have all that elaborate machinery for generating fancy formatted
math, it would be best if it works properly.  I am curious, though, if
it's truly broken universally and, if so, how long that has been the
case.  If it's been that way for some time, one might legitimately
wonder why nobody has noticed thus far.

Anyway, will try to look into it soon.

Thanks,

jon
