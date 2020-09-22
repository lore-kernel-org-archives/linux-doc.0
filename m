Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36AAC4727D
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 16:05:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8922F2388B
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 16:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ket6MFsK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgIVQFQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Sep 2020 12:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgIVQFQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 12:05:16 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1007BC0613D0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 09:05:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o25so7386053pgm.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3cb2ln5okcTwbkZwIHw36/uS8TyOTC34MG+GPkwSrZc=;
        b=ket6MFsKGgeTKg06rAwU3VDAPgvifvWos8wL/PnPWPRsfN8itIg22pijPAXgFiUxD8
         Fd7QHl+cLoi+AojYI/uzZLiSnkiKfZrV0aT1MEDwgG5wUcL5BAy0o6ZN9q6zf5x5EzEe
         +vgACDfDyXI94Lso05jFSaPdPdjsYsl78/DZsmWSL+HdbBnaqlPM35rtfcVt5gLOelRw
         Yo9TEUDsIhXgyB14PuoaFO8HxUGK2iYlLlmUDF49sNxPlVfj/fCxmT+ONyEa9FVYQg8v
         qBO57Zf8p6I4kE7DkzGlQqZdpm45ZncnEFrK0CQkrt73NeKcuVR1Km00Fjp55T7bNcux
         ++6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3cb2ln5okcTwbkZwIHw36/uS8TyOTC34MG+GPkwSrZc=;
        b=HimgdK5GWEYGW3fAQsXyT9zEDTVBOYu24O3PTBT8sriaJBbIJ6/BBqfy7c1cGywfv8
         ORuZNwWSBTR+9b5CvNSDn9lsUZ/ANoECOpYGVrNEYjq3sLU43iObFLM8mXggwsNClnRL
         +g9QWoDEMRuO+FONBpVOdrxZO7sABi5u+r+f7kEkZ5gsOl1/U/i20GvZn4AwST735IAM
         nBS0denca5QxocdZWHvfyN0pdjeh4CBM3h/z6ga0Ror5R6OYv+A9UgeC9WB+FXzWSYlT
         gqAH1U2Rm4JJFNNITxRYeCnLucs0+Dy07ByR9WtPoKC0MP8Aea0wle2vvAMFCNjEtVqk
         TWkw==
X-Gm-Message-State: AOAM531PFEl427KGMRblRSqySDVYldQqgt7U4lg/iKErVjZlbvYypPvv
        Ur8gn5euEq3KxzqjE2qUN7e0CA==
X-Google-Smtp-Source: ABdhPJwDhQVCK5kMBC//E0Erf3yB57sWYMqIm4wY94GLY8PY9N2Jd3FgOvpyMgKERXA4LDx3m9cFUg==
X-Received: by 2002:a17:902:bb85:b029:d2:21cf:dc77 with SMTP id m5-20020a170902bb85b02900d221cfdc77mr5483863pls.66.1600790714148;
        Tue, 22 Sep 2020 09:05:14 -0700 (PDT)
Received: from google.com ([2620:0:1008:10:1ea0:b8ff:fe75:b885])
        by smtp.gmail.com with ESMTPSA id i1sm15473209pfk.21.2020.09.22.09.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 09:05:13 -0700 (PDT)
Date:   Tue, 22 Sep 2020 09:05:08 -0700
From:   Vipin Sharma <vipinsh@google.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, thomas.lendacky@amd.com,
        pbonzini@redhat.com, tj@kernel.org, lizefan@huawei.com,
        joro@8bytes.org, corbet@lwn.net, brijesh.singh@amd.com,
        jon.grimm@amd.com, eric.vantassell@amd.com, gingell@google.com,
        rientjes@google.com, kvm@vger.kernel.org, x86@kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dionna Glaze <dionnaglaze@google.com>,
        Erdem Aktas <erdemaktas@google.com>
Subject: Re: [RFC Patch 1/2] KVM: SVM: Create SEV cgroup controller.
Message-ID: <20200922160508.GA4017872@google.com>
References: <20200922004024.3699923-1-vipinsh@google.com>
 <20200922004024.3699923-2-vipinsh@google.com>
 <94c3407d-07ca-8eaf-4073-4a5e2a3fb7b8@infradead.org>
 <20200922012227.GA26483@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922012227.GA26483@linux.intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 21, 2020 at 06:22:28PM -0700, Sean Christopherson wrote:
> On Mon, Sep 21, 2020 at 06:04:04PM -0700, Randy Dunlap wrote:
> > Hi,
> > 
> > On 9/21/20 5:40 PM, Vipin Sharma wrote:
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index d6a0b31b13dc..1a57c362b803 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1101,6 +1101,20 @@ config CGROUP_BPF
> > >  	  BPF_CGROUP_INET_INGRESS will be executed on the ingress path of
> > >  	  inet sockets.
> > >  
> > > +config CGROUP_SEV
> > > +	bool "SEV ASID controller"
> > > +	depends on KVM_AMD_SEV
> > > +	default n
> > > +	help
> > > +	  Provides a controller for AMD SEV ASIDs. This controller limits and
> > > +	  shows the total usage of SEV ASIDs used in encrypted VMs on AMD
> > > +	  processors. Whenever a new encrypted VM is created using SEV on an
> > > +	  AMD processor, this controller will check the current limit in the
> > > +	  cgroup to which the task belongs and will deny the SEV ASID if the
> > > +	  cgroup has already reached its limit.
> > > +
> > > +	  Say N if unsure.
> > 
> > Something here (either in the bool prompt string or the help text) should
> > let a reader know w.t.h. SEV means.
> > 
> > Without having to look in other places...
> 
> ASIDs too.  I'd also love to see more info in the docs and/or cover letter
> to explain why ASID management on SEV requires a cgroup.  I know what an
> ASID is, and have a decent idea of how KVM manages ASIDs for legacy VMs, but
> I know nothing about why ASIDs are limited for SEV and not legacy VMs.

Thanks for the feedback, I will add more details in the Kconfig and the
documentation about SEV and ASID.
