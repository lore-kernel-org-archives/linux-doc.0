Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CE4C43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 15:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233642AbiGYPef (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 11:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbiGYPec (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 11:34:32 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B83AE6B
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 08:34:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id r21so8457972qtn.11
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=67je02j6uPzSAKV5fALusQHcJaLZtd8UN7xVwkpfhMI=;
        b=cqYIXD8d4R3afensKf+99266lB8CnpoCR0cvyQJleALFFxfA893nPv3nDzZXt3p9za
         s8ObwE74BOHxU+40bwlVdDr3a0JISs43bgIQOwzuJcNzM0xST3u+iLxR8hwv1zNTXHS6
         Grd3BJJSVOsa4373326OgtzSlvStT0S1VDd14qQS8J0boaE438X2O4r5roAtieEZRa6h
         SNNVP2akwjO8VpRxcok8o5upBwDLt09kWP3F6AcTwTqmdW5Me+jybiLbG/C3AXfnQHXy
         6oThJosmja+RHL1pI0goIfSDiDz5HrJwrK5df6TJlo/cSxTG7pIONBV6cRi62GYTHyug
         bsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=67je02j6uPzSAKV5fALusQHcJaLZtd8UN7xVwkpfhMI=;
        b=Vt4qd7/232R8ukLZ+YAZoCTPm5w8bEyiq0k6oCvM5xrcn5zCZbauC9IiHqcG37WS7T
         ua/W+VccVbIndak+nriwnLvcu1M5HxWV295LgbsJadCnhOr2W6sf5Ux9zT1ts+gWAfLp
         b16qxTuQvhoxjx6CRDZcMr+Eb2ktckaKupWYTuVbenq3fAxq64afxRZ4rmCYYQro+jov
         r/U8odZXgKNnc7Nb/klRrLAx2Vls3/eIg47DGXpWMgMdfYr31X1v4u8GaC1aqmwnRfks
         VEDIcTwRZEuDPJo7afjENb/RUzE3myFhZGnzqDvHzaT8ij45UvEYDI2kBfWOJgDEXa78
         YxUg==
X-Gm-Message-State: AJIora9fk+akD+v+EtC688bKMsDY+nfy3wYI33J/00CMe7v2dtuu7MU1
        7Ccsu2ykYBxjIZtF9Xigvl6YFg==
X-Google-Smtp-Source: AGRyM1vgqIkAXbToyHYJQiompUrodEA+PwnkTXUl3kHFv5+9uA0m41T7e88PjoGYpUJEUXXNPNijFg==
X-Received: by 2002:ac8:5ac2:0:b0:31f:d13:de85 with SMTP id d2-20020ac85ac2000000b0031f0d13de85mr10923232qtd.397.1658763270030;
        Mon, 25 Jul 2022 08:34:30 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id q3-20020a05622a030300b0031eb393aa45sm7783893qtw.40.2022.07.25.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 08:34:29 -0700 (PDT)
Date:   Mon, 25 Jul 2022 11:34:28 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 1/9] sched/psi: fix periodic aggregation shut off
Message-ID: <Yt64BKsrUbD0xxYI@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-2-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-2-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:31PM +0800, Chengming Zhou wrote:
> We don't want to wake periodic aggregation work back up if the
> task change is the aggregation worker itself going to sleep, or
> we'll ping-pong forever.
> 
> Previously, we would use psi_task_change() in psi_dequeue() when
> task going to sleep, so this check was put in psi_task_change().
> 
> But commit 4117cebf1a9f ("psi: Optimize task switch inside shared cgroups")
> defer task sleep handling to psi_task_switch(), won't go through
> psi_task_change() anymore.
> 
> So this patch move this check to psi_task_switch(). Note for defer sleep
> case, we should wake periodic avgs work for common ancestors groups,
> since those groups have next task sched_in.
> 
> Fixes: 4117cebf1a9f ("psi: Optimize task switch inside shared cgroups")
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>

Good catch!

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
