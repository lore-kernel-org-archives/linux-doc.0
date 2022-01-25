Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C462C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 25 Jan 2022 12:14:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbiAYMOn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Jan 2022 07:14:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444490AbiAYMKz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Jan 2022 07:10:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DC1C061748
        for <linux-doc@vger.kernel.org>; Tue, 25 Jan 2022 04:08:44 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ka4so30308458ejc.11
        for <linux-doc@vger.kernel.org>; Tue, 25 Jan 2022 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bnTeOdUZ1f18AewsYNZJ5wSThzHFTuycY7IVqVPOkq4=;
        b=ZvHEkk5xUxPuGXPnF5qSuvyzgrOJuihK9Y7jz5RAAisK5c7Llx+i3W5Cim8Es9HwKQ
         KeR7WV4260zLaoLr9S7z5ZjLj6L0PiqoTCS+AaxkLgx63ttkPdzm1qZaLEuVgTlw3SY4
         +TkggyDT1NjuTNf4ubfR+Hi77GRyFzO6PGoKcAAbp3bwQpcPov13FdXRmDc5er8IYhQa
         7U3WamVIW5u0uoCphTZzxwiCUsanHATz6flPKGpHH5M4fXs0DUYxoQ7soSiu2vbQLfyM
         xhM9OYRvxgwI0BwQeIl69WroDpTU3u+6NiYm6qikHVDqAKXPFdctOQQSZzIQINkai3md
         a7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnTeOdUZ1f18AewsYNZJ5wSThzHFTuycY7IVqVPOkq4=;
        b=STpVh0HffIrHBzAoba8xLpWRl0lUUHd/gTl82UtdQe4Iy2aEX+ItMTQbWr6OADmCLY
         ygh402f3e5lNMOnChNnU9qSLHIRDT193rywcK1pbknOqwG1E/9axwIl0foExeeIUa+rk
         x2G7GDnmEhAqRlQElHzrv4Nm8AkXGBiV7/5ZeltAFUzkuSuvyd4m5AygzOMItu/l7Gsr
         hmX+dyIiRk8pE+6WgJCkar5GWxBWoOfFiI1BsHWkILV42JVDi6psT7mklzehg9lxkA4v
         fE4tEwU9gPeqkGj+MCWz+nTUQxYMGfvLhaKEv72nC9VuRHhuSlk3pP3nblG5eiGz42Im
         IwNA==
X-Gm-Message-State: AOAM532ZFDKhxf4BtL+Bzz3Hx3nfY1T9KubcsUOWQcGVZK/6F9jHHHD/
        /hvul8aNvpeBkXllpMcaVLu3iyFzjfrHtX9v4NVZDg==
X-Google-Smtp-Source: ABdhPJz2+mIM5zA6wUdvIdNw7dCbU7p6GO73rgF0MZ2UBLSc7rUHX6MYpPx/oW8XBB/mbeH2j2BN4/3E3HfcMDU6OGs=
X-Received: by 2002:a17:907:3f84:: with SMTP id hr4mr16347608ejc.443.1643112522894;
 Tue, 25 Jan 2022 04:08:42 -0800 (PST)
MIME-Version: 1.0
References: <1643110372-85470-1-git-send-email-john.garry@huawei.com> <1643110372-85470-2-git-send-email-john.garry@huawei.com>
In-Reply-To: <1643110372-85470-2-git-send-email-john.garry@huawei.com>
From:   Jinpu Wang <jinpu.wang@ionos.com>
Date:   Tue, 25 Jan 2022 13:08:31 +0100
Message-ID: <CAMGffEn1mCb=EmspNnRw_H0es5ZfBWMrZj9G8J7y=_YH3PdF6Q@mail.gmail.com>
Subject: Re: [PATCH 01/16] scsi: libsas: Use enum for response frame DATAPRES field
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
> As defined in table 126 of the SAS spec 1.1, use an enum for the DATAPRES
> field, which makes reading the code easier.
>
> Signed-off-by: John Garry <john.garry@huawei.com>
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
Thx!
> ---
>  drivers/scsi/libsas/sas_task.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/libsas/sas_task.c b/drivers/scsi/libsas/sas_task.c
> index 2966ead1d421..7240fd22b154 100644
> --- a/drivers/scsi/libsas/sas_task.c
> +++ b/drivers/scsi/libsas/sas_task.c
> @@ -7,6 +7,12 @@
>  #include <scsi/sas.h>
>  #include <scsi/libsas.h>
>
> +enum {
> +       NO_DATA = 0,
> +       RESPONSE_DATA = 1,
> +       SENSE_DATA = 2,
> +};
> +
>  /* fill task_status_struct based on SSP response frame */
>  void sas_ssp_task_response(struct device *dev, struct sas_task *task,
>                            struct ssp_response_iu *iu)
> @@ -15,11 +21,11 @@ void sas_ssp_task_response(struct device *dev, struct sas_task *task,
>
>         tstat->resp = SAS_TASK_COMPLETE;
>
> -       if (iu->datapres == 0)
> +       if (iu->datapres == NO_DATA)
>                 tstat->stat = iu->status;
> -       else if (iu->datapres == 1)
> +       else if (iu->datapres == RESPONSE_DATA)
>                 tstat->stat = iu->resp_data[3];
> -       else if (iu->datapres == 2) {
> +       else if (iu->datapres == SENSE_DATA) {
>                 tstat->stat = SAS_SAM_STAT_CHECK_CONDITION;
>                 tstat->buf_valid_size =
>                         min_t(int, SAS_STATUS_BUF_SIZE,
> --
> 2.26.2
>
