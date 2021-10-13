Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37541C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 13 Oct 2021 07:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DF6C6109F
	for <linux-doc@archiver.kernel.org>; Wed, 13 Oct 2021 07:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238364AbhJMHMM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Oct 2021 03:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbhJMHMH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Oct 2021 03:12:07 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9903CC06174E
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:10:04 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n8so7466202lfk.6
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogqZy3TAy6+qEHHl5cPKz54lxH4LD6O0Wc/FhOwWDsM=;
        b=CzXcO5tKFJUXWn4Q/+y2U8lDHv+2ksgjTxS0YhMwS18A8SagcBSfSzyDxu8luezXnR
         f4HGyqKMJiunW2SOGnVjO8Y0MFVpRzZzUCIAzdKgemhd6cKMaiQnwBCtSX0irmCCVbyO
         MJK4FWv3Qt1anRb3JTqnJRyK6gJX9w+J3CN+a8X6KXThrRONCAJ255acu5EYgxin2tYR
         U9CbjHag6jGRHfb32SZ4+lk/vaV3N/ckSvHWy/FSNnMy/Iu40zCE/0tx3rhBfIFLN6Xs
         lkdx1XMDPj3veTwSq4hmxx18NFewaTa10VxfikTAhZJts+0vU2XrZBlxBig3eB7U3nnu
         6iNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogqZy3TAy6+qEHHl5cPKz54lxH4LD6O0Wc/FhOwWDsM=;
        b=q9Kk1d2a1kNQtaXI0m8m0bFnA2t4nqJhTt0/juqaDOJGthBDjJEL74LeqnT0DJnmi4
         GU7ZpQG/T9I16+zsGiY6DvvTiHOX4RgKRJvFQXxmDyvv3IkApytkjtig4IUmqyPgfqDW
         nQP41nObEVvj9rCigjL9eUqkc34S3/cPhbb4Vecz/BTNhRZ/+uikfU+J6dQ0p/qEVNsN
         QPjer42MTE7B3xoY3E6rPKOJUZjc7+JgZ05ARA40DK6+UIvjRa11+Hn0k6rOzqb/resy
         189G9I8puNni8u77xGZPnAJReLpINr1Inzq/lVk2Itv3QXaWj4P3+6ciqi+TbqDNLudh
         3rKA==
X-Gm-Message-State: AOAM532B8iUN9+XFe0cEC/vwnuWvItMQEWZ20ibPWYtfeIBA0bKB7VO/
        iI+Adyc26iQ9Wzs0RUGT5mXoDhVa+LWo1TOaU0o8NQ==
X-Google-Smtp-Source: ABdhPJzvXXAHtBA7ebI/i+rhF0WnBhxKgLdOphK36gqOInuyLSlVAJfRZbbODuQKKsAd+la0o9tvW3AmYpYVWwgjsOs=
X-Received: by 2002:a2e:bd0b:: with SMTP id n11mr33501152ljq.71.1634109002881;
 Wed, 13 Oct 2021 00:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211006071546.2540920-1-jens.wiklander@linaro.org> <20211006071546.2540920-5-jens.wiklander@linaro.org>
In-Reply-To: <20211006071546.2540920-5-jens.wiklander@linaro.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 13 Oct 2021 12:39:51 +0530
Message-ID: <CAFA6WYOZ4Ux4XvMa_tZgR+mZbuNb0ypABvyUeMKc1ngAYR8zVA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] tee: export teedev_open() and teedev_close_context()
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
        Devicetree List <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Oct 2021 at 12:46, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Exports the two functions teedev_open() and teedev_close_context() in
> order to make it easier to create a driver internal struct tee_context.
>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c  |  6 ++++--
>  include/linux/tee_drv.h | 14 ++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 85102d12d716..3fc426dad2df 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -43,7 +43,7 @@ static DEFINE_SPINLOCK(driver_lock);
>  static struct class *tee_class;
>  static dev_t tee_devt;
>
> -static struct tee_context *teedev_open(struct tee_device *teedev)
> +struct tee_context *teedev_open(struct tee_device *teedev)
>  {
>         int rc;
>         struct tee_context *ctx;
> @@ -70,6 +70,7 @@ static struct tee_context *teedev_open(struct tee_device *teedev)
>         return ERR_PTR(rc);
>
>  }
> +EXPORT_SYMBOL_GPL(teedev_open);
>
>  void teedev_ctx_get(struct tee_context *ctx)
>  {
> @@ -96,13 +97,14 @@ void teedev_ctx_put(struct tee_context *ctx)
>         kref_put(&ctx->refcount, teedev_ctx_release);
>  }
>
> -static void teedev_close_context(struct tee_context *ctx)
> +void teedev_close_context(struct tee_context *ctx)
>  {
>         struct tee_device *teedev = ctx->teedev;
>
>         teedev_ctx_put(ctx);
>         tee_device_put(teedev);
>  }
> +EXPORT_SYMBOL_GPL(teedev_close_context);
>
>  static int tee_open(struct inode *inode, struct file *filp)
>  {
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index 3ebfea0781f1..26f42c4cd7a1 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -582,4 +582,18 @@ struct tee_client_driver {
>  #define to_tee_client_driver(d) \
>                 container_of(d, struct tee_client_driver, driver)
>
> +/**
> + * teedev_open() - Open a struct tee_device
> + * @teedev:    Device to open
> + *
> + * @return a pointer to struct tee_context on success or an ERR_PTR on failure.
> + */
> +struct tee_context *teedev_open(struct tee_device *teedev);
> +
> +/**
> + * teedev_close_context() - closes a struct tee_context
> + * @ctx:       The struct tee_context to close
> + */
> +void teedev_close_context(struct tee_context *ctx);
> +
>  #endif /*__TEE_DRV_H*/
> --
> 2.31.1
>
