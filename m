Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1D1C433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 20:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A82FE64E60
	for <linux-doc@archiver.kernel.org>; Sat, 27 Feb 2021 20:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbhB0Uwz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Feb 2021 15:52:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhB0Uwy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Feb 2021 15:52:54 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1DDC061756
        for <linux-doc@vger.kernel.org>; Sat, 27 Feb 2021 12:52:14 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w18so8583072pfu.9
        for <linux-doc@vger.kernel.org>; Sat, 27 Feb 2021 12:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iCzhTX7/J8HDQ1NmWTMdWfXjqfGCQtFahBty74znwas=;
        b=bhR2WP0pAVjerTSc3Rgc0a6ag6fD1FIwlK5OasyrGOmEs5qUpPYQHB2tOjhkS6+fc2
         859p06Z6DP1gtVh6ncx1lDLCHFguWhixSY8MaYQ84AzHci6WffISq2cKUg/5pkw9Yhyt
         ZfSmHTVP36H8PoLttcRMKsITjjZ+ldS55n1gqqvTSfwBP5UIcoadqmtvT7N8MuWb7aUB
         FErkDr7cMDHUDvQebKhHbGCpYuinji9Pf+dLIM1Y1/t9/OCV6VRAd49iY1yhQE12boGg
         opXZ+4SMwMnt58d0NLxBfgNSa1pEiaNuCINUqgM2yXoO3z6BfdlUoCzo3BlOow2Hxq+9
         Y2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iCzhTX7/J8HDQ1NmWTMdWfXjqfGCQtFahBty74znwas=;
        b=e+6J7wz1Ia/fJitN706CpIjTeSL+FB7cfkUU/eHHUfqneAVg8Ka663upDbQgQyQRIn
         2jmq2G38exMqpYrbX0llY7nqeOAGFoxltfZAcZMHLit/60l0JAkC7VT2vzCd0dkL/7BB
         Gk4Qe7vWQLfGv6b0XOQxpugmQ9RcUyZsHUs9PpPH5G8yGWAyxhTlRbh9PZApccbrB/o+
         BoEh807hfqMkUTDSlOABjTrB9JTvSvbw8W7EbYZzR5Krn9J0LIxAECz81Axqh7Y+0bFI
         kQ0TPqvfKaEveKJNbzD4DMdLKksgV4olbq3BD5pS+YVpjUJcfFHn1Pb45XDD5LPEPQXT
         NSww==
X-Gm-Message-State: AOAM530Av7Pn+agwlZTDgY313Zcq/DmvlHxyWC2+7MkM7A+Uo2CYy8K8
        Pdmi+9jeEd/KkFeXHKbhwp4/1A==
X-Google-Smtp-Source: ABdhPJwIUTl7xvSqFvF7pALtDLpFq8SMPiddit6YCRp3lTejTLgNoH4UqOhZFykBAvPKRzFw3aE6bQ==
X-Received: by 2002:a63:2110:: with SMTP id h16mr8015755pgh.441.1614459133593;
        Sat, 27 Feb 2021 12:52:13 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 192sm10432202pfx.193.2021.02.27.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Feb 2021 12:52:12 -0800 (PST)
Date:   Sat, 27 Feb 2021 13:52:09 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
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
Subject: Re: [PATCH v4 02/10] coresight: syscfg: Add registration and feature
 loading for cs devices
Message-ID: <20210227205209.GA3631443@xps15>
References: <20210128170936.9222-1-mike.leach@linaro.org>
 <20210128170936.9222-3-mike.leach@linaro.org>
 <20210219184313.GA3065106@xps15>
 <CAJ9a7Vhh5xdbmMgcTLjU3qJEg2nbZoZ5j2HqvenwNGoqo+54Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7Vhh5xdbmMgcTLjU3qJEg2nbZoZ5j2HqvenwNGoqo+54Rw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 26, 2021 at 07:14:32PM +0000, Mike Leach wrote:
> Hi Mathieu,
> 
> On Fri, 19 Feb 2021 at 18:43, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > [...]
> >
> > > +/**
> > > + * List entry for Coresight devices that are registered as supporting complex
> > > + * config operations.
> > > + *
> > > + * @csdev:   The registered device.
> > > + * @match_info: The matching type information.
> > > + * @ops:     Operations supported by the registered device.
> > > + * @item:    list entry.
> > > + */
> > > +struct cscfg_csdev_register {
> > > +     struct coresight_device *csdev;
> > > +     struct cscfg_match_desc match_info;
> > > +     struct cscfg_csdev_feat_ops ops;
> > > +     struct list_head item;
> > > +};
> >
> > I would call this structure cscfg_registered_csdev and move it to
> > coresight-config.h.  That way it is consistent with cscfg_config_csdev and
> > cscfg_feature_csdev and located all in the same file.
> >
> 
> I was trying to separate structures that are used to define
> configurations and features, with those that are used to manage the
> same. Hence, most things in coresight_config.h define configurations,
> or their device loaded instance equivalents, and things in
> coresight_syscfg.h are management items. I am happy to change the name
> but would prefer is stay in coresight_syscfg.h

Ok

> 
> Thanks
> 
> Mike
> 
