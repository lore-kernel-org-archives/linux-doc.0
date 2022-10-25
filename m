Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A7BC38A2D
	for <linux-doc@archiver.kernel.org>; Tue, 25 Oct 2022 15:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbiJYPHH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Oct 2022 11:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbiJYPHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Oct 2022 11:07:06 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F461162FE
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 08:07:04 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id j21so8218449qkk.9
        for <linux-doc@vger.kernel.org>; Tue, 25 Oct 2022 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
        b=Qao3n6VBojqDPD+nyuHaNb8aRuC3dHiWWy2AGSGIeYcnvqBmtYGQkw0ZAnJFMbgl3b
         YXIsxmYnbPg/gkeIi50KEfyRBdnGvB7rOyE6AKwAWbos4tmP+xf33xTqrKYAFctdgjEV
         5bJSY6/fZwHsi070+kf0Dnmrd9VA6kpKF5vcsJbaF4KkD+ujQ6HfenyTPpf4q34P817v
         Lw/cRjg8xI19gsnwTd7/9PilD6/WIP9eNa1DtNk+gWXZdxuCJP9myXKQJQF5gbDxLWVe
         PS22WiRQZeD4cAN67FUE74f+0buJO7v71DQP6WC4ve5q5Ibyz3V9+9DvZel0/LU50VSx
         rUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21fm5EgPKmeOayQHxWYMU7Nefc1Ipf9I7LMbzYS7TPI=;
        b=Nz0YR4T/ae53MgcBYhccCQ6ACusLlrPKH9bgJjKURAv45YcDH14Ek7g9n6bjmezsS9
         Rc3dPu3JachvOhREsvLYunbGbfSR8VgrVSrmvPT90jPOw5LwV9P8vKZFRhAPbNCJoRg9
         aKXNt0pO9FuAVo+ugoeFkikqBa+c7ygttM0zS7qhCmil+BgiCI1/TSPUGGgEwY+nezz6
         9eHWoge4E7kHUnEj1hW4lrshYqLeanpUWrumrMPfRCPzJlkE/UOo3clivZFWHn2dU64W
         GdT5mfCe4wK0GYRrG8cQqUwOf32M+waSMm8vmtSTWuhEvdVRDu5B4XPzjg5SvNwXrLJf
         OJhg==
X-Gm-Message-State: ACrzQf2lu+zP6T5yin23No7fCx5Z6omdTWFWDUngYzBRD3v0D3s8qZR6
        n0HHXQu/M1/1gUyBCWZTGw/PC/NRakcaQAF5XFIz2w==
X-Google-Smtp-Source: AMsMyM5WxUziOboPsxC2N6qlers3FkCq6d6ddxCwWgeTeLHIKEFc0BoQutxorsr/ysGcAgO7sfY3nB5LJLrWXyNsPDs=
X-Received: by 2002:a05:620a:25c8:b0:6ae:be73:86c6 with SMTP id
 y8-20020a05620a25c800b006aebe7386c6mr25824699qko.531.1666710423705; Tue, 25
 Oct 2022 08:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220829093141.45583-1-tomeu.vizoso@collabora.com>
 <20220909141528.5090-1-tomeu.vizoso@collabora.com> <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
 <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
In-Reply-To: <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Tue, 25 Oct 2022 16:06:52 +0100
Message-ID: <CAPj87rPTAhcqSnhzYPdDn93Kh9aGJtN9ZGVAYUP2Ke6w6frH5w@mail.gmail.com>
Subject: Re: [PATCH v8] drm: Add initial ci/ subdirectory
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all,

On Tue, 25 Oct 2022 at 08:32, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, 9 Sept 2022 at 19:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > But equally - and sorry for not jumping on the IRC (?) discussion as I =
was in the middle of other stuff when it came up - I'm don't think this is =
the right plan.
> >
> > Mesa having all its CI in-tree makes sense, because merges happen rapid=
ly to a single canonical tree. If the scripts need to be changed for whatev=
er reason, we can merge something in under an hour and everyone immediately=
 gets it. DRM is quite different though, given the forest of trees we have =
and the long merge paths between them. I worry that merging the CI scripts =
in-tree - especially for our initial attempt at it, when we're likely to ne=
ed to make quite a lot of changes before it settles down to become a stable=
 system that works for everyone - is shooting ourselves in the foot by limi=
ting our flexibility.
>
> So the entire "we have multiple trees" is why I want at least the
> gitlab-ci.yaml in tree, to force people to collaborate more on one
> thing instead of everyone rolling their own fun and hacking stuff up.
> And there's still tons of stuff outside in the separate repo, like the
> lab status so Linus doesn't get a silly history of lab flapping.
>
> Also wrt "developers don't get the update right away due to
> backmerge/pull delays", that's why integration trees like drm-tip or
> linux-next exist. So maybe initially we should make sure the ci
> patches go in through drm-misc, to maximize how many people see it.
> And even for mesa it's not fully automatic, you still have the rebase
> your branch if you picked a bad one for development (but yeah marge
> does that if the MR is ready). If you're doing kernel development on a
> linear tree instead of an integration tree, you're doing it very
> wrong.
>
> What I think everyone agrees on is that we probably get the split
> wrong and need to shuffle some files back&forth, and that's something
> we need to warn Linus about I guess. But somewhere we do need a split
> between internal and external stuff, and personally I'd like if at
> least the pure sw testing (build and virtual stuff) could be all in
> upstream.
>
> > Given that it's currently very dependent on fd.o infrastructure (publis=
hed ci-templates, the registry, the specific-tag runners for Collabora/CrOS=
 DUTs, etc), there isn't much of a portability gain in bringing the scripts=
 into the tree either. It's a good goal, but not where we are today.
>
> I don't think there's huge chances for any non-fdo gitlab anytime
> soon. Once we get there we might need to figure out how to standardize
> the hw lab interfacing, and if we have all the sw targets in upstream
> that should help with shuffling stuff around for a hypothetical LF
> gitlab CI (or whatever it is).

Yep, having talked through things on IRC, I'm happy with where we are;
let's give it a go and find out.

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
