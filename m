Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CF408624
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687093; cv=none; b=NX83iofv10Wc1N6rYv4tJKO3SwwoE4urZyUhGTbAb4Jp7Mr1gUVTFMoEYiJCoEvYwZoFr5xqT7sklH3Hjsi7OIR/7dDQRGczXFu8Y3JcpA3wAHlgY/8Qs9bR6inHnKrOlnm3ImgIJ0+IiWo31HnijDkCu8ZVaWPtEFOeMoyCeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687093; c=relaxed/simple;
	bh=C3HhkpWE6qU85b4hr6HvJtthh4oucD293NGx2vb+4Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fqFinta0ceUN0b5ntGjsFuLkwOYXFIEAbH14p5A+myy4S4x2IjXzb7OuPQiIOt+CDbHmn+u7UUPJ4q3aAbp8uSFZilBMWDZrx7T/IcU5uHfAQu+kD17Fypj3ue3muBlpmE31an4Rgh9FtC7oLE68TKw1DRmPSbsvNfBJ3wUI7g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com; spf=pass smtp.mailfrom=qtec.com; dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b=YI7DAuk5; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qtec.com header.i=@qtec.com header.b="YI7DAuk5"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c9107baa7so10049981fa.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1783687088; x=1784291888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fG0KIih+vx57RDic8M93xs1kz9fPC82KqiNSjebxkcE=;
        b=YI7DAuk5f4Ug+9+yT5XQ8xLc+RLSBljsssn19UH8KPmiCCXW7zOlzIbT5vtsJtjCNv
         yI/aoN2c0J2mepHN+eVB4EDrBJ0HYzBhDpxSzDl3/RQRZ9XmhYdi7xTsQN0Bgg5sEqmq
         DeqF2iEr7mYBtprt6oHG+hO4Rwm0qGEUS58tOiODwwttfXVTBt2oEQqUad/A1rlQ25ar
         h1bpRWZz8WOMuA1QvCjk7W6qYBqhF8VsmP1ja5pXxggcIwvhBFSAOxU3YLYb0NAcp5bV
         17roL1f57wUcFBuLXYXOYUDvVJv6eyj7y3cVbpKhWEwvjiF4YXaGoKSWigvUQrDhoHL+
         gfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687088; x=1784291888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fG0KIih+vx57RDic8M93xs1kz9fPC82KqiNSjebxkcE=;
        b=d6wbU1x5cXO0B+lMF6uOIbG4NAbZS5QLcF+werVkZ7iMAJoo288nwUC752nraDP1Qg
         khPY3QdpmZOIZcOcVjhmVCmMdrMTTlkolOgsrUeRSPeauoXLzMXIGllFDXo1LBMXkWLb
         MOA2RrGmzfejoB9CczLGjWQcICiCGRRwATfTA+NWk0RoKA0aea1foGF3rKB28tUjfHO3
         70qPL2zca6SRthSx7qVj4HBUrgsNgVO7qOkrJxFm1yOIxFMhFLMnoRCYr8mQSp046BpO
         uzUrE4fB7y0UlIqRJ2gjp2MpjBMYrGOIdPtQ6CEO0ve2iXf6eU7pDxdp2h/2K1zPtuFp
         hkXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSCkB0x8Fnm/Hro9v98J5BHiAsCBuiuD0PokFQqacmwjrMGySFBkDM6QIIeiBesCfWYenCR3H0UCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCpi2Y60ieMwft+LVDhxNEzdiKoT/KLJU79F4JEoAb3tEo21or
	5c840CrulKXZiMddvpvRXFdcEKcYxsgepNmfGXEkF619p+HKMmG4qHU6yYe12aQw2whO5ypVrEj
	o3g3x+h8=
X-Gm-Gg: AfdE7cnJ/oRUH6o782pMByt+OW3y8qmQyDYCD7Txe7DIESRjzHcRr/LYRDENA4o7TLX
	VsvJsOIENzDqTTsq8FHHWU5kYQH6DMWJH3AxxulfBc9q6xoZuzo+F+wqAjT3cCuOlaueE6Loqgl
	jKxBahsZ0pRPynJCSfQblmJsTKSggu5RodlP02vH+ouaVtR+uLtLM6BkF4ghd7ApTmUzUD9PHUb
	ATN/Muxp6QdYBvdxMHpSymky9LFHKsr9fUqFnOCf+zcMUv8hPqLs4drz2jdwmDFLgjdX6jFXfsR
	e5Qq3lgnRm4al9nYEEhYiQUbkk8oHVT+7xbfODwXRg5ob7tmii6w9k/8Meb7UA7703E/vItzpCI
	mr6V7v1ziP4qJ1J0kYsS2aF9U45NSg01iS8uLfUZVmzKixgDrL4Pxsi6dBUZpYJO5k0pQdZ6pj0
	Mr+dAkrFEQqsY6HhHE7YL+JQ1glMf8xfWat0uP+9xFkM5n74Tsh0Hni4f1f4c/NbPlJ4NUK15Mp
	s4cqy04n9YvTh+EYlaD96Mz02kUag4quoVnBW3JIMrm61YhajPwpRAYfns=
X-Received: by 2002:a05:6512:314f:b0:5ae:c3c1:822a with SMTP id 2adb3069b0e04-5b011478028mr1822557e87.58.1783687088448;
        Fri, 10 Jul 2026 05:38:08 -0700 (PDT)
Received: from [192.168.2.43] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa667asm580895e87.66.2026.07.10.05.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:38:06 -0700 (PDT)
Message-ID: <82c74030-88c6-4bf2-ae76-41c2a68ced61@qtec.com>
Date: Fri, 10 Jul 2026 14:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bad wrapping in some tables
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org
References: <c542aaf7-6a40-4730-8bd6-208c9fe932d5@qtec.com>
 <87pl0yr9ah.fsf@trenco.lwn.net> <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Language: en-US
From: Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <DJUP0UXLLHJ0.3P121A982R9TP@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

On 10/07/2026 08:55, Rito Rhymes wrote:
> I just got caught up to speed, reviewing the links, the regression, the
> prior state and other relevant context.
> 
> Daniel, thanks for pointing out the regression. As Jon said, it's
> always good to inform the author of the patch, and I'd have been happy
> to discuss and test out solutions with you.

Sorry about that, I'll remember that for next time.

[...]
> 
> The best solution:
> Make targeted changes to the tables to make them fundamentally behave
> better on smaller screen sizes.
> 
> I began this effort with:
> [PATCH v3] docs: wrap generated tables to contain small-screen overflow
> 
> Jon hadn't followed up after testing out the fix with CSS and my
> explaining why the wrapper was the better approach, because it prevented
> regressions. That fix is a start, but more would need to be done.
> 
> If Daniel is willing to help test out table fixes and provide examples
> of regressions, and if Jon has the bandwidth to review my patch
> submissions to improve the tables, I am willing to tackle this systemic
> issue, which will result in this issue being resolved as well.

I don't mind testing some stuff if you want me to, but as Hans mentions 
the media docs is full of tables which have these issues, from a quick
check, almost all sub-pages of the Function Reference are affected:

https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/user-func.html

> 
> Rito


Regards Daniel
