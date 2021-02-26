Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786E6C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 19:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46FEA64EF0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 19:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhBZTPZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Feb 2021 14:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhBZTPZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Feb 2021 14:15:25 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5A7C061756
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 11:14:44 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id b18so3126407wrn.6
        for <linux-doc@vger.kernel.org>; Fri, 26 Feb 2021 11:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RuZp97vmbX3iIDJQaLWaML/+bFGYgXRX8cY/lFqCb0=;
        b=SnBNKxyPwjxV1r4q+dVPz/jQz/ZPn7P571slVmVk1YK1kCiwwyzqHV51yA9tnmUJbB
         paSiXtb5lBKCrElhg1bHAnABFfu1XL5pN5OlvRb+9ORdJibuJ4bxnRja3JbSm1axWX62
         n7WGc2uZmO2o+/HQQGZMmxnnXs9zVW65Lz5UNyaUoueI1SlJNMudcBGQgMhSC7+VjRMm
         mXOof6DQAWCh5jVmiPuor+j0QsmWBvawconkyomG/LMCGIKzClSORwenxdiacvsCrRgG
         dWg0TTHNE0AIBtlDLyZBP4w+MzktYm7VI6dvRlZeUnssCLw7VseKo0sJy/RrswSzY7bP
         cNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RuZp97vmbX3iIDJQaLWaML/+bFGYgXRX8cY/lFqCb0=;
        b=TfqB9gIV36XgwTDNQIE/iDMttywX3sps5YV5iowD9Erp7r8G/ve0h+RSAx+uXTp1hb
         YATgFtSqmUvSidWJJprvUiFrGtcfmQ/bqTR8Fol80ZJrKZiTQJzbpyoXDi6CAkIxjvax
         8pDw7mWoBm5AuHTCHtKgUHVFtL07hx9OhvmDlLOe0re1+xekoIg33tW9xYJZhIWWSvpX
         JOGyE3MtLJNS4J3u5Q7qXMZQU/N+VXZy9l0BhdtrYzE29FqoqezdyS0vX49C7XPCRNcw
         sY78SJAWZ0WtDTRvHdr239iWGKz6+yN5TDaZRs7GhA8p+n+z6fMm9Q2JeRTip5o2LpV0
         XGAQ==
X-Gm-Message-State: AOAM5327kmjz4PYXj6tPcH921gaql4/0PZlk6lcaFzdIwPjZiCrPcwHm
        lshHTugev6MsNUOXTOfkb8lNkruMhhVdmHsKNmmixg==
X-Google-Smtp-Source: ABdhPJxSHnkbQV0oSfGegVOoaPiiMqcDhERK3pBj182Gl1wWtE17kVrglCwBzTMER3A2OJEoW7PqwMtI93lYmsfpSvo=
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr4537164wrw.178.1614366883308;
 Fri, 26 Feb 2021 11:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128170936.9222-1-mike.leach@linaro.org> <20210128170936.9222-3-mike.leach@linaro.org>
 <20210219184313.GA3065106@xps15>
In-Reply-To: <20210219184313.GA3065106@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Fri, 26 Feb 2021 19:14:32 +0000
Message-ID: <CAJ9a7Vhh5xdbmMgcTLjU3qJEg2nbZoZ5j2HqvenwNGoqo+54Rw@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] coresight: syscfg: Add registration and feature
 loading for cs devices
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

On Fri, 19 Feb 2021 at 18:43, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> [...]
>
> > +/**
> > + * List entry for Coresight devices that are registered as supporting complex
> > + * config operations.
> > + *
> > + * @csdev:   The registered device.
> > + * @match_info: The matching type information.
> > + * @ops:     Operations supported by the registered device.
> > + * @item:    list entry.
> > + */
> > +struct cscfg_csdev_register {
> > +     struct coresight_device *csdev;
> > +     struct cscfg_match_desc match_info;
> > +     struct cscfg_csdev_feat_ops ops;
> > +     struct list_head item;
> > +};
>
> I would call this structure cscfg_registered_csdev and move it to
> coresight-config.h.  That way it is consistent with cscfg_config_csdev and
> cscfg_feature_csdev and located all in the same file.
>

I was trying to separate structures that are used to define
configurations and features, with those that are used to manage the
same. Hence, most things in coresight_config.h define configurations,
or their device loaded instance equivalents, and things in
coresight_syscfg.h are management items. I am happy to change the name
but would prefer is stay in coresight_syscfg.h

Thanks

Mike


> I may have to come back to this patch but for now it holds together.
>
> More comments to come on Monday.
>
> Thanks,
> Mathieu
>
> > +
> >  /* internal core operations for cscfg */
> >  int __init cscfg_init(void);
> >  void __exit cscfg_exit(void);
> > @@ -33,6 +49,10 @@ void __exit cscfg_exit(void);
> >  /* syscfg manager external API */
> >  int cscfg_load_config_sets(struct cscfg_config_desc **cfg_descs,
> >                          struct cscfg_feature_desc **feat_descs);
> > +int cscfg_register_csdev(struct coresight_device *csdev,
> > +                      struct cscfg_match_desc *info,
> > +                      struct cscfg_csdev_feat_ops *ops);
> > +void cscfg_unregister_csdev(struct coresight_device *csdev);
> >
> >  /**
> >   * System configuration manager device.
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 976ec2697610..d0126ed326a6 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -219,6 +219,8 @@ struct coresight_sysfs_link {
> >   * @nr_links:   number of sysfs links created to other components from this
> >   *           device. These will appear in the "connections" group.
> >   * @has_conns_grp: Have added a "connections" group for sysfs links.
> > + * @feature_csdev_list: List of complex feature programming added to the device.
> > + * @config_csdev_list:  List of system configurations added to the device.
> >   */
> >  struct coresight_device {
> >       struct coresight_platform_data *pdata;
> > @@ -240,6 +242,9 @@ struct coresight_device {
> >       int nr_links;
> >       bool has_conns_grp;
> >       bool ect_enabled; /* true only if associated ect device is enabled */
> > +     /* system configuration and feature lists */
> > +     struct list_head feature_csdev_list;
> > +     struct list_head config_csdev_list;
> >  };
> >
> >  /*
> > --
> > 2.17.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
