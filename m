Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010EDC0015E
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 15:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236750AbjHKP7c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 11:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233506AbjHKP70 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 11:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8E6270F
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691769521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y47dcoSrlBDE5lrGiXLN0L0KffGDDtLt9u6t3k003Zc=;
        b=GOuXqk1/izYawDZKm5Yp0Rwo8wDqBeHJ6emKL6XZtRWYmk6/+k3k5LoD6WeOMtU3xNSOif
        mC/YuRKRehD5FnTBPV4kEYWk4MJp9qA+jKaIC3xXMGewXZs7JWJTgaLceFJ6Ny7f/3GCPG
        GycuC0FR7rHcf9RTBwNWA9g+BcLr1ZQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526--q6uiPFDOCGPvRys7KfUOQ-1; Fri, 11 Aug 2023 11:58:40 -0400
X-MC-Unique: -q6uiPFDOCGPvRys7KfUOQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-637948b24bdso5714806d6.1
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 08:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691769520; x=1692374320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y47dcoSrlBDE5lrGiXLN0L0KffGDDtLt9u6t3k003Zc=;
        b=fRY2AzclRhBj3tfRemuq4UP72gQQ2sTOEAdL/NAYJwOkg8feIfwkKjWDZgkTosfN3H
         g1N0bptB4k9FKEsnKnsw3EAESTbI8laGhMp8eW81f03V7TmJekzraDgQRyv+keB962Wu
         e+EBoIXPl46uhDYE+DYGIjw+dHaA8RoQBk0nlSU6DBXdJL61BKKu7Y+86Si7K0n2TLwb
         lnUuGETiWqx3XoWfJ12TCogBBI3i3XR/IL5Ls+DGnKPj3FF1W9yaJydHEpglQxVdjgEP
         FAZjPuhoIf/RXIz/XqszNh/RqgGNJPQnBAkWa6N99KtO0SwxbdUHpUMrKEzsJHQfqUcS
         aS5w==
X-Gm-Message-State: AOJu0YwDhoPlH/RlPI7QOH+Oy+ZRot2EV2gsc1/oH0sK+9f3RKiCQvqi
        mf9kbrWCtOoSzcLjMf9sEwW+Ml9fO9tsjgT5LtEGJ32QNTklCtzzA9/V/1zmAveH/F3lKtmCNYZ
        rrFNB1BHIH6lyYiUpgYlx2+FKk11n
X-Received: by 2002:a05:6214:2421:b0:63c:fd2d:6ff1 with SMTP id gy1-20020a056214242100b0063cfd2d6ff1mr2705578qvb.1.1691769520116;
        Fri, 11 Aug 2023 08:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmh+Ln/bhOsUI6nAHdOTMNIxEQWZcV99ppmP+3cdaKawAb9QLhtd6tpcaUaVEMHc/etnBvSA==
X-Received: by 2002:a05:6214:2421:b0:63c:fd2d:6ff1 with SMTP id gy1-20020a056214242100b0063cfd2d6ff1mr2705559qvb.1.1691769519883;
        Fri, 11 Aug 2023 08:58:39 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id z17-20020a0cf011000000b0063d561ea04csm1289065qvk.102.2023.08.11.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 08:58:39 -0700 (PDT)
Date:   Fri, 11 Aug 2023 11:58:38 -0400
From:   Peter Xu <peterx@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Hugh Dickins <hughd@google.com>,
        Yin Fengwei <fengwei.yin@intel.com>,
        Yang Shi <shy828301@gmail.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH mm-unstable v1] mm: add a total mapcount for large folios
Message-ID: <ZNZarsR7cVn/QH+H@x1n>
References: <ZNQD4pxo8svpGmvX@x1n>
 <e5e29217-11d3-a84b-9e29-44acc72222f3@redhat.com>
 <155bd03e-b75c-4d2d-a89d-a12271ada71b@arm.com>
 <ZNUbNDiciFefJngZ@x1n>
 <db3c4d94-a0a9-6703-6fe0-e1b8851e531f@redhat.com>
 <ZNVPJ9xxd2oarR3I@x1n>
 <ZNVbObUGbos73ZJ5@casper.infradead.org>
 <8222bf8f-6b99-58f4-92cc-44113b151d14@redhat.com>
 <ZNZRTmvkAlm4yeAd@x1n>
 <b001adf2-238d-1708-673d-6f512a53e1e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b001adf2-238d-1708-673d-6f512a53e1e9@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 11, 2023 at 05:32:37PM +0200, David Hildenbrand wrote:
> On 11.08.23 17:18, Peter Xu wrote:
> > On Fri, Aug 11, 2023 at 12:27:13AM +0200, David Hildenbrand wrote:
> > > On 10.08.23 23:48, Matthew Wilcox wrote:
> > > > On Thu, Aug 10, 2023 at 04:57:11PM -0400, Peter Xu wrote:
> > > > > AFAICS if that patch was all correct (while I'm not yet sure..), you can
> > > > > actually fit your new total mapcount field into page 1 so even avoid the
> > > > > extra cacheline access.  You can have a look: the trick is refcount for
> > > > > tail page 1 is still seems to be free on 32 bits (if that was your worry
> > > > > before).  Then it'll be very nice if to keep Hugh's counter all in tail 1.
> > > > 
> > > > No, refcount must be 0 on all tail pages.  We rely on this in many places
> > > > in the MM.
> > > 
> > > Very right.
> > 
> > Obviously I could have missed this in the past.. can I ask for an example
> > explaining why refcount will be referenced before knowing it's a head?
> 
> I think the issue is, when coming from a PFN walker (or GUP-fast), you might
> see "oh, this is a folio, let's lookup the head page". And you do that.
> 
> Then, you try taking a reference on that head page. (see try_get_folio()).
> 
> But as you didn't hold a reference on the folio yet, it can happily get
> freed + repurposed in the meantime, so maybe it's not a head page anymore.
> 
> So if the field would get reused for something else, grabbing a reference
> would corrupt whatever is now stored in there.

Not an issue before large folios, am I right?  Because having a head page
reused as tail cannot happen iiuc with current thps if only pmd-sized,
because the head page is guaranteed to be pmd aligned physically.

I don't really know, where a hugetlb 2M head can be reused by a 1G huge
later right during the window of fast-gup walking. But obviously that's not
common either if that could ever happen.

Maybe Matthew was referring to something else (per "in many places")?

Thanks,

-- 
Peter Xu

