Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B5C2857F6
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473120; cv=none; b=PRIQhNuEIfbl7uRdn6L6c+ttXhYZfyPxiiz+wYNJ4fBYcu5TaNtXPpHXh2OMw9eyCAL0DhJAkX7k3JMtmpDndYYyYs7K+Tt2jN6rcPFsVwtLKZlviAX2IgZVAXbHyPZarSL9h29eDNjTDpSpfZlo+SqEbAeDPDsb8EvmAaYdxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473120; c=relaxed/simple;
	bh=v0QwLRg4FnYQMO4HS2Q6uUfpD6zisS1dEZz98dZtcwQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gAFRP54NJ9+oh2CFdk5cvNjOqQr5SclThREJIulRwRQU/Pg4RPLpNbI4J/5rO1OGEcfXv3hxa9urwVPHMwoJk9mKa6tTTbUHuNy0Lm8oEYaR31EQDWlCZvLBP1sM8o3Vt0m7uUcWCd8SGyGbSW75+kbTmPvLYSsniIIqvz5Bbw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jvTPvtWm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jvTPvtWm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 866C0411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774473118; bh=iXvHBVsrVOXj+oIfuFWotAZNnxdTB7SghW5lb3OsGSc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jvTPvtWmUc9OJRjoddcAk0PqVV1Q8mU8RIxrAVwLxJNIWsi+oK1DHZ73rDUDU65Bq
	 dgV5YB7dLCSsYM0vsubCf6Jrx5JVWxIc9C2jDzHJNzDqPl02W4SDTuOhd7yrd0wTsk
	 /M+cI4dzYrQEwrAxRh3HCWBj0mIS74ZN63Vw80yWABuy1rgDjEkfbx+xDEDXirGYB9
	 HL0Y9LPPJif190zUniaiAgeU3yjn2+imkP7ZDqJL19T334dUUJmZW5eZ8JdaqDhxtr
	 JaFJKqCnL2PU05pKlunxvdLxdOB7V/tho+NL1iHBoGfJQHHak1wajqO9IBFWa6wVpW
	 1jdhLCzHIZroA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 866C0411D3;
	Wed, 25 Mar 2026 21:11:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Invalid link generation for equations
In-Reply-To: <501de93f-65f2-4a45-a84b-d38560cd9e22@linuxfoundation.org>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
 <87se9nejza.fsf@trenco.lwn.net>
 <501de93f-65f2-4a45-a84b-d38560cd9e22@linuxfoundation.org>
Date: Wed, 25 Mar 2026 15:11:57 -0600
Message-ID: <87o6kbehr6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shuah Khan <skhan@linuxfoundation.org> writes:

>> OK, so this is more than passing strange...I can't reproduce that
>> problem locally.  The HTML I get is:
>> 
>>    <img src="../_images/math/d9936822[...]
>> 
>> On docs.kernel.org, instead:
>> 
>>    <img src="_images/math/d9936822[...]
>> 
>> Note the missing "../".
>> 
>> I will confess that I don't have a great understanding of how imgmath
>> works and how that link gets set.  We could "fix" the problem generally
>> by setting imgmath_embed=True, but it would be good to understand what's
>> actually happening here.
>
> Respect SPHINX_IMGMATH (for html docs only) in Documentation/conf.py
> might explain why imgmath_embed=True works?
>
> # Load math renderer:
> # For html builder, load imgmath only when its dependencies are met.
> # mathjax is the default math renderer since Sphinx 1.8.
> have_latex = have_command("latex")
> have_dvipng = have_command("dvipng")
> load_imgmath = have_latex and have_dvipng
>
> Without setting imgmath_embed=true, math_renderer is mathjax which is
> default since Sphinx 1.8

We default to imgmath if the requisite utilities (latex, dvipng) are
installed on the system; perhaps that's not ideal, but it's what we have
done for a while.  It all seems to be working as expected, except that
the <img> element has the wrong URI in it.  Strange.

jon
