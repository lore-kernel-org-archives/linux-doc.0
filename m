Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1312C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 15:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABF3423975
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 15:53:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgLQPx3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 10:53:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728709AbgLQPx1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 10:53:27 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D00AC0617B0
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 07:52:47 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id n7so20614738pgg.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 07:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7OV9R4drFVeTku6dunPe0dURgcLywII3vMyOLzHOjbo=;
        b=yIBLJwwwDEHWJYBXBXaDOCOIOlu1mzIWwwnbbYQQfRQ7LMkU8qv2JkgGg26nogIKSs
         gxn3EeARR2JyL2paSPPTy8ZZOLVboX9eX3dPocdwjayLq4ljEaMz9tUUS7eoFsq61rpO
         vQfCxyF+sy1wilxSU4GP9nCyRGicjzMz1xnoQ5CSZOMcjYmsIGmlIfL59XL6Sj/+js1P
         llf3TuHQXpH+jtwajIkC0hNlgujwNjiNEXG1kNvJwQVxRQj34fRA2bjR1G1wYaPUkZUf
         aD3n/TscPNVA97au0sGrkDHWaARlvnOewXs22G5Iewdj4dM7VdJHL6fzM0jp1uJZ1kDq
         N8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7OV9R4drFVeTku6dunPe0dURgcLywII3vMyOLzHOjbo=;
        b=NcUfnpmyUuG4bCcsJll2XhkRBfCgq9c+uCrcJADr364z3wvyOv9M5ibK6cP/JoDYHY
         glg3JdQCTPBAobawYx702uxCHTIv6G5gwGluRoq8JIj6xkmg0qiNXS7TnKyX6BBQ3U25
         Tib5lBDXLsibxKLnHxvKMtD4con2mjR7UbKZ3Iz9hjZehp5mlmd5QESZb0P/Ehl4X64H
         GwJUqMtOHgZ39YWc2xmTXa7LayXhUcRAAOSeFW3uc4KlfvODHOY1TPjiMftrZwDdIZrM
         MIhL93Kt5H6nSJMnZofqpXRQxQ0vu5UZIsjg1IIvD+4GVIA2A3AjXajxUyiW7Cvp8MUL
         2yiQ==
X-Gm-Message-State: AOAM531cW+WKyMK+3GSSfE/ImzYpz6L/bB5CHD2/cYJOUPi1CfcAt/n4
        EEkYietSnDDfEEaCMq41Jcv4vGwZHcrXe+VRT2z/Gg==
X-Google-Smtp-Source: ABdhPJyTI/Q5bVzBSZ27aLlJM/iDQhjOE7mhc5Lg63MoMB/+jhXY3WlVE+4+B5+ELdOXR7SAXo9VOCUMfJ9+AK6tiv8=
X-Received: by 2002:aa7:979d:0:b029:1a4:3b76:a559 with SMTP id
 o29-20020aa7979d0000b02901a43b76a559mr22509754pfp.49.1608220366075; Thu, 17
 Dec 2020 07:52:46 -0800 (PST)
MIME-Version: 1.0
References: <20201217121303.13386-1-songmuchun@bytedance.com> <20201217145953.GA13874@linux>
In-Reply-To: <20201217145953.GA13874@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 17 Dec 2020 23:52:09 +0800
Message-ID: <CAMZfGtX__Ys+ccGyMBYTO+i+0u+btaK1NF6tSafTP3B53zm+cg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v10 00/11] Free some vmemmap pages of
 HugeTLB page
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
        David Hildenbrand <david@redhat.com>, naoya.horiguchi@nec.com,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 11:00 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 17, 2020 at 08:12:52PM +0800, Muchun Song wrote:
> > In this case, for the 1GB HugeTLB page, we can save 4088 pages(There are
> > 4096 pages for struct page structs, we reserve 2 pages for vmemmap and 8
> > pages for page tables. So we can save 4088 pages). This is a very substantial
> > gain. On our server, run some SPDK/QEMU applications which will use 1024GB
> > hugetlbpage. With this feature enabled, we can save ~16GB(1G hugepage)/~11GB
> > (2MB hugepage, the worst case is 10GB while the best is 12GB) memory.
>
> Is the above really true?
> We no longer need to allocate pagetables, so the savings go up to 4094, right?

Yeah, you are right. I forget to update this.

>
> I will be off for a few days but I expect to get back to this and review the
> missing bits when I am back.
>

Thanks.

> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
