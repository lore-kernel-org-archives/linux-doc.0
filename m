Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8E6C6379D
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52B5522256
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 03:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qa7gmGz7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgKTDIy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 22:08:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbgKTDIx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 22:08:53 -0500
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772D2C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:08:53 -0800 (PST)
Received: by mail-ed1-x544.google.com with SMTP id t11so8005990edj.13
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YtXOZvjpEpFV/ldFOanGBLjptcLyTt0EXS/OYP43evM=;
        b=qa7gmGz757OlSDFTjsk05inFC6M0LF1M3mE19DcQpwXzKoWt19gd0JQuk1LLbXZ3BR
         LCDoAOGXiXtnvdWeoHirvsUrxoW7itKGg+49YbWkwr9cTDviYnxcBPm07I0W7v6Pwpfp
         58M7Y+NavVaSmUUAgOSlYS5MYKiGyZdIQKDtx9YkKq54SY5qSzjFymOVbIdbmVpH4LqI
         Dx5KOMWYoq4FVSUMODPpeHTwinvQ4bNBxXy8sVYUTgVzvZPWvbLznSMfKQ/e35FVxiz/
         b1OZqoe5BF+Q9d+YPQp5lcqWxLxRMw/MUb+HzcwEVfZzFYJXpQK6NX2j2/6/HAYyz7Zg
         ZiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YtXOZvjpEpFV/ldFOanGBLjptcLyTt0EXS/OYP43evM=;
        b=dJW5oPUkUsejlfvHOPDl5D906PHpcuVCVrDD/vFdK+peTpJQXAiHq72fofVH6OlRe5
         spIY2JqOtzXJQN7pGa9P+YJV3gkJXFlmIzbMETdVzQSv3JzTvEG4/tAaOMgUgEc5bihH
         ojoon/dQF2GbM0lB+0ZCK0rPlhDhYW/jll2PdM7QfdTJvhZG0kefwPcDvcmK8djCnF5M
         h2ndFp75nANOeElzRgFO2GJ6d7hqPL9Iaw26G+/93CcAdU25ofA73lrTewGGLcerM4Qd
         0H8WoGTizfCLBr2KAncr74M/p++55ktsXDi8OfqjlU/vzHAja1+1/2b4FlZXeHUy5McB
         wM6Q==
X-Gm-Message-State: AOAM533XubhQpuIWP5PfRv5uSm83cXKYK6k1N7ZTs/LuHAALAlDZ6QkT
        mmohTmtuCiUws0jr1onzVaIakbCES1T6BJhlF/eyIA==
X-Google-Smtp-Source: ABdhPJz7RJjzL+hufqMNJi6uAMHBGxu2W0f9OprYCaMoFixITN8wKxcO/vk1C+Dq41gKH/gCCQUQeRDxgtqHoSzRzFE=
X-Received: by 2002:aa7:d34e:: with SMTP id m14mr32575884edr.42.1605841731812;
 Thu, 19 Nov 2020 19:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20201120030411.2690816-1-lokeshgidra@google.com>
In-Reply-To: <20201120030411.2690816-1-lokeshgidra@google.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Thu, 19 Nov 2020 19:08:39 -0800
Message-ID: <CA+EESO724fTxCGZJM2HhrFb5AYTDb4pPFsPnzN0vP5KXwjg0Fw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Control over userfaultfd kernel-fault handling
To:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 7:04 PM Lokesh Gidra <lokeshgidra@google.com> wrote:
>
> This patch series is split from [1]. The other series enables SELinux
> support for userfaultfd file descriptors so that its creation and
> movement can be controlled.
>
> It has been demonstrated on various occasions that suspending kernel
> code execution for an arbitrary amount of time at any access to
> userspace memory (copy_from_user()/copy_to_user()/...) can be exploited
> to change the intended behavior of the kernel. For instance, handling
> page faults in kernel-mode using userfaultfd has been exploited in [2, 3].
> Likewise, FUSE, which is similar to userfaultfd in this respect, has been
> exploited in [4, 5] for similar outcome.
>
> This small patch series adds a new flag to userfaultfd(2) that allows
> callers to give up the ability to handle kernel-mode faults with the
> resulting UFFD file object. It then adds a 'user-mode only' option to
> the unprivileged_userfaultfd sysctl knob to require unprivileged
> callers to use this new flag.
>
> The purpose of this new interface is to decrease the chance of an
> unprivileged userfaultfd user taking advantage of userfaultfd to
> enhance security vulnerabilities by lengthening the race window in
> kernel code.
>
> [1] https://lore.kernel.org/lkml/20200211225547.235083-1-dancol@google.com/
> [2] https://duasynt.com/blog/linux-kernel-heap-spray
> [3] https://duasynt.com/blog/cve-2016-6187-heap-off-by-one-exploit
> [4] https://googleprojectzero.blogspot.com/2016/06/exploiting-recursion-in-linux-kernel_20.html
> [5] https://bugs.chromium.org/p/project-zero/issues/detail?id=808
>
> Changes since v5:
>
>   - Added printk_once when unprivileged_userfaultfd is set to 0 and
>     userfaultfd syscall is called without UFFD_USER_MODE_ONLY in the
>     absence of CAP_SYS_PTRACE capability.
>
> Changes since v4:
>
>   - Added warning when bailing out from handling kernel fault.
>
> Changes since v3:
>
>   - Modified the meaning of value '0' of unprivileged_userfaultfd
>     sysctl knob. Setting this knob to '0' now allows unprivileged users
>     to use userfaultfd, but can handle page faults in user-mode only.
>   - The default value of unprivileged_userfaultfd sysctl knob is changed
>     to '0'.
>
> Changes since v2:
>
>   - Removed 'uffd_flags' and directly used 'UFFD_USER_MODE_ONLY' in
>     userfaultfd().
>
> Changes since v1:
>
>   - Added external references to the threats from allowing unprivileged
>     users to handle page faults from kernel-mode.
>   - Removed the new sysctl knob restricting handling of page
>     faults from kernel-mode, and added an option for the same
>     in the existing 'unprivileged_userfaultfd' knob.
>
> Lokesh Gidra (2):
>   Add UFFD_USER_MODE_ONLY
>   Add user-mode only option to unprivileged_userfaultfd sysctl knob
>
>  Documentation/admin-guide/sysctl/vm.rst | 15 ++++++++++-----
>  fs/userfaultfd.c                        | 20 +++++++++++++++++---
>  include/uapi/linux/userfaultfd.h        |  9 +++++++++
>  3 files changed, 36 insertions(+), 8 deletions(-)
>
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
Adding linux-mm@kvack.org mailing list.
