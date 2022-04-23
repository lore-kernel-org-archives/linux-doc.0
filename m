Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460E4C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 23 Apr 2022 14:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235998AbiDWOGW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Apr 2022 10:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235951AbiDWOGN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Apr 2022 10:06:13 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC4D68FBF
        for <linux-doc@vger.kernel.org>; Sat, 23 Apr 2022 07:03:15 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-2f7c5767f0fso15605767b3.4
        for <linux-doc@vger.kernel.org>; Sat, 23 Apr 2022 07:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fa8nrg7PnSBHWiz/ixAu3+CbgP2gabmfB3kka70Ad0U=;
        b=RBzRm8aigFAmC2YQq4Au63IrMg4vk5mNEbXU0HTFREh1S8MkXIo2r1//dLE4dyUX/e
         6NozTIV4b1f9CJCUnvT4w7Sx7ybqXpLGTEuCwKk4b3Cr+DCdjlOpNBVoS7xw+1IljbxX
         WY9TJe1wbjl3aDMWyDZjVVUsZQ+WpulkaJM5CwkywnoIXR0oQof2FUp7skcLKtWIfukx
         VknJtnGg5S6NNilEWi8UYh+oR7TXcfJ/JyaSL8lv6ju9ciyY4p8a1ydjQvkXybSBiEhR
         MVC/MmsNWdd9lqggkQCwKJIffrY3xA8wW9Gow+xt10wW2staPBbArzYc4Kx+820Ntvm+
         KDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fa8nrg7PnSBHWiz/ixAu3+CbgP2gabmfB3kka70Ad0U=;
        b=ZeLykB/wdO8bDWJnt/GC+jy61Dq1Tm9NHpjAw4TZ9Ts2x+/vMcwnj9OLDQxpSs/enQ
         549ytlH58w7HQSsRe9uvfEX+gEjEO0pgXKM7vBVmer/RCK34KqftzmZ8CIipnmpnhrsQ
         kew5qlZw7zDyo/REryWzH4SMStmnqM96VdzWe05S/EK8vfrMHHlGa/Hbs6IbRALj4/UE
         MGDlWgnK+1piTyA8kQ76AShFgJBpqSWzhnYQ5ccPzAZhGGdsEkn6N21OTRCiiQSnKMnF
         B0Mg70cBs19ZwkmcgNFIz2IZA7A3nB0wKOnj41ixyXo7hrIe/b+xkq2Fbb7r7J0xO60h
         Hj/Q==
X-Gm-Message-State: AOAM530gGQEzgGKxrvypKAQcetdvkVFFQCIiThmu+y2fJVVD7C9L7AXR
        JKpOvfRXvMpUWSFOHSWQs68uOWX968ISNQ==
X-Google-Smtp-Source: ABdhPJwStmJpcHiA2mFTxcNMhfws2BRPRjdd+RlFHxUK+bhjIRki3ilpkcFSKTXyuoE3Fh60b9kljL0wiOv+vg==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:28b])
 (user=shakeelb job=sendgmr) by 2002:a81:18d7:0:b0:2eb:553e:f3ee with SMTP id
 206-20020a8118d7000000b002eb553ef3eemr9135814ywy.393.1650722594556; Sat, 23
 Apr 2022 07:03:14 -0700 (PDT)
Date:   Sat, 23 Apr 2022 14:03:12 +0000
In-Reply-To: <20220421234426.3494842-4-yosryahmed@google.com>
Message-Id: <20220423140312.fxsxjwcebvor2x5l@google.com>
Mime-Version: 1.0
References: <20220421234426.3494842-1-yosryahmed@google.com> <20220421234426.3494842-4-yosryahmed@google.com>
Subject: Re: [PATCH v4 3/4] selftests: cgroup: fix alloc_anon_noexit()
 instantly freeing memory
From:   Shakeel Butt <shakeelb@google.com>
To:     Yosry Ahmed <yosryahmed@google.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>,
        Dan Schatzberg <schatzberg.dan@gmail.com>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 21, 2022 at 11:44:25PM +0000, Yosry Ahmed wrote:
> Currently, alloc_anon_noexit() calls alloc_anon() which instantly frees
> the allocated memory. alloc_anon_noexit() is usually used with
> cg_run_nowait() to run a process in the background that allocates
> memory. It makes sense for the background process to keep the memory
> allocated and not instantly free it (otherwise there is no point of
> running it in the background).
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Shakeel Butt <shakeelb@google.com>
