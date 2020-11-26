Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21249C63798
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 17:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC842221F7
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 17:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTwG7pth"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404414AbgKZR3e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 12:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404105AbgKZR3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 12:29:34 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0747FC0613D4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 09:29:34 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id s13so3143828wmh.4
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eNmmYIntQD41kP5Sy+k/QWgGU3OC7ECA76To2f6sO84=;
        b=OTwG7pthwmbnQa4O4pEKQm3r7t+DfZH8/A814vskFeIwb1FswL2ou7mn064m+b6JOW
         ATuWhxu9ybb+JUMtcNuHn9iSPGGKMpNnuEvEaS18eW3zmdEEu55d6WTGi+7xbSMgFQWp
         EAe58Ogmc6EQdiNxH5da82B8tRgtKqIKsJQ4UgW/7kqj5a6FUqk0iqGtQnHOdRj/rJLI
         74XACjmqHWKIsHrhYhyE9sV6/lq+bvG/IH/hWft2e+793kU22Nu/UEN/rrbVQK6wZ+3m
         fqp/0IH4Z77e15TKRtrkLfcPNbbvcsWtK3G4DfrNsxurhbPDGuxcE766h35FrLx42G5m
         jhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eNmmYIntQD41kP5Sy+k/QWgGU3OC7ECA76To2f6sO84=;
        b=PQwcdTjnruROradRT6NU9L8j4JIJhEvwHH3WOL2Hm23yI93/U90JULzHfskrG5abX/
         LgshzV8vMntz/tgOBdSt2em+DI7YyZz6o97dSW9gjMLS4FQlGbn3CK1AiSzb1hCQbNZZ
         VmYl+2B7qdUfSlx2yzw9NpyxSrKARm30KZue402dm5ziNw5FNKD516hAEggiaSz6kz53
         IloeedOYWfY1ymksqbWL0DHsYiXcjXPnFPq9QvlxuY32W6319GDCLvLaxupC63Gp9Eg+
         Yq0BOGTNRBqBtduzXaS4b6xO2vxRtX5SR4docLSji+57wTT7C9jhX86c18JDWMDB214S
         SQGw==
X-Gm-Message-State: AOAM533p32bMA/yiRfgmJ163x7jv6x2pF2kz+kHTbs10dj3hIq38iQGE
        kwooktk6xAvtixCB90hye2RrFA==
X-Google-Smtp-Source: ABdhPJza6j04qFmVsjgAU43nbnlurhLEdweYclMbOSTmqBBsojLWwg3BqabR7gpjOx4N8c/OCFiJaA==
X-Received: by 2002:a7b:c319:: with SMTP id k25mr4627247wmj.65.1606411772607;
        Thu, 26 Nov 2020 09:29:32 -0800 (PST)
Received: from google.com ([2a01:4b00:8523:2d03:4ca8:e54e:96f6:f182])
        by smtp.gmail.com with ESMTPSA id c64sm9074091wmd.41.2020.11.26.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 09:29:31 -0800 (PST)
Date:   Thu, 26 Nov 2020 17:29:30 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     kvmarm@lists.cs.columbia.edu, Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 02/23] psci: Accessor for configured PSCI function IDs
Message-ID: <20201126172930.i63yemxpc5r3mqpq@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
 <20201126155421.14901-3-dbrazdil@google.com>
 <20201126172450.GC38486@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126172450.GC38486@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hey Mark,

On Thu, Nov 26, 2020 at 05:24:50PM +0000, Mark Rutland wrote:
> On Thu, Nov 26, 2020 at 03:54:00PM +0000, David Brazdil wrote:
> > Function IDs used by PSCI are configurable for v0.1 via DT/APCI. If the
> > host is using PSCI v0.1, KVM's host PSCI proxy needs to use the same IDs.
> > Expose the array holding the information with a read-only accessor.
> > 
> > Signed-off-by: David Brazdil <dbrazdil@google.com>
> > ---
> >  drivers/firmware/psci/psci.c | 16 ++++++++--------
> >  include/linux/psci.h         | 10 ++++++++++
> >  2 files changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index 213c68418a65..40609564595e 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -58,16 +58,16 @@ typedef unsigned long (psci_fn)(unsigned long, unsigned long,
> >  				unsigned long, unsigned long);
> >  static psci_fn *invoke_psci_fn;
> >  
> > -enum psci_function {
> > -	PSCI_FN_CPU_SUSPEND,
> > -	PSCI_FN_CPU_ON,
> > -	PSCI_FN_CPU_OFF,
> > -	PSCI_FN_MIGRATE,
> > -	PSCI_FN_MAX,
> > -};
> > -
> >  static u32 psci_function_id[PSCI_FN_MAX];
> >  
> > +u32 psci_get_function_id(enum psci_function fn)
> > +{
> > +	if (WARN_ON_ONCE(fn < 0 || fn >= PSCI_FN_MAX))
> > +		return 0;
> > +
> > +	return psci_function_id[fn];
> > +}
> 
> I'd really like if we could namespace this with a psci_0_1_* prefix
> before we expose it outside of the PSCI code. I appreciate that's a
> larger change, but I reckon we only need a couple of new patches:
> 
> 1) Split the ops which consume the FN ids into separate psci_0_1_*() and
>    psci_0_2_*() variants, with a common __psci_*() helper that takes the
>    function ID as an argument. The 0_1 variants would read the function
>    ID from a variable, and the 0_2 variants would hard-code the id.
> 
> 2) Replace the psci_function_id array with:
> 
>    struct psci_0_1_function_ids {
>    	u32 suspend;
>    	u32 cpu_on;
>    	u32 cpu_off;
>    	u32 migrate;
>    };
> 
>    ... and remove enum psci_function entirely.
> 
> 3) Add a helper which returns the entire psci_0_1_function_ids struct in
>    one go. No warnings necessary.
> 
> Does that sound OK to you?

Sure, sounds easy enough and 2) is in line with how I structured the handlers
in KVM.

Thanks,
David
