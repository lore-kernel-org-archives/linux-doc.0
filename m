Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5EBC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  9 Nov 2021 08:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67BB9611C4
	for <linux-doc@archiver.kernel.org>; Tue,  9 Nov 2021 08:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbhKIIb1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237465AbhKIIb1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Nov 2021 03:31:27 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F560C0613F5
        for <linux-doc@vger.kernel.org>; Tue,  9 Nov 2021 00:28:41 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id w1so73921246edd.10
        for <linux-doc@vger.kernel.org>; Tue, 09 Nov 2021 00:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AYfmttMzhsd8uEz1aHBUrg2dnF3audYy8hGqqui2EpI=;
        b=H4a4IucMj8HDXTeG6u/Oz0ceqJbOqvSSg1DGCicM5zW8caqvUxA8hwZwgnomWSI2ju
         jx9JawN0XSBy/yqwpwZ9Zh81+Fuo/fUQs/OxpGJUzrdHzmFxk15hlK/0iwwrXWslsuU6
         7wBOt5AIcO4LZEe0egpWgofjLRMJxj93X5VzXOjX/SpKWhk2YBS1Y6vMA/16dUGWHzun
         Iyl/fitIbpsVL/RWKjRNbCrsDPP65wzA3pwhqy2cyTYX/72Thm/8MkVJLN0Dm5lvdzU9
         7H9byrChhb3YL7hLSKt3jIMjc6Cmj3XrWrUxwfmyhrS/jDWjCj02eHzhs0sTa0aeFfC+
         SU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AYfmttMzhsd8uEz1aHBUrg2dnF3audYy8hGqqui2EpI=;
        b=a++Ky53wudIoZNg7HZ8BKQwjdhye5UebXoPeKTTUT82tNU66BOKymFLHBdyhpuLE96
         gE0YUSe539OsYbNaKuJaJsP+WD/vLsVEEDLKS89iIqpk5uG39gB/6rhYttZg8EDFwU9s
         UGU/RzY/DUrmN7VqpvgW9Ryp5G6SHVf3D7LTQ7gAxva8ZtcBwzXTPEqTKp7HSD0Z6Zn8
         qOo7NG4BaUB/L+XBpIrw9i+BMeF3xNb9NG3Zqo3NYgwAn7IiAvZ090rpUZINmsnDpB+K
         Xk23vqID7c3WOBO/1ZjdTZmG4kCNTon1BYyWnHuQjML6pjsbnGaGWt/t/cQbuJz8K/xm
         Z6Sg==
X-Gm-Message-State: AOAM533tr3q1rZAW8GABPBtfNp+eS5UODM7p5loFSfI7ztGhu3u5p2tH
        I4XQvv+WIavqKJJk77LjfjOOxceMNGDinqKPklh0fQ==
X-Google-Smtp-Source: ABdhPJxB/jw6V3td6QOKuKigva5CtXSzFp342x2xvFZDOKc4h+0SujvGiXQJ/XxNHUutJyV2Co4XVI+hSOLUiArgPVU=
X-Received: by 2002:a17:906:38ce:: with SMTP id r14mr7278587ejd.268.1636446520068;
 Tue, 09 Nov 2021 00:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20211027132633.86653-1-ligang.bdlg@bytedance.com>
 <20211028153028.GP3891@suse.de> <b884ad7d-48d3-fcc8-d199-9e7643552a9a@bytedance.com>
 <20211029083751.GR3891@suse.de>
In-Reply-To: <20211029083751.GR3891@suse.de>
From:   =?UTF-8?B?5p2O5riv?= <ligang.bdlg@bytedance.com>
Date:   Tue, 9 Nov 2021 16:28:28 +0800
Message-ID: <CAMx52ARF1fVH9=YLQMjE=8ckKJ=q3X2-ovtKuQcoTyo564mQnQ@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v1] sched/numa: add per-process numa_balancing
To:     Mel Gorman <mgorman@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, sorry for the late reply.

On Fri, Oct 29, 2021 at 4:37 PM Mel Gorman <mgorman@suse.de> wrote:
>
> My point is that as it stands,
> prctl(PR_NUMA_BALANCING,PR_SET_NUMA_BALANCING,1) either does nothing or
> fails. If per-process numa balancing is to be introduced, it should have
> meaning with the global tuning affecting default behaviour and the prctl
> affecting specific behaviour.
>

If the global tuning affects default behaviour and the prctl
affects specific behaviour.  Then when prctl specifies
numa_balancing for a process, there is no way for the
global tuning to affect that process. In other words, global tuning
become a default value, not a switch for global numa_balancing.

My idea is that the global numa_balancning still has absolute control, and prctl
can only optionally turn off numa_balancing for process when the global is on.
After all, It is more common to enable global numa_balancing and disable it in
several processes than to disable global numa_balancing and enable it in
several processes.

This is my personal opinion, what do you think.
:-)

Do we need the global to be a switch, or a default value?
