Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981FEC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 19:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbiDYTVg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239610AbiDYTVf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 15:21:35 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 719C612C8CD
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:18:29 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id iq2-20020a17090afb4200b001d93cf33ae9so216955pjb.5
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=EGrHpQVhbDy5vwZTzhNYK8llc1wnwOLu4wV+jMnBYL4=;
        b=CaYfhw1w1zCr1TOBWVJ1EiBOGCE0EIxtakImw+XtoEW5vt84RvGptzaYqbrW+innlW
         +Ku88xj7fg/qsjLAFb4N18ZNeray/Se5SHppUK9OjBl0eB9PHNzoDM2LRPg44ycpi2SJ
         bjNRJBVIyxkZFe/hZdtOD8UmyZHIiFgfVHm/j3HrJhsuwLJY0Ai5lzZzWklY6oXEwfoZ
         X7ZFQXszl2q6IOU7xV6dHIkOdnvDUSnutDtxLMhn9QduayUHVDPPQG/uD1X4QAkQnYHM
         EQ8yY7q6UexyNDJjNR/gFIP/T28r2m2aPkka5RBsU4xqbdHtPNIkvuAc9lKgiFIULCS0
         BWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=EGrHpQVhbDy5vwZTzhNYK8llc1wnwOLu4wV+jMnBYL4=;
        b=EPmaErsrLgJdfeYskifURgz3OKEAYTsnLU/1Diz3id6xi6SpPGxAQ6Q0ROhz2ip6PV
         h/5wv0XQTEnEIimzlYvmoueBFe6cuCT3wBz1CedKyjqDncV6h7cqEbSJrTWBLA7RqjON
         5PPkkeydB8OfBZ2tCv8tD8Kzrgb4JDuyuWZslQ0F3qQIjsJV7bhZRonwAAYSo3MTg9jj
         vs7DEMIaKJ/sc4tYtV28KTdm3xV/rinq86JmgiY5TW8wlAxS2XPws4QRRhixfqx6w8jR
         Pi+1mm7FHucFtRKOyPlP0u0s7+51OYmqacio+SV0OMZMf7Cj5nUYL5NT736jxudc+3H8
         wdQg==
X-Gm-Message-State: AOAM5335sQlykDd2jE4TO+9XkHrij9zs3kAHXn2rkdTNgycPjsPYDeew
        ll5zX4gEkueyRiyQDtD9T7Wc4Q==
X-Google-Smtp-Source: ABdhPJxe80YjpMyc42uGIuBN4k1cDxK/sBI8c3/84Wz3/UZEwe35L5kGW2HFgSQ97+l0cr2C45Zhpw==
X-Received: by 2002:a17:902:7244:b0:158:41d3:b79b with SMTP id c4-20020a170902724400b0015841d3b79bmr19870661pll.50.1650914309214;
        Mon, 25 Apr 2022 12:18:29 -0700 (PDT)
Received: from [2620:15c:29:204:185b:8dcc:84d4:fb71] ([2620:15c:29:204:185b:8dcc:84d4:fb71])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090a970100b001cd4989ff41sm97989pjo.8.2022.04.25.12.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:18:28 -0700 (PDT)
Date:   Mon, 25 Apr 2022 12:18:28 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     Yosry Ahmed <yosryahmed@google.com>
cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 3/4] selftests: cgroup: fix alloc_anon_noexit()
 instantly freeing memory
In-Reply-To: <20220425190040.2475377-4-yosryahmed@google.com>
Message-ID: <f4aee758-c3b6-5ecb-a6e-10854a6490c4@google.com>
References: <20220425190040.2475377-1-yosryahmed@google.com> <20220425190040.2475377-4-yosryahmed@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Apr 2022, Yosry Ahmed wrote:

> Currently, alloc_anon_noexit() calls alloc_anon() which instantly frees
> the allocated memory. alloc_anon_noexit() is usually used with
> cg_run_nowait() to run a process in the background that allocates
> memory. It makes sense for the background process to keep the memory
> allocated and not instantly free it (otherwise there is no point of
> running it in the background).
> 
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>
> Acked-by: Shakeel Butt <shakeelb@google.com>

Acked-by: David Rientjes <rientjes@google.com>
