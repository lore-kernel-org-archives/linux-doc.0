Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16E3C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 16:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236338AbiGYQl5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 12:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236561AbiGYQlp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 12:41:45 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73B71DA5B
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:41:32 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id y9so8654932qtv.5
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v0Fv+XIjssvZKgFM5LQcb8oFSEVF6SdtJS8HXkaCGG0=;
        b=3QxjhGAUDPV3GRaFaoJVT9T+OOXNTZ13AG3KfIqthhNKATudxFjJHRZqCYOcuJtIK0
         RFbJelGraAA7ADvrFcTvoACcPEmPO9FHdXoZ8scMvZ8Py8hJjbUAcm3mrHZG2a+8dfiu
         jJz3k9uorP5zoWG0g9A1yrNwZjfRedzU3BbJtPZQy11Ts4/OnsNOyxJfizhK/cSQsr1W
         dhxkuga64cCsmfd+mdYtgYPikV83NIg0g+yxgnVHXe6T3jDOUIlyWm/irCW4nWCcsXY0
         fG5mlS4HNpuKW4RgHgsxzBFfLfZn5aWfNFilSvvdsrIe8toMNQLojl9mc2J6c2NUYEOI
         IXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v0Fv+XIjssvZKgFM5LQcb8oFSEVF6SdtJS8HXkaCGG0=;
        b=sVvG7EBRgjZSkXVcLUTn6fv4FnBhqL0KxW+L1i/KmTUOyMoFrFxyUC8JrySKg6Z2aq
         b8tGlcaZYFNZipBbKCCiy2CrKRz09DolOFt5zHzZY73qkj1Dk2gQcEibVCJluag+2q8J
         2toLcTyfEjUg5bExOhFIFNZvTKCHMuoNHYdtEN2unrsblvvRszQpg9oXPTdcwIAmVPF2
         2S80LrmZv0BduLCVVDg9StNvBxCdJTa0cinbhzRnBnkICquEhQ7OgmIVmTbXrGu/MxDc
         FngVGpHXZyTbFAsl5hJidvLAf8pUMtZ/uF67N4eyJTEB9FpzVQH9CPfUI9bHc76yCMXL
         0zDw==
X-Gm-Message-State: AJIora8QwePXAaHkCfFGOONdCzwvv2JJiLLYKKRsLcAmQ8GXNJREd4k7
        4yFj6y5HXvxwMwrOG2CWdpGRHQ==
X-Google-Smtp-Source: AGRyM1sgW7yWZ9Eym1B0Bz1koa30wmOCyPu27dOyzJBkyosUDaLeuiNz42s8fI4JjDRz6ZInmB+AtA==
X-Received: by 2002:ac8:578c:0:b0:31f:4be:8e00 with SMTP id v12-20020ac8578c000000b0031f04be8e00mr11152800qta.181.1658767292060;
        Mon, 25 Jul 2022 09:41:32 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id t4-20020a37ea04000000b006b66293d79dsm1382040qkj.80.2022.07.25.09.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:41:31 -0700 (PDT)
Date:   Mon, 25 Jul 2022 12:41:31 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 5/9] sched/psi: don't create cgroup PSI files when
 psi_disabled
Message-ID: <Yt7Hu141PirDh/pw@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-6-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-6-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:35PM +0800, Chengming Zhou wrote:
> commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
> make PSI can be configured to skip per-cgroup stall accounting. And
> doesn't expose PSI files in cgroup hierarchy.
> 
> This patch do the same thing when psi_disabled.
> 
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
