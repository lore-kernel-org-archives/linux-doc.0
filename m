Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAB1C3DA7D
	for <linux-doc@archiver.kernel.org>; Tue,  3 Jan 2023 23:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbjACXjp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Jan 2023 18:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234324AbjACXjm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jan 2023 18:39:42 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B14167C0
        for <linux-doc@vger.kernel.org>; Tue,  3 Jan 2023 15:39:34 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4a263c4ddbaso119532647b3.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Jan 2023 15:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJI36WUyX3/lg5q+41u1VLOHfo9VaH4c9Ww4np9pMVE=;
        b=C0Mv/9IL2kuCPPdWA8msop6QpZ3EpuOLH1kfR1zVpw/f4AUbyJBD+6G/iANVtk22ds
         hu5duuhrQjxm+1Kp4nKH6+kqp9XMhdkuQv3ErYIW7UH7XgBdnhBAn/M9ORQcscUmKxsQ
         YKQl+Y2WcFCcO/NKx0eYOqQf3MKFdo1QloKx5psY6iMcrO+/NTuvhAHB2hpKlW55yHXD
         ABIkQWJYkDINemtlyOBeLXVmwbXTOByw6YXnv1VfjGrBnOKwaFyEDMunh+tiQj/hgoat
         k9t1e0q1Cg4EIWuUG6Vuqs9jd9SCiXm/BoDYSI12xTkYfSTIxWWueNsZ1JVWJX5WEnWJ
         p9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJI36WUyX3/lg5q+41u1VLOHfo9VaH4c9Ww4np9pMVE=;
        b=zLN4SVDmR2di7hqHZV1cgCv1b6CfjfLWjKtuT/QCfu5LzM7gvTM1ia3qORiRVzNP65
         BuGMZyoFcDRb0tNLGVl8T2cMJSBoYh3CkiGIEiEcczAfMRBDW5lyLzb7tUA5527OAWqO
         3XTT2/859IphgQ3zjYd+SplRZDoLYORVyvMQp0qmTTN8docwGhN+CZ8zJQP1kYfAj3Lh
         iwSRAU9D4sHrFeNHxyK73d6GSUK3caX/AoLuvcPz9yi2INGSO3kGHjEHmV9ffkZRT9XG
         9bi/vhaTU3dgKNVoudXFbOulIIU0fcq8pNEegltWJQ+wDHISKlsVkksD8WuXQTFJbqPr
         Fb+g==
X-Gm-Message-State: AFqh2kq6p9txFTuWpnZ58KdBh31wrbsaT4pVrJXYESJFch3cgd+4um8U
        P2pEwCu063k9sG9qrUlKfJVWFgver3Cw49vXEtP6Dg==
X-Google-Smtp-Source: AMrXdXvx+mmANx48xLrOqbQThKhH6zIY5rRl2OxAt8bBN55Sv7hiEKHnG69rb1VP2Uv9FiN2mXvWkniEDvOJav50QZw=
X-Received: by 2002:a81:5c85:0:b0:461:49a3:db6a with SMTP id
 q127-20020a815c85000000b0046149a3db6amr3875030ywb.185.1672789174162; Tue, 03
 Jan 2023 15:39:34 -0800 (PST)
MIME-Version: 1.0
References: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230102210850.25320-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Jan 2023 00:39:22 +0100
Message-ID: <CACRpkdYw+J2cPfMrRtUC1KNLyWn__8Q3uk5j=WP_JN-Hm2AALg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: Remove unused and obsoleted gpio_export_link()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arch@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 2, 2023 at 10:08 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> gpio_export_link() is legacy and unused API, remove it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good riddance.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
