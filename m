Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069B6C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 12:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbiEPMEA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 08:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiEPMD5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 08:03:57 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9571EC63
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 05:03:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id q18so14186542pln.12
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R84IxflJzQsjcs6liOC1xGi2RLfZVO/J/zvMOYtMBKI=;
        b=W7DK2qATwEyfvh21pVCPdp+fSj3B28j0KvO+lqsOPxPZIH7RUOgXti2vLaZX56uPLi
         Zf54oYdtq6IyZAvY5uSVv4DttuV81ENkrczCOrwjaDIK6BuZ9TEuvUnmtPYCDQda5SK1
         2UJO3Wpu94Gdhwd/Yp8g9Rz4sXJ3VK/C2xxsZHY0ElYNMbFV7cttoOT3unYS/7uyE5ZQ
         PCp8z3w4j1eNrioDSgF9sfHye+GKmDpwe/cqZLfIukhxqI9gEH+uocUTdY3ZuzdW8+Rr
         8/PJoYZ+p6cGNJWT50couq1k2JPjXlYhEQyNWCCb7k0tVbkNVfl77lsAuuK09mYxx+sm
         4Ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R84IxflJzQsjcs6liOC1xGi2RLfZVO/J/zvMOYtMBKI=;
        b=p035jT8Euaz0DaAomGo9i2ucq0v9ol2uCj46gV1Cc1fn4tWu+y4Ye8ElMdBkN4fK4D
         YlAQ/+cWW1MExuwG3jYn1jA4NLhktpdgxOF1m8UvdGUTV0SltS2OEepfA5baGZ0fjeEr
         /lKx2Uk3IqbN+64E9DcSHYWAOFURtn1z2RtM5JUsTKY8/tOg/k7v8xQ0yMoG8bSyz48j
         CAb8VSnOrFCqUVwa22L0W99jdhRPUdBSJg5u2IR4i7kjyP6wmVORqCvDOdWAbizsg7aZ
         o3w5Gd3yPmFvjWfJuUmOiWNEjoP3FHFKP1Tg/WoBnEbtx04fmUM3TP4Xk+VRJfvxMEZJ
         bDzA==
X-Gm-Message-State: AOAM533Vx3W79+I37O7eQ4Hiz/QbLVXyQlKqVfYS3n//dyKVGs/yITrA
        9ejYo9JPwogObYvmOwzw2ugtLg==
X-Google-Smtp-Source: ABdhPJzxfHYjLSn309uprN3vFeZ39gfOTL/8yBip6LIvpYKa3y23U3WenfTaxzCyUzgFpLJTj7UIKw==
X-Received: by 2002:a17:90b:48d1:b0:1df:4fc8:c2d7 with SMTP id li17-20020a17090b48d100b001df4fc8c2d7mr5686526pjb.45.1652702633331;
        Mon, 16 May 2022 05:03:53 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id n22-20020a056a0007d600b0050dc7628139sm7015117pfu.19.2022.05.16.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:03:52 -0700 (PDT)
Date:   Mon, 16 May 2022 20:03:49 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Oscar Salvador <osalvador@suse.de>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        david@redhat.com, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v12 4/7] mm: hotplug: introduce
 SECTION_CANNOT_OPTIMIZE_VMEMMAP
Message-ID: <YoI9pdLzB/V9Kw1y@FVFYT0MHHV2J.usts.net>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
 <20220516102211.41557-5-songmuchun@bytedance.com>
 <YoIptjs65NgT1/ed@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoIptjs65NgT1/ed@localhost.localdomain>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 16, 2022 at 12:38:46PM +0200, Oscar Salvador wrote:
> On Mon, May 16, 2022 at 06:22:08PM +0800, Muchun Song wrote:
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -913,6 +913,13 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
> >  	ms = __nr_to_section(section_nr);
> >  	set_section_nid(section_nr, nid);
> >  	__section_mark_present(ms, section_nr);
> > +	/*
> > +	 * Mark whole section as non-optimizable once there is a subsection
> > +	 * whose vmemmap pages are allocated from alternative allocator. The
> > +	 * early section is always optimizable.
> > +	 */
> > +	if (!early_section(ms) && altmap)
> > +		section_mark_cannot_optimize_vmemmap(ms);
> 
> Because no one expects those sections to be removed?
> IIRC, early_section + altmap only happened in case of sub-section pmem
> scenario?

Right. The commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
has more information.

> I guess my question is: can we really have early_sections coming
> from alternative allocator?
>

We can't. The early section does not consider partially being
populated currently.

> I think this should be spelled out more.

I think you mean add some comments here to describe the case
of early_section + altmap, right?

Thanks.

