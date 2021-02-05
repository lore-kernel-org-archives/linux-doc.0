Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D359FC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 13:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F46264FC2
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 13:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhBENvU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 08:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhBENtL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 08:49:11 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CC5C06178A
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 05:48:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id 7so7815980wrz.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 05:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5Gt7lm7HDFnKYf2RrWhjZE+siO4dcLCTKmn9MIyd28=;
        b=Jmz7cvf53TjCwGxQHJHpsHhluwKoKsW3viJc5Y8zvSIecn+748ZRpAoe5PqRxJZt8w
         rTgZsaEPI5cjxNaMnArIgWgcCM9mV0CGhOHtYEDUH4H4+I6hxx5D55dBd3//G2HTrYQW
         Xa5KuupgmPF17JaHIEkxdFpNkycMdf16pWqxm/1J//nluKu//pehprHvxiovF/43U1rt
         g+wdOM9fd+nBHCmJySychS2ArSgVi0HMAn5Q2J8WraMm0U/nI5Gzq837tdQ12dl9TCBj
         +5W12Zbl5nJ7K0kehzObfdw1gRKuH5RrThAfjxYPE29Ud1aUyMKRfZSEC/oi3x4Rg5m/
         YLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5Gt7lm7HDFnKYf2RrWhjZE+siO4dcLCTKmn9MIyd28=;
        b=m+RXTpp5RbJhdp+J5hTlh1nsPjgfNt8jhp+lxyCT8iNKlOCX/wAAU9bLnRkFa+dim6
         c6DZFJBVI3PbP/EArG29ZZibcwSV95JB/MkJmjeasVF+vdWkrhN9u5iwpbeTVa0x4oPU
         TTZVg3je1WQWiEWB5KzLY2kvvec+pmXuO7EFfHGyRRe5hRHOnjjryzPlNMCXzt/9uW0c
         9E1sp4Hhjg6xPm6mtH6o+inYXtualNcV3W0rLxUzOVt46yAivoVhMNpsZIcms1WNbG+W
         JfpxQ8qQnYg7K2Wpc23qpfRmMWv3Y/qoXIUeRSgIN/4OrK8hFHB3lPeBjJouAha9hldZ
         jkjg==
X-Gm-Message-State: AOAM532J9PZ2Hui51GgSZZ+N8YxwnF/ErynrKtwZeNZ2MGnr+KdOa7zC
        uYi7lWNHCXZADbbFEgupiPqzyxsB+tX73MKlZIjpBA==
X-Google-Smtp-Source: ABdhPJybgGA0dtqhlng9SXRL3K/UPqLnTkb5044cXBN2jjDhki4O2HFfSTqq5rK/3HB5ztEnaEpAz9V+KGafPMeIUtQ=
X-Received: by 2002:a5d:6685:: with SMTP id l5mr5068041wru.176.1612532888143;
 Fri, 05 Feb 2021 05:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20210202163842.134734-1-leo.yan@linaro.org> <20210202163842.134734-3-leo.yan@linaro.org>
 <3c0a0641-a375-c7c3-d72d-e1d626e60ad6@arm.com>
In-Reply-To: <3c0a0641-a375-c7c3-d72d-e1d626e60ad6@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 5 Feb 2021 13:47:57 +0000
Message-ID: <CAJ9a7Vh5UCyGPn7=psbTs_hMOPufkKLjqoRxw=z6XxB3SVnWtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] coresight: etm-perf: Support PID tracing for
 kernel at EL2
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Leo Yan <leo.yan@linaro.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Grant <al.grant@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2 Feb 2021 at 23:06, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 2/2/21 4:38 PM, Leo Yan wrote:
> > From: Suzuki K Poulose <suzuki.poulose@arm.com>
> >
> > When the kernel is running at EL2, the PID is stored in CONTEXTIDR_EL2.
> > So, tracing CONTEXTIDR_EL1 doesn't give us the pid of the process.
> > Thus we should trace the VMID with VMIDOPT set to trace CONTEXTIDR_EL2
> > instead of CONTEXTIDR_EL1.  Given that we have an existing config
> > option "contextid" and this will be useful for tracing virtual machines
> > (when we get to support virtualization).
> >
> > So instead, this patch extends option CTXTID with an extra bit
> > ETM_OPT_CTXTID2 (bit 15), thus on an EL2 kernel, we will have another
> > bit available for the perf tool: ETM_OPT_CTXTID is for kernel running in
> > EL1, ETM_OPT_CTXTID2 is used when kernel runs in EL2 with VHE enabled.
> >
> > The tool must be backward compatible for users, i.e, "contextid" today
> > traces PID and that should remain the same; for this purpose, the perf
> > tool is updated to automatically set corresponding bit for the
> > "contextid" config, therefore, the user doesn't have to bother which EL
> > the kernel is running.
> >
> >    i.e, perf record -e cs_etm/contextid/u --
> >
> > will always do the "pid" tracing, independent of the kernel EL.
> >
> > The driver parses the format "contextid", which traces CONTEXTIDR_EL1
> > for ETM_OPT_CTXTID (on EL1 kernel) and traces CONTEXTIDR_EL2 for
> > ETM_OPT_CTXTID2 (on EL2 kernel).
> >
> > Besides the enhancement for format "contexid", extra two formats are
> > introduced: "contextid1" and "contextid2".  This considers to support
> > tracing both CONTEXTIDR_EL1 and CONTEXTIDR_EL2 when the kernel is
> > running at EL2.  Finally, the PMU formats are defined as follow:
> >
> >    "contextid1": Available on both EL1 kernel and EL2 kernel.  When the
> >                  kernel is running at EL1, "contextid1" enables the PID
> >               tracing; when the kernel is running at EL2, this enables
> >               tracing the PID of guest applications.
> >
> >    "contextid2": Only usable when the kernel is running at EL2.  When
> >                  selected, enables PID tracing on EL2 kernel.
> >
> >    "contextid":  Will be an alias for the option that enables PID
> >                  tracing.  I.e,
> >                  contextid == contextid1, on EL1 kernel.
> >                  contextid == contextid2, on EL2 kernel.
> >
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Al Grant <al.grant@arm.com>
> > Cc: Mike Leach <mike.leach@linaro.org>
> > Cc: Leo Yan <leo.yan@linaro.org>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> You may add the following line here :
>
> [ Added two config formats: contextid1, contextid2 ]
>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
>
> The patch as such looks good to me.
>
> Suzuki

Reviewed-by: Mike Leach <mike.leach@linaro.org>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
