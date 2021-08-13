Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542D1C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 13 Aug 2021 12:37:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD4160F51
	for <linux-doc@archiver.kernel.org>; Fri, 13 Aug 2021 12:37:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbhHMMha (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Aug 2021 08:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240403AbhHMMgx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Aug 2021 08:36:53 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AA7C061756
        for <linux-doc@vger.kernel.org>; Fri, 13 Aug 2021 05:36:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so5355828wma.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Aug 2021 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OVsoLc8GnI2MJx0koPlkzsYORog3roebBSA9S9Lp1xo=;
        b=egAI5MaCx9xeTeaDTXJ3k5cDg0ZnINbnSaS3tFWQFxO+8aN/v/SDF1W1pqnitQiAnn
         JOdHqGMJiOhw8oNbpX0AUwKa31k8vhYnX+ilDmFTLF/bGvem4ZRyEYTMMo4/Pj4Frz2U
         a7kPYvvhIUpNfKqRAtMWAjrLfm6aekJejIKng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OVsoLc8GnI2MJx0koPlkzsYORog3roebBSA9S9Lp1xo=;
        b=O7yGiq/dyy+wVpXzHKqV4of55Tp394HvA/7Cgh/BNZ4ELi5MhfhTCJ+juW3anTclzZ
         h3xil+876NwEM9t8RNCNZbWku0fbVGNtPtV56sQLKrZCn/QDBrHMCA+welPxm39y80Cl
         DrL7OzCS29XYEe2L7JQ2pHOFcLolfo4GE9GF548P2wXsvZmwtI6FJbMio8xQYINDwUyk
         GAGxX3bdNRz+gXKk2tITyQDS9O5cWgHyuJHZTvceYQVpcPcXrF9ErHpEMDWqT8TQH/aY
         dyB+EijmOX7/VNxgf8goCoiFcG0NQkGiu58N5HP9gNzF2leK46g6TBkSppdpvrZVT5BC
         7vTA==
X-Gm-Message-State: AOAM531wpD+WVdTLEvuR6ptnxIpD/2et5UQYYytiKrOcfCaxcFMPh4iA
        ajzrHN3IsuePKT654ED+RVztSg==
X-Google-Smtp-Source: ABdhPJxeb4QSR91gkUeMJG783tEyeIzpfzA3nquA/DVh4P6/OjdbN0MZIGZVMmA0QRAaQYs8NFvqEg==
X-Received: by 2002:a05:600c:3555:: with SMTP id i21mr2386110wmq.156.1628858162782;
        Fri, 13 Aug 2021 05:36:02 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:fa59:71ff:fe7e:8d21])
        by smtp.gmail.com with ESMTPSA id q5sm1432727wrx.33.2021.08.13.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 05:36:02 -0700 (PDT)
Date:   Fri, 13 Aug 2021 13:36:01 +0100
From:   Chris Down <chris@chrisdown.name>
To:     yongw.pur@gmail.com
Cc:     tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com, tglx@linutronix.de,
        peterz@infradead.org, shakeelb@google.com, guro@fb.com,
        alexs@kernel.org, richard.weiyang@gmail.com, sh_def@163.com,
        sfr@canb.auug.org.au, wang.yong12@zte.com.cn,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        yang.yang29@zte.com.cn
Subject: Re: [PATCH v1] mm: Add configuration to control whether vmpressure
 notifier is enabled
Message-ID: <YRZnMYCN1ArhM3wE@chrisdown.name>
References: <1628855870-5070-1-git-send-email-wang.yong12@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1628855870-5070-1-git-send-email-wang.yong12@zte.com.cn>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yongw.pur@gmail.com writes:
>From: wangyong <wang.yong12@zte.com.cn>
>Inspired by PSI features, vmpressure inotifier function should also be
>configured to decide whether it is used, because it is an independent
>feature which notifies the user of memory pressure.
>
>Since the vmpressure interface is used in kernel common code, for
>users who do not use the vmpressure function, there will be
>additional overhead.

Could you please demonstrate this additional overhead with profiles or 
demonstrations of other real world effects? Thanks.
