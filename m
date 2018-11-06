Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A98467D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 10:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387624AbeKFT0v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 14:26:51 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37699 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387480AbeKFT0v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 14:26:51 -0500
Received: by mail-qk1-f195.google.com with SMTP id 131so18056532qkd.4;
        Tue, 06 Nov 2018 02:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rzkR19TRPPMVIHqr3bzW4tFWrW6lmag84rwz6NCkuFg=;
        b=fAKQyDvCK1erbFPl5bYvDmW7TLyePo/hltfz0DwaqhnIBBGH/NOpwtPT0042qH21Kx
         q+JcnxmiZxC6hCjLnpurSQuowpbxsNiee9kjvcmvjVyBZj5RHJ2jc9Sozb/EoKJVAmFT
         qtdcSLlVkqtwTUhCA468hUhQ8J+3N6OLFN7Vf/LWjMbxJJJwzU6BgWcw1C2iNUDc15+J
         XPAex8jlwFbVjf8cSISlFPxHV0a/kReDErUWtAlZurc7SWYLpxwCT5ZHu6iUbPK3/GM+
         c0aM0jmAk41ItuCSQ81eYb4DW0lSeygZIxvK0ybaQN4DL2bKFy71rqOdm+L6A6OqkXqU
         Wcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rzkR19TRPPMVIHqr3bzW4tFWrW6lmag84rwz6NCkuFg=;
        b=d2/5ZgrFEyJ6X3fHqCTXYjqNiTUK//G7dhTrBFBqNoMbqmALPJ9HhsppQhaObPpFHp
         sGjEQ3aOIprfUZN3ttgFwERZ+TNyY1x3l615INh1downfOyhdaUjI7/RXdKVs0QT9RcI
         +XLsa03XQUrB8kRBuODQ4bA2qo4nrJpN5+fBAmjOOEUQFdX16yDgq9qcqtOUreK2Uj9j
         IWquX8l+sP+hwUUFn1kXwlxM9IPnSrREvedEIZeBXLe6PYKZKKkLZi2ooqPCskqx5WJY
         cyLWSSA21gK6g8JvECV49n5k8VH2rqMFyw66UGyX13i4SNqu5Ea/IGX6xWxjOgx6S/1T
         7jOQ==
X-Gm-Message-State: AGRZ1gKMN5JEC/GNTjZucFO3OSV5akuxTA4LEn9/pEgfoA83BJtxF5IR
        +IIGgINVCIrzXrmz5eMlhc6VICA3jQ2/+cdH/Pc=
X-Google-Smtp-Source: AJdET5cYjS3EigcnsB4d2tsegquWt3nlk3g75gbL3XaV7z3RDC3CVCyYQQaid1SUuJP3Z7w2WMuLrwfbClgM3Ghz+GY=
X-Received: by 2002:a37:7983:: with SMTP id u125-v6mr22630766qkc.219.1541498543794;
 Tue, 06 Nov 2018 02:02:23 -0800 (PST)
MIME-Version: 1.0
References: <1541516242-98568-1-git-send-email-peng.hao2@zte.com.cn> <1541516242-98568-9-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1541516242-98568-9-git-send-email-peng.hao2@zte.com.cn>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 6 Nov 2018 12:02:12 +0200
Message-ID: <CAHp75Vd_Zs+DJrxNQ1r3YWhfxYpENZAENtnU+9Qi8mVvzSsCsg@mail.gmail.com>
Subject: Re: [PATCH V8 09/11] misc/pvpanic: change header file sort style
To:     peng.hao2@zte.com.cn
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        hutao@cn.fujitsu.com,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 6, 2018 at 8:47 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Make header files alphabetical order.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index 479f7ba..e365604 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -21,13 +21,13 @@
>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/acpi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/types.h>
> -#include <linux/acpi.h>
>
>  static void __iomem *base;
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
