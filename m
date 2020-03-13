Return-Path: <SRS0=hUYu=46=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148ADC4CECE
	for <linux-doc@archiver.kernel.org>; Fri, 13 Mar 2020 17:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA9B5206B1
	for <linux-doc@archiver.kernel.org>; Fri, 13 Mar 2020 17:23:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMRXq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Mar 2020 13:23:46 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38708 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgCMRXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Mar 2020 13:23:46 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jCo2C-0000Nx-AU
        for linux-doc@vger.kernel.org; Fri, 13 Mar 2020 17:23:44 +0000
Received: by mail-wr1-f71.google.com with SMTP id l16so3897752wrr.6
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2020 10:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:to:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RkXpnuziHgLrnkR5X2klNJNHeJcp3TgPwryfqx5WOp0=;
        b=VK/b7dv3jcIaP4uWlais9It9VSsx3qFr2aFdSxTbxb0m+wEjxMhLwCKhFfC9YVKGiw
         IvtGw7vZKpheQ+chvTX9HsaABSK8gVaSHldd7zoVGxdMFO/s8vB666oZrFI7g6UaPjEq
         PleFMa+1XJVFBT6R/Fm2NkNRwRZOxfeEgPYu07hsZYLEULM/pVAz2fZilrA90+cLHtos
         6Uizvna+1zs4goq+08PRwiJ5vFfn5AU7lwxI1b96LGLXoH88zKXYzYDqzl6vKxhjdSQp
         DLYiJdXwOsGDn47wiOzuOqkXCavcQPj0lPcCFbTdv7otLD2EcZpOudJjsijtogPMhrds
         WoaQ==
X-Gm-Message-State: ANhLgQ3RJGbxPFQl1u5cL9im4yo2cEmJo1r6ENY8i+SnARnvI/2jrkwe
        nhVMNgsk23qZ/JJkPWJCr13+qGuBqmJItGljBsSF35H6hyZFhHURhC9sxoz1/ixeWFU2lEZp3AI
        INQWuNTce7ibaVRiWe9naTo5e1Fe0l1rhGV+JMA==
X-Received: by 2002:adf:ab54:: with SMTP id r20mr3358532wrc.197.1584120224049;
        Fri, 13 Mar 2020 10:23:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuPmdgJsJ31KcEO/jHEkWAnrvUInFIgglCacgBPaBPNrBuMoFcCCHSV+As+ieKRNUQTdmdHLQ==
X-Received: by 2002:adf:ab54:: with SMTP id r20mr3358512wrc.197.1584120223802;
        Fri, 13 Mar 2020 10:23:43 -0700 (PDT)
Received: from [192.168.1.75] (189-47-87-73.dsl.telesp.net.br. [189.47.87.73])
        by smtp.gmail.com with ESMTPSA id c2sm17890613wma.39.2020.03.13.10.23.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 10:23:42 -0700 (PDT)
Subject: Re: [PATCH] kernel/hung_task.c: Introduce sysctl to print all traces
 when a hung task is detected
Cc:     linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, mcgrof@kernel.org, yzaikin@google.com,
        tglx@linutronix.de, kernel@gpiccoli.net
References: <20200310155650.17968-1-gpiccoli@canonical.com>
To:     keescook@chromium.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
 Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
 30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
 irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
 7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
 AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
 AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
 5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
 4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
 q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
 iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
 LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
 aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
 pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
 kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
 nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
 bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
 BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
 1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
 egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
 Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
 kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
 X18zwLgdiQ==
Message-ID: <ef3b3e9a-9d58-60ec-d638-88ad57d29aec@canonical.com>
Date:   Fri, 13 Mar 2020 14:23:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200310155650.17968-1-gpiccoli@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Kees / Testsuo, are you OK with this patch once I resend with the
suggestions you gave me?

Is there anybody else I should loop in the patch that should take a
look? Never sent sysctl stuff before, sorry if I forgot somebody heheh

Thanks,


Guilherme
