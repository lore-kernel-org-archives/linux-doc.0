Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F12C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 16:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiGYQrv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 12:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiGYQru (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 12:47:50 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C2ABE33
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:47:47 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id i4so8826210qvv.7
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ueOMTo6DsQCvnulLJ7Rsqpth0YKKV57efxM+awobwkc=;
        b=1SD4nF22NDrVthsvc/CcEaNX0GsOg8NrfWYQauQ6kZ74/Cf5YJX7Qk7C9QYuipn3dc
         /75txsFW7Y+hWMthAHT7xUpXGfNxA3+uwyKDdnPOvRjLAjoNosLPlXssiDxAdYS7n7Jg
         UwVDAE+eUF9u+ZhvysT3aXuegZZaQVBosX2fekmPN6pfxTmUviDaE/y1MZN7SG1p6PFN
         jrMEAAfWkhyrGkTrkhwlrN4NgjBSnR+iOqCXqUKe4nW4/ddOFDf7L7MeHWR36Gz2bm0w
         HWRIuOJKtD/Ge3FM/1ggPWvXsLLCav4plXeFanzurA9vEmbG5hSVzxuFIwafwUgVAol0
         YdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ueOMTo6DsQCvnulLJ7Rsqpth0YKKV57efxM+awobwkc=;
        b=XSLf+/FVOerBRzHwu7/hHQ2SdrEYiqmsCLYTEXwweUk3XecYqVAYnvNqnl8eTqx61g
         DXiWD4rtxlpqhf4wSMTVSjy8uq2qV7DMN8iuONzcSS0RvIIEMYRE7bjKWeOQaE1n/OZw
         dc8wAIjxHi/R/RXp1iqj4mVQNqLA5deSO/7iZUGgsRrrMLVU3wd9enU4sdr5Yj2xnP3S
         x/trIIk9/TBIveb94ZhsBsvoln28mBMBfaNEt2DUH5g+S6szl1cyLlfshsSzkuxfPIdj
         oft5u7mzVrU/ykclpNqg/iFhd0AjdiiNsjUoEDp8GzUcr/mlsUYiZFiNpqWv9VCG7OD3
         e4bg==
X-Gm-Message-State: AJIora/0JPmVdQ3t/p1Gv894vwSHJbtoGJqJ8VQfmThSJBor7xqwKR2/
        f3SoB2u72xx1O4XOsUzyyYfqjg==
X-Google-Smtp-Source: AGRyM1tsn0XMOPnrteAVb22JR6gvBwTiHBtpn90Nl3EtZupeVtIltfU2MMOYYeSMUPrNGhQqxw9BoQ==
X-Received: by 2002:a05:6214:d81:b0:45a:e07e:6bcb with SMTP id e1-20020a0562140d8100b0045ae07e6bcbmr10926274qve.29.1658767666878;
        Mon, 25 Jul 2022 09:47:46 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a2a4600b006b633dc839esm6966288qkp.66.2022.07.25.09.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:47:46 -0700 (PDT)
Date:   Mon, 25 Jul 2022 12:47:45 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 6/9] sched/psi: save percpu memory when
 !psi_cgroups_enabled
Message-ID: <Yt7JMfKHYFLGUGBb@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-7-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-7-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:36PM +0800, Chengming Zhou wrote:
> We won't use cgroup psi_group when !psi_cgroups_enabled, so don't
> bother to alloc percpu memory and init for it.
> 
> Also don't need to migrate task PSI stats between cgroups in
> cgroup_move_task().
> 
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
