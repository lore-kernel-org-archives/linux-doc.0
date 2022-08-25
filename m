Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595F0C04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 13:20:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241205AbiHYNUt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 09:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbiHYNUs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 09:20:48 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF25B8A1E1
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 06:20:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b16so26100001edd.4
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=tGI/HgI5RJ0IOQ7oCC9l+UoRS3M/KBpS5rSBAd3MZgo=;
        b=whhwMf11JScRmGvZpTzi4pm8aQUE+LI1b+HFpqXieLoJb6OwFEWMMa+Y/SI3hiRfSa
         JVJvBQuNwEbjYGDBjUlhLzIqA8xnjXhvYDwpro7ItADA2pIOZ4lUne38Gc06R0mw4ydw
         4UAEy9/ZJ1W3J0CXMP6jJo9Ou6s22HAdt12AOj0xjT5d04mLaOjV30rQy9Mzd1ffVcmr
         4U6pSbwSpLZQy12eWKyJ/eyJUQn67mpFP0t6UmF6CMmAk9GR1k2VTGeSIfOAfAF0BJ6w
         MaWFv/K4v+A18UkkelXRxiWWvHCgEqeGL05vBTUHARhmihHnqcnkXCImasUJj5pFMN0c
         oocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=tGI/HgI5RJ0IOQ7oCC9l+UoRS3M/KBpS5rSBAd3MZgo=;
        b=xHHfiHq/upr+t1W7QiC3clenOwxqEARKce+SDY6hxz3sOebc+/2hFP1InR4LH/fN72
         86qUhqBwE56Plzlph44CAfNrEUyOppqM5YEbqy4bnpGOCCgwoChu8cmXQ1UVq7r3b8pN
         cE/Fgnln29QAWQt7M/AnUsrZBSHK8hAQVMwswCs43QqN1/13HXxU7CYWL4FPvFpJHNAC
         H5Col7+zQBGtY2EWpH+CM1BXCLmNwN5M5kqTN0DtXlrcSs4NimgQ+B8pkKx+oV+rxXJV
         OioMRg8nL1QMj9HbGdLXqCW+9ThPFWbXtBagTrmw4fZYDfxnw40jQgZd243ai9Hum4b5
         dOOA==
X-Gm-Message-State: ACgBeo0/zw5m7xLGcFs+TCpNy1EcNV1ssHlCXklAr6TOIjZUsMYCvdMM
        Jcf1Du+tKuB+CImiYnZf2Ykh5g==
X-Google-Smtp-Source: AA6agR6BOF6YHOTMnMPROJdUE9tUsTOtPD6FHwfwYHiTakQgV+VT68NMf0ZjE2YrASDCSQ8PdivlLw==
X-Received: by 2002:aa7:cb06:0:b0:446:7668:2969 with SMTP id s6-20020aa7cb06000000b0044676682969mr3214524edt.206.1661433645579;
        Thu, 25 Aug 2022 06:20:45 -0700 (PDT)
Received: from localhost (ip-109-192-149-028.um38.pools.vodafone-ip.de. [109.192.149.28])
        by smtp.gmail.com with ESMTPSA id u16-20020aa7d0d0000000b004477c582ffdsm2874284edo.80.2022.08.25.06.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 06:20:44 -0700 (PDT)
Date:   Thu, 25 Aug 2022 09:20:43 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     tj@kernel.org, mkoutny@suse.com, surenb@google.com,
        gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] sched/psi: per-cgroup PSI accounting
 disable/re-enable interface
Message-ID: <Ywd3K1+5blotUEtU@cmpxchg.org>
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
 <20220824081829.33748-11-zhouchengming@bytedance.com>
 <YwX2jC2UQ/zeY2E8@cmpxchg.org>
 <324b1d0f-42e5-8947-68cb-a3d20135f2c6@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <324b1d0f-42e5-8947-68cb-a3d20135f2c6@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 25, 2022 at 08:28:39PM +0800, Chengming Zhou wrote:
> On 2022/8/24 17:59, Johannes Weiner wrote:
> > Hi Chengming,
> > 
> > Thanks for incorporating all the feedback. I have a few nitpicks
> > below, but with those considered, please add:
> > 
> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> > 
> > On Wed, Aug 24, 2022 at 04:18:29PM +0800, Chengming Zhou wrote:
> >> @@ -5171,12 +5220,19 @@ static struct cftype cgroup_base_files[] = {
> >>  	{
> >>  		.name = "irq.pressure",
> >>  		.flags = CFTYPE_PRESSURE,
> >> +		.file_offset = offsetof(struct cgroup, psi_files[PSI_IRQ]),
> >>  		.seq_show = cgroup_irq_pressure_show,
> >>  		.write = cgroup_irq_pressure_write,
> >>  		.poll = cgroup_pressure_poll,
> >>  		.release = cgroup_pressure_release,
> >>  	},
> >>  #endif
> >> +	{
> >> +		.name = "cgroup.pressure",
> >> +		.flags = CFTYPE_PRESSURE,
> >> +		.seq_show = cgroup_psi_show,
> >> +		.write = cgroup_psi_write,
> > 
> > To match the naming convention, these should be called
> > cgroup_pressure_show() and cgroup_pressure_write().
> 
> I just find cgroup_pressure_write() already exists, so I change the names
> to cgroup_pressure_enable_show() and cgroup_pressure_enable_write(),
> since this file name is simplified from "cgroup.pressure.enable".

That makes two outliers instead of one. It's probably better to steal
cgroup_pressure_write for cgroup.pressure, and rename the currently
misnamed helper. How about do_pressure_write()? pressure_write()?
