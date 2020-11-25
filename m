Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACA1C64E7A
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC72F2083E
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NnonjqDm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730242AbgKYPal (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:30:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730172AbgKYPak (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 10:30:40 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DBFAC0613D4
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:30:40 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id i17so2734473ljd.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Slyp8M32CTo3TZBPXXq3KE8TAXlfyjLtOZIfe4y0/HM=;
        b=NnonjqDmdvZd/9bSd04OInTnpLaptAn24qZ62do7ESFB5eB8H99OFXgxMq0C0/XXt7
         WBVm0g1C8mVKkGzY594+h7Rr+u73Edked79ouedKZIUISNROONMwbnsYE9BWo27EESIz
         RY94ivrBRdtIIoBGdN6TF2EnUQfqce8rm8OcNjSJexupkBAZAYwcK/Zhjl45Tkk34cu0
         RCsJZnIqjYVRIHhtqINp47mSXVwVOoEZ45cbbCOAPETWDmpmyM5XNzRK0YjOCpAp3ogW
         UYsyRRKvgdc+uwClcNu8ktg2uLyko2UN1P0idwia0Ilbl0SHABEocGwnry2I192Hn/K2
         Z3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Slyp8M32CTo3TZBPXXq3KE8TAXlfyjLtOZIfe4y0/HM=;
        b=FOZetSPEjTOeU6I1IIb7L865ji/dymGJ7Ba32/iN3EgPb7Dh1RVQk2M5BSWbgGaj/d
         1WDKmjw4IzmvvBm2rqd3gjmC4bJ+Sc8K8voDqqQuH7821dulCTjMKyHdSrBNaSGHEqTE
         pOH4OLbfnOCAtaPIpbNij+8Tq05kxpdUysxEs2oNsCfqJWNxnfdwpCuZPYVW+28PGY10
         RvuxA7tJyx+oKD75hMN5AJvJJFJEccrZxFPmAIbKvKXLcZzqZrgXbhD7a1uwLKbA9xJh
         Mr2GTB2oEddWq5LU53rL/oP0a2M+7Ic+gxthZPNVzso8wgcPbT+HALaN63ca+zAI/nNB
         w27w==
X-Gm-Message-State: AOAM530KWRKw4V9ZEgZSsAkYStOi+YAJn5wPMSDnXBxwfusyPWd6oLiC
        pNZV6pP7vRG+iZ+/+LuXVWJAO4hoKbJ2iNoT02qtjg==
X-Google-Smtp-Source: ABdhPJwVzS1M6/iPBLepZWnkrgJKe9xWN8z9BuRiNQ1/W7SbWt/76jTFn5FM03QWJvBNkwwAfM9dHSjIgzvQnH95Cc0=
X-Received: by 2002:a2e:3c12:: with SMTP id j18mr1598680lja.192.1606318238459;
 Wed, 25 Nov 2020 07:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20201020085940.13875-1-sjpark@amazon.com> <20201020085940.13875-8-sjpark@amazon.com>
In-Reply-To: <20201020085940.13875-8-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 25 Nov 2020 07:30:27 -0800
Message-ID: <CALvZod7xhyp6yY_v6nyWp-yqHQUCtCBcxFXz=fSKOjS62HrG-A@mail.gmail.com>
Subject: Re: [PATCH v22 07/18] mm/page_idle: Avoid interferences from
 concurrent users
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, sblbir@amazon.com,
        Shuah Khan <shuah@kernel.org>, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 20, 2020 at 2:06 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> Concurrent Idle Page Tracking users can interfere each other because the
> interface doesn't provide a central rule for synchronization between the
> users.  Users could implement their own synchronization rule, but even
> in that case, applications developed by different users would not know
> how to synchronize with others.  To help this situation, this commit
> introduces a centralized synchronization infrastructure of Idle Page
> Tracking.
>
> In detail, this commit introduces a mutex lock for Idle Page Tracking,
> called 'page_idle_lock'.  It is exposed to user space via a new bool
> sysfs file, '/sys/kernel/mm/page_idle/lock'.  By writing to and reading
> from the file, users can hold/release and read status of the mutex.
> Writes to the Idle Page Tracking 'bitmap' file fails if the lock is not
> held, while reads of the file can be done regardless of the lock status.
>
> Note that users could still interfere each other if they abuse this
> locking rule.  Nevertheless, this change will let them notice the rule.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

I don't think this is allowed. I mean returning to user space with
held mutex and other processes can unlock it. I don't think mutex is
what you need. Or more importantly is this really an issue?
