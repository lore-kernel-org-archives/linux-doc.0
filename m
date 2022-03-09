Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0F2C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 19:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237333AbiCITPi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 14:15:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237329AbiCITPh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 14:15:37 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA94310DA6B
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 11:14:37 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id q194so2595882qke.5
        for <linux-doc@vger.kernel.org>; Wed, 09 Mar 2022 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aNqfcNEZGjceg+UV7MiCwR4m/+vO50KsZYIOCuJEo8c=;
        b=36TrIEKdsMjnR7Chc525qevaBESCl1mKL2De489X86GnsLdsf4+mvQ1ZMcNIROMSYO
         yCGltj6ZHmV85LAY5X414jSI2M/X7EfReqYx80ZB/lbKZ1isvIgHAPVIFhlizprCE4ie
         Rv93uyCm/H5c37PhSni5oMcTlfdNeprBpFPl7p/siwSBpl+kCtHyK0kbv3lUG8mnKnom
         GAvEvDWMFHbGqzSwiuB8gkgYut4pT3apuanO8FxlqpXDlX/5tFjUmE2Tq4oH6Yvim8ce
         dtQ39d8dHPjJiTABTKoBL0erxyMfA2nDOSqWW6viiYnWIOLaybhG0+AxgBbt8+zKuhK8
         QhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aNqfcNEZGjceg+UV7MiCwR4m/+vO50KsZYIOCuJEo8c=;
        b=DsWpFwB0842KzyUOmWoLfErXCdGKEPd3wgSFpJMCpCJOn70c+vsuRAqsJXsBLrwXDN
         +QwulLwns/a2tj86QSllyudUACGI8mmoZj8Fh5hxv/UumiCMzvFVeFC8JXvOm4dCgieK
         8ytpp4kSI2tpjM2QJxJCyKujZCFtYuEpam50oviyvj4OMkCXbQBGlQHnMAIBZdmO8Vfo
         BjNFSSojCjeR5QU5OIhxMXtLhUkltsZpk4fJfnWYT9FZ6PtxUmKeAkjYAqk/jf6IScbt
         I7JaF74YivvptDy85pIQQiDDrKYZXIVI24/us+vVJ0XJtCpSYRfjtC6NwNDOCtBJw/IW
         StQQ==
X-Gm-Message-State: AOAM531nsnY7A1Roh7+fDRzcQZZ6fj72gvu2iYzz7dJ7U9zXSTulkafb
        3p20XhC9GSUoYyxbEZpa6CL06Q==
X-Google-Smtp-Source: ABdhPJxEad5S6wPK7a2NTjRrfC58JrsVr52wJnsXTsUalVv0RC3OWfazfcQbMinjlmvU76c5q/g2lg==
X-Received: by 2002:a05:620a:2941:b0:67d:243d:3b7d with SMTP id n1-20020a05620a294100b0067d243d3b7dmr802338qkp.46.1646853276922;
        Wed, 09 Mar 2022 11:14:36 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id n13-20020ac85b4d000000b002de6fe91d2fsm1795510qtw.68.2022.03.09.11.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 11:14:36 -0800 (PST)
Date:   Wed, 9 Mar 2022 14:14:35 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        surenb@google.com, ebiggers@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Martin Steigerwald <Martin.Steigerwald@proact.de>
Subject: Re: [PATCH v2] psi: report zeroes for CPU full at the system level
Message-ID: <Yij8m9qHtvNKyGMK@cmpxchg.org>
References: <20220309111445.86484-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309111445.86484-1-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 09, 2022 at 07:14:45PM +0800, Chengming Zhou wrote:
> Martin find it confusing when look at the /proc/pressure/cpu output,
> and found no hint about that CPU "full" line in psi Documentation.
> 
> % cat /proc/pressure/cpu
> some avg10=0.92 avg60=0.91 avg300=0.73 total=933490489
> full avg10=0.22 avg60=0.23 avg300=0.16 total=358783277
> 
> The PSI_CPU_FULL state is introduced by commit e7fcd7622823
> ("psi: Add PSI_CPU_FULL state"), which mainly for cgroup level,
> but also counted at the system level as a side effect.
> 
> Naturally, the FULL state doesn't exist for the CPU resource at
> the system level. These "full" numbers can come from CPU idle
> schedule latency. For example, t1 is the time when task wakeup
> on an idle CPU, t2 is the time when CPU pick and switch to it.
> The delta of (t2 - t1) will be in CPU_FULL state.
> 
> Another case all processes can be stalled is when all cgroups
> have been throttled at the same time, which unlikely to happen.
> 
> Anyway, CPU_FULL metric is meaningless and confusing at the
> system level. So this patch will report zeroes for CPU full
> at the system level, and update psi Documentation accordingly.
> 
> Fixes: e7fcd7622823 ("psi: Add PSI_CPU_FULL state")
> Reported-by: Martin Steigerwald <Martin.Steigerwald@proact.de>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Peter, would you mind picking this up for 5.18?

Thanks!
