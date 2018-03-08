Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E8F937E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Mar 2018 11:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755755AbeCHLys (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Mar 2018 06:54:48 -0500
Received: from mail-wr0-f193.google.com ([209.85.128.193]:43413 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755734AbeCHLyq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Mar 2018 06:54:46 -0500
Received: by mail-wr0-f193.google.com with SMTP id a63so1773932wrc.10
        for <linux-doc@vger.kernel.org>; Thu, 08 Mar 2018 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Ew4bAajO1wfyf96akdHWbi/AxlCDS6xhYRp+mCqgDyw=;
        b=RxuMv5az04hKfg9d0wtZVl5x74AVqyT9vefkigr879/1uW+426pVGgZl/blu9Bypm8
         vbCCm21CwIqPiI/WI+MgWI5yqP4CrlRrUgH63yz0+8S4/iAjSOagBdS42LU0e3Nyej8A
         yW4eoWDT9Vb2W1IfbREoipab6Km8rtoKWWGxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Ew4bAajO1wfyf96akdHWbi/AxlCDS6xhYRp+mCqgDyw=;
        b=feTVvVXvQbSCh1Xe6V6idd3Ybt9EFe5kyp+7yCLl6aReZM1uI3CbVPmnb6JgqcuOW7
         OayqeNIv5kVXbeQhzF86P0R6OlFXmuiU7Nanv1dlF9RTJTHCMaWHldv3k3W9xbSvOgtj
         TF+SBTyWH26A5lOwnQNimwa1VHWKUk2U/sqDtPkhmlNpj9dpfoAayQzKFRb6Mhto4AT6
         SUO3Hs/53QtpR1NAyoni8gZOVNFZobvZXHMH5Q3ti3pgKpjKOf3g9PyV0tJooa0Eamdm
         km6wfdZXE9A19ClwRuT8R9TaccXLU74gmLFL1+QOhMeQwxGNdsCJw3ZZ9N4rZHi7Kd3p
         Q0Yg==
X-Gm-Message-State: APf1xPAxkWKJDChAyV6pM7x0CB4qn26w/zOI1Ewrp9iOuXvexSasvY8O
        DVtcw0uscqJEw8gmhjwvt25FRA==
X-Google-Smtp-Source: AG47ELvlG3QGbwsosaX5ITZE6k2j7vQs4bdZgCiVmGveNit9AFFaOWbBX2RYjA+jo4F53y4kegwwkw==
X-Received: by 10.223.201.15 with SMTP id m15mr20810682wrh.54.1520510085228;
        Thu, 08 Mar 2018 03:54:45 -0800 (PST)
Received: from oak.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c14sm17005815wmi.16.2018.03.08.03.54.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 03:54:44 -0800 (PST)
Date:   Thu, 8 Mar 2018 11:54:41 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>, edubezval@gmail.com,
        kevin.wangtao@linaro.org, leo.yan@linaro.org,
        vincent.guittot@linaro.org, amit.kachhap@gmail.com,
        linux-kernel@vger.kernel.org, javi.merino@kernel.org,
        rui.zhang@intel.com, linux-pm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH V2 5/7] thermal/drivers/cpu_cooling: Add idle cooling
 device documentation
Message-ID: <20180308115441.edb4jtpodj2qut2n@oak.lan>
References: <1519226968-19821-1-git-send-email-daniel.lezcano@linaro.org>
 <1519226968-19821-6-git-send-email-daniel.lezcano@linaro.org>
 <20180306231906.GB28911@amd>
 <84fa8a3c-28bf-41ae-8ed7-9dd348b1cde9@linaro.org>
 <20180308085949.GB17761@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180308085949.GB17761@amd>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 08, 2018 at 09:59:49AM +0100, Pavel Machek wrote:
> Hi!
> 
> > >> +Under certain circumstances, the SoC reaches a temperature exceeding
> > >> +the allocated power budget or the maximum temperature limit. The
> > > 
> > > I don't understand. Power budget is in W, temperature is in
> > > kelvin. Temperature can't exceed power budget AFAICT.
> > 
> > Yes, it is badly worded. Is the following better ?
> > 
> > "
> > Under certain circumstances a SoC can reach the maximum temperature
> > limit or is unable to stabilize the temperature around a temperature
> > control.
> > 
> > When the SoC has to stabilize the temperature, the kernel can act on a
> > cooling device to mitigate the dissipated power.
> > 
> > When the maximum temperature is reached and to prevent a catastrophic
> > situation a radical decision must be taken to reduce the temperature
> > under the critical threshold, that impacts the performance.
> > 
> > "
> 
> Actually... if hardware is expected to protect itself, I'd tone it
> down. No need to be all catastrophic and critical... But yes, better.

Makes sense. For a thermally overcommitted but passively cooled device 
work close to max operating temperature it is not a critical situation 
requiring a radical reaction, it is normal operation.

Put another way, it would severely bogus to attach KERN_CRITICAL 
messages to reaching the cooling threshold.


Daniel.


> > > Critical here, critical there. I have trouble following
> > > it. Theoretically hardware should protect itself, because you don't
> > > want kernel bug to damage your CPU?
> > 
> > There are several levels of protection. The first level is mitigating
> > the temperature from the kernel, then in the temperature sensor a reset
> > line will trigger the reboot of the CPUs. Usually it is a register where
> > you write the maximum temperature, from the driver itself. I never tried
> > to write 1000°C in this register and see if I can burn the board.
> > 
> > I know some boards have another level of thermal protection in the
> > hardware itself and some other don't.
> > 
> > In any case, from a kernel point of view, it is a critical situation as
> > we are about to hard reboot the system and in this case it is preferable
> > to drop drastically the performance but give the opportunity to the
> > system to run in a degraded mode.
> 
> Agreed you want to keep going. In ACPI world, we shutdown when
> critical trip point is reached, so this is somehow confusing.
> 
> > >> +Solutions:
> > >> +----------
> > >> +
> > >> +If we can remove the static and the dynamic leakage for a specific
> > >> +duration in a controlled period, the SoC temperature will
> > >> +decrease. Acting at the idle state duration or the idle cycle
> > > 
> > > "should" decrease? If you are in bad environment..
> > 
> > No, it will decrease in any case because of the static leakage drop. The
> > bad environment will impact the speed of this decrease.
> 
> I meant... if ambient temperature is 105C, there's not much you can do
> to cool system down :-).
> 
> > >> +Idle Injection:
> > >> +---------------
> > >> +
> > >> +The base concept of the idle injection is to force the CPU to go to an
> > >> +idle state for a specified time each control cycle, it provides
> > >> +another way to control CPU power and heat in addition to
> > >> +cpufreq. Ideally, if all CPUs of a cluster inject idle synchronously,
> > >> +this cluster can get into the deepest idle state and achieve minimum
> > >> +power consumption, but that will also increase system response latency
> > >> +if we inject less than cpuidle latency.
> > > 
> > > I don't understand last sentence.
> > 
> > Is it better ?
> > 
> > "Ideally, if all CPUs, belonging to the same cluster, inject their idle
> > cycle synchronously, the cluster can reach its power down state with a
> > minimum power consumption and static leakage drop. However, these idle
> > cycles injection will add extra latencies as the CPUs will have to
> > wakeup from a deep sleep state."
> 
> Extra comma "CPUs , belonging". But yes, better.
> 
> > Thanks!
> 
> You are welcome. Best regards,
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
