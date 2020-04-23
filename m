Return-Path: <SRS0=PsPG=6H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50ABCC55191
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 16:28:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BB0320704
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 16:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgDWQ2z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Apr 2020 12:28:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46161 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729453AbgDWQ2z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Apr 2020 12:28:55 -0400
Received: from mail-qt1-f197.google.com ([209.85.160.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jReia-0000Hg-9i
        for linux-doc@vger.kernel.org; Thu, 23 Apr 2020 16:28:52 +0000
Received: by mail-qt1-f197.google.com with SMTP id g23so7474389qto.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2020 09:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:in-reply-to:from
         :openpgp:autocrypt:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=QFp1xUPtC4x90s979mDGrGX1ZrK4UaMagxHOnhJ59TA=;
        b=fGqGq+Tr5VbCA3krepKK305OmUDjS4IdfuBg0r4BvSHdP5GbO2TN5AncIwrFLmpY6w
         CfS/v5+N9l4ew11OxJfKBcsi/xuD5xhsAT32el5cUAFfKiEAstSFqp1s7CUAQJTb2xxQ
         Rw6+7067stfZnjJmHqICQffltXJ2uSbw8JiaLZ4oTc07tXAwyUV+WeUqM0VR6P0Oe6I+
         3rl9U0NQRq+nfau5ZORhova5EBIdT6MRGoUfTZ/JY8qtu9jMjQReqfcR+zaLjgLgrILw
         3Yu9+SuVznnclo+HAPZ4a2rIHzxeIyMCzoVFJASVDpr41M4IH7HgA7SzOVzTIRbZShWr
         2/JA==
X-Gm-Message-State: AGi0Pub9VQ6uFOpAECd5d7P5JZ6F4IS2RI7+6vbVauBJ/xiFXNPAwPOx
        o09BTW3DkUfZNHbQpJTwtswWkljcBrYjpAi3a0ccQ1ooWVQVWsKA9Y0ocCxGUqS9ZLJWT0l6sOR
        wChJ+HQIt94weyqrqwepxcT0Fc/iAEJKDeJk31A==
X-Received: by 2002:ac8:34b2:: with SMTP id w47mr4913067qtb.271.1587659330681;
        Thu, 23 Apr 2020 09:28:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwHb4uLT7RrfYY8cNi6vSBEdxbAHrq0EI+Fzu9yen2L4734tLd7aaRcMRMvS2ad6MxkRcTNA==
X-Received: by 2002:ac8:34b2:: with SMTP id w47mr4913032qtb.271.1587659330384;
        Thu, 23 Apr 2020 09:28:50 -0700 (PDT)
Received: from [192.168.1.75] ([187.10.60.9])
        by smtp.gmail.com with ESMTPSA id q6sm2049514qte.72.2020.04.23.09.28.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Apr 2020 09:28:49 -0700 (PDT)
To:     rdunlap@infradead.org, akpm@linux-foundation.org,
        sfr@canb.auug.org.au
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, refactormyself@gmail.com,
        gpiccoli@canonical.com,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>
References: <83eef4ae-8a31-aef6-038e-1d1de51a5c00@infradead.org>
Subject: Re: [PATCH -next] Documentation: admin-guide: sysctl/kernel.h: fix
 underlines and headings
In-Reply-To: <83eef4ae-8a31-aef6-038e-1d1de51a5c00@infradead.org>
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
Message-ID: <781027f8-e17e-dc70-f25b-2d3362c4a290@canonical.com>
Date:   Thu, 23 Apr 2020 13:28:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks Randy for fixing this issue with my patches, I apologize for
that! I'm also adding Stephen to the thread (he's the committer in the
-next tree), and Bolarinwa (which sent a similar fix to linux-doc this
morning, thanks!).

Also, I'd suggest adding fixes tags like below (or don't we need them on
linux-next patches?):

Fixes: 925eca2dee09 ("kernel/hung_task.c: introduce sysctl to print all
traces when a hung task is detected")
Fixes:  fb16bede2879 ("panic: add sysctl to dump all CPUs backtraces on
oops event")

Cheers,


Guilherme
