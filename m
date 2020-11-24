Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32ECC56202
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 21:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 838CD20C56
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 21:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j1YEcpcR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbgKXV1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 16:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732255AbgKXV1c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 16:27:32 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF58BC061A4E
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 13:27:30 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id s63so345384pgc.8
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 13:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ycdBeKfDdnxlj2we2eatzJcCu25NkZg7utasfa+QCJs=;
        b=j1YEcpcRCjolfYVSNLeLmzuHRNxnhlKz+wYLfNMVpoq2ZqI2DBBuBRO0ixD0qzD3tC
         KeLaMHOuTm71wOBGHwodtG43JGmQ/uDnbRrbK1FFWk5Td49DkkdETpql2oh34ccq4SD6
         7G+zsmZKba/biKWGiFY/xlEkWH+nziDRuGaRqaa/xUKKo84H0mY/qaLWRRw7SC2e96ny
         QTFOq6vk7UcEem8/3SuMSoV/N97Ernjs6ts18XyYnVsAVpygnI7frPOeqHNMhVmknuqb
         Wsc7mJroPtrz8tH6x7VyOyhgV2x6Wt3ToRvDfOKxm+pe4OgSAcD0mTj2Z6oCko7hQMkF
         BKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ycdBeKfDdnxlj2we2eatzJcCu25NkZg7utasfa+QCJs=;
        b=lXsMAycMS0qGQm3kbAovTz0kuO1V0zttu1Ym5cjCzn1l+Q6GpeZrKyTiDNcvhejfsx
         FAHi3kGl3mVs1mUbTEkGnZOAVXaRoN/Rn1Tz+oM1JA4bemUqyoOETP69jN8oG6gpzMqE
         4VUStSB5UOO2qnT+1BbH5xrzrajvsPdchiuTBw+ydPRMH2oyMn3fTPH4TlLPNGqF/wSD
         iWe+4U8/xa9ms3gyhLbk4InpkBAwXxDhVdaQz0iYdA3C1y5UMORZaiz3j0ayYzRcyBos
         3fVkeQ/rZSIkLYeoYptVTVWk942CZX0xs9vplnEvuy60UzhvchFtRpqkVgNIaeOI/1If
         BM7Q==
X-Gm-Message-State: AOAM530TD+eoLWTVXFgge0OENBdFGgilAT3IP5RMwNzo/+T4PWrMz/gA
        1rzLX+BmhqZoSUaUitou21baBA==
X-Google-Smtp-Source: ABdhPJz29bntK467ochG2vHVzVTuub/FtxMns7R2Jct9+Ce6+9D3MGeT5gHMd85APqAOELHIj+WlYw==
X-Received: by 2002:aa7:9edb:0:b029:197:f0c9:f5bc with SMTP id r27-20020aa79edb0000b0290197f0c9f5bcmr169373pfq.10.1606253250128;
        Tue, 24 Nov 2020 13:27:30 -0800 (PST)
Received: from google.com (242.67.247.35.bc.googleusercontent.com. [35.247.67.242])
        by smtp.gmail.com with ESMTPSA id j69sm11414pfd.37.2020.11.24.13.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 13:27:29 -0800 (PST)
Date:   Tue, 24 Nov 2020 21:27:25 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Vipin Sharma <vipinsh@google.com>
Cc:     David Rientjes <rientjes@google.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Thomas <thomas.lendacky@amd.com>, pbonzini@redhat.com,
        tj@kernel.org, lizefan@huawei.com, joro@8bytes.org, corbet@lwn.net,
        Brijesh <brijesh.singh@amd.com>, Jon <jon.grimm@amd.com>,
        Eric <eric.vantassell@amd.com>, gingell@google.com,
        kvm@vger.kernel.org, x86@kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC Patch 0/2] KVM: SVM: Cgroup support for SVM SEV ASIDs
Message-ID: <20201124212725.GB246319@google.com>
References: <alpine.DEB.2.23.453.2011131615510.333518@chino.kir.corp.google.com>
 <20201124191629.GB235281@google.com>
 <20201124194904.GA45519@google.com>
 <alpine.DEB.2.23.453.2011241215400.3594395@chino.kir.corp.google.com>
 <20201124210817.GA65542@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124210817.GA65542@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 24, 2020, Vipin Sharma wrote:
> On Tue, Nov 24, 2020 at 12:18:45PM -0800, David Rientjes wrote:
> > On Tue, 24 Nov 2020, Vipin Sharma wrote:
> > 
> > > > > Looping Janosch and Christian back into the thread.                           
> > > > >                                                                               
> > > > > I interpret this suggestion as                                                
> > > > > encryption.{sev,sev_es,keyids}.{max,current,events} for AMD and Intel         
> > > > 
> > > > I think it makes sense to use encryption_ids instead of simply encryption, that
> > > > way it's clear the cgroup is accounting ids as opposed to restricting what
> > > > techs can be used on yes/no basis.
> > > > 
> > 
> > Agreed.
> > 
> > > > > offerings, which was my thought on this as well.                              
> > > > >                                                                               
> > > > > Certainly the kernel could provide a single interface for all of these and    
> > > > > key value pairs depending on the underlying encryption technology but it      
> > > > > seems to only introduce additional complexity in the kernel in string         
> > > > > parsing that can otherwise be avoided.  I think we all agree that a single    
> > > > > interface for all encryption keys or one-value-per-file could be done in      
> > > > > the kernel and handled by any userspace agent that is configuring these       
> > > > > values.                                                                       
> > > > >                                                                               
> > > > > I think Vipin is adding a root level file that describes how many keys we     
> > > > > have available on the platform for each technology.  So I think this comes    
> > > > > down to, for example, a single encryption.max file vs                         
> > > > > encryption.{sev,sev_es,keyid}.max.  SEV and SEV-ES ASIDs are provisioned      
> > > > 
> > > > Are you suggesting that the cgroup omit "current" and "events"?  I agree there's
> > > > no need to enumerate platform total, but not knowing how many of the allowed IDs
> > > > have been allocated seems problematic.
> > > > 
> > > 
> > > We will be showing encryption_ids.{sev,sev_es}.{max,current}
> > > I am inclined to not provide "events" as I am not using it, let me know
> > > if this file is required, I can provide it then.

I've no objection to omitting current until it's needed.

> > > I will provide an encryption_ids.{sev,sev_es}.stat file, which shows
> > > total available ids on the platform. This one will be useful for
> > > scheduling jobs in the cloud infrastructure based on total supported
> > > capacity.
> > > 
> > 
> > Makes sense.  I assume the stat file is only at the cgroup root level 
> > since it would otherwise be duplicating its contents in every cgroup under 
> > it.  Probably not very helpful for child cgroup to see stat = 509 ASIDs 
> > but max = 100 :)
> 
> Yes, only at root.

Is a root level stat file needed?  Can't the infrastructure do .max - .current
on the root cgroup to calculate the number of available ids in the system?
