Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A55C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 25 Jan 2022 12:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381676AbiAYMO6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Jan 2022 07:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344235AbiAYMLC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jan 2022 07:11:02 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54DDC06175D
        for <linux-doc@vger.kernel.org>; Tue, 25 Jan 2022 04:10:43 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id p15so30317962ejc.7
        for <linux-doc@vger.kernel.org>; Tue, 25 Jan 2022 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2Or7EOuVFAWdSwKGqZnK74jkCaCCYypnTmbKSXvhDk=;
        b=eajOZBVMkXgp8q2tQR0NvldNEACMoGcRWQz4sT7LkkL+9fay1LIewB3BXBniT1+4Hu
         ug0e9p2E+cJk06nbOWX0ebHaL2ILYT7g6W5cFUUJXz6ljvHONM90lbkP30XLdVCo2FaH
         w4txMZT7RBKEV0TcXJKNKrKhm86rT48U48kbgCQEFb+Dl4MFzocH4kpd8ltCze9YwpfH
         Y7ERPmnb7JzqNrb7WkbfDUkvJTPcWD/Ve60ytDu3s9OK48R4jIv1waifH87y7MCFGfQ0
         Q2kNUB+8m1DkMuBtUu6gs0qt0fYs6RigpCoKBKj15UQsr1+Ka74QU//DnDgVFZ0X2hYz
         GOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2Or7EOuVFAWdSwKGqZnK74jkCaCCYypnTmbKSXvhDk=;
        b=yYRrGCDMj5EY1c5hNT4BE8SUiitH+uNRI8t4Jmi/XYB8Xau7an6kvJHS2mlCxsdJGR
         uaV+dCR83qfc3vs1QjhOKjxMA5G9c+3VAlQRPDI5XaHAsibgK0LesfAr0r6HIK9g090q
         0l5yV8jz8yk7YdDbNlkQK/7+b6gql1Na6cMJ0r8E1mWILcPrtykIPtLx38ILkwr7oJFa
         tlxK2r4ovVRh+mMZm4ul6jmctFSryB/YIsfUPrNpen8rZ2ih6cWySl+pWpkdwjAEmUbQ
         ZZy5aCssXr5gxFM/aOg/DoCuv5sCtxrNsiRXUtAfc/mKv88eEo6CHxg0Mt32uKwS9DJG
         1Ozg==
X-Gm-Message-State: AOAM531piY27UFws/BkxhrkIPko/Qa50YGoaKxUv/Wt+bxsm0kdTvmMh
        GU1r+hkEOtkCi7BPv0cyxgY4wVi+RNME50LfxR3Yog==
X-Google-Smtp-Source: ABdhPJzqhDBNaDbY3FnQwZiIXxBTm6b7O6lM49HJyRnPwcvicTcxqP1cxpduVqiYq5cznKXAtxAZuKhRsB1ImLIAQFs=
X-Received: by 2002:a17:907:3f84:: with SMTP id hr4mr16354442ejc.443.1643112642469;
 Tue, 25 Jan 2022 04:10:42 -0800 (PST)
MIME-Version: 1.0
References: <1643110372-85470-1-git-send-email-john.garry@huawei.com> <1643110372-85470-4-git-send-email-john.garry@huawei.com>
In-Reply-To: <1643110372-85470-4-git-send-email-john.garry@huawei.com>
From:   Jinpu Wang <jinpu.wang@ionos.com>
Date:   Tue, 25 Jan 2022 13:10:31 +0100
Message-ID: <CAMGffEmofF+yhT1Lt8jZp-06+GLXOmNo3SEdNg5VWX0TnzCrPA@mail.gmail.com>
Subject: Re: [PATCH 03/16] scsi: hisi_sas: Delete unused I_T_NEXUS_RESET_PHYUP_TIMEOUT
To:     John Garry <john.garry@huawei.com>
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        artur.paszkiewicz@intel.com, jinpu.wang@ionos.com,
        chenxiang66@hisilicon.com, Ajish.Koshy@microchip.com,
        yanaijie@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, liuqi115@huawei.com, Viswas.G@microchip.com,
        damien.lemoal@opensource.wdc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 25, 2022 at 12:38 PM John Garry <john.garry@huawei.com> wrote:
>
> There is no user, so delete it.
>
> Signed-off-by: John Garry <john.garry@huawei.com>
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
Thx!
> ---
>  drivers/scsi/hisi_sas/hisi_sas_main.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/scsi/hisi_sas/hisi_sas_main.c b/drivers/scsi/hisi_sas/hisi_sas_main.c
> index f014e458edbb..61414a308906 100644
> --- a/drivers/scsi/hisi_sas/hisi_sas_main.c
> +++ b/drivers/scsi/hisi_sas/hisi_sas_main.c
> @@ -1801,8 +1801,6 @@ static int hisi_sas_abort_task_set(struct domain_device *device, u8 *lun)
>         return rc;
>  }
>
> -#define I_T_NEXUS_RESET_PHYUP_TIMEOUT  (2 * HZ)
> -
>  static int hisi_sas_debug_I_T_nexus_reset(struct domain_device *device)
>  {
>         struct sas_phy *local_phy = sas_get_local_phy(device);
> --
> 2.26.2
>
