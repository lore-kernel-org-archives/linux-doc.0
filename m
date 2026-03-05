Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE5D35DA47
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745756; cv=pass; b=IpgsHASpXKkug1nt6/+oX992P4jACf+C7bpPAqI5dNiUlZWbwtaCqCGgJMM7ISiKsb+97EYSzlbWdpnsnpx98GsZky81zaraB/Toz6tTXZcjsLlhYIZ27Fr+KVjZxp+HaucYe2/geojd3t3Wd7f9ySNF5V+MqY2/WvoTViF2HdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745756; c=relaxed/simple;
	bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQwfIEw81xvZWsT3So/oiSMxcSJo5S6urml3q9wTUqhPydZe+Jjo4JpVTokleDJiajZ/61hzfSEMt+BtTrMgVktdN0Zyf66IoAktqsbD/qwTCGQq++JbBu18Od8GVRsx/WatAA3ZEYkTj3A4qHD6kAmMIBnxdPXU7msYJDwpHHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwCD8JD5; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwCD8JD5"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79652789a0cso5204417b3.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 13:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772745754; cv=none;
        d=google.com; s=arc-20240605;
        b=jilbhBke+ZRdnCbQ0dE4hW13BLpmlPkxh8scJiaFnIO9rwIrkDaEGDmDdumb+3PxXX
         kKT2Ao7VMDNTSXb5NGfn1Eagnfw7J/nJp+EZIo1StbOTIfDnaKX9V8TzWi1hLSoFpXlX
         KVmevU4kWz1IGIe/s7TBVvfO5o1vKIEcuN4vFaafrluVJgisJQKR7JTXcrEYZtb2oF+K
         f73+4vVySP8htiVbX2W9XKfail1lPOLEGW6D6Y4bIAky9J3QbIOlMAfTzN7NhkJpfdV8
         SErEtDQ6Vc+XNnWSQX6hVnv3X6whrkWSEnuMg2Xzxm75ITTZ8zFaDNyF1qqwq8sKNFcP
         qlig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        fh=ZWoDXTALOUXd6f8Cg6Yx2GZB/8o3Zo7TMkDtPOyAdcE=;
        b=h7sIV5LYd7UmwNIvFEP/WVwf3GKaK6t8mfJX3d90M7ksmOV6AwOBOFtQhl4U6xj4aU
         1ZykoDwl9IxQrmDJNuha6I9YHPQPh2hrFR3Yanq2CTURArVuA0cxEKJqJ/ZebHF6OEmw
         4p3g8xozh0UIEo9DQm2lg0Vki0MYCYgZYaKD4l1u/Rdc05syYYUd0hZ2iOkaDRPBWKgU
         MycxNvA42S/yaBmEANlJyGByBl8p9lq3ycLTQv3fun0D/Ldu2COurs8H2WjqzpH0soAJ
         PMbDA2kxyrJEtHRgIUsQz7jlMnObXaLYRYGfUPpH1GIHO0sd4/Rd9EFQk8Mq+wijddx0
         jerg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772745754; x=1773350554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=UwCD8JD5Nt7KVwhWhvDouar5AnDLfUEEyRwNPxz9WD/FSEPNLoLTdxjOwT0oH/q9uM
         RAFrFY41HkHXmJpWnbVYikJaV2bSiN0wYMHmJ/YJbOSiG3cA3ygsUys2RthW7E5t7JiQ
         RKdC4HWMbIFSBkCJywpD5h5T1JKKAzTR9ylkzAo+dAAGLnBae61AtPWU5AvAbyY0jOJc
         WdP/OUVv29xMyWQ3tbS1dWORmSWv1GPtzB2iSY9xgjTgE8HRGEIIxwGgQFhx+qdr9EG5
         1hhQRo+3KObCWa1OE6k67gpTgK9nr3bvj7bWwHH0kLnBfOCeMu7RjTRHoYSj2T6m4Eig
         QH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772745754; x=1773350554;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRV4KrgPufJHYoouG5oBzfgHa9sX1mic2JP1prCF/Sk=;
        b=Xg3q6rA1qf8IYmUuAw7VCZ24aN2AR92/vyuYlgXFUBra2uxd+4v0e48is3rRd106ba
         pr1sgDRXSwDcGQyhKaAWgBVP+zkw0L48iLG//SMI69KuQYrnhQYVM1JP4e2oKdueH63Z
         PpRnMGT59RIMIzqwJtnpQKC0XSeJXGOWMnwYxWbYacvag85dET7ExMCreq0l/978RLIn
         3qDkG9zxchn8DB6niIbmqZUJN9QAv+JevcE8IrY/UOfbeLGbp/TnKIeexdFdMEoAVdMW
         /Q8n2b09U94eO8rkAzIj6EMXci7RKZoE2kE+NCOVjfpbwE+U95FNkai4qFWKpRSAX15Q
         AQtA==
X-Forwarded-Encrypted: i=1; AJvYcCUhvEutlbFqhxGkDYvJRFGJDF/nalNhhIWt55O3GfI/oLOK6QC/ohi97R8oph+qiX/FPG+x5Gcx6hE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm3WwGmukSKT3WDscE2vWzRgnHebuPnPncYvMbgoPXu9Wk4ZFW
	wg2miN2E7/3/SARAJ3EwR0LdYmUDH038yXT+hmaS1UbNRIF3po+b883f4iG3wfr8//tEMIAjmoq
	ZRoLQfOgexJBZpTDwfOjYGFx+8BmJSYk=
X-Gm-Gg: ATEYQzzEN3x2ir9U0PWMfUAED3HnYBXQE66Jhc7KbGXti6aAZPLm7SXTb87kI4GmO2v
	rZXiB4meJrGKqa2azifBXhCxaANw7LVzVPM3rbk3qm7LHZwSDVQKlPtR1rRaNXW1rnoyZZEERqm
	JG04xbeBS6lw9Ky5rIbeXk9W2aI6j2HALoUIN+NddAdOOL3lLGLyXWoE584nsvUxV6GVCTeiBp0
	nywZs1QUize3pq9cIJy3Lt/h618oRe7e8WEL2S3787W3HAVK33H5sdR9LfJxwujEZ+v5PLhx0Kj
	uvvOMps6
X-Received: by 2002:a05:690c:385:b0:794:2fca:81a with SMTP id
 00721157ae682-798c6cdffacmr55975367b3.8.1772745753906; Thu, 05 Mar 2026
 13:22:33 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 6 Mar 2026 06:22:32 +0900
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
 <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 6 Mar 2026 06:22:32 +0900
X-Gm-Features: AaiRm539DykMmBy-Zg-BtYOlfUPQKOJ6bwMQcvFff9WH9ZMuhoRcwF9c8D83p3A
Message-ID: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> Thanks, that looks really neat! I should've thought of that instead of making
> separate arch versions :)
>
> Do you want me to attach the code you posted here to this patchset or do you
> intend to post it yourself?

I think you can just squash my diff into the subject patch.
