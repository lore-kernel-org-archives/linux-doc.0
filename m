Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1162EC43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 16:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbiGYQkF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 12:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbiGYQjz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 12:39:55 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F1F1DA60
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:39:51 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id e5so8649922qts.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7xVgMqmN/86GQHcqXO1yw7VSBDbzPsFu44uQMKjUJeE=;
        b=G1BoE6F8flgmzsQzfW3nkF7mptQonm328gZXYogDGG2IBIo/98/hfHLbhV7UAJkXQI
         X8ynxusv76jgdnblo7OxdqtfwPoXk/rNSeoDm2clKMjo+cyP+MkOivoz3cjRpyBfFOMl
         SIlEVNpakmxkbmqt4+XxLQLJ4QQ5PCkIi8fjAenSwWjxlcnBfytss8LLn3ERV7YvDbZa
         +VH8K1yK0xvi9ijH2dX3DZyfC4rI5TE1UjZr8z9tc/TucWdSj8cQGKObuYxB1bKQ6CbK
         2/AGAfXA0e/T+pDGaivYnTvUT5YBiUB+stnvoGNHnjm/BVx/LCqP/LJmcqT6Q4OGgHau
         mRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7xVgMqmN/86GQHcqXO1yw7VSBDbzPsFu44uQMKjUJeE=;
        b=w60K9e3GBWRHhJylXAed4JxxHeca8w44WFBVaeqHAMjw07kFAFrLBUtTaESbUtPtVV
         n/5FYMSElI4flHrZrXtOcU6tlR50MGywAMltcBEJYv563o/sAAcS3dYdT5aqi4gjRrXL
         M8mqHUmRh+Lo60XfvoXN4otHnAZTHQzw4zpn2EfjzeH3i7/ffJkxT1/7XRaaED91kumW
         i6F4TIyHzD30okwG6aftiaER9m1B52UBfMHwhmLMOw9nBlN81raLNw03p2NGHPJG4Qy3
         y2OdQS2uCY4XpwpymQwxLQuXkryiTO0+dod5J2C260o3Od5g9N2JLkjy4vA0NrjPJsQ6
         JQbA==
X-Gm-Message-State: AJIora/vHrzXo7GsPdttsLOO0W+P+S1pdAqzCchyubnTKNpEP4SDkKhZ
        sl8f5sZdaoujSPE6M74U84Kepw==
X-Google-Smtp-Source: AGRyM1uKPvbHdE7zEZLQVfC2qN7mSkhxt10ohJq0YaOc0s83Re06cnlkFoQmtVFqPXBDnTfsAuzhwA==
X-Received: by 2002:a05:622a:1710:b0:31f:340:41dc with SMTP id h16-20020a05622a171000b0031f034041dcmr11262377qtk.311.1658767190695;
        Mon, 25 Jul 2022 09:39:50 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id r19-20020a37a813000000b006a6d7c3a82esm9041344qke.15.2022.07.25.09.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:39:50 -0700 (PDT)
Date:   Mon, 25 Jul 2022 12:39:49 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 3/9] sched/psi: move private helpers to sched/stats.h
Message-ID: <Yt7HVcdXMYeNn6uS@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-4-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-4-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:33PM +0800, Chengming Zhou wrote:
> This patch move psi_task_change/psi_task_switch declarations out of
> PSI public header, since they are only needed for implementing the
> PSI stats tracking in sched/stats.h
> 
> psi_task_switch is obvious, psi_task_change can't be public helper
> since it doesn't check psi_disabled static key. And there is no
> any user now, so put it in sched/stats.h too.
> 
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
