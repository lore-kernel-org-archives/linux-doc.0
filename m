Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5DD5E7D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 06:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbeGZHzf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 03:55:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbeGZHze (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Jul 2018 03:55:34 -0400
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFBC620891;
        Thu, 26 Jul 2018 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1532587215;
        bh=qZGTXOa+cse2ED6dniCZppI/kL8ZjRwN2r3xcJnuTrU=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=bUhSzCLyp85UwnQledymVwuyJ/cGZBc/XpGzz4Jt/4bAMxhiC2rd1BIuDcGS+bJ5p
         vC1B5bTUlnjgtOdwx5dhsRt4TF2sVkmb9Q1KDdJhc/16aNFyZ+4K1cvEM2azOdsH6p
         AqE6oe+nZeGz0iTT/6AgjfXXEgGEqSvoLP7b8X7U=
Received: by mail-wr1-f48.google.com with SMTP id r16-v6so501216wrt.11;
        Wed, 25 Jul 2018 23:40:14 -0700 (PDT)
X-Gm-Message-State: AOUpUlHwjDp8OZNqy7V2uiuGoBGuu49puGpzm3Dd0IndIqWdnOfrG25Y
        EL8eJZ4od5SSz1pV4zX5FS7IihJREmCe+rNsJ/Q=
X-Google-Smtp-Source: AAOMgpeMvZV4HP/vMFnTxLd+Z5d8FaJzgM+zHUG6aHjRLK5SNhQFYqLZJY54wGMq6j8cG12Q1RTwamEvuTSckgyRIMU=
X-Received: by 2002:adf:9d81:: with SMTP id p1-v6mr520793wre.12.1532587213323;
 Wed, 25 Jul 2018 23:40:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:9141:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 23:40:12
 -0700 (PDT)
In-Reply-To: <CANAwSgSChhEzDf5oSqZ2Srt62n16Z+ppFnupT=0pGkaSCv90vw@mail.gmail.com>
References: <20180724164946.6274-1-krzk@kernel.org> <20180724164946.6274-4-krzk@kernel.org>
 <CANAwSgSChhEzDf5oSqZ2Srt62n16Z+ppFnupT=0pGkaSCv90vw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 26 Jul 2018 08:40:12 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc1csipQsmtJ77uZOwUgchPwGoA_+xxzmCjx97dLU5cyg@mail.gmail.com>
Message-ID: <CAJKOXPc1csipQsmtJ77uZOwUgchPwGoA_+xxzmCjx97dLU5cyg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: exynos: Fix imprecise abort during Exynos5422
 suspend to RAM
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 26 July 2018 at 08:22, Anand Moon <linux.amoon@gmail.com> wrote:
> Hi Krzysztof,
>
> On 24 July 2018 at 22:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Suspend to RAM on Odroid XU3/XU4/HC1 family (Exynos5422) causes
>> imprecise abort:
>>
>>         PM: Syncing filesystems ... done.
>>         Freezing user space processes ... (elapsed 0.003 seconds) done.
>>         OOM killer disabled.
>>         Freezing remaining freezable tasks ... (elapsed 0.003 seconds) done.
>>         wake enabled for irq 139
>>         Disabling non-boot CPUs ...
>>         IRQ51 no longer affine to CPU1
>>         IRQ52 no longer affine to CPU2
>>         IRQ53 no longer affine to CPU3
>>         IRQ54 no longer affine to CPU4
>>         IRQ55 no longer affine to CPU5
>>         IRQ56 no longer affine to CPU6
>>         cpu cpu4: Dropping the link to regulator.40
>>         IRQ57 no longer affine to CPU7
>>         Unhandled fault: external abort on non-linefetch (0x1008) at 0xf081a028
>>         Internal error: : 1008 [#1] PREEMPT SMP ARM
>>
>> with last call trace in exynos_suspend_enter().
>>
>> The abort is caused by writing to register in secure part of sysram.
>> Boards booted under secure firmware (e.g. Hardkernel Odroid boards)
>> should access non-secure sysram.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>
> I could not get the suspend to ram working on my Odroid-XU4.

Correct, resuming from suspend to RAM does not work on Exynos5422
(yet). The patch does not add support for it. I did not write that it
works. The only thing patch does, is fixing the imprecise abort during
suspend.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
