Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9427914D449
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064385; cv=none; b=KwzWIjORPxP1GKCStzAk2UXcI5h4MHBobankIrUc8JRZUGhqFQ8mASEB9X99ZulAQaF8MibpM8fKOYi4gjXh1BmXy3oRZiUWyz5c671GAkb7qXstcNYuUc9uPPN0WF3BOluTzHXUTXVLUcOBhCsrMm9HCsTbmwcBCn329geUkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064385; c=relaxed/simple;
	bh=y+dxIVPPQcoEKEUvrDUoNHT9mkJJSFbZStkBz/BWSts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlhshgHiYP6BFmVXI24Qol6lS5BANv9QR2RWp6dEog9ByBQdMgE9wPzBr/meP9W/W6XigvNwAsusb3Tub1f3aM20ThSTQE2CuoL0Rp+2f/XVr1mHOMptTWNiuxkkwbSEZjLoZ+FTaq9MWkgD/oN360cP9Im+HSiiyuSPNLB9MJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=18aoNCu8; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="18aoNCu8"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ac61cf3fffso650686eaf.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1714064383; x=1714669183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cI/xzH4GnLh1DKbKDnSMz6UbC56WU+EMAwZKm/b/cR0=;
        b=18aoNCu8HvZgPZxChDi9G0G/gEJaw8F+spJ/MYxWtokyvsIqMauNoPZTB8+aHFwvyr
         Qih2/ATCYdivBfukp9AlBPQWGTqCf3/r7KQA9867dJ39jB5IM3A66A7veaP+Hof5lfUz
         s/xClaf1HsMj2wyeKHI/J3ht8zMntjamFov607mZrZ1N7c8bS6S14xhGRoE7UAY2+s/2
         3MqEkFK4mJR06JIjIEwWJXGwQtU2l/vGFqZXQevEizYwXJ1f+svo2ivkBXeKwu//q8Wm
         8a7r2uJg6KC8WI8kiqt65quyRg3Hs6xRLelTuXlkPW7dE8Yyad/rcI5pmICJBSqnNSS9
         /klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714064383; x=1714669183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cI/xzH4GnLh1DKbKDnSMz6UbC56WU+EMAwZKm/b/cR0=;
        b=E10/tyXLcWpBtiJhbfVwvu6DoRE2dVesQ3acsMYWKs8lddmgwuanbgBQZb0JSO8Ypq
         vCup8S68jm8GCHjNU+z7YoEKiuIk4puzfakUPO2zziTTxTrLmfv1EvQbNPxPyPUX/KPq
         MrtYcn8AnnxmiT0KPwLXinFTV5vC45GtLVeMQMSE6aY41EZ+ebuqiNIFnYGsxMd1Jcg8
         pjwVseT7o8X4VBMxfASUtjrR2fbBXazxVBd1bDkzpOS2GYj9j6eMzhKM7SjMU3nv+ufA
         Io5Py783AxN323pogQV062XDk0QTZ3LHzJBu8ZzVbLnZgvgAA2HVtrjBcE07KABNjWyc
         tdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmGILc2+tF5caVj4AO6mLCmdGA/utObbvF8iU9uwHJVlKyCeb3VKxRRJiPG7F1YchD/ms2ry4vhFR2E5ZoKrRUWVCj+eyJtUq6
X-Gm-Message-State: AOJu0YwU+pcsppur/JSZWIoWh+bV41maaI1hzelVyvT79jzNMlYdCxgJ
	kk2PQHR91Mic1UPJnZbjGZolBpR8VC5b/LaWHMR0DLicxPVJ6kYfwlGfFKhz4jabkemsn9NUxFA
	aL6s=
X-Google-Smtp-Source: AGHT+IGpVwutJV67cvjnugICyt7Xzbd1m/f0vHJt+eZg6wz+q8DR43n9WJlhz7t5PSjv0jeYJ5cbag==
X-Received: by 2002:a4a:e1b8:0:b0:5af:73b4:5252 with SMTP id 24-20020a4ae1b8000000b005af73b45252mr232238ooy.0.1714064382659;
        Thu, 25 Apr 2024 09:59:42 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id u7-20020a4aae87000000b005ac62af671esm3364663oon.25.2024.04.25.09.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 09:59:42 -0700 (PDT)
Message-ID: <0def9eeb-881e-48b6-9964-357446b5eb0b@vt.edu>
Date: Thu, 25 Apr 2024 11:59:39 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Feedback on my development setup
To: Josh Marshall <joshua.r.marshall.1991@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: "Bilbao, Carlos" <carlos.bilbao@amd.com>, ngn <ngn@ngn.tf>,
 linux-newbie@vger.kernel.org, linux-doc@vger.kernel.org,
 pranjal.singh4370@gmail.com
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw>
 <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
 <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
 <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
 <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
 <87o79xqxtp.fsf@meer.lwn.net>
 <CAFkJGReoq2s+LR1kj1hj8QvsKsEhk+CLYtCXV=DQTjTqan3DOg@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <CAFkJGReoq2s+LR1kj1hj8QvsKsEhk+CLYtCXV=DQTjTqan3DOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Josh,

On 4/25/24 11:15, Josh Marshall wrote:
> 
> 
> On Thu, Apr 25, 2024, 11:14 AM Jonathan Corbet <corbet@lwn.net
> <mailto:corbet@lwn.net>> wrote:
> 
>     Josh Marshall <joshua.r.marshall.1991@gmail.com
>     <mailto:joshua.r.marshall.1991@gmail.com>> writes:
> 
>     > Hello Carlos,
>     >
>     > This is a generational shift.  For my peers, we understand the benefit
>     > of keeping everything in a thread.  But at some point it becomes so
>     > verbose and cumbersome as to defeat the purpose.  The size of the text
>     > I'm working with and the number of text changes it has seen meets that
>     > level.  And so I've kept it in git and referenced that.
> 
>     Nonetheless, you are trying to engage with the kernel community, and
>     will have far better results if you follow that community's norms.
>     Those include sending patches by email and not top posting.
> 
> 
>     They also include listening to the advice you are being given.  Like
>     others, I appreciate your efforts to improve our documentation; it
>     certainly needs it!  But please think about improving the *existing*
>     documentation, rather than creating yet another file, disconnected from
>     the rest.  We already have far too much of that.
> 
> 
> I cannot abide by this.  Not out of obstinance.  This document is not
> written for a veteran.  It probably isn't even written for anyone on this
> list.  It is meant to be much more approachable than that.  Comparing to
> the closest existing document at
> https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html
> <https://docs.kernel.org/dev-tools/gdb-kernel-debugging.html> , the
> difference in intended audience and skill level is stark.  Let alone being
> able to find that document since it is so buried relative to the intent of
> someone trying to get started.  I have heard several times " you should
> rather improve existing docs" but without really breaking into all the

Jon is explaining how contributing works in the kernel community. I think
you would benefit from reading the documentation on this subject, for
example:

"Unsurprisingly, the kernel development community has evolved a set of
  conventions and procedures which are used in the posting of patches;
  following them will make life much easier for everybody involved"
  - Posting patches, Development Process

or:

"Top-posting is strongly discouraged in Linux kernel development
 discussions. Interleaved (or “inline”) replies make conversations much
 easier to follow." - Submitting Patches

It's simple: You are free to refuse to abide by such basic rules, but you
won't be able to get patches accepted in this community.

With that established, I fail to see the connection between the intended
audience of your document and whether you should make the effort to
integrate it within the existing documentation or not.

> implications that 'just' doesn't help.  Given the back and forth required
> to express the finesse here, I am willing to have a phone or video call to
> get this right.

People on the mailing lists typically prefer to resolve issues through
email.

> 
> 
>     Thanks,
> 
>     jon
> 

Thanks,
Carlos
