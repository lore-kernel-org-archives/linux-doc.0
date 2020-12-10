Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C146C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 19:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B59522571
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 19:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404307AbgLJTzk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 14:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393565AbgLJTzg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 14:55:36 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB2CC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 11:54:56 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id v22so6832795edt.9
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 11:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jiqhdpxyPB2qhSSL8lmFRULkbulVtgbgM3x8Yn9WIks=;
        b=AQf++TUte2ltHpibq5Gju3qOiL3gtd1QwSaE59Zg0LsQw0zfjWW1HRIjo9mBANVxxH
         g2yUJArXsTS3kiJYk8vnpJm/oDoorxtLFcUedB6/Ott4sfP1HkYEs9t7U26t6bey9sTA
         Er4F3CqzLKP85p3pj8B2B6a7zErOigfFrDZZ9E7gNU686C6eHUdLXUmgUjC2P4bVgU/t
         Oll8359JTX5UYeF11kTF1p01Spfeg705guksa4L+rg+PsJ7z3XD0xgGoF7BtmGAl7g7Q
         /+qZmbbMRwbJxIZ7nzM/qn2BqIpL3ylAOl0oe7DirzZefatNhRi/T6dEcsk+MYr6sXSa
         cF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jiqhdpxyPB2qhSSL8lmFRULkbulVtgbgM3x8Yn9WIks=;
        b=oE1sfudcB/4Ix+i/g710ud7KgAl+XzcRGCC7vom8/NO78FCwKPuj/CXrT9F4jzadce
         eLnRUvZ/4HVX/C6Mz4NWsETg4rqy5djjsH6gjqU8eOSf44XC3KReo9F6PecwqpFSi/bI
         mNlQUuM55Vqy+bFjf3cNSgSsLqxkWfqxJqrM/MW5H7WHfrUF+gVexHaSWs4RRMNawPUu
         MCA4t5ZmbCpHNaX5nJiQFLx59o3eUHcYGngEzMBrnU6Y/obPH/1p+4mxRUy2pfUoRzdI
         +J75fL6eG0shNNxWthTHge2OUtjZEnDgxgeI9C9vLmbta8nFs8Gu3IajHk+uCcxXhu4M
         /g/g==
X-Gm-Message-State: AOAM531Gy7ljChsG9LFXNugMsLkB8WrMg/K2BSyV51krPwrK2eZqBgfv
        iaZMfsZZO1JloScN6wT399noKd7Jga+3HGcplK2hLA==
X-Google-Smtp-Source: ABdhPJy6P/1OMDVVi/Mgffhj7q+Ecrh69fmJZ7dv7K4HV4Uijlx/0siUn7Ux4OH+Kcm9DmIKFaYocoPNZYKKhggZsDE=
X-Received: by 2002:a50:d757:: with SMTP id i23mr8539200edj.116.1607630094894;
 Thu, 10 Dec 2020 11:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
 <20201210004335.64634-4-pasha.tatashin@soleen.com> <20201210040618.GR1563847@iweiny-DESK2.sc.intel.com>
 <CA+CK2bCVEnKKatQSxZcdcvNo+9rWNrGWXyLS3dnF-y7=5Ery7g@mail.gmail.com>
 <20201210174431.GT1563847@iweiny-DESK2.sc.intel.com> <CA+CK2bBbN9dxqD_ntAPACfjJmwahPEyP36cb7koVm212nzsuKw@mail.gmail.com>
 <20201210195333.GZ5487@ziepe.ca>
In-Reply-To: <20201210195333.GZ5487@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 10 Dec 2020 14:54:19 -0500
Message-ID: <CA+CK2bCgEwa=dP4mUPkYy9vF+feXiWGQPM0gv6wZTd3j5Y6nyQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mm/gup: make __gup_longterm_locked common
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Ira Weiny <ira.weiny@intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 2:53 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Dec 10, 2020 at 01:57:20PM -0500, Pavel Tatashin wrote:
>
> > Thank you. Yes, this series should be backported, but I am not sure
> > what to do about Jason's patch. Perhaps, in the next version I will
> > send out this series together with his patch.
>
> You need to send out patches that can be applied on top of linux-next,
> at this point the window to go to rc kernels is done.
>
> When you eventually want this back ported to stables then suggest they
> take my patch as a pre-requisite.

Sounds good.

Thanks,
Pasha

>
> Jason
