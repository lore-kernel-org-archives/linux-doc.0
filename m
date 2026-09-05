Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3673793DC
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616336; cv=none; b=CLan1I551QoBZoFKPAyexya7eO9pucQrTZXfUai9vBEi5wZBlO8Ffmbg+C2p+K9S6XfNruEyzjVg68km4IcU29xxCo+wywYMTz4ptiGdDVlTJnjMMjyoYWkWRHipM9o95WMxo3Qf74xhM5KULzyv7EoqzutiXLhcFYo+hBwQtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616336; c=relaxed/simple;
	bh=eoaqP1cpmgdeqA13VuoN62OPJ9Zf7oNSZ1XwyXsfHwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2rwu3C1uvEJ5usvhewUZKMkd49jmH/b2TZGWM3XzBbMI0osnKM2SO+TGAlj6yk7ooo0QfUX+XmlNdrUsMfit7JxE/AnGwnbBdja9x4ay1/ZvUfQkgYgOxNU5i/xVrEzz+kmQHbrHqRZSx6sLAT7bD4uCKz+IDjb8a4iSBMHDE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuJWeO0d; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuJWeO0d"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so15305745e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 06:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616333; x=1789221133; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goBUo0KyzYl6adZ9zmSf9yB7LNuxO2AIINcuATmiu7w=;
        b=kuJWeO0dgZQTmZ4lvjdt2TC96iy1B3f2JCpJh90IMy/u0mrueqKBgA5+dof864twtH
         PpXdxEQgM4nrUGvsNl6JjEdHsohYe4fLJpmfUu9Z+FmIxB2sw9uputBnpT6Ts1Ggeeyf
         harjJLbstSTUJeN0XbYkn9k1XbgDqMNoFh1J2KUma9cEad5yhTxmjYRILMGyglrkhT8+
         +Zs+1mKGYwUyiBCAHZzeH+KyVKFD5blnvLA8tD8W4L21Y44LtobO6P2oN3oEj9Iwo/Vv
         9qjbsPpJQ/VchoG1Z9gmyqG+YcASsUE7Sy8VxtD6Jw2l0ylTuqPx/BfEjHfjnQ7Wc5LE
         +4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616333; x=1789221133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=goBUo0KyzYl6adZ9zmSf9yB7LNuxO2AIINcuATmiu7w=;
        b=mEHuhDSC/a/KTJzD0L5NysW9OtLdcYmKAMm+Bi0roe8JQ+JczCDaeAPV7erNQVxJzX
         GFhOnr5/4kvvFJy3UIelZxm/lOx9KfO/pcJzxF+g5gdlcFP5vWKoM5cTfOUOAl3DT2zE
         w688ayOR8OL1keMUzHhx7vPy48wNIZAFjPYBOh9Xgdmr16T5A9pZeJJTJ7Qw+9GZAMrC
         s7V27YaamGcxlRWwNE26+nB/RqM9ju3kfifs+o/33pIXyoqLa89+Hr7cAc9qYDWLffKR
         kKkyZqXosSkPxYPpVc87F9Byhu0JEhtrzKAZsYJCuNNNYijqR6Fz6nZ5HHFFXNSp+P5d
         rAsA==
X-Forwarded-Encrypted: i=1; AKwUvBw0mfQiRVuwAaKhg8L+T09CD6Xe4SFtVTDZbVi3+fLLrSQY/CKg20Lg9MkTrafJkvUI8ivF/jhCNso=@vger.kernel.org
X-Gm-Message-State: AFuF++n9bh5jkA712j6vyG1bY/Xqk8Fe2m9XCFdYIDr2Nr4QZt+NUlPa
	26GZ9J66k7tjFwGK17UIJRmNDGt5gFUKoqPxHMWv5+PjiKu60Ib+noUM
X-Gm-Gg: AYBFou2t0UkRLfhhEZh72A7KCMRJUIcQWRx9oAJ9yVeSf+y4zpC4ZJTfFEYaIbe1ga+
	h6XRr9Bqyw7ccPifRHFjX/84lXRGuLPhLf30VkmTbIngIPihFarQDp+ukR6enxO+57dLaBBDATL
	AeldWWGSPjHRk4C4lTpPU8medQJSE28C1gd7WK8txHmyrmZDSw9zVtKufRykKxcrX+XmUyETtnV
	uSvTyF+mMqBwLEKKTX819KSkMFqfqGDbPzce+rS4FTaoh05nB0x9WPrex9wEZIkw3J8C817CdmA
	s2hUkMS4nuJHt3mD2i41mx5v8CPrHH5Qm6wFgwWpB/aFdo6dgaoCpTkSKkLitiDyFW18pnCeCul
	12wBlGXt2KqkClJMxn1Pfjy3chBWrVf4K9wq+VFhZAQrZa6Gfvk8bLDPfM+D+6ZQr9fLDUorzLB
	KaL4zTxov6HtW3lx0xkjSzc/z3bPJB8GNHQwsMJ+MxPaif3FjIiTOCCibkIyS0+Cl7YsCPQKnwI
	XrY4AR7oifDVa2LMxi6qPgbOWFTM7CmHKwzgwTKcuUeupvjueXhqqV9kmkq7V4LppGM9+Pk7cB9
	ZO8nMw++XOXgmPNlx2sgDi9UxVEm77/CgIlbvqgsBY8su975jLP2Eb6wWDYG8vlt
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49cfea1f79cmr86204765e9.12.1788616333161;
        Sat, 05 Sep 2026 06:52:13 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm258560335e9.1.2026.09.05.06.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:52:12 -0700 (PDT)
Date: Sat, 5 Sep 2026 15:52:10 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: PCI: Point the pci_device_id kernel-doc
 at device-id/pci.h
Message-ID: <apwdZWsGOa2W16HU@gmail.com>
References: <20260905084916.40196-1-kmehltretter@gmail.com>
 <apv6yQ1U-HhNglyV@monoceros>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apv6yQ1U-HhNglyV@monoceros>

On Sat, Sep 05, 2026 at 01:21:32PM +0100, Uwe Kleine-König wrote:
> there is prior art that can be found at
> https://lore.kernel.org/all/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org/.
> My patch is more complete, but I didn't respin yet to address Randy's
> feedback and so it wasn't picked up yet.
> 
> If you want to take over caring for this patch that would be very
> welcome, there are too many open threads in my mailbox and I'm happy to
> be able to close that one.
> 

Thanks, I did not find yours when I looked. I will take it over and send
it as v3 with Randy's file nit applied and your authorship kept.

This patch is then superseded, please consider it withdrawn.

Karl
