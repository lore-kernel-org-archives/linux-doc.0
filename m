Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1760C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 14:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C10664F0A
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 14:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbhCDOrQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 09:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbhCDOrO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 09:47:14 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200B0C061756
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 06:46:34 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id e10so27698045wro.12
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oPjdoY3IchTxSeEVo8a3bj2scxE+31WbW/AYcYPh3QM=;
        b=rWuP9MybS+aGNANpU21WEPXzBZdbNfgJBQDKLXXyKxTGG0Cz8tNdUtYfvz/OuVuCCl
         CVRGV6hVWxzz6SfQEDifFlLbj/P1hl9an9J4kSJltsh4DorFGVan0EEMGGno5Dmodz1f
         UZt9qqcvs5WUHgMo3cQ8XeiSyLubYIX3riytWVynvcAsOrh11nthtYMtVtvbj1MQA9sN
         tkCW8To5JT3qdfBrBI5MaGPMrFKSURAXdeXkbcO8uqO7qi6spY2caiScQ3iQZY6Y9SVg
         nUZPgSvgt61iAxNbamg3s3Mwr2sR7jAgu+V3pID6X+DSXpgwj5jgDQAQUUXuaLIIk8X9
         GbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oPjdoY3IchTxSeEVo8a3bj2scxE+31WbW/AYcYPh3QM=;
        b=Bdl1c1Qj3xoMIvG+18CJh3Cqw9kSpAQeoC5asuSI9K1CewSLn+OB//fFhft9iVtUtk
         BJfyRWG1ext5bcA+k9V00S6eni5m0AUMYjt/MkFiB1UrAQ+TAdZynjYUSmX9ujMjRVim
         bsaOlacLfdV6E2CDpa0VfA+L4Woy6EWunGPE/tMnGcgzFmwYD4vd3XQ9qRLKk4Uki8dj
         X3Klru6FL+XaYbZVQqoAS1YT/jPPEk9IQVI98bnKOvvB4R5dNvkbW2X2e+nkaJ9IbNFn
         HzxdQnuwpX4CxymZOTfP3S7gbfgQlFOnT3YOhmdS3/V4nE96gq556+em70SJfWaZiHTu
         BvVw==
X-Gm-Message-State: AOAM5328NuawSYtDW+anjCumP/RGwHbEC23ZAjdt+lWJbT6T3RZIqpkE
        B7ABBpUAn/VN7FN7Yg+/tPsCVxtgefQSo6b5scLpTOfPoYA=
X-Google-Smtp-Source: ABdhPJxMrhGvW7HaiafS+5gzz8xlNld8dYnSjUSYnfDHMPCyjqWwP0NmkfwcNhxBxz2381/J9tn7v+J/rwg60YsUCu8=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr4392324wrq.39.1614869192777;
 Thu, 04 Mar 2021 06:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20210128170936.9222-1-mike.leach@linaro.org> <20210128170936.9222-5-mike.leach@linaro.org>
 <641a0d20-bf3d-24e2-8402-d99de9117584@arm.com> <CAJ9a7Vi5dTJTNRNC36UEwAeCayd_HF9jN8rXSggRF_4cPZ1NrA@mail.gmail.com>
 <921225a2-14a8-2a4f-4726-f61224cafa28@arm.com>
In-Reply-To: <921225a2-14a8-2a4f-4726-f61224cafa28@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 4 Mar 2021 14:46:22 +0000
Message-ID: <CAJ9a7VhWqkDeSWeZnGi2JdrYv-d8=R6He_zfd+L3Za3WoPRXOg@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] coresight: etm-perf: update to handle
 configuration selection
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Yabin Cui <yabinc@google.com>,
        Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi

On Thu, 4 Mar 2021 at 14:25, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 3/4/21 2:19 PM, Mike Leach wrote:
> > Hi Suzuki,
> >
> > On Thu, 4 Mar 2021 at 12:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >>
> >> On 1/28/21 5:09 PM, Mike Leach wrote:
> >>> Loaded coresight configurations are registered in the cs_etm\cs_config sub
> >>> directory. This extends the etm-perf code to handle these registrations,
> >>> and the cs_syscfg driver to perform the registration on load.
> >>>
> >>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> >>> ---
> >>>    .../hwtracing/coresight/coresight-config.h    |   5 +-
> >>>    .../hwtracing/coresight/coresight-etm-perf.c  | 164 +++++++++++++++---
> >>>    .../hwtracing/coresight/coresight-etm-perf.h  |   8 +
> >>>    .../hwtracing/coresight/coresight-syscfg.c    |  13 +-
> >>>    4 files changed, 166 insertions(+), 24 deletions(-)
> >>>
>
>
> >>> +static ssize_t etm_perf_cscfg_event_show(struct device *dev,
> >>> +                                      struct device_attribute *dattr,
> >>> +                                      char *buf)
> >>> +{
> >>> +     struct dev_ext_attribute *ea;
> >>> +
> >>> +     ea = container_of(dattr, struct dev_ext_attribute, attr);
> >>> +     return scnprintf(buf, PAGE_SIZE, "%s\n", (const char *)(ea->var));
> >>> +}
> >>
> >> "configid=0x%lx", (unsigned long)ea->var ?
> >>
> >
> > ea->var _is_ "configid=0x%lx" due to the way perf handles the events
> > sub-dir entries.
> >
>
> This must be combined with the suggestion below.
>
> >>> +
> >>> +static int etm_perf_add_cscfg_event(struct device *dev, struct cscfg_config_desc *cs_cfg)
> >>> +{
> >>> +     struct dev_ext_attribute *ea;
> >>> +     unsigned long hash;
> >>> +     int ret;
> >>> +     struct device *pmu_dev = etm_pmu.dev;
> >>> +
> >>> +     ea = devm_kzalloc(dev, sizeof(*ea), GFP_KERNEL);
> >>> +     if (!ea)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     hash = (unsigned long)cs_cfg->id_ea->var;
> >>> +
> >>> +     sysfs_attr_init(&ea->attr.attr);
> >>> +     ea->attr.attr.name = devm_kstrdup(dev, cs_cfg->name, GFP_KERNEL);
> >>> +     if (!ea->attr.attr.name)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     /*
> >>> +      * attribute value is "configid=<hash>".
> >>> +      * this will be what perf evaluates when the config name is used
> >>> +      * on the command line.
> >>> +      */
> >>> +     ea->var = devm_kzalloc(dev, CSCFG_EVENT_STR_SIZE, GFP_KERNEL);
> >>> +     if (!ea->var)
> >>> +             return -ENOMEM;
> >>
> >> Could we drop this string and use the "hash" instead ?
> >>
> >
> > No. My understanding is that we have added an events directory to
> > cs_etm, and add the configurations in there:-
> >
> > cs_etm/events/autofdo
> >
> > Now the contents of autofdo are "configid=0x<hash-value>" - where
> > hash-value is the hash of "autofdo".
> >
> > On the perf command line:-
> >
> > perf record -e cs_etm/autofdo/ .....
> >
> > will result in perf parsing autofdo, looking in the events dir for
> > cs_etm, seeing the configid=-string, and parsing that to assign to
> > configid attribute - which we have allocated to config2:63:32 - this
> > will then appear as a value in the perf_event and we can load the
> > configuration when starting up the event on the ETM etc.
>
> Sorry, I was not explicit in my comments. You could drop the string and
> have ea->var = hash. And the _show() could simply do
>
> "configid=0x%lx" , hash
>
> as mentioned above.
>
> That would avoid another string allocation, with the same interface.
>

OK, that makes sense.

Mike

> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
