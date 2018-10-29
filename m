Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C32387D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 29 Oct 2018 10:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbeJ2TEN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 29 Oct 2018 15:04:13 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45138 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729613AbeJ2TEM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Oct 2018 15:04:12 -0400
Received: by mail-qt1-f193.google.com with SMTP id l9-v6so8453494qtj.12;
        Mon, 29 Oct 2018 03:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XpXxIG6RvfrJcmeHDk6dC/VEkNzaQidrxdFaPMKMV0=;
        b=I4vj2Xub5Q5Un4bI2t8yTgRZrGCRh9xO4IqL30AkyyFRQ6au2bMZ0mwh2ijRUiuO05
         HQoARWuj6nQFNvQDuumW1w6YNuUCi6uFBWC27CJdliYFBBGMY+7Fm+A9QYXtSDb5sOz0
         HZwAJhZG1Kgi/uUmzD9GJ97xA4bvI9hvZhFq7EKjsfyPnT6ev/pf9tzY0Ez+T3lNL0zt
         MCqtvSfjom+m2y+0LhpacV0QucvbAG/poMQjqDLrMAKoYxwioDXhegHn4+R8xw/4rp1z
         2kt9vtIkusHHUnOLXntZXwSdjkGScX2IDRM+tD3x2jFXTHpfgM0ByAjlBTPTdcFjYMza
         o3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XpXxIG6RvfrJcmeHDk6dC/VEkNzaQidrxdFaPMKMV0=;
        b=BvKWCC5wMpstc2+DKN82V3B4Lwoclcd5Dswr3S9dOSdyB/FLzgAuU18dIIWgxCo3MH
         VfCHpKOcIpBNK0EmUZX1uBRIzqW3rMJHQ3+ZXKkI2jIwr95Ph5HTr0glYMzxn3hvoYj9
         B0P0Ij8Dq67feZp4iN/otmmKQFV3Ko6KVqtZSTK3KKS4e/CfSseIOJmm0WE7aHKP52Pd
         0uy6fW2egidOo49ac1mYu9NJUU+zeAqZjbKgxHRjcyb8VeuZVywmjo6zUoyBRVxaU1KJ
         7LbYXw1q52xJCTAw3+PNzorbI01tlbv7Q+IMmyi3HAbpR4iCqxAqtZUXDwwLJ5X9Rwrf
         Q0YQ==
X-Gm-Message-State: AGRZ1gKrcmFhgsytVQWW46mzXyDZ7ztAp+MRvZf3hdkwG6ygvyUVnRCZ
        Iy8wcrw59uDLsWMIhJOUUX2IU9wCdnImAR0w8Ks=
X-Google-Smtp-Source: AJdET5egLiFmmHoRTIWCABhRELgj61D9ZxCYemS7kxJfkREnqTBQFxljnVBv5ZJIO04AtB5LSDq5EFoKOqMOX/1ZKnU=
X-Received: by 2002:aed:3e56:: with SMTP id m22-v6mr2858113qtf.99.1540808171280;
 Mon, 29 Oct 2018 03:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1540812743-1825-1-git-send-email-peng.hao2@zte.com.cn>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Oct 2018 12:15:59 +0200
Message-ID: <CAHp75Ve19dcQ3FtRa4BS_Y381g9TDvb2G-M8BNegFuUWA6wzAQ@mail.gmail.com>
Subject: Re: [PATCH V3 1/5] pvpanic: move pvpanic to misc as common driver
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

On Mon, Oct 29, 2018 at 5:22 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> move pvpanic.c from drivers/platform/x86 to drivers/misc.
> following patches will use pvpanic device in arm64.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/Kconfig           |   7 +++
>  drivers/misc/Makefile          |   1 +
>  drivers/misc/pvpanic.c         | 124 +++++++++++++++++++++++++++++++++++++++++
>  drivers/platform/Kconfig       |   3 +
>  drivers/platform/Makefile      |   1 +
>  drivers/platform/x86/Kconfig   |   8 ---
>  drivers/platform/x86/Makefile  |   1 -
>  drivers/platform/x86/pvpanic.c | 124 -----------------------------------------

As I mentioned you better to use -C -M.
This is currently a bit hard to review.

-- 
With Best Regards,
Andy Shevchenko
