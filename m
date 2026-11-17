Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933919;
	b=4+ng48nqdYt255DhpFjyd5XgM3o6Pb2/qVQLSUtQYG4MJQLkspPn/Vea8kcUMKmQMMlF
	 kMkJlz/eabYKvDTx7QQMrbjpbedffusVzhAfcgj0AZJnXXl7vUJFq+aDLYf75R2Me9vHm
	 N9XowVK/2jhjTx6/DDqc/be38EXsQjY9z50Tdj5G7+XB+7kQR1vNlySJ+G7eA86YcUxD+
	 VrJ49Eq6titIk+la1lPkVZMN75aN+PnA0a3BOY13D0ngVlGBM0LgvbFuieeIhmcEXr+R9
	 FBDhwRxgixzg6jqDYrAABX6Q/cBaCg5b6Fyk2BIkIkV9GT+DJ3rAWP/n+5qve8/2V6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933919;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
	b=XeEo8BebBDwu0dGlkSVnJbO58+fL/2CExfZNojiPY0HxlyVzdCdr3xw+EwtSDRJ0+fG3
	 h6mcVTeSeD+lwunYbp4RxKDsimll4Kx+jYBlm4XE5K7CvO/s31LTNpZ5YBpZE06a0BXR5
	 EsY8nN0vvuKs+gwohjZ88ZEL+0U3tScFrrbuefYFJokaqBmNb3VzneIKIaoW3+dxAJC7S
	 NtZH0qQht9Bjhh1Ret+dtjT/sVNvsUEyaFsGAeLnv9tPS5CDBJYnXHQTv0u7wadP0AgSb
	 ZJ/T0Q8k/jdawF/YtktXdico1+3+RTCjs17tBaYZCKPjSudzOQcJYbcRdj1TBHCSgoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF1D606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF1D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b271e573adso2222347b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933919; x=1795538719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
        b=xsP9UYOaEfIHwcSZ9PcWCgPcKKNnc8dJyGFkIjtr6Yb/yJja2FNEeaYjMgzBB6ggv0
         9qEpvDNzKehkEjLnmE4YaL8TFZdF2whMrD5pucxBxK8lL0XWHN38OwvZI1u7aNARuUql
         JB1Xif6E4PNOC73E2P5uo2iyMVIxq5BolhNeuVibKPViF/i4H+jO9f3Nz2I8N56nczzg
         BmSZGhS/U1GHmQmyUtLFWLNNkqHYgiFxUYgwylHQhd3bPxPm8zSXVKqrcYq4lxk768DE
         zH8VFgZOHBQpS3/tMjy1GCc9acfbXZarVIphc9YTUwQ+S5FcSozWyD5QMIo/gOW465d0
         EhqA==
X-Forwarded-Encrypted: i=1; AL+hErGZyg+P+9yIGTQeft3c+I84yXUNp2MsM/zxuo+PjW5DGIoUvZnj6EnGmykQNL6WnBb65EOoiBI151k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vfW9YfyizrA4Spop7vZNB8U3BcRkD3ozeMaJdW0tMZmyMXmcr
	XIA46ePEjpYQESwVwq3bAPZsVuIQmXr0smrM6nw+Nhc+NQq/8q/3XaobDWp9kNxP
X-Gm-Gg: AYBFou1WCbnxuSrdoSPK/nqfaUZ2OxCQ0UIi1KEHnkuULB1rCvUPIIdpIyRygopCsUU
	u8h2CGwNZRuH0EdYXwziYlvXGHihw4MTHT9idEbrqvnuEDZpSqXgVH7/vPY/r30REuGBpzyz4p2
	L/991oUIdaT3pLvioBbe6mYqk3TP4ATfbZ/2E0ogqJCdXCxheR2VCkApzQlyG2vkkNLlCrTNAP3
	R12DzE+cspaAJcQznQoSwZnotBqrRyq87TIqDnpfdZ2GzTR6GrY8j3mTd/mobxbcxsf4wgAo6W2
	//L1irRwqhXR+wzOcR5+zjLSrU/yc8S6WBjJNvrycyUL1BynUbCxQOc+kbYVI+38VPrGBUSxhOb
	8pjaq4jXzhb5Je1l14BRSJEDXFWHSxZ8J9v78bdjEWLAbVF/lxInYJjvhw6NvasVtW31RShkQuc
	k12YjJtGEhjedRVvS8tPPzNbZMQPl/9nqCbSsZ7g1ChNCGcgYrkYUG3luwxlUJ3Tn/AmA61n0+3
	lECrygZSEntnl2Gez9U9U+AKTEKCBLTzDMu3ptqGHOaJlHsHEpT0VsTrSDpq9aX7N/3MWHkj8Kd
	foXEQZ3/foX4BlL6gSV4bjR3ovhNHIxH6P7NvNY4zzxP1VS6JBKthWE1QL4AbDp3PjkK3g==
X-Received: by 2002:a05:6a00:23d2:b0:87d:e8a0:2389 with SMTP id d2e1a72fcca58-8beb772ad57mr12844485b3a.21.1794933918647;
        Tue, 17 Nov 2026 08:45:18 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5b08d7feesm103947b3a.5.2026.11.17.08.45.18
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:45:18 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40312e2so201220eec.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZr+TtGReX5REoA1lCbth71tYdTzfB+zLdgg1MJcz9eVNaUHP9pWb/NTK9QBBwNTySOpkLv45F5WA=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:1ace:fd06 with SMTP id
 ada2fe7eead31-7d64d7a9d5amr4459124137.20.1794933540494; Tue, 17 Nov 2026
 08:39:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com> <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
In-Reply-To: <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 17:38:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
X-Gm-Features: Aa3M54oLa7UUmy4CFc0JRC-Lz0IWxEH7iP1kR67WyO7NUNvhNNuybpNvCvDbePk
Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform profile: Extract the core from ACPI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Wu <jackbb_wu@compal.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Tue, 17 Nov 2026 at 17:03, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> On 11/17/26 12:48, Geert Uytterhoeven wrote:
> > On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >> Platform profile providers already use device-based callbacks and do not
> >> need ACPI types. The core is nevertheless confined to the ACPI build and
> >> refuses to initialize when ACPI is disabled.
> >>
> >> Move the implementation to drivers/platform/profile and introduce the
> >> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> >> selectors. Keep provider-specific ACPI dependencies and the
> >> platform_profile module name.
> >>
> >> Isolate access to the legacy ACPI kobject in an optional compatibility
> >> object linked into the same module. Retain the legacy ABI on active ACPI
> >> systems, and initialize the class even when ACPI is absent or disabled.
> >>
> >> Use subsys_initcall_sync so the class is ready before built-in thermal
> >> and CPUFreq providers, but after ACPI has initialized its compatibility
> >> kobject.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> >
> > Thanks for your patch, which is now commit 699041135f75b13a
> > ("platform profile: Extract the core from ACPI") in pm/linux-next/
> >
> >> --- a/drivers/platform/Kconfig
> >> +++ b/drivers/platform/Kconfig
> >> @@ -1,4 +1,20 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >> +config PLATFORM_PROFILE
> >> +       tristate "Platform profile support"
> >
> > I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
> > you have updated all provider selectors?
> >
> > If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
> > configuring kernels for different architectures do not see this option?
>
> The goal of this series is to make the platform profile firmware
> agnostic so it is available for all architectures

Sure... Are there any users of it on these architectures?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
