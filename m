Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD7FC49EA6
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 851C060C3E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbhFXOzc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 10:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhFXOzb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 10:55:31 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E2AC061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:53:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j4so10741985lfc.8
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ovP/lGCXrJxv1nxs9/4YwxIKrqxmdrIBwP4MPn+ws9I=;
        b=e3lGtuExOlYER8W6nNo54e+F3pfIYvAlP9FQWJSVcLvPCf1Bckx3+WbCoo6Gx2ib0S
         iIdZTx6Vmw92+ej0Bkw69mWEDvOoq8TEeuIhJo0xjjrRmCOHv7r2JMQ1iYfFaydZW6+b
         rw/ZCcHRNU8PBbNMwJsl751dnqefq0axjlZvRPUzuH0grThDHS/kR/LK3hX7LRv4IuD6
         5Sw8dQU6SWkj3IY164XETlnQljc8kpaZVCmSj9XlHBWhlLsJFj/e9He2j8G40kiDfIPj
         mda1ipmPguErhZkccwfbE5Oit5kY5f6fIfm65aoLVzPnXgKrdNic1VjVVMAiBmTgGh2P
         cfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ovP/lGCXrJxv1nxs9/4YwxIKrqxmdrIBwP4MPn+ws9I=;
        b=l7aWgosJJA+Annx1t9CFLDBeHo1VLDWMsGHW89Z3z1hV6RZeJ6rIZwOxRwumCvCiiH
         /aSxrRwj8CWzumZ11tRNZpR+oLH/h4Vz31oyQ4DE6kiMSgi2vibfMn6rUrNHTPVmuC8k
         m93kaa7bV76WHLP2adXKAN6G9QDFTVJ/FFblzEHjwlSbfReHa/puwFEqb+Y1Lplk9OED
         6MCTvHiTipb9P2vzZ5cF6rL1pXSKrJJYyV35lZC9SbUObm1PrRiKisSain2SM2qTvsTr
         oz9Kx3CMK61ilmpZyRWl8FNMrNLj3+2h6HHd1rI1PL5nr1bXUT0Y214KYeQt+l+LMUVy
         dukw==
X-Gm-Message-State: AOAM530rZS+V62pNxrmHAifJPtLqdLsGs3jQXvgq2BfHZUikwEPnvtQj
        6Cd7xJVVg0MVZXUDfTtSJX7/TQDdcaaJRUDnphg1sg==
X-Google-Smtp-Source: ABdhPJxV07HPRcmp8a0+ID/KVCmXrxdr3n+dd62frBO5x/g0l97z0IK36nmYnZAJktrWd01HO+ysPAStfFzV9tf8vkg=
X-Received: by 2002:a05:6512:442:: with SMTP id y2mr2350427lfk.117.1624546390404;
 Thu, 24 Jun 2021 07:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210624102623.24563-1-sjpark@amazon.de> <20210624102623.24563-4-sjpark@amazon.de>
In-Reply-To: <20210624102623.24563-4-sjpark@amazon.de>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 24 Jun 2021 07:52:59 -0700
Message-ID: <CALvZod7gLSCqqYVR50F9-8DxG=gRL4seiHAqvSsr3A6U6cvjig@mail.gmail.com>
Subject: Re: [PATCH v31 07/13] mm/damon: Implement a debugfs-based user space interface
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, greg@kroah.com,
        Greg Thelen <gthelen@google.com>, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, Mel Gorman <mgorman@suse.de>, mheyne@amazon.de,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        sieberf@amazon.com, snu@zelle79.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        zgf574564920@gmail.com, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:26 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
[...]
> >
> > The high level comment I have for this patch is the layering of pid
> > reference counting. The dbgfs should treat the targets as abstract
> > objects and vaddr should handle the reference counting of pids. More
> > specifically move find_get_pid from dbgfs to vaddr and to add an
> > interface to the primitive for set_targets.
> >
> > At the moment, the pid reference is taken in dbgfs and put in vaddr.
> > This will be the source of bugs in future.
>
> Good point, and agreed on the problem.  But, I'd like to move 'put_pid()' to
> dbgfs, because I think that would let extending the dbgfs user interface to
> pidfd a little bit simpler.  Also, I think that would be easier to use for
> in-kernel programming interface usages.  If you disagree, please feel free to
> let me know.
>

I was thinking of removing targetid_is_pid() checks. Anyways this is
not something we can not change later, so I will let you decide which
direction you want to take.
