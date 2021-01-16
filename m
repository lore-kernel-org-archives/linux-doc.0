Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA88BC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jan 2021 00:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7E723A5E
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jan 2021 00:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbhAPACo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Jan 2021 19:02:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728604AbhAPACn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 19:02:43 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13794C061793
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 16:02:03 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id b5so6152030pjl.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 16:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FY8VpQNfhIxBmUN0CCall3v72xLkiHt1IqHsb3quwR4=;
        b=luKEj3UoOFPuOKbYwRLoqFsDstinvsZbmPyy851wXrrnY6L+VRXyETTqdGgw5hGxLP
         q82oal/qKPyYEtADP0J+9+aBTHtWcStqg7f1d2isGuDnoxu5PU5w2R93MXCZlyflx7l7
         2o23TrL3joPsXdxh4adFBgmxw8KI6tA70dzTICQIh6Z6okR/z0pWkGEKOZgja4fDXYdG
         DyEQN0FCTeWyAWBEferv1Qib1rPFv4dHvg3qKJ+/zKLnUD9LMAW64+23msX/mrMix17s
         vqPEIc6shaHkKBmGEJoepfmcUzY6UCsQYw68cMqc890Tb5k1Xwy/ExMW6A4K+8uwTgVs
         azuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FY8VpQNfhIxBmUN0CCall3v72xLkiHt1IqHsb3quwR4=;
        b=s0//NO63ROZbtzotjXC4MED8QZaBJBww7HtH1oaH0qQ4XPEVqjTJPEwe9OW8lp1f+z
         CIZ27Vz8hEYtNLP2AMRhbap9PHERMnCjWmXuSw5c23Ibd+lJ9hzLL+uAh247JnFkZa7s
         iYPmuV2e4UM1phQxrXSjlWVmnXSTPqAFgUZeNWQ8XBcfX0GkttI1xZnbbRbb40x4Dg65
         3CAaCdaf7cHi83QPTUejCb6CtE+51FkijCFFeTRPNnOJDtu+V5qtbDY4S2Y9FOI2i648
         aaRotv9YbfXSR75Uowu+EaNUa0c+K5XNnpxukLyLscabSbHGqgTTOmqowoq23vJsstXM
         KZGA==
X-Gm-Message-State: AOAM532V5SKYa/W4xOteO/FwH4Lg6kxQ5WGh7Jr19gcIIhT2ZYp2ymOF
        qckXihT5QbOTwDwCTop2V9soYTkR4rWIdbPSRx4kOg==
X-Google-Smtp-Source: ABdhPJzv8hrDv7j8QxBRMT8DbWGNHAjn2SFadQCf6V/1mYcyv79IOw9cqliku5v7+LW/FEZaY2ZCORI+UiGpp+SD2WU=
X-Received: by 2002:a17:90a:6ba4:: with SMTP id w33mr13549703pjj.32.1610755322387;
 Fri, 15 Jan 2021 16:02:02 -0800 (PST)
MIME-Version: 1.0
References: <20210112053113.4180271-1-morbo@google.com> <20210113061958.886723-1-morbo@google.com>
 <20210113205547.GA21653@Ryzen-9-3900X.localdomain> <CAKwvOd=0wWz4o652EoZNvfu1L+fuhuGZusqpxiJ+561DtCh7Eg@mail.gmail.com>
In-Reply-To: <CAKwvOd=0wWz4o652EoZNvfu1L+fuhuGZusqpxiJ+561DtCh7Eg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 15 Jan 2021 16:01:51 -0800
Message-ID: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
Subject: Re: [PATCH v4] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 13, 2021 at 8:07 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 13, 2021 at 12:55 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > However, I see an issue with actually using the data:
> >
> > $ sudo -s
> > # mount -t debugfs none /sys/kernel/debug
> > # cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > # chown nathan:nathan vmlinux.profraw
> > # exit
> > $ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
> > error: No profiles could be merged.
> >
> > Am I holding it wrong? :) Note, this is virtualized, I do not have any
> > "real" x86 hardware that I can afford to test on right now.
>
> Same.
>
> I think the magic calculation in this patch may differ from upstream
> llvm: https://github.com/llvm/llvm-project/blob/49142991a685bd427d7e877c29c77371dfb7634c/llvm/include/llvm/ProfileData/SampleProf.h#L96-L101

Err...it looks like it was the padding calculation.  With that fixed
up, we can query the profile data to get insights on the most heavily
called functions.  Here's what my top 20 are (reset, then watch 10
minutes worth of cat videos on youtube while running `find /` and
sleeping at my desk).  Anything curious stand out to anyone?

$ llvm-profdata show -topn=20 /tmp/vmlinux.profraw
Instrumentation level: IR  entry_first = 0
Total functions: 48970
Maximum function count: 62070879
Maximum internal block count: 83221158
Top 20 functions with the largest internal block counts:
  drivers/tty/n_tty.c:n_tty_write, max count = 83221158
  rcu_read_unlock_strict, max count = 62070879
  _cond_resched, max count = 25486882
  rcu_all_qs, max count = 25451477
  drivers/cpuidle/poll_state.c:poll_idle, max count = 23618576
  _raw_spin_unlock_irqrestore, max count = 18874121
  drivers/cpuidle/governors/menu.c:menu_select, max count = 18721624
  _raw_spin_lock_irqsave, max count = 18509161
  memchr, max count = 15525452
  _raw_spin_lock, max count = 15484254
  __mod_memcg_state, max count = 14604619
  __mod_memcg_lruvec_state, max count = 14602783
  fs/ext4/hash.c:str2hashbuf_signed, max count = 14098424
  __mod_lruvec_state, max count = 12527154
  __mod_node_page_state, max count = 12525172
  native_sched_clock, max count = 8904692
  sched_clock_cpu, max count = 8895832
  sched_clock, max count = 8894627
  kernel/entry/common.c:exit_to_user_mode_prepare, max count = 8289031
  fpregs_assert_state_consistent, max count = 8287198

-- 
Thanks,
~Nick Desaulniers
