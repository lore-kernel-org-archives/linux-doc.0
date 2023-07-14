Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DEDC0015E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 00:47:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbjGNArk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jul 2023 20:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjGNArj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jul 2023 20:47:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDD02D51
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 17:47:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso20610691fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 17:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1689295656; x=1691887656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k7y296KedplM2A3mke9UNwqTxqKMP8WdPVepgqrON6E=;
        b=QPK4Vb9V1JiKbKNNG1W4kMrTt/sbfQYFbO+F+IzDPH4/Sc61AQqk0LodIW9hZeZYj8
         a/yP5YwNng8/3JemhpHqBe3ELJQgYkgSm3tSyjJLb4657jtRsucgRZUKGy0rcJVvWgOl
         V78bOBdfllbw8T5Ws3BnF2hFlJpaxWMKPWvcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689295656; x=1691887656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7y296KedplM2A3mke9UNwqTxqKMP8WdPVepgqrON6E=;
        b=U2WkugGFnu1fsGlqIH8Yuq0Poz/MwuIRybpkws0jLoYwjKMalO6JgHqvdTGgrMjcLQ
         qBSaqxeKCtuJPbD5IObPBmCuJ/QQt/ZRIA9P6sMmXGNsmZ4tRn44fanLk0iJQI6kS4M7
         B1xe185OTsMiE333+/osrEgQfHQ3ncZ9KcBShFbJzNfNRYrsKE2a/54oevuXqwRpQ3t8
         257JPJ18KFw/C8OqEOmx1u2JMCYkDCE8YHOAs8mmRz0HSe79x6Ofc/DyViphT7J00Hvt
         cM7OnS+v7TrC58vwCfKFy1wSOxOmbdJ0kOgwpKDSSH3tk6+lp+zaN7UuVH4J1bfx8qE1
         D8dA==
X-Gm-Message-State: ABy/qLbAX3y3bqwuJH7GvmpKzjqHxbp42hb+qKEpmEHEk50oXFC2bZSk
        WxLyeQcb1L8mdRyqAWcLF4dKm3ZqAzydqokT5Hf3h8i9
X-Google-Smtp-Source: APBJJlHlISh6g2AiKeu7lm/W/LOUkaWRjgPklrG8zNAtCTxyTOlSo+zxNUBty8rfp6WC+gEiTZkV3g==
X-Received: by 2002:a2e:9e0a:0:b0:2b1:c1ae:73e3 with SMTP id e10-20020a2e9e0a000000b002b1c1ae73e3mr2601287ljk.15.1689295656465;
        Thu, 13 Jul 2023 17:47:36 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e9b8d000000b002b70206cd45sm1727278lji.90.2023.07.13.17.47.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 17:47:35 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb7589b187so2337583e87.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jul 2023 17:47:35 -0700 (PDT)
X-Received: by 2002:ac2:5388:0:b0:4f6:3677:54e with SMTP id
 g8-20020ac25388000000b004f63677054emr2106458lfh.36.1689295655179; Thu, 13 Jul
 2023 17:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230713230417.1504773-1-kuba@kernel.org>
In-Reply-To: <20230713230417.1504773-1-kuba@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 13 Jul 2023 17:47:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyGEZKpb1h=OTYzxaam_g0ek4GKyCPCvVz4fOh+BzCEA@mail.gmail.com>
Message-ID: <CAHk-=wiyGEZKpb1h=OTYzxaam_g0ek4GKyCPCvVz4fOh+BzCEA@mail.gmail.com>
Subject: Re: [PATCH docs] docs: maintainers: suggest including lore link for
 conflicts known to linux-next
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 13 Jul 2023 at 16:04, Jakub Kicinski <kuba@kernel.org> wrote:
>
> I'm not completely sure what is the best practice for notifying Linus
> about conflicts which have already been resolved in linux-next.
> I presume they are a no-op to him, so maybe we shouldn't even call
> them out?

No, I do *not* somehow auto-merge stuff that has been merged in
linux-next. I will do my own merge, and see the conflicts, and I will
resolve them independently of anything that has happened in
linux-next.

I may then check what linux-next did, particularly if the merge was
non-trivial, but honestly, that's fairly rare. And if the merge was so
non-trivial that I check what happened in linux-next, it's actually
not all that unlikely that I ended up resolving it differently anyway.
I send out emails saying "that was wrong in linux-next" somewhat
regularly.

So if you were notified by Stephen that there is a conflict in
linux-next, and it has been resolved there, that means that as far as
linux-next is concerned - and *only* as fat as linux-next is concerned
- that resolution will now continue to be done in linux-next.

But you should preferably mention said conflict when you then send the
pull request to me.

It's perfectly fine to just mention it - say "there's a conflict in
so-and-so with the pull from tree so-and-so". That will give me a
heads-up to not be surprised about it.

You can point to the email that Stephen sent (using lore), or you can
quote his resolution (or your own, if you do a test-merge, like many
people do) if you want.  It's not a requirement.

But I do kind of want to see the "there's a conflict" mention, not
just to have a heads-up. It's also a sign that you are actually
keeping track of what happens in linux-next and are on top of things.

Because I've had _too_ many pull requests that actually turned out to
have had problems in linux-next - merge related or not - and the
developer having not tracked anything at all despite having been told
about said problems, and just sent the resulting untested crap to me.

So the "there's a conflict" note ends up having that kind of secondary
meaning. It gives me the warm and fuzzies that the developer has
actually reacted to what happened in linux-next.

The corollary to that is that when I see a conflict - even if it's
completely trivial - and I see it in linux-next too, and the conflict
was never mentioned, I go "ok, this maintainer never actually reacted
to anything that Stephen said about his tree".

That often says more about the situation in general than about the
particular conflict.

             Linus
