Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9052CC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Feb 2022 07:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240513AbiBKHzL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Feb 2022 02:55:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbiBKHzL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Feb 2022 02:55:11 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5AFBC1
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 23:55:09 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id v186so22559558ybg.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFWl4N/6J5B3bDAo1+3Ti4QnX8z8+sO+me8z+ZLOUek=;
        b=qImMfzX75nIsucO3r+h4uLRvcljZb3e7cr/WNACPHJseT0wYpE9507AdRswD3BvGcR
         c36waKHvaxSDJJummhi4bJsR2ZLUt2d19KAIGpgKboZnYuF7ha5MRCfYuuoYNarP46uo
         BPS60oFB1TJ2GEuA/ji+qgOsZmXfkXVIvv/Gvs6Z/gl3AZzJMtClIm/Kbtym6xfkssji
         x202KzM8rI70bEVFKE9ibYuQeV44gloJmmEZzTLTQwjCdc/Y5a8ROxZc/DxHH7sGpxJp
         v2dj8ksVJyvEtVF57xwkgvWynBtLm9sLtOxOyRKx4lYob1PClOU2Pq8ckanFQXKMX4sw
         o3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFWl4N/6J5B3bDAo1+3Ti4QnX8z8+sO+me8z+ZLOUek=;
        b=1y4R5e0r9ifYT4EtuWcC6e1aVxBcnKYgvY2ex1BbsQ/x1wdUULC4SQ5boCPBCkKxga
         kCkLC6pDWuFGWhH+7ebNqxr0sioL2BV4WlnCvWI4Z+rBQA7WByZrzFbM6JAS/gZ+/Xzj
         nt4l1vw2et9MkF+LSjwr/LunL0zsd8GJ2lOfs0KUtjJW2RmYXi53fq0SsLK/ooCY3U4B
         tOWWbVP/7KK+7ARi2nQCE4HBTLmNgGZS6/Td2e+94gS7v2lSMj3+FsZIZKUNj11IRkZ6
         kP/s9/KIo14xSG6v6UttwRzBGRvMZwQhf5Ah7muoH0g0zP+bqjOrxLuefmg2koWJw0QE
         rOQg==
X-Gm-Message-State: AOAM531JtSyqb81pbT9jeNBOdnkLoE5eHNaWkWDPaabUEA28FaC3rRm/
        wGubu9MUBRdJYpdQIHhwZ6QtGPuyhgN9KweFIJdeqA==
X-Google-Smtp-Source: ABdhPJz36OYGiW0l0r/oylHwfdCxsXvMNwCMmoqyD81+7Jri0bGHPdZ9d2xirwVPfwxyo/MAFmCVBhn5Pt50YkwkrZ0=
X-Received: by 2002:a81:4524:: with SMTP id s36mr478438ywa.331.1644566108982;
 Thu, 10 Feb 2022 23:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com> <20220210193345.23628-3-joao.m.martins@oracle.com>
In-Reply-To: <20220210193345.23628-3-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Feb 2022 15:54:31 +0800
Message-ID: <CAMZfGtXM0S1L-AbMXVuCEjFLns4X-jG3mk2js-fFw0uk0RfBHg@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] mm/sparse-vmemmap: refactor core of
 vmemmap_populate_basepages() to helper
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In preparation for describing a memmap with compound pages, move the
> actual pte population logic into a separate function
> vmemmap_populate_address() and have vmemmap_populate_basepages() walk
> through all base pages it needs to populate.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  mm/sparse-vmemmap.c | 51 ++++++++++++++++++++++++++++-----------------
>  1 file changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index c506f77cff23..e7be2ef4454b 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -608,33 +608,46 @@ pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
>         return pgd;
>  }
>
> -int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> -                                        int node, struct vmem_altmap *altmap)
> +static int __meminit vmemmap_populate_address(unsigned long addr, int node,
> +                                             struct vmem_altmap *altmap)

How about making it return a "pte_t *" instead of int. If it returns NULL
meaning NOMEM. I'll explain the reason in the next patch.

Thanks.
