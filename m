Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2233C48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 19:10:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 811896120E
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 19:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFLTME (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 15:12:04 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42]:35737 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbhFLTMA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 15:12:00 -0400
Received: by mail-wr1-f42.google.com with SMTP id m18so9641286wrv.2
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 12:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kuRUfV+q7qAHGhHA5OLkse4agRm/XQx10cHb9gtUZW8=;
        b=s06PhCZ3835jxxHTzKKRAtggi+TT9vGycYDn2PwEvmdswflLsTbcKhHiQ3SgfeuhH6
         UTln/RH6xWVbaX5RJOFqC82Q/B3f3aYTC1orv+iBF8A/jjX6lcbV8+YDnG6WZw88QncR
         6/DPIpmwfURHFT8Z70F2lt3ihOMkw2zQLWf9Janx0PZqnzaVW797rMWZNae5ABVdTTR4
         6wfj2/D50XUX5qidQbly9Bx5wKCartZD2mrOLbdWRXNB7AGZEe7R3pefGju+feqgl3M5
         XLJ2YJ+uErX1tbov1ypjLHcEozMNCKlScPDMkYZp5Mbe9sb4N52H+XXgm1KC1BWqVtrd
         Sx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kuRUfV+q7qAHGhHA5OLkse4agRm/XQx10cHb9gtUZW8=;
        b=N5+5dgE0GC8mOraNwZXfAV1qqp9VpEAHesRvrhCbh822R4XETgL2iUkutGYqhpj3qg
         30MRI9O5qPIVF3SRosac+HvIOEZkUZVxqSFAQIrEGsq3FmHrvTSRlE5HebqrEsnOowDl
         KRY6sdld/ga/M0gLsTWw8DY4gqmaApc29cufZJt0kP4naFJ3IAsfbMhEDoo5h6Mh6DKv
         CxRl6lPKxN/pPFRXi0Kk+qa0Im8UBoxtjrBPKIKrlK3DtR1KL1gcYRyVAGXk3170V5gI
         crYK0oLJnKnd1Q1F6pXfs8wBgXCCnX8nEg3HPHWrFdO5X3sd3sdc+tAeGfm7Hb+jLgL0
         7W4w==
X-Gm-Message-State: AOAM530FPiMNMckk6G7RMJoJbWp0Ku9+HX1NHjaeyGg8j5Tg6+qgBZu5
        Wz9u1bKyRw5b7k73dLtBlEm6cw==
X-Google-Smtp-Source: ABdhPJyOO34sWQdESQfjFKmlyoRdLrIAAIE/NVc0QzHnaUCTC12w4DGk0b3HOz9ZD+OqNoC72INAGA==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr10390688wrw.419.1623524939237;
        Sat, 12 Jun 2021 12:08:59 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44? ([2a01:e34:ed2f:f020:15bb:2e33:aa66:1b44])
        by smtp.googlemail.com with ESMTPSA id v15sm10812484wrw.24.2021.06.12.12.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 12:08:58 -0700 (PDT)
Subject: Re: [PATCH v2 08/40] docs: driver-api: thermal: Use ASCII subset
 instead of UTF-8 alternate symbols
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
 <6866f10fbfbe599448fafa0ca35f1b5b262ce60f.1620823573.git.mchehab+huawei@kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <059fe414-8bb0-a0b4-9fab-cc7c8fc73eaa@linaro.org>
Date:   Sat, 12 Jun 2021 21:08:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6866f10fbfbe599448fafa0ca35f1b5b262ce60f.1620823573.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/05/2021 14:50, Mauro Carvalho Chehab wrote:
> The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
> and some automatic rules which exists on certain text editors like
> LibreOffice turned ASCII characters into some UTF-8 alternatives that
> are better displayed on html and PDF.
> 
> While it is OK to use UTF-8 characters in Linux, it is better to
> use the ASCII subset instead of using an UTF-8 equivalent character
> as it makes life easier for tools like grep, and are easier to edit
> with the some commonly used text/source code editors.
> 
> Also, Sphinx already do such conversion automatically outside literal blocks:
>    https://docutils.sourceforge.io/docs/user/smartquotes.html
> 
> So, replace the occurences of the following UTF-8 characters:
> 
> 	- U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
> 	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  .../driver-api/thermal/cpu-idle-cooling.rst        | 14 +++++++-------
>  .../driver-api/thermal/intel_powerclamp.rst        |  6 +++---
>  .../thermal/x86_pkg_temperature_thermal.rst        |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/driver-api/thermal/cpu-idle-cooling.rst b/Documentation/driver-api/thermal/cpu-idle-cooling.rst
> index c2a7ca676853..60934a518560 100644
> --- a/Documentation/driver-api/thermal/cpu-idle-cooling.rst
> +++ b/Documentation/driver-api/thermal/cpu-idle-cooling.rst
> @@ -49,7 +49,7 @@ belong to the same cluster, with a duration greater than the cluster
>  idle state target residency, we lead to dropping the static and the
>  dynamic leakage for this period (modulo the energy needed to enter
>  this state). So the sustainable power with idle cycles has a linear
> -relation with the OPP’s sustainable power and can be computed with a
> +relation with the OPP's sustainable power and can be computed with a
>  coefficient similar to::
>  
>  	    Power(IdleCycle) = Coef x Power(OPP)
> @@ -134,7 +134,7 @@ The idle injection duration value must comply with the constraints:
>    user experience, reactivity vs performance trade off we want. This
>    value should be specified.
>  
> -- It is greater than the idle state’s target residency we want to go
> +- It is greater than the idle state's target residency we want to go
>    for thermal mitigation, otherwise we end up consuming more energy.
>  
>  Power considerations
> @@ -146,11 +146,11 @@ power for a specific temperature but at this time we consume::
>   Power = Capacitance x Voltage^2 x Frequency x Utilisation
>  
>  ... which is more than the sustainable power (or there is something
> -wrong in the system setup). The ‘Capacitance’ and ‘Utilisation’ are a
> -fixed value, ‘Voltage’ and the ‘Frequency’ are fixed artificially
> -because we don’t want to change the OPP. We can group the
> -‘Capacitance’ and the ‘Utilisation’ into a single term which is the
> -‘Dynamic Power Coefficient (Cdyn)’ Simplifying the above, we have::
> +wrong in the system setup). The 'Capacitance' and 'Utilisation' are a
> +fixed value, 'Voltage' and the 'Frequency' are fixed artificially
> +because we don't want to change the OPP. We can group the
> +'Capacitance' and the 'Utilisation' into a single term which is the
> +'Dynamic Power Coefficient (Cdyn)' Simplifying the above, we have::
>  
>   Pdyn = Cdyn x Voltage^2 x Frequency
>  
> diff --git a/Documentation/driver-api/thermal/intel_powerclamp.rst b/Documentation/driver-api/thermal/intel_powerclamp.rst
> index 3f6dfb0b3ea6..d349c1b64281 100644
> --- a/Documentation/driver-api/thermal/intel_powerclamp.rst
> +++ b/Documentation/driver-api/thermal/intel_powerclamp.rst
> @@ -29,7 +29,7 @@ By:
>  INTRODUCTION
>  ============
>  
> -Consider the situation where a system’s power consumption must be
> +Consider the situation where a system's power consumption must be
>  reduced at runtime, due to power budget, thermal constraint, or noise
>  level, and where active cooling is not preferred. Software managed
>  passive power reduction must be performed to prevent the hardware
> @@ -39,7 +39,7 @@ Currently, P-states, T-states (clock modulation), and CPU offlining
>  are used for CPU throttling.
>  
>  On Intel CPUs, C-states provide effective power reduction, but so far
> -they’re only used opportunistically, based on workload. With the
> +they're only used opportunistically, based on workload. With the
>  development of intel_powerclamp driver, the method of synchronizing
>  idle injection across all online CPU threads was introduced. The goal
>  is to achieve forced and controllable C-state residency.
> @@ -264,7 +264,7 @@ CPUs).
>  Usage and Interfaces
>  ====================
>  The powerclamp driver is registered to the generic thermal layer as a
> -cooling device. Currently, it’s not bound to any thermal zones::
> +cooling device. Currently, it's not bound to any thermal zones::
>  
>    jacob@chromoly:/sys/class/thermal/cooling_device14$ grep . *
>    cur_state:0
> diff --git a/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst b/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
> index 2ac42ccd236f..5b95af96e40f 100644
> --- a/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
> +++ b/Documentation/driver-api/thermal/x86_pkg_temperature_thermal.rst
> @@ -13,7 +13,7 @@ Authors: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>  Reference
>  ---------
>  
> -Intel® 64 and IA-32 Architectures Software Developer’s Manual (Jan, 2013):
> +Intel® 64 and IA-32 Architectures Software Developer's Manual (Jan, 2013):
>  Chapter 14.6: PACKAGE LEVEL THERMAL MANAGEMENT
>  
>  Description
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
