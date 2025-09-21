Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB71494CC
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758444220; cv=none; b=ciTrVsQBD/r9KQAsOUeH5detv3UGj0fzQ6a8udQAFv0FHPsN65ZDLQ/Q/9bV+m28+obPPM4J6c4jmi7r/6cvpp2FKfHFVVcdZaM/rtCOdDmGCDZEutiQRnwEeYn+kiFWERW4YHNDD9Y+Mlbw6G695k8BRZiPktN1yHEZHKKiGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758444220; c=relaxed/simple;
	bh=UjN52QhzqZyfjm57PydUQ+he7++5mFgxAuApM6NaDqQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qNa/N+cb8vV9P6p7tSOpAYcko590ouEAr6cfx6TKIqlH6qRYAnpukQC1Po/NbETnNAAvrO7NmWhA5p5xzgPs8NFjCHp2ozir/1grZ4aAA5IYTOLRb6nai/0VxIBciFpeNoUy48of24yuqM84TdCW2NRh9hDINHvQKjnPFDxYra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpocAxWm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpocAxWm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77f3580ab80so67245b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758444218; x=1759049018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhuxGkdlbYwQtUxo9AAy8/gz7UCzFi3umGZgoVwppwU=;
        b=DpocAxWmxlXp4e3TwzawQD1HZjkJi5pS+uoCiOESqubnDUX+cA1jHNyQGrxhAeets5
         OywjNWx+Q/B4VmrdOjWDfLObQ+VB0bkhggZjaFE8cu5O/qa7JRQyVLBj+PobBL3JPrGP
         q6E0a/MSiJuruPyjw3WjvI3Wo5f31xR9wtbnuoHZC7OMIEe1Q32hKfZ8DGrCpxAKA5Lc
         F6rRMb5oHPIj1WeUNwXceki7nLdxauRiZMTeZy1y2m2T9QGK5ryYM4VaB0ugL3ckPvM1
         PyS1/XnF+Xymy+JAdOfcw+q9XmbbFoOVrL8Me2i1hqpQluVn4vWygU5bMlLrg0bot0yR
         /d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758444218; x=1759049018;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhuxGkdlbYwQtUxo9AAy8/gz7UCzFi3umGZgoVwppwU=;
        b=aUXEGV1GwxJNMOHOvKqY9U/bKk92T8mH7hilAjeHKwac4euCIAj2bIgC0rv5lRj2/5
         E6ojKVIRzC/IX++Zqi7ysQOOIwDsZWJUScJRtT5pV4shCzp/Uoo9Rxz4/MwTnhEZTIo8
         +AZbUTLOtAJMeCgquw5LS93+40h/ngPH2e4EsT8glp59qZlu/bRsDtvhbvpYP476LbM0
         lepSPPvbqQKxbnY2JptZbSnnpIbqZKjc5lH/Ua7+TGFXXH/JGXILUAGqY94BKostUoMh
         9FzL+/8RbLXkyqe7DJ6k2aMs+AJXuShpYduwawjfBFPx4sbyeRCKl8bU9M2zmosDWv6p
         8QZw==
X-Forwarded-Encrypted: i=1; AJvYcCUCfnpOltv/2H6eP2/5a8PYDO6RAgKIm6C3AFvxadbrqq80cnCIeUoyLvnlkWp4FFZXeIj4nm1rgFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWJcWfMeyCSTWFIoyWTruMUiepUdgmsGskMq24fTz+s7OpGAh
	77K13KiQA12VTBmjCiNXOiKYB+9X6v3l6Ub7VGPgg4ihbc5StQ6cGENB
X-Gm-Gg: ASbGncsoeDALK1+zSCLTVHACAbbKbvNsuAHRTiWMcRG+J4AnL4nkaIZZJ14DNPxTiIJ
	U2L/+yNFaf45tlxvP+SrIuM3L8fu2Y3yrOYFtelcU13WUUiT+LPhObAOjdOnjVE6UK5PAuWrPHM
	BQ857tF3y2Ks/pZmOP3sBI4BCVVIBwKPJ2m2uWXWvY5DWmlUY98FmdeyCC0kidkZYZ+s0xruB+v
	ARvQEMqDdUEseFex4sDC+ykS6rv6Hz4rlNaKB9AooQQnCO0y0iKyW19BM+/2JSWB6e5hNvfs7kf
	FUld43aQMiRYE4mcmISnmwOVcZrgJI+aGs9yc4Vump+KovQlM7gS5rrg0qDfNY55kKuKiqaXnWX
	pRpV6jdwroS8/y7aInghy8jP/d/4yv/tCsYpctm7FbEkOK0rhc95Peh2PKsX+W2lEpGv5
X-Google-Smtp-Source: AGHT+IFqCRKRtItqhHVLVKIhfbYwcAdS9aUI+YCtSIJZLyIniucuWcyztE1Fb64OCQV1kf2LRvwPVg==
X-Received: by 2002:a05:6a20:2445:b0:254:84f8:b280 with SMTP id adf61e73a8af0-292748080d1mr12116002637.49.1758444218470;
        Sun, 21 Sep 2025 01:43:38 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b552882b177sm5004313a12.11.2025.09.21.01.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 01:43:38 -0700 (PDT)
Message-ID: <54d1f3b1-ba8c-458b-92d6-9d8880952e06@gmail.com>
Date: Sun, 21 Sep 2025 17:43:38 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: linux-next: Tree for Sep 19 (make htmldocs problem)
To: rdunlap@infradead.org
Cc: broonie@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
References: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Content-Language: en-US
In-Reply-To: <883df949-0281-4a39-8745-bcdcce3a5594@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Randy,

On Sat, 20 Sep 2025 17:17:56 -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/19/25 8:05 AM, Mark Brown wrote:
> 
> With today's linux-next, when I do 'make O=DOC1 htmldocs', I get:
> 
> make[1]: Entering directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
> ../Documentation/Makefile:71: warning: overriding recipe for target 'pdfdocs'
> ../Documentation/Makefile:62: warning: ignoring old recipe for target 'pdfdocs'
>   File "/usr/bin/sphinx-build", line 1
>     ELF
> SyntaxError: source code cannot contain null bytes
> make[1]: Leaving directory '/home/rdunlap/lnx/repo/linux-next/DOC1'
> 
> where the "ELF" line contains some binary bytes that are not shown
> via copy/paste. Here they are in hex in case that might help:
> 
> 7f 45 4c 46 02 01 01 0a              .ELF....
> 

Hmm, my /usr/bin/sphinx-build (under Ubuntu 24.04) is a python script.

Running "file /usr/bin/sphinx-build" says:

    /usr/bin/sphinx-build: Python script, ASCII text executable

Randy, how did you install the sphinx-build?  And which distro are you
on?

> 
> I don't see what is causing this, so I am using the previous day's
> linux-next for Documentation testing etc...

Another question ...

Does going back to a past linux-next make sphinx-build work again?

If that's the case ..., I'm not sure, but it might be related to
Mauro's sphinx-build-wrapper, which is now in docs-next (not in docs-mw
for v6.18 at the moment).

Randy, what happens if you revert the latter part of Mauro's series, namely,

  819667bc3ccd ("tools/docs: sphinx-build-wrapper: add a wrapper for sphinx-build")
  2e1760999e58 ("docs: parallel-wrapper.sh: remove script")

  ... up to ...

  42180ada39da ("tools/docs: sphinx-build-wrapper: add support to run inside venv")

on top of next-20250919 ?

Regards,
Akira

> 
> Any ideas/suggestions appreciated.
> 
> -- 
> ~Randy
>

