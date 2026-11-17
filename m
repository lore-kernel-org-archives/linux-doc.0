Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916420;
	b=rm6tPlSr9YGoYmfOAf5zYyM0xyN5y/6dSIc5u3JJnM3wowryXqTKVJQMt40rS7jCNW6b
	 xt40oNQbE7ugsjgOBygCkRVKNqUkV1iN1fEaEjSueOohW9ze5Gl0nrkuOsvuhTZ+3zQ1x
	 0q3HLFjRgvTIS5nRFe6eUvZMOBouf+ecla1ojxSxxA5enfNFf9eRt8LiZAmhv56qM0LaO
	 lQsjtf0LPX4gB61qg/Uo8peFdJEZGDZW4p8YuY30ytxJGb/iohdggBeBx8n1zNcE6/mfX
	 NF4qnpqTjWjtozr/4eYsQVt4TUlI4eHAcDxmj3vQKwaXtRviUEjEbFIn/Ixt6B+CMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916420;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
	b=uJEqQmKnKPxU6mpJ785qLHFQmrYG6GH9E9CfX6HOdj4ENcQYOznumOjjWI4TdHUwY9c9
	 CS6UmmPcI4CkGGocLP8UBJvEvTAZkmFOo8ptVHImygqykCgpbTAErpM0etZMvwuu2FcUt
	 0wueb/XblRL9ugpsCyK0SV8mMRATQHB3TAKOKr0IwAvEY9OSXgfWw7bHzYT+5+dUoDUFn
	 eAH80SfR77GG3qGTh/so1cdyyrNlTH5zBm+uvxuEz+LafVpN5F5kz3N5Ovg1j8++bw/i0
	 PR7nfDmlU3acInPfcu1qRlYSaIMb7YgF1y18pHy3gZaJ99BRz/3zyTquddicKvultkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858EA606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 11:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 858EA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ec6f271883so3985774e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916418; x=1795521218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
        b=bOry6nUg6PzDBqPfZmZ/BKurMGZmQdPXPClGs402UzMQEuFiT2+i7RZeppxHy0hpo2
         Wuk0E8qoPsFjS1vy5ITkpHffFVw5n3DdCjwmu1c2eJw1PpmBB0lDwmSubB/+0waBQ7A3
         oHvRkFNYAL3/6jmYYtVMf/UNKN/LlqLniFwcFgLHNQe5AezkktmXylNuFLXcVpxKmqcg
         bCNWcWdyLmgIW6KTCUxzqDYVYTEpyby2tKwm+vgiRyBjcooTODAsR9eBS/ji7mNuH5tM
         Fg3TNiXPwEp69XJDceqejBv21oxdRxZjt27ErtBc+mMGLcFVbQn990sM3Fs7X8kh3b1b
         KoMw==
X-Forwarded-Encrypted: i=1; AL+hErEezXaC2rnkc66DSOOTkbZVvM6saLkl5kZI9YTczf3IqP4Ico4y9sqx4wU+CprzUq2+uJt9ixTDWM8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EO7w/26/OOHX1T+T7SEpyux1T0odVwaWHgC5emu204gD/iHfr
	DMk4eEBM6IXgc1YAUN6cow/ZiaG7xA/x+ihta8+H7bd9Bt+C3cRHynYaU2Bq0d0r
X-Gm-Gg: AYBFou2SfpHVmWtQ70H9U+vzfpk/uyVaxsYN2E0MXOXcXU4KH2F+Sv1IzjPRNXJ4BQ1
	WZtGWbBAr5YQh63jjkxV0FjaqfdzxjtK8TobJVKmu3gvNJp6loGvKxPZWRQbS3genOjy6Qeaivd
	+1o7M4TAs+RN67DTNXtsyfjw7dRgDGms6umW4K60xBgcgBplmbeV8Bi4r73Rp7jiVoOaE47fyml
	ZvZvUBYYFAqzsN+zEXpMP1H8Sd/fZJe89k5NRt0lrxPm0qXb9XbqNWg2pHnGQ0ie97Hxzp2aDua
	nMX+crHtAnDk67TuESOsucBQdifH70U9HSNhfG2ozV4eK999vcfgD15Fr9rLlvyRINS4GWKQ3Ru
	9OCHgLUWhhScNKG8924JDlRkpLsKXRmSt2bg1eygyWm7YLITlD3c7rTKVpREtxEximrgerH6/ck
	xrComipKJqhcmG/cNenYjB1gfPjji/+m3RVnporitiGip8bUvnyXcaruXWWdBl3IkWxv+9RbcHG
	qvk7TWYyXy7dHvjqoSya4fDCHs+0BkXW4mXcMxuaTj3KdJZl4QnKcD+0VLwLXICsDXcVRSurXkx
	EvU5OFscxGxJA66u3LCTaP1H1y4hTbrCGlHMHWv+tiFp+gOaNpBqSGLfUJbBKX1Aub9KnuNs
X-Received: by 2002:a05:6122:d17:b0:5ee:19bb:f8ad with SMTP id 71dfb90a1353d-5ee34ad85d5mr5348351e0c.17.1794916418432;
        Tue, 17 Nov 2026 03:53:38 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e11d3c2sm6671360e0c.15.2026.11.17.03.53.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:53:38 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ec6f271883so3985772e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:53:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG80MSz5aIZR5lwGwzRM86TDWmQ92PMfpjpVqeHjRuJp6kS/a0aSsTJA5TwA5pUGDjPGf3tOfOzoJg=@vger.kernel.org
X-Received: by 2002:a05:6102:578c:b0:7d2:c786:5a95 with SMTP id
 ada2fe7eead31-7d64d69dc95mr4808481137.13.1794916104363; Tue, 17 Nov 2026
 03:48:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com> <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 12:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
X-Gm-Features: Aa3M54o4xtj3bYccvEv51xwUP0A3vPBfjxtiJtpZqQUGyQco56wW9LsC221L5Po
Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
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

On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> Platform profile providers already use device-based callbacks and do not
> need ACPI types. The core is nevertheless confined to the ACPI build and
> refuses to initialize when ACPI is disabled.
>
> Move the implementation to drivers/platform/profile and introduce the
> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> selectors. Keep provider-specific ACPI dependencies and the
> platform_profile module name.
>
> Isolate access to the legacy ACPI kobject in an optional compatibility
> object linked into the same module. Retain the legacy ABI on active ACPI
> systems, and initialize the class even when ACPI is absent or disabled.
>
> Use subsys_initcall_sync so the class is ready before built-in thermal
> and CPUFreq providers, but after ACPI has initialized its compatibility
> kobject.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for your patch, which is now commit 699041135f75b13a
("platform profile: Extract the core from ACPI") in pm/linux-next/

> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,4 +1,20 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config PLATFORM_PROFILE
> +       tristate "Platform profile support"

I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
you have updated all provider selectors?

If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
configuring kernels for different architectures do not see this option?

> +       help
> +         Provide a common sysfs interface for selecting platform power,
> +         performance and cooling profiles. Platform-specific provider drivers
> +         map their operating modes onto standard profile names, independently
> +         of the firmware interface they use.
> +
> +         The core exposes per-provider controls under /sys/class/platform-profile/.
> +         A provider driver must register before profile attributes become
> +         available. ACPI is not required; on ACPI systems the legacy system-wide
> +         interface under /sys/firmware/acpi/ is also provided.
> +
> +         To compile this as a module, choose M here: the module will be called
> +         platform_profile.
> +
>  source "drivers/platform/mips/Kconfig"
>
>  source "drivers/platform/loongarch/Kconfig"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
