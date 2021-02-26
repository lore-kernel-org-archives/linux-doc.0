Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35F6C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 20:13:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADDBB64F26
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 20:13:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhBZUM1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 15:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhBZUMF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 15:12:05 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6CEC0698D1
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 12:10:09 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w11so9723618wrr.10
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 12:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYHcnJh5U/6gVrGS5eDqixWkprjFpWIsSZ52nLUsrJc=;
        b=DSfMOLBxr80hV9v8h3EUvd/OLOFky0SJeRZdwhBnc36/ZpcPbQsu5d5PKODXq4bHIF
         QJdAYs0TDqk7dKTWHhHZa2YZgnRoL2P3vWK5eoR+rVuc7A/ys1fYWanQcSikr8Z2n7u4
         nQZEq8a2UwIPn2Gz4IAazI7WeFdCqjNzjWjO62WgIZCWfWU+VM5XJC1uwpQvabQGRuFv
         N+sJMaudVZtLvfyJWtZeeU+doAwBIb+ZwnP1AvfVgpbJNku6a0hLN4Tz4nMU/NWrHntN
         brqTKkRrR2dLtVIFdehSmuhnOMxDyAORHnDaPaWvXxAFjZ1rL000wgyeQidxbB8FT+m3
         985g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYHcnJh5U/6gVrGS5eDqixWkprjFpWIsSZ52nLUsrJc=;
        b=RXoz4t6816fo1nT2ADpF8HEfshiq3iaQhMjhJEfskqZ4j5XnuGU59lnGhRoezqLxT1
         PSkiOGkNzE9d57Jj8iDnx6VxQDzL7fWPhJYC9JPmimK2PtZ/89bYGdUNRcVJh+91udGa
         j1N3aML9moDUujwjjmgvLXJdGWvB4+gWw6MWEtbmPh8cMPtxIX20WFpz1/CJkwztr+rD
         baRjIoYhn9Itc8WChtoIqvHG2bODWinIdQVjwyK+25AhKVZDZXPVwK/FdQAwSWS3Q6Xq
         eF1SyD9ryVkjx4nnTLyDpyBKY2GAXvzzZ+YiULbwjzMchPFp+Vj0xDUVzBtbLuArB/aI
         aW4w==
X-Gm-Message-State: AOAM53104xPQm+3Pw0LpMIAplsTmGZaPqNOLbxiccnA/uVUmAsjCMSkh
        oVV0kE1DgcN09jHYeE1oT4+MHqPBEJV8YIhHxvkycA==
X-Google-Smtp-Source: ABdhPJzFk/7GIOENhAIWM+EZkNdE/mONUK5IXOXD3LykxferNg9wj5MnKOvayTLAOrdBVIDUHJnk4J+G73gZ7GaKm6w=
X-Received: by 2002:a5d:6643:: with SMTP id f3mr4867346wrw.182.1614370208353;
 Fri, 26 Feb 2021 12:10:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128170936.9222-1-mike.leach@linaro.org> <20210128170936.9222-7-mike.leach@linaro.org>
 <20210225215122.GC3567106@xps15>
In-Reply-To: <20210225215122.GC3567106@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 26 Feb 2021 20:09:57 +0000
Message-ID: <CAJ9a7Vi5Dyb2k7uDxqRg99e-cxKyLkCgimMD8ZSO2m+1NdbFjg@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] coresight: etm-perf: Update to activate selected configuration
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
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

Hi Mathieu,

On Thu, 25 Feb 2021 at 21:51, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jan 28, 2021 at 05:09:32PM +0000, Mike Leach wrote:
> > Add calls to activate the selected configuration as perf starts
> > and stops the tracing session.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.c | 14 +++++++++++++-
> >  drivers/hwtracing/coresight/coresight-etm-perf.h |  2 ++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > index e270bb1e0f7d..5c1aeddabc59 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -178,6 +178,10 @@ static void free_event_data(struct work_struct *work)
> >       /* Free the sink buffers, if there are any */
> >       free_sink_buffer(event_data);
> >
> > +     /* clear any configuration we were using */
> > +     if (event_data->config_id_hash)
> > +             cscfg_deactivate_config(event_data->config_id_hash);
> > +
> >       for_each_cpu(cpu, mask) {
> >               struct list_head **ppath;
> >
> > @@ -236,7 +240,7 @@ static void etm_free_aux(void *data)
> >  static void *etm_setup_aux(struct perf_event *event, void **pages,
> >                          int nr_pages, bool overwrite)
> >  {
> > -     u32 id;
> > +     u32 id, config_id;
>
> config_id, cfg_hash, id_hash...
>

OK - I'll get the naming consistent.

> >       int cpu = event->cpu;
> >       cpumask_t *mask;
> >       struct coresight_device *sink = NULL;
> > @@ -253,6 +257,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
> >               sink = coresight_get_sink_by_id(id);
> >       }
> >
> > +     /* check if user wants a coresight configuration selected */
> > +     config_id = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
> > +     if (config_id) {
> > +             if (cscfg_activate_config(config_id))
> > +                     goto err;
> > +             event_data->config_id_hash = config_id;
> > +     }
> > +
> >       mask = &event_data->mask;
> >
> >       /*
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > index 3646a3837a0b..751d768939d8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.h
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
> > @@ -49,12 +49,14 @@ struct etm_filters {
> >   * @work:            Handle to free allocated memory outside IRQ context.
> >   * @mask:            Hold the CPU(s) this event was set for.
> >   * @snk_config:              The sink configuration.
> > + * @config_id_hash:  The id of any coresight config selected.
> >   * @path:            An array of path, each slot for one CPU.
> >   */
> >  struct etm_event_data {
> >       struct work_struct work;
> >       cpumask_t mask;
> >       void *snk_config;
> > +     u32 config_id_hash;
>
> Please align this with the naming convention you will be using above and
> throughout.
>
> More comments tomorrow.
>
> Thanks,
> Mathieu
>
> >       struct list_head * __percpu *path;
> >  };
> >
> > --
> > 2.17.1
> >

Thanks

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
