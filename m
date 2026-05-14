Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D01A3C8713
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778760814; cv=pass; b=QjHpccym7wGiKlh1H7Hbl4jt55eY31sZhsSBnM7tlTHiyrM9/uXj677QhejAdEwku2VTTQ91QO3UaRXjDxI1wuK0Q6Dbqknfum0EGfB3MgwjOnaYE2t4dvRFckuH+L1N50XyQj0V46RKcFADwJVisslZr/As05XMdMOTPWiq124=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778760814; c=relaxed/simple;
	bh=ni3wzkLyA3yJhGADjOlUkhT/YUz3yaeC6w/J7cOueCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ka4aVO0Pu+sw043QUXEOMOsGMPboy9hU1D/YwsnGz1U6l8fEKwxzKn5H6ECz2A+E1Q9OS638KO3vBAJ7KVsOgAevbCG/+D8w7EgWfz9md2dxVOeFrNrx21t2ss7NfpY8GFU2D0g6XInjDajjI/Hyqyts9lUuXwu8fOh1r7A2mgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBAhlkKA; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBAhlkKA"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48fde648a71so3565645e9.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 05:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778760812; cv=none;
        d=google.com; s=arc-20240605;
        b=koutktrprudt3Rj6ZOw8jvxgoAhcgr2asuGUCTWoGuWgRNQ2oxfWVDKDZTQ9YgaK7p
         FhAfDBLlUpiHiFu8NfcbBZt1Ydamfp5xM1eepXsBo5EFso3p3tnWOEbcBp/5EDPmzkwm
         lVCXyuYCWdsvJqr5HJvTb09WpFqRgkSAC+pNAiHvg7TOC0NNWeO3EdJJx6egWV6g01sY
         vDA826pn2c65MAH7AZOycSACXIq8Jkfy+PM9dIGaLCdjovHK9Ikdj36rIOZWLgBZasuq
         zReL8GF96z1y3uEjZmP8TwIqc3n7Bre1C92czK6OoLQ8asAsfM7H2bnCm5W+ZXa1opfx
         9Mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fRsal/BdUcyFgKh8kL1mNQA5IvkWA0/w0SIKFrkFwEY=;
        fh=/2HLCRd9Q6weRXHTUP31NWY6vIbtGPFBKOLWFuZ1Evk=;
        b=UGG0QsKNwy3bGcjD9U0SRQzBvQRQY9SGYFm4xSm7Yr30RuXh8uLgAgnzyh1VSk2t0b
         b2ypBLyYsV6iRGXoGnsxIF7utXu9Uqa0QpDsvZOqf1T8rlIlY8FC9TA1N4oy0dgPkjua
         uUIapYSEpOqJ42Cs5WCFeQIuq0ff49mSxvQHdmJBk3x1F/yNfHmNF8ZeL4cLnKrfKnTC
         mXoapX5SDL/odRelT0HczOqO7QoEhtAsEr34+FfWN9o0QBKFkG/wDc8iX005UrOwbRGx
         lFFm3fonQ4D6+qW95wX5mcVNr5Kd4UpFtOkmqCebZCQxVytn+uNEsVKoCPds2O2XzGHL
         izCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778760812; x=1779365612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fRsal/BdUcyFgKh8kL1mNQA5IvkWA0/w0SIKFrkFwEY=;
        b=UBAhlkKAbhGyxpixcgCh3hc+HYWj6VxOYUKiTgWUcfwqd5e/bWYeVlZYZtegxiYVDr
         WQIQE2531Wgbhm0TNudcskNRErWJHoVjxHIQwRO+D6PmF/7jBBbKvm1kwaYJWnsoY4W6
         YOAw9aIjNb4j7eVdTwdwR2RCb4NBH2bELNC8ouYMKCQkJ7+14+Y8nxLZVMu+B9UNipBH
         brXrqxKA05wjDkaFmyjHHj7md98KZpv355MyYa+yJ3lO16l0dRfL8h67hX6NSgqfyKW/
         BAEBCDdDZKw5+ZdjHee216S2gavCmLzfb2nJwMLHgHSuoT1NBWY4ofqzNZFdE25mMATw
         u7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778760812; x=1779365612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRsal/BdUcyFgKh8kL1mNQA5IvkWA0/w0SIKFrkFwEY=;
        b=SAocvPnlXvEWOqlNiLnoqUHaGaIWwiDmXLzLIX+l1uhHRlvYKlEHNGtg3T6OZX89Bl
         7mCGX94Lry9HIK7L2LgUMoUPp0hz4kLpLQ55cTFXcjAPkchu3+frrEtZxjL4tQXBgktj
         iIeWEy82xIW7siSaysfI4y2ytx084yiGm8CFNKmPpiEkDeABkYpLjaagSn1VMLMyjQXH
         v2QsA6YCF3kNrlqDpYrpDMOrBB7iThrhG9z9bZQyLwH7rCO0RK0gb6V+XKmpFOaj775v
         qKaU3Vgzi8O9htSIQPAcyc68LK9bPHOuSwx+cJiaVEbmVED15rq5f0qD210BI+M49u1N
         HXjg==
X-Forwarded-Encrypted: i=1; AFNElJ9LqxxGBshnc5zLHceyg3waCVxpdG2dEDCDDO9wl5YACU1YaSvKRopfgHGd3lI783sz1hjrmg8L/BQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhUwykND21lXqRvLCWAAXaLDg5BB5cr8ADwBoY9j2LS9cBmlAN
	kmvyjlBON9mp/SHdZ3DzvQiR4JetCIBwHmu+f04A9Jiq7yP11SFlHyi8OmfMPCBq8NLKNtDUwg5
	7ye06T1WzoYuMjaq2CI7rU2AAPsYlKxI=
X-Gm-Gg: Acq92OFg1Vr+aOPOxUIMpbTsqThYr5EhiKOoh/YsmBv+hbdcSp5RHnBveamFN94/Ky5
	y33Ps47E3yhza6xG3//pr728hRY5ZhnN2FEL8//UzNLn88p1hIOkUVfzCsb06SSK4Ltmhuc67kW
	2DvhfEOxAeJxzthDmoZd8e/BWbpCnORXoy/bBkpavzXTON0RsiioWua2TzTncIlHkScrdsKrlUV
	twWuj9hjnu61txeon3RZhgtwL8G4IAeOQZTrshBgxrhkn33QoICRHCGh74NfNrIGuHUBmMqyyUw
	G+DpkRtyEGaLE+MKBEpbe5NV18VPjPR1h4indUYaAdDbBrlME5HKayUyNQTAkwQKqMUotmkL1RH
	qTBNKGCteBYoIpdqaHncWKxxUD+Fj1VEAf6fYbFME3rimym5udXau9q5RDxr/22TUFUxZvUvQB3
	3RThvxkg==
X-Received: by 2002:a05:600c:4e41:b0:48f:e230:29f4 with SMTP id
 5b1f17b1804b1-48fe249dfa3mr11504305e9.15.1778760811998; Thu, 14 May 2026
 05:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514085157.20327-1-sozdayvek@gmail.com>
In-Reply-To: <20260514085157.20327-1-sozdayvek@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 14 May 2026 14:13:20 +0200
X-Gm-Features: AVHnY4J5ZwUyYpPyKga-Z4xCln2b6N-gK7uGxZO0NnEuWxP8pZ9ESoc0Ciw9EPY
Message-ID: <CALoEA-zY2C0H2173bx7ETNDUceh8+AyWF_e4EJuoFfSdrRFHoA@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: iio: fix typo in triggered-buffers example
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: corbet@lwn.net, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, hcazarim@yahoo.com, linux-doc@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 10:53, Stepan Ionichev <sozdayvek@gmail.com> wrote:
>
> In the "IIO triggered buffer setup" example, iio_triggered_buffer_setup()
> is called with "sensor_iio_polfunc" (single 'l') while the function is
> defined and later referenced as "sensor_iio_pollfunc" (double 'l'). Fix
> the misspelling so the example is consistent.
>
> Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
> ---

Looks fine to me.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
