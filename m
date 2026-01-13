Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ECD2EA151
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322037; cv=pass; b=VGtWTBpsNsYcmTD7+N1DiwePLn54abxZZqO34Wbatz1Vc7AMXsKGfKX0JJIPkRDfwNwMytnE+dfIKA0lYKByAi1skGrs4Ah04O7PGDMsoCuC6hE56nW5NP5kuvXxo4z46jqxMehdi/4ni7Yh5XsBCGoDuGmWAXiicE1UINX7RKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322037; c=relaxed/simple;
	bh=qI+cXlhZ3eVz3npFQ/NimD2ZFpeK3OA3wDm9Z2GaXgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gprzhg1QDfTZqSfePfgFg61DxsMBJS62Fsg8MjMR6WIRhT6tRSsCQ58bmBcDNYgq8a2zsuU2rdBK7xp0lM20mtEpucXrhlrfvpyuPpUR85Nf5xVAT5EYVdbQp3bYaagOtHIdfvwKWMuhpdN3YPNdyqz2H43ZXLqXaeKK8wJVoUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zVjVDsm3; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zVjVDsm3"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ffbaaafac4so656541cf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 08:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768322035; cv=none;
        d=google.com; s=arc-20240605;
        b=MylOuz8YtHsNKBAKLT+5KBvgMuN1lANOsWmxqaLmOnYEtdRaFuBInfXv1OJYVfYKWL
         Cg+sQgb8U39Vp9t2xnxDePvsYbqMnZjE+xAgKGrICbsBbpZPMamt2Vk+QZBR0BWZrh2h
         8yquGbmq5h2bKRb7fD8Y31wlgnXgWqDvVO3H+pB8PwbdslXe3mF9zzX/EeaS3GIB2tMs
         WRg51sxn81El5EcURee845lLQ51XXAsooaztitqHqy/IBjhF8f4zos/4SdTxpreypdGA
         3kpl2pwDHM8KCccFQiHnjD4+KpaIQKf2CP086bNA2gEpzBa+eHP2HIzZ9IKcAqJ0E+5Z
         KMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qI+cXlhZ3eVz3npFQ/NimD2ZFpeK3OA3wDm9Z2GaXgk=;
        fh=Qg54hftDX5woFVn0HC4TaW0XRoQunf5yYpXgQL5x3os=;
        b=VXsnVTaLTU5oMy/qsMgnhZcWNPMuwi69iIqP1KZLyHI4Qjgepuaq5bY61MX8cZGRPN
         hdVfuKBrskKB97Gpd7LbZ0D4h61aejDcvkdTs+SOoV/r5TS7Xw6XzfowPkqCWDC2wZKb
         QySY5PwlCtfxpkXYjK44EEoWLIUqPJkupdrhVdD52mYFAveWrC5W0PZA79y3QmL4eFvD
         2C+mGBADD8ooQdhrZZIk9AQbFkenvESXCaAozDdcpQKPhroGx++hFEuIq79AS/ePv1IV
         dSUCXMEOFCc/jXzrutbKAm1g5Q/unMHHri8i7uFB0P1xonK7BOA4BBb8KQLmMzyAsVeO
         8RwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768322035; x=1768926835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI+cXlhZ3eVz3npFQ/NimD2ZFpeK3OA3wDm9Z2GaXgk=;
        b=zVjVDsm3HjHVqXJuBnFMntc8H2Inhmr7+d0aP8NfFkFBFWf01l0KA5R5GdpVT7tsPU
         jodn6S6D7qf8288COTSlda3zri/SAUoCv/CqII2B5o3IeRTNJI3J8Hol7GvS7LheFlWF
         BqVUoTnBiPLf3lVtFv76SLtv3Ky+oBcrqzwl9KzlTOUAG63Aw36mpTQwywiz0H1LZLKi
         5U3dIC525xNzXG4ii9IYMLyLLjiyDyTlQmuufccXHNWv0pMvKqWivDCf0GMZZv4IxmLB
         lTkfWJenoERVj3Sqatl/hwixak2qITL/ra3okvKgFcQwJrxXSNi/i22LUq9sXiW7DPY8
         O1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322035; x=1768926835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qI+cXlhZ3eVz3npFQ/NimD2ZFpeK3OA3wDm9Z2GaXgk=;
        b=RH6JRyDBAzYiewzSPd41U7Gmnzpxq6rNyvybD0fO9Oh/1S5WON+zNqpofDt+ptbCTo
         LFzFc6ULO/hIvtEPN0gw2l9SXQJDBfrSoqGzrwp4HSSX/L2yiedmQPv/U8b4BxwsdWuU
         10TPTTritj7EHgEUzuDILapTgQbQlzuQWwARIbrEHW9tE6Z+ocX8MrL+w3RQCsmpgoge
         j/U5y9kry3MaqJp2Vkhh47FrKkVPHe2Jje+6355/c46ckecsbiq4dOOJG3GCIj43S3UC
         sLdSLBojsj7wHU7/phNPHft3AoK9MGDMlHicke59KjXyj3MRKYUMSHd/4TT3m59FTYxB
         Nx2A==
X-Forwarded-Encrypted: i=1; AJvYcCWAlxrYdnSIPkcA8qBq0r8zGIgP6+/SaeMkRy2PSPXkWbQmqJDSHRYYEFwMHQ0sXtVg9qyrQsjRl4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpzl8qqeIszE3qhfB2F02/ZW+TDfnpbbUpkAY6GaeHpu1thPKB
	SubVWA5rRc2OTjAiEk4NRUAO2VUsoLM5/x9P5GPoQrMRI2DT1uRPrJRxu6aBBfHsc6RtKZVr8go
	w3dYi/H5vGoVVmIl3YCwiNpeQ3ByTdc2HQVgge92i
X-Gm-Gg: AY/fxX68J2FDTVBUUDYFFZVonvhU9Q2fNAIsud3vp4P6Dn1eckBqQqL0xDaSEKI3oXe
	eDtAdHoJYnW+Ev5/2GAeyynIxx7tnVNtH1+DYTPAwmzFDcI0I/SsaYZBj9+SjZ1LDzuHp8warhk
	IoLVd+1ABitVHG2xbBvCZa4LXSis3R4NLKixCX6DuWIt5car/+QH7liwo2JLh/FcWqWIBEhetNN
	HRxScezTqufEc0xqv0/ya1GHIztJRnpJEsxsJmaZW+juTYMW08vmJ8CiLtFGzqdrKGrLse4m2qD
	s+hyS5XtFjDePvnw7ybdM1fECA==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-5013a287cb3mr12545891cf.14.1768322034517; Tue, 13 Jan 2026
 08:33:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aWMLQkvushKidjQQ@moria.home.lan> <20260113032735.161838-1-ranxiaokai627@163.com>
 <aWXAaiLXn2tXr8nU@moria.home.lan>
In-Reply-To: <aWXAaiLXn2tXr8nU@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Jan 2026 08:33:43 -0800
X-Gm-Features: AZwV_QhF2LNh9b5y9XH-3TUKdD9SDJ16RHoFzZRc-qtc8Hdy1LAoshy7iJbvlXE
Message-ID: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: ranxiaokai627@163.com, Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	corbet@lwn.net, david@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, ran.xiaokai@zte.com.cn, rppt@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 7:50=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Tue, Jan 13, 2026 at 03:27:35AM +0000, ranxiaokai627@163.com wrote:
> > >On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
> > >> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> > >>
> > >> Boot parameters prefixed with "sysctl." are processed separately
> > >> during the final stage of system initialization via kernel_init()->
> > >> do_sysctl_args(). Since mem_profiling support should be parsed
> > >> in early boot stage, it is unsuitable for centralized handling
> > >> in do_sysctl_args().
> > >> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> > >> the sysctl.vm.mem_profiling entry is not writable and will cause
> > >> a warning. To prevent duplicate processing of sysctl.vm.mem_profilin=
g,
> > >> rename the boot parameter to "mem_profiling".
> > >>
> > >> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> > >
> > >How was this observed/detected?
> >
> > Actually no kernel bug or funtional defect was observed through testing=
.
> > Via code reading, i found after commit [1],
> > boot parameters prefixed with sysctl is processed redundantly.

I was able to reproduce the warning by enabling
CONFIG_MEM_ALLOC_PROFILING,
CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
CONFIG_MEM_ALLOC_PROFILING_DEBUG, CONFIG_SYSCTL and setting
CONFIG_CMDLINE=3D"1".
The fix I posted eliminates that warning. Ran, you can post my
suggestion yourself with me as Suggested-by or I can post it with you
as Reported-by. Let me know your preference.

>
> When bcachefs was in the kernel, I spent an inordinate amount of time in
> code reviews trying to convince people that yes, they really do need to
> be testing their code.
>
> Strangely enough, I have never had this issue with project contributors
> who did not come to the project by way of the kernel community... :)
