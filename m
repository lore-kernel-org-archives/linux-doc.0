Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE89C71143
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 13:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352741AbjHRNCZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 09:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376282AbjHRNCB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 09:02:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CF53AA3
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 06:01:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26d60e6fe19so39264a91.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 06:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692363718; x=1692968518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BySwfAMVjboFh8pZFCMwcMlGJBJzCKRbS2oWZM0joZE=;
        b=Pn/hi7bXB7JScRUFYmvRcjDaWf6xmyoXJqvMyARjFSREKrPUOxyBBRO55ooNU7bxZS
         af4QMoJrJcOrEw8HllIdpPYtAq36RWzfWZW6+O4dlZ0X8LVu1sX99619SOyGgzZPyFr/
         MRUnTdkHgT9y8hinYIyhaqdL0rFO2c9Hxg7w+nQlsLWj+/zq1j9kJ8ZsL+CybU2HfdNp
         9cjd/p09tM0P6RDo+Qo4eMvWwEXlcGXvCud/74TNkhytszvmz4EBHTXcm1hLTonTUaLn
         ywyDnXMyDgz+UJLKhZL5dYsQRKxVVP6Ow1mDCzz2BjJlIVbIS9yV0S/naj9CpOzaPfgN
         jEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692363718; x=1692968518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BySwfAMVjboFh8pZFCMwcMlGJBJzCKRbS2oWZM0joZE=;
        b=cjaMNr55C8uv3ppuTJ5lfP4Agc4hkgmocVeny/NulCZ/pTIJic1gGL2h+cPEtxtSdM
         I0aRMwENVDJh1QcpTQxZmaWASaEZVL4JRLCJGFLjnYC4lKGz+XRgDM9MqHB6DvlFU/Nk
         HHQSsc/7rf0XFIW9kfUkqTByYMSByhpEjIBIFpB23mW2j4i6c9UcbW9Vx+mYs2En+kNu
         dA2V+5kE4NG9/1SxcbG2uoJZii3u/018sJJyReNPCpyD4BXyORHZX96Au0hsANvDh9z3
         DlQO9Gb30AEpYf3NURBnJjvrKW58kCRH3wYAHD7uZ00D8Bc1j+nk75eadCvmEbp/7WX4
         Hv6w==
X-Gm-Message-State: AOJu0YxPeoio8sE//iShbXgPog8uA8tghIJvSmaUhILOvbHauKRGefRM
        m9SA8BuqudZq5XMmQgjomLLEt3vgXiRZyyJq3bGS2XrZzfgBUhNdhj8=
X-Google-Smtp-Source: AGHT+IEDNjK2QatzguViUwgMz7IkK5RyW5TS+GQ4/9gxgRmnanM3FvD09fmimpG9ksgjAW6l+o/3kMdMlVNGhAR3l8Y=
X-Received: by 2002:a17:90b:3715:b0:269:2195:c322 with SMTP id
 mg21-20020a17090b371500b002692195c322mr2303017pjb.41.1692363718296; Fri, 18
 Aug 2023 06:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230818112051.594986-1-anshuman.khandual@arm.com>
 <20230818112051.594986-3-anshuman.khandual@arm.com> <75147373-d5f0-b9cc-cdf8-15b5093fb8e2@arm.com>
In-Reply-To: <75147373-d5f0-b9cc-cdf8-15b5093fb8e2@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 18 Aug 2023 14:01:46 +0100
Message-ID: <CAJ9a7Vhg+OznPN_wfVFXgJ9Zx2Y1bCOJZEXpuXK-Ot0JertYyw@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] coresight: etm: Make cycle count threshold user configurable
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        James Clark <james.clark@arm.com>,
        Leo Yan <leo.yan@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Aug 2023 at 12:25, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 18/08/2023 12:20, Anshuman Khandual wrote:
> > Cycle counting is enabled, when requested and supported but with a default
> > threshold value ETM_CYC_THRESHOLD_DEFAULT i.e 0x100 getting into TRCCCCTLR,
> > representing the minimum interval between cycle count trace packets.
> >
> > This makes cycle threshold user configurable, from the user space via perf
> > event attributes. Although it falls back using ETM_CYC_THRESHOLD_DEFAULT,
> > in case no explicit request. As expected it creates a sysfs file as well.
> >
> > /sys/bus/event_source/devices/cs_etm/format/cc_threshold
> >
> > New 'cc_threshold' uses 'event->attr.config3' as no more space is available
> > in 'event->attr.config1' or 'event->attr.config2'.
> >
> > Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Cc: Mike Leach <mike.leach@linaro.org>
> > Cc: James Clark <james.clark@arm.com>
> > Cc: Leo Yan <leo.yan@linaro.org>
> > Cc: coresight@lists.linaro.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Reviewed-by: Mike Leach <mike.leach@linaro.org>
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm-perf.c   |  2 ++
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 12 ++++++++++--
> >   2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > index 5ca6278baff4..09f75dffae60 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -68,6 +68,7 @@ PMU_FORMAT_ATTR(preset,             "config:0-3");
> >   PMU_FORMAT_ATTR(sinkid,             "config2:0-31");
> >   /* config ID - set if a system configuration is selected */
> >   PMU_FORMAT_ATTR(configid,   "config2:32-63");
> > +PMU_FORMAT_ATTR(cc_threshold,        "config3:0-11");
> >
> >
> >   /*
> > @@ -101,6 +102,7 @@ static struct attribute *etm_config_formats_attr[] = {
> >       &format_attr_preset.attr,
> >       &format_attr_configid.attr,
> >       &format_attr_branch_broadcast.attr,
> > +     &format_attr_cc_threshold.attr,
> >       NULL,
> >   };
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 591fab73ee79..3193dafa7618 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -635,7 +635,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >       struct etmv4_config *config = &drvdata->config;
> >       struct perf_event_attr *attr = &event->attr;
> >       unsigned long cfg_hash;
> > -     int preset;
> > +     int preset, cc_threshold;
> >
> >       /* Clear configuration from previous run */
> >       memset(config, 0, sizeof(struct etmv4_config));
> > @@ -658,7 +658,15 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
> >       if (attr->config & BIT(ETM_OPT_CYCACC)) {
> >               config->cfg |= TRCCONFIGR_CCI;
> >               /* TRM: Must program this for cycacc to work */
> > -             config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
> > +             cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
> > +             if (cc_threshold) {
> > +                     if (cc_threshold < drvdata->ccitmin)
> > +                             config->ccctlr = drvdata->ccitmin;
> > +                     else
> > +                             config->ccctlr = cc_threshold;
> > +             } else {
> > +                     config->ccctlr = ETM_CYC_THRESHOLD_DEFAULT;
>
> Ideally this must be the ccitmin ? Theoretically, default value could be
> bigger than the minimum value supported by the implementation (i.e.,
> ccitmin)
>
> Suzuki
>

In order not to change existing behaviour unexpectedly this could be
re-ordered...

cc_threshold = attr->config3 & ETM_CYC_THRESHOLD_MASK;
if (!cc_threshold)
         cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
if (cc_threshold < drvdata->ccitmin)
         cc_threshold = drvdata->ccitmin
config->ccctlr = cc_threshold;

Mike
> > +             }
> >       }
> >       if (attr->config & BIT(ETM_OPT_TS)) {
> >               /*
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
