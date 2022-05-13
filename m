Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37498C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 13 May 2022 20:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384588AbiEMUzB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 May 2022 16:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384596AbiEMUzA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 May 2022 16:55:00 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B9A2FFF3
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 13:54:58 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2ec42eae76bso102080527b3.10
        for <linux-doc@vger.kernel.org>; Fri, 13 May 2022 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdknKTFAjuVV6cG3pEPQnMSdfNEMapIBJ9sGtA9Y09c=;
        b=xmMXBU3NmkyVtivyV63dP3bIvtMkreg3G2vlBW6VC6qDJftpmGZXb7rWsbSDpzwnbO
         soAf29nXLOaF4fnFpp0VKJ9Q/HJxJkgEfDnG/rcA7YSj5tJN3c/On8k+vdx5e16qGp+I
         Zn04CLtil4jLFL2MKQePF+OMCd4s3gl/O6i5GgHj7vP4YFxbzBKELPCKAtXGH71AbPdz
         EBSLGJl1PYdI304Gdwa2ruEvjYy/jZMpZjktq0WgI+RTyY0FGhDPwt9NDO/VT4xleHzS
         ymzu9R2WwIGGQxE1vO8YJ3I183gySCovNtEw2YJSZTavWsLdKsm3ik6/05PDHbo/5ltW
         javA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdknKTFAjuVV6cG3pEPQnMSdfNEMapIBJ9sGtA9Y09c=;
        b=UfYGvgXfr6VNnRpx3cvzsGrJLOw5Iqg5uqgFFoEatkQTmSjz30bVnnyxYA4aRPIxNG
         pxHW+JYosIjG5q8KPMm2QO1cRkAcJotPC3LHNSpKM2K78u9Dmkq5iN4VkIiJUUKFwu2Q
         giMjTV+LwgQRaZx6U/Ct7CJFH321I2qtlKyPW6d2xWsbwK90egZHXTHBEMi4EtGr/YLd
         N0C4+7mS4pG44Q19dYNtUHsPSW+oc6vRiiTjPrt2/6OYscGF/P6oa4jOQbEtqepfMBMd
         MXmoeB6uJhiS5kS3BsrN+8NWSpSbLR/XNnkrlj4sMIHGKsmipuQ635kXasPmQFh6FAyU
         NEOA==
X-Gm-Message-State: AOAM531b8C5LxDdyeTL7LGDZo6eR+X/YqRjO5FhCkOr7ZomvFjnLZYe9
        CqON8OLfVObOUxf1tHTiokA4juBRUc7f3IAwcQZDmeJcqaAWYA==
X-Google-Smtp-Source: ABdhPJxPYfUJI+pU2KSqKyur2vWFLJAP5xoEG54qiHUWnn0lt/PmPx08z9HTjGpaf9iKB/bRclMaMq2/qf0xUEiybCM=
X-Received: by 2002:a0d:e5c6:0:b0:2f8:c866:7af9 with SMTP id
 o189-20020a0de5c6000000b002f8c8667af9mr8074972ywe.268.1652475297420; Fri, 13
 May 2022 13:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220512173921.8210-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:54:46 +0200
Message-ID: <CACRpkdZ50rd7dvZmsx5jTgkVKWHbx_Tsx9W-YY+mAO9RE3RfMw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] Documentation: gpio: Fix IRQ mask and unmask examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022 at 7:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> After switching to immutable IRQ chips for GPIO drivers the examples become
> uncompilable due to wrong IRQ API, i.e. irq_desc_get_handler_data() in use.
> Replace it with proper irq_data_get_irq_chip_data() call where it applies.
>
> Fixes: 5644b66a9c63 ("Documentation: Update the recommended pattern for GPIO irqchips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
