Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C5EC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 23 Apr 2022 14:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbiDWObG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Apr 2022 10:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiDWObG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Apr 2022 10:31:06 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1956926540
        for <linux-doc@vger.kernel.org>; Sat, 23 Apr 2022 07:28:05 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2e644c76556so93882287b3.15
        for <linux-doc@vger.kernel.org>; Sat, 23 Apr 2022 07:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DXAXkVZYPHcetFXE1oISHIeSMz1Xot5LLxB15W3LMjk=;
        b=tQibwGA8uz8Ue+E3pvs+c8ZLtax4gGb4dFOV3dy8bzYAyRQotxBRYtX3oExAAr/e5W
         lcJykMgKZDqXuCRcUTWrpgdKqNqa7SDK7R5LQ1iWkeMFOMj4/GvkIliYrru0Fcz3ot5h
         cvD+hIJBFRnHqnE3eBGsznogk3ef/KiPrus6ZbeRLGrGf+/GlLHeLPEohW773ai5NpM2
         pXrvOgHb8VQuBDo7BbJ8vcpHd3CLD6msHLW5xjWZJUln3dl7h6R0dYjUMivzqyXucYGI
         E+67TMHQeiyQW5PXgSo8AKsLGTtBzdyQAAlPZ+C99mPyDJfjZvDTgswF9XlojwtZrxoc
         qXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DXAXkVZYPHcetFXE1oISHIeSMz1Xot5LLxB15W3LMjk=;
        b=t9O3A8U703UiVHheAjmZUst3H0gDYH/Aw469vtSm7LuADLJhcAW7xECzUD9vKVrHN1
         JRnK2uiqk78QKt6Lcaochl7U2xjVD8EYSyhWFvdGhhhf452Lvlf0Y1F0Mvfh9m1GYN2I
         c0I7oEPHXJY6Vq//Cc21a5KAhGKwLY6mdkoZCNW41t9wTOEOV1UEwhuqIDTmGjb8Sxfb
         2m7DlNyqkV2VRgFoKG8+JLaoIKXMsBun3JscSSaWzB/WdLCUNY+zWrUamka5SbZwXMpL
         4tT17iUwR//A4wdsEShy0pB9S7MjCToKItDnmX2LScdH2SgbDU2efMklA14j7BXocg8t
         ViwQ==
X-Gm-Message-State: AOAM5319//5Q2Y0x5WthMnNJUxTjoX3+9lFO5tGFya/2qJOaAxog+pxx
        25Pxu8snFyt2aCGMJm2Oj2uJUA6GALewbA==
X-Google-Smtp-Source: ABdhPJymwLMUEIWwXLSUSEFl1hrUHDozuSw0iJLPBiMCTcvECf3BdD1JzQSLUMCkewcVDkKmZFBQ5OvW5vc+iw==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:28b])
 (user=shakeelb job=sendgmr) by 2002:a05:6902:124b:b0:644:c3bf:fa2d with SMTP
 id t11-20020a056902124b00b00644c3bffa2dmr9159316ybu.462.1650724084357; Sat,
 23 Apr 2022 07:28:04 -0700 (PDT)
Date:   Sat, 23 Apr 2022 14:28:01 +0000
In-Reply-To: <20220421234426.3494842-5-yosryahmed@google.com>
Message-Id: <20220423142801.gnvd42cdcsz4hpon@google.com>
Mime-Version: 1.0
References: <20220421234426.3494842-1-yosryahmed@google.com> <20220421234426.3494842-5-yosryahmed@google.com>
Subject: Re: [PATCH v4 4/4] selftests: cgroup: add a selftest for memory.reclaim
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

On Thu, Apr 21, 2022 at 11:44:26PM +0000, Yosry Ahmed wrote:
> Add a new test for memory.reclaim that verifies that the interface
> correctly reclaims memory as intended, from both anon and file pages.
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index f2ffb3a30194..5f7c20de2426 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -760,6 +760,91 @@ static int test_memcg_max(const char *root)
>  	return ret;
>  }
>  
> +/*
> + * This test checks that memory.reclaim reclaims the given
> + * amount of memory (from both anon and file).
> + */
> +static int test_memcg_reclaim(const char *root)
> +{
> +	int ret = KSFT_FAIL, fd, retries;
> +	char *memcg;
> +	long current, to_reclaim;
> +	char buf[64];
> +
> +	memcg = cg_name(root, "memcg_test");
> +	if (!memcg)
> +		goto cleanup;
> +
> +	if (cg_create(memcg))
> +		goto cleanup;
> +
> +	current = cg_read_long(memcg, "memory.current");
> +	if (current != 0)
> +		goto cleanup;
> +
> +	cg_run_nowait(memcg, alloc_anon_noexit, (void *) MB(50));

Don't you need is_swap_enabled() check before deciding to do the anon
allocations?

> +	sleep(1);
> +
> +	fd = get_temp_fd();
> +	if (fd < 0)
> +		goto cleanup;
> +
> +	cg_run_nowait(memcg, alloc_pagecache_50M_noexit, (void *)(long)fd);
> +	sleep(1);

These sleep(1)s do not seem robust. Since kernel keeps the page cache
around, you can convert anon to use tmpfs and use simple cg_run to
trigger the allocations of anon (tmpfs) and file which will remain in
memory even after return from cg_run.
