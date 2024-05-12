Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B87E134A9
	for <linux-doc@vger.kernel.org>; Sun, 12 May 2024 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715529508; cv=none; b=SwcOLtdScZQwvxmQL82xuELIJSo14zkDHPVO40B+i4P7NO7bPv/WOZvImhSKvs6Udqwz6drQUl51BA/NpfgDkJ7k5sBRh6RtMqneFkRZ9rCVIWzY1x7APGQ+6xpv5L8GBy+hh39MF1rtgPVvRWDfVmc6pO2Y304jQ66BxZQapNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715529508; c=relaxed/simple;
	bh=yvX5DnZK52XCwTm0p79cLwWxhs6IyPwuPLIDVkE+0VM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G4hVmtd3mbElV6uOHRuqUoFIWwE3BRDZIuh+PfQzMWPywS98YHn4IuaRwY2eEOlmiCXzIHL8aOHvp6YVbS+n8IYvR9gxsXWevHUrtX5niEX50Ji1sTgOAeCH6fEm0sUkt7XFEkEXyhDk65laE7+kgC9T5R2kIz8HhIN06WuyZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=V3rPdzeD; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="V3rPdzeD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1715529503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uwRDRYHs759cEQpiIl9Csa3wg09sxGGTVDVUky2ARS0=;
	b=V3rPdzeDVbVNwzhcdv/hgBOizkbQ2Bw3gWUTJHSuPvClicbpqSRBL8FydRAuLFvv8oVL3M
	u3vpVPDbSDovSlmYWoo4i8uYSx5XfJ8YtpCQ3Okz2ofO87W7+Eo2B866bXMZ/a5cSSVs44
	QA1mfOgXzyGt2hW2U/0CXA3QBEF4ECnwblemLkzPZSNIiDFG1kYbtcylKgSTLXwj/0P7Ue
	l9+bZNXVm+bkA83KuPERl0B+pjNfdGHxul/AaDx5+yHckvzsSjTt7y1GCdZZM6ETSTnnT2
	kJm2QCPLDe77pJG50zkaAjyyTGojw9UYQuo5sDBj/sS0jOdSjBn74AKHai/cuA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: checkpatch doc suggestion
Date: Sun, 12 May 2024 17:58:10 +0200
Message-ID: <2996994.g7u86YH9XO@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZjTe1STECXg2mmmJ@archie.me>
References: <8090211.0vHzs8tI1a@bagend> <ZjTe1STECXg2mmmJ@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22575807.0nvYYx3YEx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart22575807.0nvYYx3YEx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: checkpatch doc suggestion
Date: Sun, 12 May 2024 17:58:10 +0200
Message-ID: <2996994.g7u86YH9XO@bagend>
Organization: Connecting Knowledge
In-Reply-To: <ZjTe1STECXg2mmmJ@archie.me>
References: <8090211.0vHzs8tI1a@bagend> <ZjTe1STECXg2mmmJ@archie.me>
MIME-Version: 1.0

Hi Bagas,

On Friday, 3 May 2024 14:55:49 CEST Bagas Sanjaya wrote:
> On Tue, Apr 30, 2024 at 12:56:30PM +0200, Diederik de Haas wrote:
> > I think it would be really useful if (f.e.) the following URL
> > https://docs.kernel.org/dev-tools/checkpatch.html#BAD_FIXES_TAG
> > 
> > would lead me straight to the BAD_FIXES_TAG explanation.
> 
> So to add link to arbitrary location in the docs, you have to explicitly add
> target (anchor) to desired location. Then you can reference it using the
> target's name. For example, to accomplish your suggestion above:
> 
> ```
> diff --git a/Documentation/dev-tools/checkpatch.rst
> b/Documentation/dev-tools/checkpatch.rst index
> 12796899584739..002b0aa68b8022 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -612,6 +612,8 @@ Commit message
> 
>      See:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#desc
> ribe-your-changes
> 
> +.. _bad_fixes_tag:
> +
>    **BAD_FIXES_TAG**
>      The Fixes: tag is malformed or does not follow the community
> conventions. This can occur if the tag have been split into multiple lines
> ```

Thanks to your hint and some experimentation, I managed to add id attributes 
to the various ``dl`` elements and can directly reference the tags :-)

But I noticed 2 things in the generated HTML documentation:
1) The id attributes are all lowercase, regardless of how I defined them in 
``checkpatch.rst``
2) The underscores (``_``) have been replaced with dashes (``-``)

So instead of linking to checkpatch.html#BAD_FIXES_TAG I have to link to 
checkpatch.html#bad-fixes-tag. I was hoping that I could get the literal tags 
names (including underscores and uppercase letters) as id attribute.

Is something rst/sphinx always does or did I do something wrong?

Cheers,
  Diederik
--nextPart22575807.0nvYYx3YEx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZkDnEgAKCRDXblvOeH7b
bmsHAP4xqgAjm48v1YxLBwAL2r7SkuodhM2gIeUfKN7YNwnmeAD/YL3W6wQOBqxQ
DEMhYHQrXrqebLaK4CKKUJvIMiNLjgo=
=4gcl
-----END PGP SIGNATURE-----

--nextPart22575807.0nvYYx3YEx--



