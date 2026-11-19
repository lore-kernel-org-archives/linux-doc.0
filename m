Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795058693;
	b=qNGtiYoC2rI1Gjth3DE84USHRRsk3sUNvFmjhxazWkHSWpQCRqhV1c3cMiaai8htKOd2
	 0dQ00mYnRy55g+DCJKZvtEXOSSQzT+UkzK9rLV6j+LBMGrnMB/Ag+mbxtKYBJF67LJYzO
	 ZfySQkdWPU70EIi2r+3o8k55xLG3jngEGzHmAcBZjfDVc2S3AqlZJgKwGkb6xhnFZt6MH
	 +Q2RfBXlXnhz5Rj7/1eMgujsVB8070toFAEVa6uLA05FFYj69jXgcmfvaxWZXt3cFOyGL
	 mO0rLWE2ErDyNSBfGIiWdU1xe6v6UHpkUTnTpq31+6zC0jcjwmgg8yaK7tsW/0xDp4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Ed1A83hWGcfzMl6v3aOySDGYn1wpfy76gMlz1I8VKU=;
	b=ItK+fook7jVf/xpTk8lVWKGDHHfiP4kzcrIFafrLB61ErjFrkwrrkMbsM/64F2J8Hss7
	 E3gv1PNDAOP+AkGzyDkMiDrZGEiZiVxJf3cgfbqMr5j4yEp8W+rWJla/bgPbyRzvYRty7
	 GSQ5dACR0DlFu1CLYnqd4wnjrhhT0mc6g4V080um8gwXzOGBL3EFNtUH7+9iZM5LTeTbI
	 P7qFQEhGcFf7LBVzE/dM68FgKZExrQHiTu6x6NvghQ7pLuHlPR7k/5xJYEF/7jpDF/AKq
	 TA1SmoLY3a5NHqLGIb73gNyqEXCi7FgPlX9NyLgOBEesEmUkk69NdFcuYfCYZok8sRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhEJZ0Bs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95900606A326
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 03:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95900606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhEJZ0Bs
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-536717a4d83so14445921cf.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 19:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795058691; cv=none;
        d=google.com; s=arc-20260327;
        b=loEyxTOlMr8vyeHgv0PK+I8qPkJYXwfyRzWwR3E23olfjBMSR9csbAR+NQxhDL2gLy
         KEwseiYLZN0aZiLWenAC3eo6LUrAn2d03L1cUTI16EKafQ5OJfOtoxa7Mgd1+whtBEXi
         SzWkVH+Wm774NQLzGTXAmfB5bYEXKnsVFZxnt2u/en4fk5DAKvL7kyfRhba0HS0UQPo7
         g091L1u6SBEPvrum5htFclAa9jY1aNe5frlm30rnUNllyYkBKr7vuu1E0DF8a2SkImAV
         JWeYSmZAaYbl7oUy9uxyNnoi2oXrbaR3vHeMUr4lWW2eJ4Nc5ZVlqkEBgO7W4cKpNgW1
         o/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Ed1A83hWGcfzMl6v3aOySDGYn1wpfy76gMlz1I8VKU=;
        fh=t0Q0fo2vPrJxkheLYfxibTtCRP/6VEwm4t0nH9CakS0=;
        b=EkkD99x2fG6t/mTYhEwfMYwsJ4CMHT+v/snW+8Pg7D3pd1YJltwxBorwJOJImKsXMZ
         ADGNa+vwzUzSAitYO9Vf4H6UkBqLaxHs9d3lyEzXoFlBCGU3Cnt/53nT++BgWFvfvvb1
         9u3rSkKKMOmqou9CIgH7aVUcTtwWEixs5NbRy1OmNDclofAUhB5CiNXv1izT2hBp0SIi
         X8KtDJi2FN56NoK/2niHNSncznnv4DVFAYegZk1mzFhQF14PJHOgnQomBIESsJ416jYt
         o+Fz3gOA/qVEF61ZXu1rWbRx8YQ3bQJCwQLHyELNZvgGDfNzk8xaLYi+wYIe8LacNJAI
         X3Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795058691; x=1795663491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Ed1A83hWGcfzMl6v3aOySDGYn1wpfy76gMlz1I8VKU=;
        b=KhEJZ0BszJRqw1Qllfbw0qA72euEjCMJab2+AsERZYiGi2acKZAAqbkydDNk3mHrJb
         i/31dAqciSf5c7FQvx/lOXGdyqYDscXBeDZYbVDiSubz5QIVubi5zOXie5EvxqT7Li2L
         9vKR03Xe+WpttpOG8aEGKjsdnCpHXXXCzfXAO4QP+tKH+6aJNLFmlriRSKZljlzmSvQA
         dvcIcQL6/ai7zIEAq8I/fat74QO9E6Io5IYFWTpp6TEj+DDOE18thto9T3ac2muqmZ5f
         q+WJptbqH3KhtQeYtXt0aGxZ2OdNWJsZYimGJW1D++C3UvrDAafHmCHI681GV7o4g9Kg
         wCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795058691; x=1795663491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Ed1A83hWGcfzMl6v3aOySDGYn1wpfy76gMlz1I8VKU=;
        b=XEi3YOLqGT4hMO3xwVhcMaWMBXEdK42H+mt+xX3sOe8e6DEa9MwQMh4EiDv51RTDci
         dOL86zm9zta8KZQHPUNUcDNiCFpcOvbhoGAD3lV+Bz98Z5qSi6OBJea2+xPZEAvl5wXr
         KKVNAJWLNzaiFEyHtJOSeXD8Xno3jK9Dk5PASZ2AKc+HBs8p9c8ssMKpVag/L1wGyeck
         80p4yzDNc3ZXAkcEvKr2pc+HfBkABacZs3dQ548VAkR7wbx/8CmA+fBcTuSJtEca0gZq
         YR9JPAMK91Rq2nDfjfWKMWoZTFOfToPpwTRC7BJ2ol9TZZjv1LeEWc8WHSRcSvEM+ddF
         /ruQ==
X-Forwarded-Encrypted: i=1; AL+hErGu3jlx7mPiU40mylvhSN5RhPnqjvZdvgHhdcGFLFSJmN+K1ZE7KJH2UtlpgtjVHgS9owxU+Y/XICU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WnYje/ImBLdFZMTWUtxJJgDyS/u3KjJYmz2Z0bzXac2B0bmhY
	Yrnr2T3JWpsvvuL3LVCzJDHAvdr2jOHXTMMtRVT/KKAhWGkfQfSmrllzm92wFZJinGqAzvLqc0j
	B97ldVBGRSs+vYWDS3F0S/beG/YT3PJs=
X-Gm-Gg: AYBFou10AW9CqvAIz8eGPXvmEwDdI6feM+YtqnEQfAXlG8DeeZo8Jc1XZR3+Q0hX6+Y
	I+lRVKVi0nfwOUh9zT2j8O3AbqefUigV3eXJrCWKP2bSNka+7ld9HtsTjJN410cNOdmtB/GePU6
	d5ONFOMyyXMDpph0Qeul0TOZ7LWLl5lWOLEk0cTNfvOZED3l2yJT7c2O2FKheRfRUI9S9NHaivA
	riw4s4Hkh0Ob1hMSuh6RIbrNViUmDN29oNLbKZ+Y4IyUkFTV5PLxPVD4Fqo9BkrfmTaJCCnAAy9
	p2TBeLAzdSJFWKAVk9ffYvQDdCGF+kzNMLo24q6PEUmBYYos0k5AFywhqK0p3i2HgrB8pw8azZt
	3qBOzw7QvmfexM90oO0SdNkcfqgFmGPa1n5sCgipg+RG7JxO9PGSepFu9p3hRK5M3xFTduiVGm0
	X1K4kz2Wi9SRudZsjytVLP8xYjKtRtjA5SbCsPKb1+kWb26p0ktW7hO2Wjn1Geeb+cveZUdeSN+
	X84AGNd1772x4cEPxBBuGQI
X-Received: by 2002:ac8:59c5:0:b0:535:f182:782b with SMTP id
 d75a77b69052e-55d5a718056mr69972231cf.74.1795058691555; Wed, 18 Nov 2026
 19:24:51 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118210623.111428-1-igorgphotoarte@gmail.com>
In-Reply-To: <20261118210623.111428-1-igorgphotoarte@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 19 Nov 2026 00:24:40 -0300
X-Gm-Features: Aa3M54pETJ9GN_GpWCTC5J0GZiPjRYzaETM7ZvsDbwcw1yyZ8uWIyTOGrzRafbs
Message-ID: <CAMAsx6efLSeRpYYNH5W3W8M2mBBa_vwgynabWEbADSOng_6Ueg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] docs: pt_BR: translate driver development
 debugging guide
To: Igor Giamoniano <igorgphotoarte@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 18 de nov. de 2026 =C3=A0s 18:06, Igor Giamoniano
<igorgphotoarte@gmail.com> escreveu:
>
> This series translates the driver development debugging guide into
> Brazilian Portuguese.
>
> Patch 1 adds the translation and links it from the pt_BR debugging
> index. The kernel-doc directives at the end of the original were
> replaced by a pointer to the English document, since including them in
> the translation causes duplicate C declaration warnings and the
> generated API text would remain in English anyway.
>
> Patch 2 updates the existing references in the pt_BR debugging index
> and in the userspace debugging guide so they point to the translated
> document instead of the English original.
>
> Changes in v2:
> - Add a cover letter. No changes to the patches themselves.
>
> v1: https://lore.kernel.org/linux-doc/20261117223335.111220-1-igorgphotoa=
rte@gmail.com/
>

Thanks for the fixes in 2/2. checkpatch and htmldocs are clean, and I
reviewed the translation block by block with no issues.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
