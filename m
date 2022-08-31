Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6FDECAAD4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Aug 2022 13:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbiHaNcm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Aug 2022 09:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbiHaNcl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Aug 2022 09:32:41 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DDCCCD79
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 06:32:38 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id s11so18381490edd.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Aug 2022 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CgFPDK2LvRhAS6goxi4X/Ic8NNdHal1iYUOcFxcfEdk=;
        b=OihL0qcd7WTm78kvrrTsnVuXk1//E+pKPWsyjcGbB/P4HjEZXfREd/CjogrV6SDOlL
         GsHoAFIvYgnKbfcx6ccWiSl/xuBdQG3P5vgPFA8wCFCPYFhzTVSvCx3jIWFOrPt68oMR
         qUwnav9c//Odlu5krHpyk+sUs7gdRgOWz0XpnFbonZzefWiC4MhVBSZ3S2qO0xugA1Ov
         AYmMZUOVp+svGZPETa8oThZlCTa0q8zfwEfoUmRrznv3BP2HFAI0R6ZJICBLg/fmdhkh
         BaKfz/hMLg5YOV9680dDdCjKdeV3uupWudbX/ipOad25UYmOrgCvX6SUubv1SUxPTtZN
         rsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CgFPDK2LvRhAS6goxi4X/Ic8NNdHal1iYUOcFxcfEdk=;
        b=aV7UBPUXTavv00z2UrGDr4rSlrXV8fV4ih+ootsY5OUk9ADeDfsBi2x6rJSaHYhGOj
         PzZyqGQGV1bsNF35sjT9uxhG8K45yT/OXpWwj1eqSpcO6EHGV4sOu9kNleRCtuCyxoz3
         yOE/3lX7Vr/Ha3WS4+MaAhN8flkdTsJNSXtr9GBr4TgczZ/vkrDRjyTwAB87q6WOVOWG
         t+rrr4tEBGHcJWZ49oCxXp7UJHse4hHw1WxDI25eM95GtQqHBbqMb/Zo8eeq1Dd2D4sh
         lcN47KZLFZC0+uA8YvN2aXfBIx7dzV2H5cwtwrLUaAuSdpt4iuyNmbSDwJcewqkCDGyO
         gvYA==
X-Gm-Message-State: ACgBeo3LFGndjqZfOCSelPhm1+uMShFu7gWpRkBh/blmGfaTf3N/AlkW
        74xvtowVBau37wTXQEMWBDaoNiyf0JUn89fMvTMVTA==
X-Google-Smtp-Source: AA6agR4gJIbhP+4ApJR2yhAwf3e1Odkz7EHU+179Wq7SwkPr/9kSVAUOmgosnJMFlpXFsd/QDaxBnLupLFuZc97eYn0=
X-Received: by 2002:a05:6402:2691:b0:43d:ba10:854b with SMTP id
 w17-20020a056402269100b0043dba10854bmr23759195edd.158.1661952757218; Wed, 31
 Aug 2022 06:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0j-54_OkXC7x3NSNaHhwJ+9umNgbpsrPxUB4dwewK63A@mail.gmail.com>
 <CACRpkda0+iy8H0YmyowSDn8RbYgnVbC1k+o5F67inXg4Qb934Q@mail.gmail.com>
 <CAK8P3a0uuJ_z8wmNmQTW_qPNqzz7XoxZdHgqbzmK+ydtjraeHg@mail.gmail.com>
 <CACRpkdb5ow4hD3td6agCuKWvuxptm5AV4rsCrcxNStNdXnBzrA@mail.gmail.com>
 <87f2ff4c-3426-201c-df86-2d06d3587a20@csgroup.eu> <CACRpkdYizQhiJXzXNHg7TXUVHzhkwXHFN5+e58kH4udGm1ziEA@mail.gmail.com>
 <f76dbc49-526f-6dc7-2ef1-558baea5848b@csgroup.eu> <CACRpkdZpwdP+1VitohznqRfhFGcLT2f+sQnmsRWwMBB3bobwAw@mail.gmail.com>
 <515364a9-33a1-fafa-fdce-dc7dbd5bb7fb@csgroup.eu> <CAK8P3a36qbRW8hd+1Uhi88kh+-KTjDMT-Zr8Jq9h_G3zQLfzgw@mail.gmail.com>
 <Yw3DKCuDoPkCaqxE@arcana.i.gnudd.com>
In-Reply-To: <Yw3DKCuDoPkCaqxE@arcana.i.gnudd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Aug 2022 15:32:25 +0200
Message-ID: <CACRpkdZeAAZYqV3ccd-X=ZwdnfSwRUdXchGETB-WTkgSZQL=Pw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
To:     Davide Ciminaghi <ciminaghi@gnudd.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Alexandre Courbot <gnurou@gmail.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>, Alessandro Rubini <rubini@gnudd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 30, 2022 at 9:58 AM Davide Ciminaghi <ciminaghi@gnudd.com> wrote:

> the sta2x11 was a chip containing AMBA peripherals and a PCIe to AMBA bridge
> (it is still in production as far as I know, but deprecated for new designs).
> It would typically be installed on x86 machines, so you needed to build and
> run AMBA drivers in an x86 environment. The original drivers we started from
> had platform data, but then we were told to switch to DTS.

For the record I think that was bad advice, I hope it wasn't me.
But the world was different back then I suppose.
Adding DTS to x86 which is inherently ACPI is not a good idea.
Especially if you look at how SBSA ACPI UARTS were done
in drivers/tty/serial/amba-pl011.c.

Today I think we would solve this by simply creating software nodes, which
are the same no matter if you're doing device tree or ACPI, so it would
have been much easier now, I think. :/

Yours,
Linus Walleij
