Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE0797D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Sep 2018 03:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbeIXJMc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Sep 2018 05:12:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35471 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbeIXJMb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Sep 2018 05:12:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id o18-v6so8500530wmc.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Sep 2018 20:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+SNeM+3rEiB9AOJ7flDOpSJUnC15RRsbdFD5lT7uKC0=;
        b=SnqAMKCCGlWIo/gOYkuoAs6fkjlHU+/PYDwsByRhX8K9QEb0k+OOvp7jo0cYnz0VoJ
         gYfDgSLx7YBuZk5tL1/bvp/R+CYcS+ic+3Urbh28xnTHUWHPmUSnSFi47oIsT+OaVRP3
         Wdr13LB00WqD50k9N2Q7Wke0wOF97W/UopqT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+SNeM+3rEiB9AOJ7flDOpSJUnC15RRsbdFD5lT7uKC0=;
        b=tewQEuJJ8vVxBclyB3qLo9n4B6TIxtYIg/wfodReUi+5xX5BETx48j3f8DSvA3Rev4
         ocZXpc87NYJXTPcCNnNGMicXYyw9Scvw26veFuf7ly52DCdF2xHCGHevmpUpZhTpPAJA
         k5CiWsBK2jAPCjMrSOKTd24DtgqcnMvOz07krr1PIfS+FwOIyI0AFkc5puhZhEQSPM8F
         jCQv6y5P217JZ4a8sgQ8RiE1bum8/GYaWTxRQ3tNG6oFrdmAJWaQb42BfY8j12JOkhtF
         lHXRqwu2ucUjjKBb00zvhckAvSlNc/Hx6DQYxSsJFGh58RzNo7Vh5JSO5AzUMB4CkKS1
         QhTg==
X-Gm-Message-State: ABuFfoiTlVYkPDPNPIndWa0sgVU1Ku/DJ1O+NbncAQtvaYm35kqkQ9bO
        2ioB7cAngzSomNSQiXFdS3oZo8DqEgw=
X-Google-Smtp-Source: ANB0Vdays2jX5iJ+DbdDiAqzMmKDj57HlI7Zx1ZrlnPZ6HnjXxnmIM3fgkhpedb1bS6kSJDV7g3VIA==
X-Received: by 2002:a1c:7711:: with SMTP id t17-v6mr5661512wmi.35.1537758751389;
        Sun, 23 Sep 2018 20:12:31 -0700 (PDT)
Received: from [192.168.0.41] (sju31-1-78-210-255-2.fbx.proxad.net. [78.210.255.2])
        by smtp.googlemail.com with ESMTPSA id k63-v6sm31067102wmd.46.2018.09.23.20.12.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Sep 2018 20:12:30 -0700 (PDT)
Subject: Re: [PATCH v7 05/24] clocksource: Add a new timer-ingenic driver
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20180821171635.22740-1-paul@crapouillou.net>
 <20180821171635.22740-6-paul@crapouillou.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e0836866-552f-374b-d271-a4ea2d4953ac@linaro.org>
Date:   Mon, 24 Sep 2018 05:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180821171635.22740-6-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 21/08/2018 19:16, Paul Cercueil wrote:
> This driver handles the TCU (Timer Counter Unit) present on the Ingenic
> JZ47xx SoCs, and provides the kernel with a system timer, and optionally
> with a clocksource and a sched_clock.
> 
> It also provides clocks and interrupt handling to client drivers.

Can you provide a much more complete description of the timer in order
to make my life easier for the review of this patch?

Thanks

  -- Daniel

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

