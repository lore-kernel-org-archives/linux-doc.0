Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5269C05052
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 16:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjHHQ7g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbjHHQ6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 12:58:15 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AFB4C2C
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 08:42:22 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-585fd99ed8bso97441697b3.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Aug 2023 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509322; x=1692114122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jUmsLzGlT/3ajSSxcA4F7f9F7ELiIgL969vcB3E0/EU=;
        b=KAfG9qY5FVOUcpQR8u+RmRDomII7JkUhq3r4OerbVvxJSRLWF/A6Ki6GA2oJJHZiLt
         iWY30cDldAunr3wfPsltcxRpYjDaaq9yrztjdMjcItpTQi3F+OfAk2xcCAW+4lp3Pc+4
         vdDMcfQU1ieeeov1US1FPxBpsrSMcchTOdops+qhuRQwxWrKsv1R2wirR3VF3GrF5bOb
         AruWGf5aeMpk9hQ9cFhS2Em1CjLrjiW/4RVtipIPi2p/P6cuItlYTHgVh66vJ3Ou8OPa
         fJyv8vtjwiuqULFNq95eyUAcvbItPBwb8ZUQh963OkVRkpLaAaySQJONbCcwoUf9DjNe
         71Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509322; x=1692114122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUmsLzGlT/3ajSSxcA4F7f9F7ELiIgL969vcB3E0/EU=;
        b=a1FoHprwCSIxo71P9mFCdAvBHRHukAqmlyUojZAhwK3b8MMFROxTJFZEdJRzrFsiRq
         E41A4Kxs9Z4sIk9qAJA3J52mkw7IHMiOW8C/pTJdP/N479QBHc0iwcXdpAdOMM8lngLi
         XibDKDSfUlI/mKw7s7jwLjQb8O4YZYVTQ8CoN540lkBI0RJfA1Rk/vedvP6ovIaqPvo2
         OFt6bYv7hHDCamFqbaMCkcRbkVPsIFL7uJfyGBBoDeWV93zqWT2QpguYNiq9TTY0dSVe
         NqatPRSDUfroRc/uI1dOzxMtUZ1kaJtopeYXqL5Z4uTu0DPlMrk6tz12PkQwf8JYKHz4
         63Ow==
X-Gm-Message-State: AOJu0YzgNb38N/Whlg5mOfptAxX23mjoh4VUB5EfFz2cNsZNM98KySJI
        dZ4ra+zvRGPyvs14jX30warkTNu9h6AYS75L0IDkFgyeNdoPUeufUSg=
X-Google-Smtp-Source: AGHT+IFdh3n0Z+Nb2sYnL4rKbZf1o/9zxM/XYPxxA8QKFr+qWALfdNbRf73dZ8pKAo+LLZDyLigVO5A5FbAEFvDYU34=
X-Received: by 2002:a17:90a:940e:b0:268:266a:1ab with SMTP id
 r14-20020a17090a940e00b00268266a01abmr11695191pjo.5.1691489964555; Tue, 08
 Aug 2023 03:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230808074533.380537-1-anshuman.khandual@arm.com>
In-Reply-To: <20230808074533.380537-1-anshuman.khandual@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 8 Aug 2023 11:19:13 +0100
Message-ID: <CAJ9a7Vgs6nP+KEPhjuj4BtWRZrRt-byz1xsa-JRzk3cFGJ+d8w@mail.gmail.com>
Subject: Re: [PATCH] coresight: etm: Make cycle count threshold user configurable
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, Al.Grant@arm.com,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Anshuman

On Tue, 8 Aug 2023 at 08:45, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> Cycle counting is enabled, when requested and supported but with a default
> threshold value ETM_CYC_THRESHOLD_DEFAULT i.e 0x100 getting into TRCCCCTLR,
> representing the minimum interval between cycle count trace packets.
>
> This makes cycle threshold user configurable, from the user space via perf
> event attributes. Although it falls back using ETM_CYC_THRESHOLD_DEFAULT,
> in case no explicit request. As expected it creates a sysfs file as well.
>
> /sys/bus/event_source/devices/cs_etm/format/cc_threshold
>
> New 'cc_threshold' uses 'event->attr.config3' as no more space is available
> in 'event->attr.config1' or 'event->attr.config2'.
>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V2:
>

Please ensure that the e-mail title reflects the "v2" nature of this.
e.g. [PATCH v2] ....


> - s/treshhold/threshhold
>
> Changes in V1:
>
> https://lore.kernel.org/all/20230804044720.1478900-1-anshuman.khandual@arm.com/
>
>  Documentation/trace/coresight/coresight.rst        |  2 ++
>  drivers/hwtracing/coresight/coresight-etm-perf.c   |  2 ++
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++--
>  3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> index 4a71ea6cb390..a698b07206b5 100644
> --- a/Documentation/trace/coresight/coresight.rst
> +++ b/Documentation/trace/coresight/coresight.rst
> @@ -624,6 +624,8 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
>     * - timestamp
>       - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
>         <coresight-timestamp>`
> +   * - cc_threshold
> +     - Cycle count threshold value
>
>  How to use the STM module
>  -------------------------

The doc elements here need to be in a separate patch in the set and
additionally sent to doc list and maintainer
(linux-doc@vger.kernel.org and corbet@lwn.net) to be picked up.

> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 5ca6278baff4..09f75dffae60 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -68,6 +68,7 @@ PMU_FORMAT_ATTR(preset,               "config:0-3");
>  PMU_FORMAT_ATTR(sinkid,                "config2:0-31");
>  /* config ID - set if a system configuration is selected */
>  PMU_FORMAT_ATTR(configid,      "config2:32-63");
> +PMU_FORMAT_ATTR(cc_threshold,  "config3:0-11");
>
>
>  /*
> @@ -101,6 +102,7 @@ static struct attribute *etm_config_formats_attr[] = {
>         &format_attr_preset.attr,
>         &format_attr_configid.attr,
>         &format_attr_branch_broadcast.attr,
> +       &format_attr_cc_threshold.attr,
>         NULL,
>  };
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 9d186af81ea0..a353c0784bab 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -644,7 +644,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         struct etmv4_config *config = &drvdata->config;
>         struct perf_event_attr *attr = &event->attr;
>         unsigned long cfg_hash;
> -       int preset;
> +       int preset, cc_threshold;
>
>         /* Clear configuration from previous run */
>         memset(config, 0, sizeof(struct etmv4_config));
> @@ -667,7 +667,15 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>         if (attr->config & BIT(ETM_OPT_CYCACC)) {
>                 config->cfg |= TRCCONFIGR_CCI;
>                 /* TRM: Must program this for cycacc to work */
> -               config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
> +               cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> +               if (cc_threshold) {
> +                       if (cc_threshold < drvdata->ccitmin)
> +                               config->ccctlr = drvdata->ccitmin;
> +                       else
> +                               config->ccctlr = cc_threshold;
> +               } else {
> +                       config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
> +               }
>         }
>         if (attr->config & BIT(ETM_OPT_TS)) {
>                 /*
> --
> 2.25.1
>

As we are using ccitmin - which I think we must - then we need an
additional patch in the set that implements the errata workaround
mentioned by Al, when setting ccitmin in etm4_init_arch_data().
Perhaps a helper function called from there to read the ID reg unless
one of the errata cores in which case set to 0x4.

Regards

Mike


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
