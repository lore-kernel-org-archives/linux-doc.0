Return-Path: <SRS0=PWN0=CW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A70C433E2
	for <linux-doc@archiver.kernel.org>; Sun, 13 Sep 2020 17:09:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38F6F2076C
	for <linux-doc@archiver.kernel.org>; Sun, 13 Sep 2020 17:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="kXjiBqYL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgIMRJT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Sep 2020 13:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgIMRJQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Sep 2020 13:09:16 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8083EC06174A
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2020 10:09:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e17so8541605wme.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2020 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NHSyG/ZtG9S0n0YZM7cSzTFQ+FkKUxE2tX0ghcDmfZ0=;
        b=kXjiBqYL6OViT3ewAjh9aCHJsTXRTaC9OZ01erzxJzAY0iuwHOa6mBt/6RPf+22jJd
         g+UbRQyTmu2YclZLlFGpfI5q/gvpZ+Fu5Z73vb11F0o9mGNsGXQvXPXxKQod18U4WBU1
         HxqWnKX+7mSCl2lhKU7uexA73WmMS93491Q9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NHSyG/ZtG9S0n0YZM7cSzTFQ+FkKUxE2tX0ghcDmfZ0=;
        b=tOi7VKC4Sg6iYaTT92pESYdGgYldeIhk3OPSPuhYE0uzc+bM8i54ju1KktbRZxQ/wm
         nqD24KQU6c4hnx/RpA3cx8IKNidV0gOJVs9sbLsgDbuZEGxjwn9W5SvOPvcovXKfBOrR
         zCPBCxd3YUQwDmXxkFoFtWDIOCkEXY/suutGOsEJ4Zn4IVxLvidu8S2T3VEXaYfHnUUF
         nrIW/7VLCFYClG8zFbzRZIJT/DwR20FwDRye9z+Ta2KfVC+4cSPNrxT6teYhu7lW/4d9
         /pOjGKMjzryrEbuajNsr5mUeebrk0X5HrCTrCroq/59G+VVMIRP9qLyK19ig4SBoi1V3
         5zXA==
X-Gm-Message-State: AOAM532XcBMUBCWTX+WLSAmjuL0FxJKYG69V1jjxqtyofL/40A00C4Fb
        2sTNgTCv9akrnE9dCi6YMSa7ig==
X-Google-Smtp-Source: ABdhPJwL1luvqQq2GdA/kvbVc2X5wQ2OPvXWO9D/pL7y3epijMqdaCQIrgYZQ16AcG8kZ+Tp9tpJIA==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr11236947wmb.101.1600016954047;
        Sun, 13 Sep 2020 10:09:14 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
        by smtp.gmail.com with ESMTPSA id q18sm15870487wre.78.2020.09.13.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 10:09:13 -0700 (PDT)
Date:   Sun, 13 Sep 2020 18:09:13 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Muchun Song <songmuchun@bytedance.com>
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        corbet@lwn.net, mhocko@kernel.org, vdavydov.dev@gmail.com,
        akpm@linux-foundation.org, shakeelb@google.com, guro@fb.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] mm: memcontrol: Add the missing numa_stat interface
 for cgroup v2
Message-ID: <20200913170913.GB2239582@chrisdown.name>
References: <20200913070010.44053-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200913070010.44053-1-songmuchun@bytedance.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Muchun Song writes:
>In the cgroup v1, we have a numa_stat interface. This is useful for
>providing visibility into the numa locality information within an
>memcg since the pages are allowed to be allocated from any physical
>node. One of the use cases is evaluating application performance by
>combining this information with the application's CPU allocation.
>But the cgroup v2 does not. So this patch adds the missing information.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Suggested-by: Shakeel Butt <shakeelb@google.com>
>Reported-by: kernel test robot <lkp@intel.com>

This is a feature patch, why does this have LKP's Reported-by?
