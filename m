Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447F8C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  6 May 2022 02:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240164AbiEFCxl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 May 2022 22:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239598AbiEFCxk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 May 2022 22:53:40 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E127A5C759
        for <linux-doc@vger.kernel.org>; Thu,  5 May 2022 19:49:58 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so5741201pjm.1
        for <linux-doc@vger.kernel.org>; Thu, 05 May 2022 19:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=stPISc2iVOTrkVyZNKG7JLMVggqEFJ4NiZq00z+cHsE=;
        b=gE/nuUHAhcDJQN3EZYN6feAehm7KCsihVT/r/sh+0Hz0ho+0dbgcD7W1PWV27Cv5dK
         1avL6eXfGegY/KtPCt7K+VegUYGNC5E/7afq55pRaj570x5cKYO5oSCwL1+8mebW+J8t
         achpeJ0YYOJam4b2sKPhBgwb9YKKGCs+S/OEEO3l6Iq5NuZCaLizEAmXWc44Q0F50cYr
         WhRTlirDR0FEvSUDP7Va8A4i+HS/ZMhw1EipoS5zEe+kmC+MlH61SQP8x1zeFDDOtk7e
         pmx/FPkQPSaZFYmurBRoZjoEc1LvrYtD0kRFdmZKAzvQ7x07muPWeDfL1RON6n2+vIe2
         DmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=stPISc2iVOTrkVyZNKG7JLMVggqEFJ4NiZq00z+cHsE=;
        b=sYL8qdNtXXu+CIFKqO0V9Ly+Uc1a2xao3yizSYBonfwKfRW8QYEXDdleeZiIyyKv/b
         bMYTUQAMZfssPx9fGex0G7oBLN/gstOQSm200Zfkh3hr3FEAP5VXPQcQt8qIhStYD8WM
         nnXErXXbT1wBbXv3K13+PG4Wv06Y0AcVBPfHHmMm0G3f6DOFATdgmpMUB6685a/AQg8p
         8kpIW5VJUczw9VIOA1DjljkXbnCgfEFF78hCDtZ4xAl4ambu2JNCaGbSpz0ohLZkL714
         Xz9p1IxjVHC8GbET6IHO+5NYe8q/4/tToux9tJjV3C5JBn8s8H7at1rfCf7DSLrVfqTj
         tJFg==
X-Gm-Message-State: AOAM530nnMAb6rXFCTjsszwELrd/tjRQOMJLKc6ZQtjLaib8wewlvM5y
        /4/WwLs6J7enktpUziO0KsihKw==
X-Google-Smtp-Source: ABdhPJyMVCLds+L8GtrgygvTohfA9Xrqr1VFkzEF58ywVmq17fAPyaoO5ITK3cIWURZ/fRCtnAw1BA==
X-Received: by 2002:a17:90a:d818:b0:1dc:9b3a:a74d with SMTP id a24-20020a17090ad81800b001dc9b3aa74dmr1638223pjv.35.1651805398389;
        Thu, 05 May 2022 19:49:58 -0700 (PDT)
Received: from localhost ([2408:8207:18da:2310:3921:3664:64f7:6cac])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090341c200b0015e8d4eb25esm344056ple.168.2022.05.05.19.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 19:49:57 -0700 (PDT)
Date:   Fri, 6 May 2022 10:49:53 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com, osalvador@suse.de,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v9 4/4] mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap
 sysctl
Message-ID: <YnSM0Wd/lEc9wnwJ@FVFYT0MHHV2J.googleapis.com>
References: <20220429121816.37541-1-songmuchun@bytedance.com>
 <20220429121816.37541-5-songmuchun@bytedance.com>
 <eadec7de-2e1a-2fb3-3317-c7b492a84e2b@oracle.com>
 <YnM4DRFhdD6iZIs1@FVFYT0MHHV2J.googleapis.com>
 <f77412f1-ffe5-659d-8a7d-578e0e8c5e2c@oracle.com>
 <YnOEl6Qwp5jp7RHp@FVFYT0MHHV2J>
 <a0c54e91-dcb2-debd-a1ef-b4906fed8ab1@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0c54e91-dcb2-debd-a1ef-b4906fed8ab1@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 05, 2022 at 09:48:34AM -0700, Mike Kravetz wrote:
> On 5/5/22 01:02, Muchun Song wrote:
> > On Wed, May 04, 2022 at 08:36:00PM -0700, Mike Kravetz wrote:
> >> On 5/4/22 19:35, Muchun Song wrote:
> >>> On Wed, May 04, 2022 at 03:12:39PM -0700, Mike Kravetz wrote:
> >>>> On 4/29/22 05:18, Muchun Song wrote:
> >>>>> +static void vmemmap_optimize_mode_switch(enum vmemmap_optimize_mode to)
> >>>>> +{
> >>>>> +	if (vmemmap_optimize_mode == to)
> >>>>> +		return;
> >>>>> +
> >>>>> +	if (to == VMEMMAP_OPTIMIZE_OFF)
> >>>>> +		static_branch_dec(&hugetlb_optimize_vmemmap_key);
> >>>>> +	else
> >>>>> +		static_branch_inc(&hugetlb_optimize_vmemmap_key);
> >>>>> +	vmemmap_optimize_mode = to;
> >>>>> +}
> >>>>> +
> >>>>>  static int __init hugetlb_vmemmap_early_param(char *buf)
> >>>>>  {
> >>>>>  	bool enable;
> >>>>> +	enum vmemmap_optimize_mode mode;
> >>>>>  
> >>>>>  	if (kstrtobool(buf, &enable))
> >>>>>  		return -EINVAL;
> >>>>>  
> >>>>> -	if (enable)
> >>>>> -		static_branch_enable(&hugetlb_optimize_vmemmap_key);
> >>>>> -	else
> >>>>> -		static_branch_disable(&hugetlb_optimize_vmemmap_key);
> >>>>> +	mode = enable ? VMEMMAP_OPTIMIZE_ON : VMEMMAP_OPTIMIZE_OFF;
> >>>>> +	vmemmap_optimize_mode_switch(mode);
> >>>>>  
> >>>>>  	return 0;
> >>>>>  }
> >>>>> @@ -60,6 +80,8 @@ int hugetlb_vmemmap_alloc(struct hstate *h, struct page *head)
> >>>>>  	vmemmap_end	= vmemmap_addr + (vmemmap_pages << PAGE_SHIFT);
> >>>>>  	vmemmap_reuse	= vmemmap_addr - PAGE_SIZE;
> >>>>>  
> >>>>> +	VM_BUG_ON_PAGE(!vmemmap_pages, head);
> >>>>> +
> >>>>>  	/*
> >>>>>  	 * The pages which the vmemmap virtual address range [@vmemmap_addr,
> >>>>>  	 * @vmemmap_end) are mapped to are freed to the buddy allocator, and
> >>>>> @@ -69,8 +91,10 @@ int hugetlb_vmemmap_alloc(struct hstate *h, struct page *head)
> >>>>>  	 */
> >>>>>  	ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
> >>>>>  				  GFP_KERNEL | __GFP_NORETRY | __GFP_THISNODE);
> >>>>> -	if (!ret)
> >>>>> +	if (!ret) {
> >>>>>  		ClearHPageVmemmapOptimized(head);
> >>>>> +		static_branch_dec(&hugetlb_optimize_vmemmap_key);
> >>>>> +	}
> >>>>>  
> >>>>>  	return ret;
> >>>>>  }
> >>>>> @@ -84,6 +108,8 @@ void hugetlb_vmemmap_free(struct hstate *h, struct page *head)
> >>>>>  	if (!vmemmap_pages)
> >>>>>  		return;
> >>>>>  
> >>>>> +	static_branch_inc(&hugetlb_optimize_vmemmap_key);
> >>>>
> >>>> Can you explain the reasoning behind doing the static_branch_inc here in free,
> >>>> and static_branch_dec in alloc?
> >>>> IIUC, they may not be absolutely necessary but you could use the count to
> >>>> know how many optimized pages are in use?  Or, I may just be missing
> >>>> something.
> >>>>
> >>>
> >>> Partly right. One 'count' is not enough. I have implemented this with similar
> >>> approach in v6 [1]. Except the 'count', we also need a lock to do synchronization.
> >>> However, both count and synchronization are included in static_key_inc/dec
> >>> infrastructure. It is simpler to use static_key_inc/dec directly, right? 
> >>>
> >>> [1] https://lore.kernel.org/all/20220330153745.20465-5-songmuchun@bytedance.com/
> >>>
> >>
> >> Sorry, but I am a little confused.
> >>
> >> vmemmap_optimize_mode_switch will static_key_inc to enable and static_key_dec
> >> to disable.  In addition each time we optimize (allocate) a hugetlb page after
> >> enabling we will static_key_inc.
> >>
> >> Suppose we have 1 hugetlb page optimized.  So static count == 2 IIUC.
> >> The someone turns off optimization via sysctl.  static count == 1 ???
> > 
> > Definitely right.
> > 
> >> If we then add another hugetlb page via nr_hugepages it seems that it
> >> would be optimized as static count == 1.  Is that correct?  Do we need
> > 
> > I'm wrong.
> > 
> >> to free all hugetlb pages with optimization before we can add new pages
> >> without optimization?
> >>
> > 
> > My bad. I think the following code would fix this.
> > 
> > Thanks for your review carefully.
> > 
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 5820a681a724..997e192aeed7 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -105,7 +105,7 @@ void hugetlb_vmemmap_free(struct hstate *h, struct page *head)
> >         unsigned long vmemmap_end, vmemmap_reuse, vmemmap_pages;
> > 
> >         vmemmap_pages = hugetlb_optimize_vmemmap_pages(h);
> > -       if (!vmemmap_pages)
> > +       if (!vmemmap_pages || READ_ONCE(vmemmap_optimize_mode) == VMEMMAP_OPTIMIZE_OFF)
> >                 return;
> > 
> >         static_branch_inc(&hugetlb_optimize_vmemmap_key);
> >  
> 
> If vmemmap_optimize_mode == VMEMMAP_OPTIMIZE_OFF is sufficient for turning
> off optimizations, do we really need to static_branch_inc/dev for each
> hugetlb page?
>

static_branch_inc/dec is necessary since the user could change
vmemmap_optimize_mode to off after the 'if' judgement.

CPU0:				CPU1:
// Assume vmemmap_optimize_mode == 1
// and static_key_count == 1
if (vmemmap_optimize_mode == VMEMMAP_OPTIMIZE_OFF)
	return;
				hugetlb_optimize_vmemmap_handler();
					vmemmap_optimize_mode = 0;
					static_branch_dec();
					// static_key_count == 0
// Enable static_key if necessary
static_branch_inc();

Does this make sense for you?

Thanks.
