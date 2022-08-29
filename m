Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF8BECAAA2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 01:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbiH2B4K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Aug 2022 21:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiH2B4J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 21:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B837513DC5
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 18:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661738164;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/lL9xtmFCS+QjOxGv7pOfwve3SFMHPxQby6r9EFdWUQ=;
        b=Lx8GYNd51dayv9cLFbAHoqyyrs+FNxjyaROY8Jn7CAaeQM2tWm1zLlhmcT1PJfHmgkNIRL
        3rxUgodyxH0Jr2MPaGDBTTx7/A2cM3ncSbJQDECfYcWttIZwSSDOj66DGzLCYXwo7jCO0+
        LVSCfnzE4fnmQiTgK79eZJeXVu5XbPE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-KZT0FO7qPtyJtE6aCcGn9Q-1; Sun, 28 Aug 2022 21:56:03 -0400
X-MC-Unique: KZT0FO7qPtyJtE6aCcGn9Q-1
Received: by mail-ed1-f72.google.com with SMTP id v7-20020a056402348700b004481d536c7bso3054498edc.10
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 18:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/lL9xtmFCS+QjOxGv7pOfwve3SFMHPxQby6r9EFdWUQ=;
        b=gHles1rZ5CZztWSfL1W3SVyZsQe0xUKFx8DoDwS8mz2IzbytPNq4qGx2WcItvqT2cx
         Bn+zX/twuNuOKiPNtro3/TmWbRqCIn+DaMgZDX27Ru9abp4d0gntRTkxOqCL82rgQs+J
         //p7ldsSEwmonsowzbCQn/dUGPSlpHEcQ8GDw9clHdRcskL7U5d7gINKZlYLdOCpAPAU
         AzcU4lf08aBBYMgV9cOavCVRZwID0hHPSmw19StlmrEKbwhTUAQJWZnMsTQzZFkJ4OrS
         6b1LORTH+7eDnn7R5jJ3FIik5Fq7/R2Ovegenle+QmMJF4u49vhqQVmakXx+KQwpF0Rt
         RdUg==
X-Gm-Message-State: ACgBeo3QsP3my5vemEbzSY19v+i8pgllqOS1RL8X5Aw1+eErcwcc4p3y
        dQVexg3PsjdeVrO1tnRIQk7hHNaTP0B1hRaH/8n1+KHKg6CnlbRkSgHuVxf6AJw1PptRSdfxweu
        IB4KY24P5alZGMRbrW/kWbxIGYWYJUeuDLnAw
X-Received: by 2002:a05:6402:5110:b0:440:4cb1:c137 with SMTP id m16-20020a056402511000b004404cb1c137mr15415369edd.262.1661738162349;
        Sun, 28 Aug 2022 18:56:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5eMXbOLee5RayKIqofkJ3fxRMK30WscRLXXzrEPqElRjEUewfxLjylxvXdDgHHQSmEVcGPJxqYWWX+KCNadZg=
X-Received: by 2002:a05:6402:5110:b0:440:4cb1:c137 with SMTP id
 m16-20020a056402511000b004404cb1c137mr15415361edd.262.1661738162130; Sun, 28
 Aug 2022 18:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220824163100.224449-1-david@redhat.com> <20220824163100.224449-2-david@redhat.com>
 <0db131cf-013e-6f0e-c90b-5c1e840d869c@nvidia.com> <ea380cf0-acda-aaba-fb63-2834da91b66b@redhat.com>
 <CALu+AoThhou7z+JCyv44AxGWDLDt2b7h0W6wcKRsJyLvSR1iQA@mail.gmail.com> <fe7aee66-d9f7-e472-a13f-e4c5aa176cca@redhat.com>
In-Reply-To: <fe7aee66-d9f7-e472-a13f-e4c5aa176cca@redhat.com>
From:   Dave Young <dyoung@redhat.com>
Date:   Mon, 29 Aug 2022 09:55:51 +0800
Message-ID: <CALu+AoRwVfr=9KabOLUQigWwCtP5RLQ1YaKbG75ZVM9E-bW2ZQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To:     David Hildenbrand <david@redhat.com>
Cc:     John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
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

Hi David,

On Sat, 27 Aug 2022 at 01:02, David Hildenbrand <david@redhat.com> wrote:
>
> On 26.08.22 03:43, Dave Young wrote:
> > Hi David,
> >
> > [Added more people in cc]
> >
>
> Hi Dave,
>
> thanks for your input!

You are welcome :)

>
> [...]
>
> >> Side note: especially with kdump() I feel like we might see much more
> >> widespread use of panic_on_warn to be able to actually extract debug
> >> information in a controlled manner -- for example on enterprise distros.
> >> ... which would then make these systems more likely to crash, because
> >> there is no way to distinguish a rather harmless warning from a severe
> >> warning :/ . But let's see if some kdump() folks will share their
> >> opinion as reply to the cover letter.
> >
> > I can understand the intention of this patch, and I totally agree that
> > BUG() should be used carefully, this is a good proposal if we can
> > clearly define the standard about when to use BUG().  But I do have
>
> Essentially, the general rule from Linus is "absolutely no new BUG_ON()
> calls ever" -- but I think the consensus in that thread was that there
> are corner cases when it comes to unavoidable data corruption/security
> issues. And these are rare cases, not the usual case where we'd have
> used BUG_ON()/VM_BUG_ON().

Yes, probably.. (say probably because those cases are hidden and not
clear sometimes)

>
> > some worries,  I think this standard is different for different sub
> > components, it is not clear to me at least,  so this may introduce an
> > unstable running kernel and cause troubles (eg. data corruption) with
> > a WARN instead of a BUG. Probably it would be better to say "Do not
> > WARN lightly, and do not hesitate to use BUG if it is really needed"?
>
>
> Well, I don't make the rules, I document them and share them for general
> awareness/comments :) Documenting this is valuable, because there seem
> to be quite some different opinions floating around in the community --
> and I've been learning different rules from different people over the years.

Understand.

>
> >
> > About "patch_on_warn", it will depend on the admin/end user to set it,
> > it is not a good idea for distribution to set it. It seems we are
> > leaving it to end users to take the risk of a kernel panic even with
> > all kernel WARN even if it is sometimes not necessary.
>
> My question would be what we could add/improve to keep systems with
> kdump armed running as expected for end users, that is most probably:
>
> 1) don't crash on harmless WARN() that can just be reported and the
>    machine will continue running mostly fine without real issues.
> 2) crash on severe issues (previously BUG) such that we can properly
>    capture a system dump via kdump. The restart the machine.
>
> Of course, once one would run into 2), one could try reproducing with
> "panic_on_warn" to get a reasonable system dump. But I guess that's not
> what enterprise customers expect.
>

Sometimes the bug can not be easily reproduced again. So there seems
no easy and good way to use..

>
> One wild idea (in the cover letter) was to add something new that can be
> configured by user space and that expresses that something is more
> severe than just some warning that can be recovered easily. But it can
> eventually be recovered to keep the system running to some degree. But
> still, it's configurable if we want to trigger a panic or let the system
> run.
>
> John mentioned PANIC_ON().
>

I would vote for PANIC_ON(), it sounds like a good idea, because
BUG_ON() is not obvious and, PANIC_ON() can alert the code author that
this will cause a kernel panic and one will be more careful before
using it.

>
> What would be your expectation for kdump users under which conditions we
> want to trigger kdump and when not?
>
> Regarding panic_on_warn, how often do e.g., RHEL users observe warnings
> that we're not able to catch during testing, such that "panic_on_warn"
> would be a real no-go?

Well, I'm not sure how to answer the questions,  when to panic should
be decided by kernel developers instead of kdump users,  but I think
the panic behaviour does impact the supporting team.  I added Stephen
who is from the RH supporting team, maybe he can have some inputs.

BTW, I vaguely remember Prarit introduced the panic_on_warn, see if he
has any comments here.

Thanks
Dave



>
> --
> Thanks,
>
> David / dhildenb
>

