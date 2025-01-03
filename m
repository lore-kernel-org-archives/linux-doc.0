Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7AC1BBBE5
	for <linux-doc@vger.kernel.org>; Fri,  3 Jan 2025 20:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735936903; cv=none; b=b4YEkxpUDIbYX+zTmLZeZFTXMYQ5IBCu9wcDyImhnXwB2Mjkk/IpjEonI2CL80DADPRhrVKmnoEPZUddvJansag8rtbkGUHFei1bvvv3RNGuN508n8VZuxnRAd2PTjoXzKiqqz25QGF5iNa9fuPjmOwaB0yX7B6Y3Ob24RZBfPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735936903; c=relaxed/simple;
	bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvCTWRuzNHars2Qez13S2eiDZmbvltLft0BTsPacR5Y8kMNJRuCa0Pc/dGoK86X7KtBIVrgJ8fhzGBxMX768kvwjLWEw0Khho7aB0f83EgVPTHEOtgNc64sHXWOs9FTWpOLOhsgIUUdfV1jdCQh0Fp6lfXfpnPdoMC5Y8GMeFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3P5F9h79; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3P5F9h79"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540254357c8so12482887e87.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Jan 2025 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735936899; x=1736541699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
        b=3P5F9h79Cb9NxZnvEtYGMVcF6XIz2aRmd9XSjpJNuQnPKd9JKSe9owOQGwcfRCIwmL
         i02aTqXdfQtFlPP51Nqh7y8hIlkZOPjJ8jiW6mG3IBHlgyYNaGwDLv7Ynxeo/x9QKcs9
         y8wZyCnjpeGSlTHNTRaCncCBMoehFbDUtI5aO3ASVvggATvnzGvtdVr1A/GTEJ/BPBT2
         0eFfAU9n7QQsJvNqy6Mk7RzX+M1w6NtzksnvEUvINvCiov3lN8p9gDR1YkSEETpDcKFR
         ZC5lfOtCzUJ5LigEvzOFAS9eb/OezLO6Nbdxj735iT+8f55SLX8HoY14TYeKS2JXzxRE
         hdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735936899; x=1736541699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXf96zYai8qp1sG5hrC46Ci+QBMBRzpANyI9zFZANdE=;
        b=pzdL4lMCOBmIrHU14UH/6TtGVYlSPMh1ULCKed1ENUw7klb7QX3w3VKwSBEik52GpV
         WS5/DBoUch39Bc0f5b/hY9DAGgvSXoPP3kg0LTCSdscSxcRNggYKjxlXopRf961cMNf6
         j8ZeLpqwwTtai80iE8ZOH6HVx9q8umat0ieep3cKi8dk+nt73eAVvzREjwBtsliLzbLq
         wR72A0KtUlBabvbIKQb2V+pn4u/X9in80vCPKJG8NJUUExE5PZP88joJo0HUf0dTMzah
         WBd14nJGIaJxAsL2IIkueXHz3JcRHbwUscwHYyVnocv5hgHvtATL9D86PeXuJrUDrDBD
         Pmgg==
X-Forwarded-Encrypted: i=1; AJvYcCXZGlfc12gQkepqiZNbAp93PFMS815XWqCHf5BfGpkz8kPuGiK/7DKHd+ojvJ4JpXYPfRd1LcdrJVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDfNHk7tUBZM4C/ZD+qzWv48XqVQu94qbpB3SjRhoGxdAN5lOa
	aNZfcj0tu9AgKTRKB9ZxFPT6up7Ed1d8F54/yDAao2JFwf71Eyk77YCnHgspEtZQZmlbz1w6S8K
	dPUZ9Xy0D3bpOslxVi0TXIWazBESFr3FslMePFGD5pX7kxrl4
X-Gm-Gg: ASbGncvc//HwLfvKaTt/bJptV2RO/eViv6iVcRCZoYh3JKPqI4rguE9X0OHknol1QDq
	ENbuGWzxyo/7nCUVJSiKyUJuDINsgF8Ne2QhhEdKroRHA4yUZdsZYbnDw4arHBohHcJ3HCg==
X-Google-Smtp-Source: AGHT+IFOiOOaakTmeMBG5eqydIK5cqSCBF8tUVuiOD4SosMI2146lUP4JdfUohPnFyyIaa57hUCKGFAMF4ciB7oy1BU=
X-Received: by 2002:a05:6512:350e:b0:542:2991:e984 with SMTP id
 2adb3069b0e04-5422991e989mr10799402e87.9.1735936898655; Fri, 03 Jan 2025
 12:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217085302.835165-1-chensong_2000@189.cn> <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
In-Reply-To: <ec5531e5-6fae-431e-bc58-73bb816d477d@189.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 3 Jan 2025 21:41:27 +0100
Message-ID: <CAMRc=McNWBNCbCsNPvqUHrMtwfveeMCy5am+yNxVKUficat_VA@mail.gmail.com>
Subject: Re: [PATCH RFC] drivers:gpio: introduce variants of gpiod_get_array
To: Song Chen <chensong_2000@189.cn>
Cc: linus.walleij@linaro.org, corbet@lwn.net, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 2:25=E2=80=AFAM Song Chen <chensong_2000@189.cn> wro=
te:
>
> Dear maintainers,
>
> It has been a while after this patch was sent. I'm not sure if i
> followed the idea suggested by Bart correctly, see [1], any comment will
> be appreciated.
>
> Best regards,
>
> Song
>
> [1]:https://lore.kernel.org/lkml/CAMRc=3DMfpwuMh-MH1UEHKky09iAs4g9=3DiGFP=
ptARXzoZrVS8hdQ@mail.gmail.com/
>

I've been meaning to respond and it fell off my radar. We typically
don't add new calls without users so I'd love to see this patch in
conjunction with a conversion of some driver to using it in order to
prove that the change makes sense.

Bart
