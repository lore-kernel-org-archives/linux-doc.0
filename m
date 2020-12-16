Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3197FC2BBCA
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 13:16:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF733233F6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 13:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgLPNQy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgLPNQx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 08:16:53 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22C3C06179C
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 05:16:13 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id t22so7181994pfl.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6L/Wca1HGpPpa8Kh87M7g3rfUrMbWp/MdbGStsV9q74=;
        b=SWzCDPmcgXHs8joj9qsdVal5fb97rP3JSZA+RfX5NW4sOoD6PDFUWw8HlZbVp35nAM
         vo7Cw5cdtSKbSszTsDBQCK3DfpTPLolbbpBWIr4goIplFh3u/tnaS+lfNu5Y/o7nl129
         iSTvpEpq/8cMFGcVMhpb186Hp9u2yWHGGEek7OC9lKjehizFkCdW5c2OKAVkfI3DMlHN
         4KGax+88yDxGHXEEyGG9qM4l2si2jsBdas3QF1F9YGuScXgmWib7Z07cw+kAmorgOgyB
         K09haO30kL0q8C10hSx6N8jYvprB1SpNaiZMBI8sSaNXjt5QtekvTZEQIB5zW1OfEBck
         Gg2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6L/Wca1HGpPpa8Kh87M7g3rfUrMbWp/MdbGStsV9q74=;
        b=nhyQk4KCmAcjKF+BydDb3VYIy48BbqDHYY0TftA/HsZV2pQy2C3nh8mg7HmVvUzk4l
         sn9RblaIhNY/Tk/CApeGpUL4DcKggETZ1fH7i6aLgG4ZLZjDOXeJ92BG3GbfOGKArMe+
         jG2yW2hAuyf/nqLv50lL7fC1UbbURZ1xBEAYyQPWhL/qguISxESjgACzgTdEcCuQefy4
         iSkNxFtokoReHV1TsP5OGjMQFFa8qeIxT0Yw+9yt7xBg/ynCgmiXrrxTUY5b4eldTUol
         FtxO52USHzZ6oGVbJNUywLg9TrsxF6KB+wYKQCkaQ91clUktR5u3GOZ2HL0d8N65xcNf
         bHjw==
X-Gm-Message-State: AOAM531TMd68xL/fm40LQApy3jmxyZI9+j98FB8XhNDY+peIhwIF0vLb
        +VHkLKS0Sgt3xtxQAcydBE3nU1HOg/WQ3ZZVrW6Rxg==
X-Google-Smtp-Source: ABdhPJylbsG1/G9W61nTZD6h2sPahKPh/KflZZGUdSMN76kQ1vt+Ic9l9fa2bzPc8XCZvW314mfL25BcdqesvEHu4f8=
X-Received: by 2002:a63:50a:: with SMTP id 10mr4997756pgf.273.1608124573269;
 Wed, 16 Dec 2020 05:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-4-songmuchun@bytedance.com> <20201216130602.GA29394@linux>
In-Reply-To: <20201216130602.GA29394@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 16 Dec 2020 21:15:37 +0800
Message-ID: <CAMZfGtXvvkjChhKL3TtTEW50P3w8ekrnUDbhZM1Z3XWgsf_n_w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 03/11] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 16, 2020 at 9:06 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Sun, Dec 13, 2020 at 11:45:26PM +0800, Muchun Song wrote:
> > +
> > +/*
> > + * vmemmap_rmap_walk - walk vmemmap page table
> > + *
> > + * @rmap_pte:                called for each non-empty PTE (lowest-level) entry.
> > + * @reuse:           the page which is reused for the tail vmemmap pages.
> > + * @vmemmap_pages:   the list head of the vmemmap pages that can be freed.
> > + */
> > +struct vmemmap_rmap_walk {
> > +     void (*rmap_pte)(pte_t *pte, unsigned long addr,
> > +                      struct vmemmap_rmap_walk *walk);
> > +     struct page *reuse;
> > +     struct list_head *vmemmap_pages;
> > +};
>
> Why did you chose this approach in this version?
> Earlier versions of this patchset had a single vmemmap_to_pmd() function
> which returned the PMD, and now we have serveral vmemmap_{levels}_range
> and a vmemmap_rmap_walk.

This approach will be more universal. :-)

> A brief explanation about why this change was introduced would have been nice.
>
> I guess it is because ealier versions were too oriented for the usecase
> this patchset presents, while the new versions tries to be more broad
> about future re-uses of the interface?

Yeah, you are right. I plan to reuse those interfaces in the feature.

Thanks.

>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
