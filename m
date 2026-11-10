Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321625;
	b=LvZCWLYySkMp/lQxfSDLbJPZUyeSlbh4Lk0tQzZLnC9BaLpnz61kJ2fBddYgdtwBv/og
	 6s9/o9ssFvs4Y6Df2kCdi0KZmXujERzct1B6CCydPxfeKxElXjBCxXkt1uA/ncgQ8/mTj
	 J51RlhnFFytV+lohT+hKrqjfJ5oGQLiSmpwj7VqtXY8cpYiJhRqmSmpC1QSvsmOJcPJ2M
	 iZDogCVS5Aqi+DKhcFXC7GLAwf3G0u2xaH0PH5HU07zi4YhH2xQfeENkcXg/LmY7iM2Hg
	 cFArsV/8s4XR/F60wPSxgaxMbWUsmjiE1gXRDeYO71oeLNTAthyj7Dv2e32rn459LcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321625;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
	b=eE05nM92Mg1c1roYLNM8JJtgXq2HF4nvWgK0z55dOpkUvX80LZW4VOUkmq40jk4vbSHi
	 75yF7XJNJ1WpnmxcJNTa8nnOybAoYxy46Ei+jL71QyyP8N7k+HhEydHs/YtOeQ8B3LgrG
	 jXGyQKQyMaAHd2CCra8k6MmTZp1KLBDgSoqU6U8cy6Y6YcWddgfeRvAykdEt8Q/dpt4jN
	 7BnJuWVEGeChKio0BbYzALNd1spewwQQulWuyUS6ncM3CBQ0SxGMDYbh3OdG7DyV9ryJN
	 jEaVXfpN/8jV1GLXclyNEOtUuP0I1NK9DME+kv7UFNDWxe4aI+JqrNQG65MgLn2wwEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A058606A325
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 14:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A058606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505186727fso97736166b.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 06:40:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321623; x=1794926423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
        b=Oz4jLbIU6AeyQQ7tFCEMs9fPTLLfvOIJJL1ZNiCF7aTKX0Yq/3EJXlucdsnHAQE8jY
         8nYFxh9woXYF16tKYsQbXASHEAaeW53yM/8i8zC0X4th4FgLShAgQK2X0rDCCDd3dtn/
         VkLzEt485owQ0XERkwK3TuGRWS823LMTVjiKH/I30KvPwN7NZf/lYqRYxu15whmlYcIg
         UeeLZv7s7hi50C1hjzOngXiwNL7gmlCULTGuCRGpWq7FVBqj3okp6xbm76ZA1rNtwrGa
         sBRl192bPGf71HLdyDMxQXqu1yjBFGQUx4Cqmj2yhB3eblHvla94uUTcFNNDkrgIOUHG
         grrg==
X-Forwarded-Encrypted: i=1; AL+hErGJyCrs72Un5fifZ2Pwk16qf3bvpeaLPL6YcHR50geuoJITud3X3gkIwE77w1uTgak3O1IX/Qc1fSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uzTcVSQu0biddJNU20mSqnXVKsnPQw/Y7+0UdXYg/fxeicbuH
	wwI3vpEqs9mRzP5TmCHUd7GLPCDeJtNnLmhgqgDKc8RtyiU6bM8XeSzYymX0wyju8o8=
X-Gm-Gg: AYBFou3ojXNjSQ6prQ7YtWMFpRiOet9b0BF5kdHwRLugOkkI/4v7Ii1pCOA9or9/rSe
	RpOmrhGgtYtH9TKaNsKTQnj5UM8BgxXyNmJt/puqkcHuJFh7ZBrV5HmelhTyfxsjZjcHf/n2mEI
	z6BMMD0/stLqdThQB762BeMAqAVuTD+rfsaSu7HQPxTP+x/z++TKWOd5key62weoiMPp3kUWO2/
	vekoGt4KBFun4vBxFhmM+EFeQbyWDVHe1htlSfL4p3uOJJJR79r/Paorol478Ccj3R0uGCTp4zN
	7M+t6wHxBPN9yPqNJcgTDhUcTv4VzU6YW0fiLKVTz9ov+LvYkgrbLr6xvr6EG3LgVuLrkyW6H01
	9ikKONWKryRXhZrsVk5VQXfb3iAsls1Bqfd1wr/9ovAG+Gf7USioBDAPtI7UMZoTI04kFYIlcvS
	yZw6P437xBP5U/dgFNZ7V4llzHLgGo9WACIYYBGSHu/W/yXOKKKLGPkSr+F8ZAM/Y1M018MU7gV
	MGRBGktJruUhfmtyTcxKe/RKAqNf2V0VoDhtxV42vf8yaGTBXSZP9mj08h4Zt13YMHMP0VR+0mK
	r8aLA4t5+7hEQ8pL84O8Y6lo6TxM9v0ZVtNMpLQuil9YrsLjxzGv3kA/mbVc2hUfnuA=
X-Received: by 2002:a17:907:9304:b0:c43:ae92:9a9 with SMTP id a640c23a62f3a-c504964fdadmr254696866b.33.1794321622760;
        Tue, 10 Nov 2026 06:40:22 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a628c6bsm112891066b.56.2026.11.10.06.40.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:40:20 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2872218a12.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 06:40:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFJF1N3ku1KJCJOWUAHoJxvE/ac+61kg29qAwS41Cp3cxjZg/hCxy1mDpg3xawU1cAjSFwbIIv8jPI=@vger.kernel.org
X-Received: by 2002:aa7:d78b:0:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b756b12aeemr1910612a12.43.1794321620553; Tue, 10 Nov 2026
 06:40:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:40:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
X-Gm-Features: AclHuK-vciKQvIOU3wexWocdK7lSDvoS7oWEizuJMJhyo6occ__o2qwUAjcDY0U
Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
Subject: Re: [PATCH v3] docs: submitting-patches: Clarify partial review tags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 15:36, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
>
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
>
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
>
> The sentence is explicit, exhaustive and complete, meaning it does not
> allow implicit variations like: "this patch or part of this patch".
>
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
> be followed by '# subpart' suffix.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v3:
> 1. Minor commit msg adjustments
> 2. Use  Driver X author <foo@example.org> # for Driver
> 3. Tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
