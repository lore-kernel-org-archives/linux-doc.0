Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A503C0502E
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 03:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiH2DIt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Aug 2022 23:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiH2DIe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 23:08:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6843ED7A
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 20:08:23 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id z41so1109002ede.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 20:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=czsEz3uMSDGtuN3iX+1gBJ3GgnTp4SI1Njv08bLGbUU=;
        b=cPVVHSrIrAu2fehaiXFO0NP7AV/D8IKrlaMiQe+6eE9t8kVdLLqit3Ns43ao5yryMU
         bM3fOL+yiO5KsBC9cVh11Rmxm0oDVgV9e8FV3PDtt1F3rBjNB5Hi9jvvZ95lMWPmJgHo
         BzpLC+c2RDhxf774/fKbqWzoqlAZzsnK+vWK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=czsEz3uMSDGtuN3iX+1gBJ3GgnTp4SI1Njv08bLGbUU=;
        b=38OcFs8U91O81Cbr6BpmTVQJtWkEnYFGWMdbIjP9epTb78bYn6+4RLQ/N4aeXRl6jx
         Mwd2Etbw8InOgyO5JjjkJrrwLIJB0Q8FuTSOeXIQZY3zSR0wkAsptMBttXN4UKwKjynZ
         IsopeCRRb3O1Hl7Etr3rccrFzlcGHN7N0JP9wgsWO+8vy+5Aw8ZkVxBeDv8Vc7hMKeTI
         BAmW1Ovn/AQdJ7jUmrNX5gQ7CLijXslAjEIV6Pk7Wo3Pp4lupV7j0NoZlPQFGGqb7mXQ
         h6ewXqeMwr54cioiGOmzUqnpjXj9PARvu7JifwHNGdJfleu25VbmK+zsG70KPleoLq+l
         Quzg==
X-Gm-Message-State: ACgBeo0zz4k0HURZgLrlpKD2KI660K9M5SkfDM+BwsDQgpkCXTrvaSH2
        XJONCraxPGvAk7h49xuNmpjnYFJsDwBZy+gl
X-Google-Smtp-Source: AA6agR7IRJAixeifOu6gtTZ8R0Hxie8otPMK9lEtlbfi69oqiqWZ6Js3UJmca5bDZtOa8bupS+51gQ==
X-Received: by 2002:aa7:d596:0:b0:448:3d51:825 with SMTP id r22-20020aa7d596000000b004483d510825mr5512601edq.220.1661742496407;
        Sun, 28 Aug 2022 20:08:16 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b007324aa2ca77sm3855500ejo.85.2022.08.28.20.08.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Aug 2022 20:08:16 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso7452579wmh.5
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 20:08:16 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr5607006wmj.38.1661742495614; Sun, 28
 Aug 2022 20:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824163100.224449-1-david@redhat.com> <20220824163100.224449-2-david@redhat.com>
 <0db131cf-013e-6f0e-c90b-5c1e840d869c@nvidia.com> <ea380cf0-acda-aaba-fb63-2834da91b66b@redhat.com>
 <CALu+AoThhou7z+JCyv44AxGWDLDt2b7h0W6wcKRsJyLvSR1iQA@mail.gmail.com>
 <fe7aee66-d9f7-e472-a13f-e4c5aa176cca@redhat.com> <CALu+AoRwVfr=9KabOLUQigWwCtP5RLQ1YaKbG75ZVM9E-bW2ZQ@mail.gmail.com>
In-Reply-To: <CALu+AoRwVfr=9KabOLUQigWwCtP5RLQ1YaKbG75ZVM9E-bW2ZQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 28 Aug 2022 20:07:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com>
Message-ID: <CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To:     Dave Young <dyoung@redhat.com>
Cc:     David Hildenbrand <david@redhat.com>,
        John Hubbard <jhubbard@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, kexec@lists.infradead.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Stephen Johnston <sjohnsto@redhat.com>,
        Prarit Bhargava <prarit@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 28, 2022 at 6:56 PM Dave Young <dyoung@redhat.com> wrote:
>
> > John mentioned PANIC_ON().
>
> I would vote for PANIC_ON(), it sounds like a good idea, because
> BUG_ON() is not obvious and, PANIC_ON() can alert the code author that
> this will cause a kernel panic and one will be more careful before
> using it.

People, NO.

We're trying to get rid of BUG_ON() because it kills the machine.

Not replace it with another bogus thing that kills a machine.

So no PANIC_ON(). We used to have "panic()" many many years ago, we
got rid of it. We're not re-introducing it.

People who want to panic on warnings can do so. WARN_ON() _becomes_
PANIC for those people. But those people are the "we have a million
machines, we want to just fail things on any sign of trouble, and we
have MIS people who can look at the logs".

And it's not like we need to get rid of _all_ BUG_ON() cases. If you
have a "this is major internal corruption, there's no way we can
continue", then BUG_ON() is appropriate. It will try to kill that
process and try to keep the machine running, and again, the kind of
people who don't care about one machine (because - again - they have
millions of them) can just turn that into a panic-and-reboot
situation.

But the kind of people for whom the machine they are on IS THEIR ONLY
MACHINE - whether it be a workstation, a laptop, or a cellphone -
there is absolutely zero situation where "let's just kill the machine"
is *EVER* approproate. Even a BUG_ON() will try to continue as well as
it can after killing the current thread, but it's going to be iffy,
because locking etc.

So WARN_ON_ONCE() is the thing to aim for. BUG_ON() is the thing for
"oops, I really don't know what to do, and I physically *cannot*
continue" (and that is *not* "I'm too lazy to do error handling").

There is no room for PANIC. None. Ever.

The only thing there is are "I don't care about this machine because
I've got 999,999 other machines, so I'd rather take one machine
offline for analysis".

Understand? The "should I panic and reboot" is fundamentally not about
the code, and it's not a choice that the kernel code gets to make.
It's purely about the choice of the person maintaining the machine.

As a kernel developer, you do not EVER get to say "panic" or "kill the machine".

End of story.

                 Linus
