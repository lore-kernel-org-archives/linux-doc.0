Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D1AC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jan 2022 18:25:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356735AbiASSZL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Jan 2022 13:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242946AbiASSZK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Jan 2022 13:25:10 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCDCC06161C
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 10:25:10 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id l68so9523659ybl.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jan 2022 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhZUjSqSQkfhZLoYn5e7bhCr/SYhnGpXe4Qg5Zbv7IY=;
        b=KcjIc7Fy7AyXlztjvbf4TXqfnkrciDNXOMtpFzvtF3QorWdBdCJcZNxXQir+xqCgM/
         vhWvU4puaDNNHZIf8tBZKxSuEwQBcTPRaILKpqqMlp0EO0agvObWm58HneQ/F52afxd+
         6yk9sB6uJI4kgfYa9xXzLl1IhZoi8Xr/g+mGUrRUzF3gyQ9ppLz97Lc6tXjX5m/whFY+
         ECRNg2HIhE2665MiG3OSXjnIgdouodrSJyK4mwNzw4KfTZvN2jBb+EzlnKNLhNJrQzDp
         62ZPButvLcfnCM8PWDujKudROIKqyKSbycC36/wmwUvk0cT2ZnfhnIf8hQfmUytuiq2F
         Dvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhZUjSqSQkfhZLoYn5e7bhCr/SYhnGpXe4Qg5Zbv7IY=;
        b=kgsMF42r/8h6dOEpHU2WT071t9O+boQPhS7Kzplb06GdbcS1E7GEl98eeXVBbm89FL
         2v3N8bHlyTjYKsvt6w4315HbsiB7mn+i4VNH9iE827N3kvc7KAFfqqTuOy/01NMvvY3c
         FwdrPVwcY9RR0JCaAiKKjbO2dkIpzQwECue7OPW5kwx1VBiCKShbdftIXe1re66DouFy
         inbJ3ikSmtlaKipnlTrxiJLvSbQof1WVsPRhbaia2hD0+iL5y+25kiBwmj1PRJUdhCWW
         DdoWeMAvlQRpsn1LU7SrC2RIMH+zd8a0sFZRs1C1ayKcMyIJjmp7NLUEKkYntZSOZM81
         q8og==
X-Gm-Message-State: AOAM530WAiV8ogn0WDQWhZ/zaERhnNTHQT5BQIX6z7t9zEqIyPTzlGxa
        JIYOk56/t05aC6jIn+L7+i5Ydop4iJI3rcTHWDxlNA==
X-Google-Smtp-Source: ABdhPJyn4giiiq8ubwJREn+9rcxttcLhxnSzBFBbGPyp4Qw1J6vVVbQT+Fu9+AYAHNXgggW+6+BF7t8OrokPelbULGw=
X-Received: by 2002:a5b:586:: with SMTP id l6mr28353208ybp.322.1642616709101;
 Wed, 19 Jan 2022 10:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20220115010622.3185921-1-hridya@google.com> <20220115010622.3185921-3-hridya@google.com>
 <aea5b741-c994-4007-156e-d8a3a5b9bbcc@infradead.org>
In-Reply-To: <aea5b741-c994-4007-156e-d8a3a5b9bbcc@infradead.org>
From:   Hridya Valsaraju <hridya@google.com>
Date:   Wed, 19 Jan 2022 10:24:33 -0800
Message-ID: <CA+wgaPNqXSCxhby8xzQGCZ-GGJQ475Nx==ki63=DR_i25P_PiA@mail.gmail.com>
Subject: Re: [RFC 2/6] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <christian@brauner.io>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Dave Airlie <airlied@redhat.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthew Auld <matthew.auld@intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Li Li <dualli@google.com>, Marco Ballesio <balejs@google.com>,
        Hang Lu <hangl@codeaurora.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        cgroups@vger.kernel.org, Kenny.Ho@amd.com, daniels@collabora.com,
        kaleshsingh@google.com, tjmercier@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 19, 2022 at 7:40 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> On 1/14/22 17:06, Hridya Valsaraju wrote:
> > diff --git a/init/Kconfig b/init/Kconfig
> > index cd23faa163d1..408910b21387 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -990,6 +990,13 @@ config BLK_CGROUP
> >
> >       See Documentation/admin-guide/cgroup-v1/blkio-controller.rst for more information.
> >
> > +config CGROUP_GPU
> > +       bool "gpu cgroup controller (EXPERIMENTAL)"
> > +       select PAGE_COUNTER
> > +       help
> > +     Provides accounting and limit setting for memory allocations by the GPU
> > +     and GPU-related subsystems.
>
> Please follow coding-style for Kconfig files:
>
> (from Documentation/process/coding-style.rst, section 10):
>
> For all of the Kconfig* configuration files throughout the source tree,
> the indentation is somewhat different.  Lines under a ``config`` definition
> are indented with one tab, while help text is indented an additional two
> spaces.

Thanks Randy, sounds good! Will fix it in the next version!

>
>
> thanks.

>
> --
> ~Randy
