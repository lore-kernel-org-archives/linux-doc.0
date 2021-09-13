Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135DCC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 16:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAFA360FF2
	for <linux-doc@archiver.kernel.org>; Mon, 13 Sep 2021 16:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240672AbhIMQxj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Sep 2021 12:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240665AbhIMQxi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Sep 2021 12:53:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CB0C061574
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 09:52:22 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n2so22520983lfk.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Sep 2021 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7Yl//dy5tlfXJpNjGw/RwytM2u2c4Gl1NK7VqTyQik=;
        b=KNPJ8GcEHSQYCyweuG+VxPhO+NQJEAV5rGoLEtdlZyPcGARXJQ4RTZmYrXPQfJq0v+
         JanZlPaQbOkPRxSWiNI7mgttz1ig7R1UWK98/qdxhmYcIdlNdL9m9uVRXNb+ON8CCUur
         Vi9ROjD9c/UG3PSZEYPWnZvIs+mpSkp1gAPlYOOV1lg1vbFVacUc2xpLTvh/AmsP+JgO
         4CrYqxGaCg/pOU8W4zn7fgOltRuocCUBGyxISE3mCIfbIKI1U3Q4O+bntohv6KwRgW+T
         qOJmtLwKuZdVpRejUHOK+0Qj6SFpB03AyU99MOkQ/8LtIFscGQ+9aG4sMtPZh+ra5Rex
         hqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7Yl//dy5tlfXJpNjGw/RwytM2u2c4Gl1NK7VqTyQik=;
        b=VPYu6h1D3vQUKUhV6N0Pt64gGpVRtdXg+uI5ODg8DGgnRqcI4TeeN7u6pOdennalcK
         xCjIzsJUMQHxmG7yfYO13JefeZ7MSlhRQKvGcVXDg962PAJn11jkvZFq7YmYXYu4vlQ5
         vhsV+3jF/xELvGgeH0vrndUipLVxFA4D6PMTfrpV3TPfirIQ53SYNBFp3G+wxvFNWrNN
         3go2EWqoIdx9OoRNK+r6kagHSBKJNWUS5ZAzrABXqG4JbvlL67jSWs9qJLs4x4tCLxxI
         r3DN/F8hpQphQQV7i2Yk2lgwKPTKvmlLe36E7rtkleNg9TeyM2uJO8+OBLnFSKaUMU7q
         vtkA==
X-Gm-Message-State: AOAM533qen1+DGR8uRAXLwkMHQp+2ecUYMmez5rVYap8RhGYpe3EkACC
        kI/hlBiCKwyAumG/TsM7uHsQ7DPyiqo4bAStvTtemg==
X-Google-Smtp-Source: ABdhPJzCAM1ELjBbRxjqidCSeOp6uM/bwe4+ZcMAmINHRMWKcX6tqFGPCAcCIcI3Cvdy9FWpXQH7U/5uwggj7OdIvNY=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr9909008lfp.368.1631551940275;
 Mon, 13 Sep 2021 09:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <50b83893065acaef2a9bc3f91c03812dc872f316.1631504710.git.brookxu@tencent.com>
In-Reply-To: <50b83893065acaef2a9bc3f91c03812dc872f316.1631504710.git.brookxu@tencent.com>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Mon, 13 Sep 2021 09:51:44 -0700
Message-ID: <CAHVum0dmTULvzD6dhr4Jzow-M1ATi-ubDkO5wQR=RQmWtt_78w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] misc_cgroup: introduce misc.events and misc_events.local
To:     brookxu <brookxu.cn@gmail.com>
Cc:     tj@kernel.org, lizefan.x@bytedance.com, hannes@cmpxchg.org,
        mkoutny@suse.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 12, 2021 at 10:01 PM brookxu <brookxu.cn@gmail.com> wrote:
>
> From: Chunguang Xu <brookxu@tencent.com>
>
> Introduce misc.events and misc.events.local to make it easier for

I thought Tejun only gave go ahead for misc.events and not for
misc.events.local.

> us to understand the pressure of resources. The main idea comes
> from mem_cgroup. Currently only the 'max' event is implemented,
> which indicates the times the resource exceeds the limit.
>

For future emails, please provide the links to previous discussions
like [1], [2],...

> @@ -36,6 +41,8 @@ enum misc_res_type {
>  struct misc_res {
>         unsigned long max;
>         atomic_long_t usage;
> +       atomic_long_t events[MISC_CG_EVENT_TYPES];

Since there is only one event type for now, my recommendation is to
not use the array and just use a single atomic_long_t.

>
> +static const char *const misc_event_name[] = {
> +       "max"
> +};
> +

We will not need it if you remove the array in struct misc_res.

Thanks
Vipin
