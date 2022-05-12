Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B05C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 03:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344338AbiELDfP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 May 2022 23:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344419AbiELDfI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 May 2022 23:35:08 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1EC6FA2B
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 20:35:07 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id v11so3644971pff.6
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 20:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X1EWtaAUcC9nY4ecdIj3gv8AzSUp1nD6lxQDDkHzRhM=;
        b=cskRuPyshApD9fUcRR98UoK/tm6N0nS7PLFObGyO2zx1ZhP2UoucAEef0yxRbm0Gzy
         j6WCarlZMSxwc2u0ely+oDNFqEJcB4VEPSOrjQc2CaOEY40BHmEwfLxs+hl//QUPyEOh
         4W2lw9IXlxKZVV3EdwWUadzrs9UXzcGUd7JEM4xZXh1/BYWgJq/5gWmJcMs634aSNknq
         B9BlEkl9wgU5U19jCUnjQvOup0NqOs6EJFxXXz6f+jbVPSMZaBOqalzCztC0Dwme8/Yg
         Aw0UPBApMUu56/J2ETl5mZeDwTVmeVR2oMjgP+rZD1PcpmrPIJ5CysQxjpC48Quw+opf
         eefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X1EWtaAUcC9nY4ecdIj3gv8AzSUp1nD6lxQDDkHzRhM=;
        b=BpZ/ChT6rYLwE2GMMZQFY19JtEkScs+rZw3IkcYOgsnpcqH355WVKb344ieYlCbZKf
         Mh02XIAnsd+t8oB9RjvtljWFPiWUdX12lC0wSCFKUxsiFwideDUg7oLHoVKmEHzjU/dw
         5d3XCV3SZz/ud47JhtMZro/6GaCLdppGvUGbDZFlLZLPYDAGgj55XlE/YaU8oaNXZ8Ry
         owdXzSJt7oikzktaNZFS65whn/yXpxyfznOs7vMy6NtCk/kEBK5VeEh9yNlWBxKJV6Qh
         z4x3onrLm48Z4HoT6w9m12DSiOUMEYkya59upJ84MZjONs6P50QEvofbo6+k+7v5VQzQ
         8Wvw==
X-Gm-Message-State: AOAM5304mcyGdPKphuq+ULiRdroiC79pcsWcW2/cQH/6ptsmgT7cZvyB
        I1SmMjkqNVYjuOLWuLYayS7muA==
X-Google-Smtp-Source: ABdhPJwvazLxYDzsIGa1KMrB5vzmREoXsmZdW0ImzlKi2JBBm3AHvRmqeR1wDZD2sT5xyV/vgQ28UA==
X-Received: by 2002:a63:6a45:0:b0:3c1:47b7:edce with SMTP id f66-20020a636a45000000b003c147b7edcemr23175244pgc.207.1652326506731;
        Wed, 11 May 2022 20:35:06 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id cp23-20020a17090afb9700b001cd4989fee1sm658198pjb.45.2022.05.11.20.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 20:35:06 -0700 (PDT)
Date:   Thu, 12 May 2022 11:34:54 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com, osalvador@suse.de,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v10 4/4] mm: hugetlb_vmemmap: add
 hugetlb_optimize_vmemmap sysctl
Message-ID: <YnyAXu5ZHrMjbUrD@FVFYT0MHHV2J.usts.net>
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-5-songmuchun@bytedance.com>
 <970166e0-f70e-dd2a-c764-af23a8425f87@oracle.com>
 <9d64809f-db8c-0a3e-1ae9-d4a8ab79041e@oracle.com>
 <YnuF1c5fMOzJnNfD@FVFYT0MHHV2J.usts.net>
 <YnuWnFbb8xExKfdk@FVFYT0MHHV2J.usts.net>
 <c77c61c8-8a5a-87e8-db89-d04d8aaab4cc@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c77c61c8-8a5a-87e8-db89-d04d8aaab4cc@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 11, 2022 at 10:53:07AM -0700, Mike Kravetz wrote:
> On 5/11/22 03:57, Muchun Song wrote:
> > On Wed, May 11, 2022 at 05:45:57PM +0800, Muchun Song wrote:
> >> On Tue, May 10, 2022 at 05:39:40PM -0700, Mike Kravetz wrote:
> >>> On 5/10/22 14:30, Mike Kravetz wrote:
> >>>> On 5/8/22 23:27, Muchun Song wrote:
> >>>>> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> >>>>> index 029fb7e26504..917112661b5c 100644
> >>>>> --- a/include/linux/memory_hotplug.h
> >>>>> +++ b/include/linux/memory_hotplug.h
> >>>>> @@ -351,4 +351,13 @@ void arch_remove_linear_mapping(u64 start, u64 size);
> >>>>>  extern bool mhp_supports_memmap_on_memory(unsigned long size);
> >>>>>  #endif /* CONFIG_MEMORY_HOTPLUG */
> >>>>>  
> >>>>> +#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
> >>>>> +bool mhp_memmap_on_memory(void);
> >>>>> +#else
> >>>>> +static inline bool mhp_memmap_on_memory(void)
> >>>>> +{
> >>>>> +	return false;
> >>>>> +}
> >>>>> +#endif
> >>>>> +
> >>>>>  #endif /* __LINUX_MEMORY_HOTPLUG_H */
> >>>>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> >>>>> index 8605d7eb7f5c..86158eb9da70 100644
> >>>>> --- a/mm/hugetlb.c
> >>>>> +++ b/mm/hugetlb.c
> >>>>> @@ -1617,6 +1617,9 @@ static DECLARE_WORK(free_hpage_work, free_hpage_workfn);
> >>>>>  
> >>>>>  static inline void flush_free_hpage_work(struct hstate *h)
> >>>>>  {
> >>>>> +	if (!hugetlb_optimize_vmemmap_enabled())
> >>>>> +		return;
> >>>>> +
> >>>>
> >>>> Hi Muchun,
> >>>>
> >>>> In v9 I was suggesting that we may be able to eliminate the static_branch_inc/dec from the vmemmap free/alloc paths.  With this patch
> >>>> I believe hugetlb_optimize_vmemmap_enabled() is really checking
> >>>> 'has hugetlb vmemmap optimization been enabled' OR 'are there still vmemmap
> >>>> optimized hugetlb pages in the system'.  That may be confusing.
> >>>>
> >>>
> >>> Sorry, I forgot about the use of hugetlb_optimize_vmemmap_enabled in
> >>> page_fixed_fake_head.  We need to know if there are any vmemmap optimized
> >>> hugetlb pages in the system in this performance sensitive path.  So,
> >>> static_branch_inc/dec is indeed a good idea.
> >>>
> >>
> >> Agree.
> >>
> >>> Please disregard my attempt below at removing static_branch_inc/dec.
> >>>
> >>> I still find the name hugetlb_optimize_vmemmap_enabled a bit confusing as
> >>> it tests two conditions (enabled and pages in use).
> >>>
> >>
> >> Right. It tests two conditions.
> >>
> >>> You have already 'open coded' just the check for enabled in the routine
> >>> hugetlb_vmemmap_free with:
> >>>
> >>> 	READ_ONCE(vmemmap_optimize_mode) == VMEMMAP_OPTIMIZE_OFF
> >>>
> >>> How about having hugetlb_optimize_vmemmap_enabled() just check
> >>> vmemmap_optimize_mode in a manner like above?  Then rename
> >>
> >> I'm wondering is it necessary to do this? vmemmap_optimize_mode
> >> is a internal state in hugetlb_vmemmap.c, at leaset now there is
> >> no outside users who care about this.  Open-coding may be not
> >> an issue (I guess)?  If one day someone cares it, maybe it it
> >> the time to do this and rename hugetlb_optimize_vmemmap_enabled()?
> >> I'm not against doing this, just expressing some of my thoughts.
> >> What do you think, Mike?
> >>
> >>> hugetlb_optimize_vmemmap_enabled to something like:
> >>> hugetlb_optimized_vmemmap_possible().  Sorry, I can think if a great name.
> >>>
> >>
> >> At least I cannot come up with an appropriate name.
> >> hugetlb_optimize_vmemmap_may_enabled()? It's not easy to come
> >> up with a good name.
> >>
> > 
> > Instead of renaming, how about remove hugetlb_optimize_vmemmap_enabled()
> > directly?  I found there are only two places (mm/memory_hotplug.c and
> > arch/arm64/mm/flush.c) except include/linux/page-flags.h where use this
> > helper.
> > 
> > In arch/arm64/mm/flush.c, we could replace it with
> > 
> >   if (PageHuge(page) && HPageVmemmapOptimized(compound_head(page)))
> > 
> > In mm/memory_hotplug.c, I have a plan to remove it as well (I'll
> > post them out after this patch merged).
> > 
> > Finally, there is no outside users of it, we could remove it and squash
> > it into page_fixed_fake_head(). What do you think this, Mike?
> 
> That sounds good.
> 
> Sorry for all the questions/suggestions around
> hugetlb_optimize_vmemmap_enabled.  It just caused me a little confusion
> as it is providing information on two conditions.  I wanted to prevent it
> from causing confusion for others reading the code in the future.
>

Sorry for the confusing. I'll post the subsequent patches ASAP.

> This patch as written is fine with plans for a follow up to remove
> hugetlb_optimize_vmemmap_enabled.
> 
> Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

Thanks Mike.
