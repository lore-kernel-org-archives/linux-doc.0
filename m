Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395C7C001B0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 22:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjHKWTP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 18:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjHKWTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 18:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7432ECE
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 15:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691792307;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bmeas2NEzxsPQpZufMSchtFdVh8A95sRbIu+0MZwtg4=;
        b=fLUNQ60FqxHQwfZ3xxC63cIjxiPyaEKzuHh4biyB7XuWnYhwP/QcezItG9RcGEZJrKtI7O
        htzpGaoOI0/XwEeJgI4ik84dhHeauOWOtI/DeKhY7V1eTbEzPIuc25MO6K7JgG7PdHkuHG
        ul8dMMDoil9CCgT/KKAJIGDmfXMpQsc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-z9lAwz2cME6VssFluwYVgQ-1; Fri, 11 Aug 2023 18:18:26 -0400
X-MC-Unique: z9lAwz2cME6VssFluwYVgQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76cde638658so72200685a.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 15:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691792306; x=1692397106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmeas2NEzxsPQpZufMSchtFdVh8A95sRbIu+0MZwtg4=;
        b=kHkAvocQrgKYr+49lq9nYz8Uvx3VNBl0qZuGKAq3YtYtxcFx9vs93j3YZMXe2m8BhX
         ws9SQ74bg6xi/RzdlLGjmG7RjqtqaVvn5GLvl48q6yZ33uXYoVWw5WAsPHcT6yjKfibm
         Mw8LS1TLgruKjGnNuiZdxjdsS2KXUcqJag3vx3tIjf4UCe3Se3uPUgrXEMAi9o/TPwA7
         OI1gukQIaEEEvdCakCK2YSa5pqREw5VZj0r0BTMSprysMo1OKXJMN/iCIeNXmnlK98A5
         /sz8RbZGSZlDg7/+XdoueaI4MY6pIMZPv4D9Ah4c0LibtNe3G61MEDD1OSUNRe9Q9f70
         x6/Q==
X-Gm-Message-State: AOJu0YyGseAmupyRfZYUfe90HrLqYFoufwnYLWh0Od8z40njyfpjh1O3
        v/qsRTPyO8cb6nxV/7GKXyYoxCvB6WKIn0C36kSn38PnXQ1jY8dSNoIygnQJqDasYhiCY5h+YNz
        U/XERqugBKvb4Je5xcuLG
X-Received: by 2002:ac8:5995:0:b0:40f:f509:3a85 with SMTP id e21-20020ac85995000000b0040ff5093a85mr3138545qte.6.1691792305854;
        Fri, 11 Aug 2023 15:18:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUxOrMW7NnKDkIKGGX7eyKW3GFX6pksc6x+BXUwwIhVMYQQt6D3U4Z0wLLpDBFfKmHZ6W4Fw==
X-Received: by 2002:ac8:5995:0:b0:40f:f509:3a85 with SMTP id e21-20020ac85995000000b0040ff5093a85mr3138525qte.6.1691792305540;
        Fri, 11 Aug 2023 15:18:25 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id h11-20020ac8744b000000b00403ad6ec2e8sm1444566qtr.26.2023.08.11.15.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 15:18:24 -0700 (PDT)
Date:   Fri, 11 Aug 2023 18:18:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Zi Yan <ziy@nvidia.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNazr4ylywFZcIcG@x1n>
References: <ZNUbNDiciFefJngZ@x1n>
 <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com>
 <ZNVPJ9xxd2oarR3I@x1n>
 <ZNVbObUGbos73ZJ5@casper.infradead.org>
 <8222bf8f-6b99-58f4-92cc-44113b151d14@redhat.com>
 <ZNZRTmvkAlm4yeAd@x1n>
 <b001adf2-238d-1708-673d-6f512a53e1e9@redhat.com>
 <ZNZarsR7cVn/QH+H@x1n>
 <8aac858e-0f12-4b32-e9df-63c76bdf2377@redhat.com>
 <14C73423-C643-4B72-B3DD-573F5636B5E0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <14C73423-C643-4B72-B3DD-573F5636B5E0@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 11, 2023 at 12:11:55PM -0400, Zi Yan wrote:
> On 11 Aug 2023, at 12:08, David Hildenbrand wrote:
> 
> > On 11.08.23 17:58, Peter Xu wrote:
> >> On Fri, Aug 11, 2023 at 05:32:37PM +0200, David Hildenbrand wrote:
> >>> On 11.08.23 17:18, Peter Xu wrote:
> >>>> On Fri, Aug 11, 2023 at 12:27:13AM +0200, David Hildenbrand wrote:
> >>>>> On 10.08.23 23:48, Matthew Wilcox wrote:
> >>>>>> On Thu, Aug 10, 2023 at 04:57:11PM -0400, Peter Xu wrote:
> >>>>>>> AFAICS if that patch was all correct (while I'm not yet sure..), you can
> >>>>>>> actually fit your new total mapcount field into page 1 so even avoid the
> >>>>>>> extra cacheline access.  You can have a look: the trick is refcount for
> >>>>>>> tail page 1 is still seems to be free on 32 bits (if that was your worry
> >>>>>>> before).  Then it'll be very nice if to keep Hugh's counter all in tail 1.
> >>>>>>
> >>>>>> No, refcount must be 0 on all tail pages.  We rely on this in many places
> >>>>>> in the MM.
> >>>>>
> >>>>> Very right.
> >>>>
> >>>> Obviously I could have missed this in the past.. can I ask for an example
> >>>> explaining why refcount will be referenced before knowing it's a head?
> >>>
> >>> I think the issue is, when coming from a PFN walker (or GUP-fast), you might
> >>> see "oh, this is a folio, let's lookup the head page". And you do that.
> >>>
> >>> Then, you try taking a reference on that head page. (see try_get_folio()).
> >>>
> >>> But as you didn't hold a reference on the folio yet, it can happily get
> >>> freed + repurposed in the meantime, so maybe it's not a head page anymore.
> >>>
> >>> So if the field would get reused for something else, grabbing a reference
> >>> would corrupt whatever is now stored in there.
> >>
> >> Not an issue before large folios, am I right?  Because having a head page
> >> reused as tail cannot happen iiuc with current thps if only pmd-sized,
> >> because the head page is guaranteed to be pmd aligned physically.
> >
> > There are other users of compound pages, no? THP and hugetlb are just two examples I think. For example, I can spot __GFP_COMP in slab code.
> >
> > Must such compound pages would not be applicable to GUP, though, but to PFN walkers could end up trying to grab them.
> >
> For FS supporting large folios, their page cache pages can be any order <= PMD_ORDER.
> See page_cache_ra_order() in mm/readahead.c

Ah yes..

> 
> >>
> >> I don't really know, where a hugetlb 2M head can be reused by a 1G huge
> >> later right during the window of fast-gup walking. But obviously that's not
> >> common either if that could ever happen.
> >>
> >> Maybe Matthew was referring to something else (per "in many places")?
> >
> > There are some other cases where PFN walkers want to identify tail pages to skip over them. See the comment in has_unmovable_pages().

Indeed.

Thanks!

-- 
Peter Xu

