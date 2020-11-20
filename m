Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B71C5519F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 09:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1483122404
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 09:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbpQTy1f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgKTJew (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 04:34:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27178 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727310AbgKTJeu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 04:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605864888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gbikbOFWLmH51xEMI3CZCcV1DBmB6rsbo4SOuPJyr+Q=;
        b=cbpQTy1fmfZEEGUZr9Zjcj2Ha6vhpZ8gbi1xjgbChaMxkwqZ6fscIacyVef89080c2mxGk
        P6UTsE72bvs15s78WDVSnKGcmfHmk2jb+rStsNOht4pJQp/Z5HzjIvpGz6+ea9p0qj9RYj
        fwBlllgLa8BHWEVcwvZKMS85vTaxwlI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-nwFiYxwkNUOy57hd35r-kQ-1; Fri, 20 Nov 2020 04:34:47 -0500
X-MC-Unique: nwFiYxwkNUOy57hd35r-kQ-1
Received: by mail-io1-f69.google.com with SMTP id b4so6991597ioa.4
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 01:34:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gbikbOFWLmH51xEMI3CZCcV1DBmB6rsbo4SOuPJyr+Q=;
        b=jKGmx9OVwLDGGGV5qYGKDr325e5zS1twn8m5sxd1+KDd/Pe55vGwb8tMQqR8/Q9NZV
         /h/xxQFIUSBog9atc7qwKgH4L7BAbJ7ca1pdGw9cmY86r5KdDFjh1j6pPE9BfWKzkmDS
         3hp6S73vTBhrCxnl8Arq0KL543kApW2yM+0E3gCWW/duTQV9Xc147mShC65Hc/+CeU58
         BTkRzirFiqHgqF/0Rx5JeJ+98cMjSpV4iuaPwzemnGh4Pwz9D460UXhs2H0/r0wYsS8T
         JOagA5Roi8ErwIJiEOxLOXSI0i4NA5TipoVQKfwHx9iPh8FMda30X9kuC2tt18uoxKHG
         XzcA==
X-Gm-Message-State: AOAM533cAGsSYyJOspzfZyWDdVUldWev3d9mymVxJCYAAzI3TUyHuBVa
        ZeKQf+TZao0q0q91zjuzdi8y2wjrp92XfsRKPZdj6zLIVOFLVY3cmro/IGB7cnk73CsyFYcYoKN
        zZ2zbTsw4DEeGXOKugr842iKLFcCrJKszb1Z0
X-Received: by 2002:a05:6e02:e8e:: with SMTP id t14mr4572450ilj.207.1605864886426;
        Fri, 20 Nov 2020 01:34:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZTkOfTuI3Fs1qspxBePJyTE8vzwQ8naLykgg6urOciQRhNvxGx1ixR75FmurFgow5FjHHGWgcjObn0wV/Cq8=
X-Received: by 2002:a05:6e02:e8e:: with SMTP id t14mr4572436ilj.207.1605864886218;
 Fri, 20 Nov 2020 01:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20201118232431.21832-1-saeed.mirzamohammadi@oracle.com>
 <CACPcB9e8p5Ayw15aOe5ZNPOa7MF3+pzPdcaZgTc_E_TZYkgD6Q@mail.gmail.com> <AC36B9BC-654C-4FC1-8EA3-94B986639F1E@oracle.com>
In-Reply-To: <AC36B9BC-654C-4FC1-8EA3-94B986639F1E@oracle.com>
From:   Kairui Song <kasong@redhat.com>
Date:   Fri, 20 Nov 2020 17:34:35 +0800
Message-ID: <CACPcB9d7kU1TYaF-g2GH16Wg=hrQu71sGDoC8uMFFMc6oW_duQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] kernel/crash_core.c - Add crashkernel=auto for x86
 and ARM
To:     Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Cc:     John Donnelly <john.p.donnelly@oracle.com>, stable@vger.kernel.org,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Anson Huang <Anson.Huang@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 4:28 AM Saeed Mirzamohammadi
<saeed.mirzamohammadi@oracle.com> wrote:
>
> Hi,
>
> And I think crashkernel=3Dauto could be used as an indicator that user
> want the kernel to control the crashkernel size, so some further work
> could be done to adjust the crashkernel more accordingly. eg. when
> memory encryption is enabled, increase the crashkernel value for the
> auto estimation, as it's known to consume more crashkernel memory.
>
> Thanks for the suggestion! I tried to keep it simple and leave it to the =
user to change Kconfig in case a different range is needed. Based on experi=
ence, these ranges work well for most of the regular cases.

Yes, I think the current implementation is a very good start.

There are some use cases, where kernel is expected to reserve more memory, =
like:
- when memory encryption is enabled, an extra swiotlb size of memory
should be reserved
- on pcc, fadump will expect more memory to be reserved

I believe there are a lot more cases like these.
I tried to come up with some patches to let the kernel reserve more
memory automatically, when such conditions are detected, but changing
the crashkernel=3D specified value is really weird.

But if we have a crashkernel=3Dauto, then kernel automatically reserve
more memory will make sense.

> But why not make it arch-independent? This crashkernel=3Dauto idea
> should simply work with every arch.
>
>
> Thanks! I=E2=80=99ll be making it arch-independent in the v2 patch.
>
>
> #include <asm/page.h>
> #include <asm/sections.h>
> @@ -41,6 +42,15 @@ static int __init parse_crashkernel_mem(char *cmdline,
>                                        unsigned long long *crash_base)
> {
>        char *cur =3D cmdline, *tmp;
> +       unsigned long long total_mem =3D system_ram;
> +
> +       /*
> +        * Firmware sometimes reserves some memory regions for it's own u=
se.
> +        * so we get less than actual system memory size.
> +        * Workaround this by round up the total size to 128M which is
> +        * enough for most test cases.
> +        */
> +       total_mem =3D roundup(total_mem, SZ_128M);
>
>
> I think this rounding may be better moved to the arch specified part
> where parse_crashkernel is called?
>
>
> Thanks for the suggestion. Could you please elaborate why do we need to d=
o that?

Every arch gets their total memory value using different methods,
(just check every parse_crashkernel call, and the system_ram param is
filled in many different ways), so I'm really not sure if this
rounding is always suitable.

>
> Thanks,
> Saeed
>
>
--
Best Regards,
Kairui Song

