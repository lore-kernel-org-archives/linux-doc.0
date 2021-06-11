Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6993C48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:24:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 824B660FEB
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:24:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFKDZ5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 23:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbhFKDZ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 23:25:56 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67963C061574
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:23:46 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id q25so3311208pfh.7
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7AeKnAwYLMBGaOYXVe0aYJA8bYJeJ8yHr06kQ7H8lQk=;
        b=z1JaIyy3oBxQ0LvjmKJujrq4DLvCIXj/kORRhsaXg4FQ8DyRctogXMzDi8qjXDfQX5
         IKsP3vuoBpAqtIx3s5bdvnzUpIeeRRCbXmx3P8ROeTxD7Dj/Jsy/Avdbww6VSx59/K8D
         iUPh4Py7w8IqPQcntjuuQaevgG3LPszKolcGImKdWcGlHAGZvrh9vJi6CKUQyWfJ1Yyd
         PU0ZfLbagM3GP8lnH/ORNOcrYGlxxaQVN8yeSkskSY/x04RGUCBjKjf8uLNop7r5Cuvd
         VoonSIU6JwPPUN4NZcJsNZkFcvSQA0jSfJz5BDjQV9nO4B+v1YUvTluAk8VZv0XVnw1r
         n8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7AeKnAwYLMBGaOYXVe0aYJA8bYJeJ8yHr06kQ7H8lQk=;
        b=DBXHDER1X9RC+1yTyFCG0Gd4F7Dfg6C4aBu2TeyjvgsCydbSq87Yhgf2wNSjezT7Cx
         NMyCGsAB59/hv0C+fOl/maxloyEjY40StqQ4gFONDSxGesQ7lXJhT5RYqCRC00tZLfYg
         yrTU1Ef0kX/3sTVt4p3BtwOsNZILsMxpxYpBSAIkrMeozF9xAYNCX/jtQ7+v/6t+dQP/
         /7REAKkMyCrL/KEf7PiuF68RzvTN+e8bGLtBetdh+cdighbHg2K6hQlHzJdM8N6kai4M
         zKQANWc5n0sOZHdPEoEpDsJPFdiC0XBaV4i/hUSC/vI/kb+0FM8k/8JcdH5LstyWuUNY
         H7dQ==
X-Gm-Message-State: AOAM531mLxjN5Wool6QROTT7fCxA/DPGJ5S22Kv8G60OfgULWG4oVSLR
        0IwaQwew0NuQupVbXp06yBb5kfTGpqK39x43FgMDYw==
X-Google-Smtp-Source: ABdhPJyG1SmyYhbDe27LGm31FcQiX4uFLQqmV5JyJlZX78C2tXhJbU2v24B9Q5YXghs5rIB++Fm1LCjVeqLZ1wrr7og=
X-Received: by 2002:a65:5288:: with SMTP id y8mr1489206pgp.31.1623381824894;
 Thu, 10 Jun 2021 20:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210609121310.62229-1-songmuchun@bytedance.com> <d4fa211e-e896-e1da-017e-dafd120d3583@oracle.com>
In-Reply-To: <d4fa211e-e896-e1da-017e-dafd120d3583@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Jun 2021 11:23:07 +0800
Message-ID: <CAMZfGtW_oSv+Wz7ztwAdZfs2PVEsZtTmszD33vwQht=241CZPg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 0/5] Split huge PMD mapping of vmemmap pages
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 5:33 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 6/9/21 5:13 AM, Muchun Song wrote:
> > In order to reduce the difficulty of code review in series[1]. We disable
> > huge PMD mapping of vmemmap pages when that feature is enabled. In this
> > series, we do not disable huge PMD mapping of vmemmap pages anymore. We
> > will split huge PMD mapping when needed.
>
> Thank you Muchun!
>
> Adding this functionality should reduce the decisions a sys admin needs
> to make WRT vmemmap reduction for hugetlb pages.  There should be no
> downside to enabling vmemmap reduction as moving from PMD to PTE mapping
> happens 'on demand' as hugetlb pages are added to the pool.

Agree.

>
> I just want to clarify something for myself and possibly other
> reviewers.   At hugetlb page allocation time, we move to PTE mappings.
> When hugetlb pages are freed from the pool we do not attempt coalasce
> and move back to a PMD mapping.  Correct?  I am not suggesting we do
> this and I suspect it is much more complex.  Just want to make sure I
> understand the functionality of this series.

Totally right. Coalescing is very complex. So I do not do this in this
series.

>
> BTW - Just before you sent this series I had worked up a version of
> hugetlb page demote [2] with vmemmap optimizations.  That code will need
> to be reworked.  However, if we never coalesce and move back to PMD
> mappings it might make that effort easier.
>
> [2] https://lore.kernel.org/linux-mm/20210309001855.142453-1-mike.kravetz@oracle.com/

I've not looked at this deeply. I will go take a look.

Thanks Mike.

> --
> Mike Kravetz
