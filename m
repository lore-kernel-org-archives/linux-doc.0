Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03101C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jan 2022 14:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354166AbiALOkF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Jan 2022 09:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354167AbiALOkA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jan 2022 09:40:00 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44789C061757
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 06:40:00 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id y10so3230231qtw.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jan 2022 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=azTS6tnDk3tgwE9tswmIFeSjakmtEkN/3qV9mBsYccQ=;
        b=lTRxPpgHABlbCins2TOnLV9LVjCQ26SweG5q5/C2dMrN7f4+7+CdEQaKc4xcdS/zs3
         DnnJODvxalPzEBmfycggfJ4lZoZUdSfkcT1FFajWBuoDH4tbJJLL2YuL6VbiKPY23zjT
         s9abyL/GVEQlgdsFh47XnaBAIlnd4r3ZyvPyN5/9fVlr23f1ZQ+zFnmJ2EknoM6EVijq
         DtrWB4hpPieJhguRemvh6pArWmjvKs5iO38IbvNSIbHAERKk9TjFr3Jxk2ED+QMTUtWB
         yC+ONdLHxP7q+hbMjaRXE0DQCgYR737mTcvby6eksJwvQM1crqiY6MklMC7KIIBeXrYS
         SJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=azTS6tnDk3tgwE9tswmIFeSjakmtEkN/3qV9mBsYccQ=;
        b=OF9H1VRfwoaEQl0ZXuxdYZ1cA1uVOu9FuQ8U5s86tZddzTo5srTjRlF2dzX/alaMM3
         0KWzdKi8I9jYsyVOX2KX7f1bbPb04qSJ3WFBSkXq+ffqnmOroqLipfouDd6FeCZXS7cy
         7sHPrsYF4vOaiSdmSlwIl2IV3FhZ9jLYv5ucesHrImYg7HQfwORpaDjN3Y1+gbzSn7ia
         8SAHwn9t6jskxOg2+blWjzdE1Ca0q2uzHIHnKFLIv1FJIlD3lrmDc1evI9loahSmhUwz
         hK8L1AWSw9UCUNOFPvZXkwIwt7/uNDH4RrTHGy+sH8VHHVkbTcC6HfeWhwYeg022FaBg
         frbw==
X-Gm-Message-State: AOAM531vKdcAjIWPjmunMd3lB8GalU5QATon2vtQ3Fe4wC7Z5qADLfae
        rJrPcWLV56uDtE/mmcwElR0+xg==
X-Google-Smtp-Source: ABdhPJzrrSK3m7ltAbl1maAKx6vtdpBbyflm+yV6TugFLnybhDj8DR7ye+TY80jvOr5AzdzXhoJBmg==
X-Received: by 2002:ac8:5a4a:: with SMTP id o10mr7834867qta.617.1641998399438;
        Wed, 12 Jan 2022 06:39:59 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id 2sm129843qtx.66.2022.01.12.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 06:39:59 -0800 (PST)
Date:   Wed, 12 Jan 2022 09:39:58 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     torvalds@linux-foundation.org, ebiggers@kernel.org, tj@kernel.org,
        lizefan.x@bytedance.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, stable@vger.kernel.org,
        kernel-team@android.com,
        syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com
Subject: Re: [PATCH v3 1/1] psi: Fix uaf issue when psi trigger is destroyed
 while being polled
Message-ID: <Yd7oPlxCpnzNmFzc@cmpxchg.org>
References: <20220111232309.1786347-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111232309.1786347-1-surenb@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 03:23:09PM -0800, Suren Baghdasaryan wrote:
> With write operation on psi files replacing old trigger with a new one,
> the lifetime of its waitqueue is totally arbitrary. Overwriting an
> existing trigger causes its waitqueue to be freed and pending poll()
> will stumble on trigger->event_wait which was destroyed.
> Fix this by disallowing to redefine an existing psi trigger. If a write
> operation is used on a file descriptor with an already existing psi
> trigger, the operation will fail with EBUSY error.
> Also bypass a check for psi_disabled in the psi_trigger_destroy as the
> flag can be flipped after the trigger is created, leading to a memory
> leak.
> 
> Fixes: 0e94682b73bf ("psi: introduce psi monitor")
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+cdb5dd11c97cc532efad@syzkaller.appspotmail.com
> Analyzed-by: Eric Biggers <ebiggers@kernel.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
