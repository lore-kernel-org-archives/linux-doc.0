Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EC6D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 17:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfGaREV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 13:04:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33670 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfGaREV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 13:04:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id i11so2869218edq.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3v6TLclWYCTjAr1Tti2BDVXfhzMXBqkZT8bGQWpyYs=;
        b=aOi9HiQRPHO4FOr23H0QJg5L4BRnfgz+Y7QvXWhB/ngiIQaEGHpBRMnl1OxzoXIBD2
         k43GqRNVGXw98UkWEJOgJJ2uCTXIijl6XMElm2r6cO8ZxA6p+VeKe0q36fAAh9KHjGXh
         YSgHNRaRuPZ5vFNks3rQ7KnUpdHhj099KPD3D99ZDMOC90fiBIPstXZKeDLSEGq6tymT
         9ON4RFhkvi6jSB8/Oj5Xi0cdIYetxeUWiifFJKWczZ8hgQpqdsJUnl9/Uwx6rJkeFEJj
         58AJWNsYbe4cmO3e3vyV70t0uKsb/DXhqgr2SLW8GdW3LoqfK74WF1+J9TrqIxeltae+
         yGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3v6TLclWYCTjAr1Tti2BDVXfhzMXBqkZT8bGQWpyYs=;
        b=WYMfzCg0nSbqorxlL0Dm60k97N+JX0JtzwtvemdAytegZ7mu93/dks8HHwSNy18v1e
         7Gyp5Gh+wKRaIQqDztkXz28+J9AujtPFdZMkM640y0d4Gw4VfDa9MYZaDPNLq3T+4Reo
         qmaDDHxESyem0Zwa9fRH7abASXpGC/nGBQ38+/KQK0QnlfuoCmy9aP2Di/UGlYNUECWD
         qNbRArjMAl7BcKlntJ7xjb7RwqwWOQ7FV840LMAc8wA8uEVxDyH4Sk1ep0CJMpOKZxho
         dFU75CymW8FNf2g39Z5afgKOuUgt9XhQ0asjmkqcsBLc9yyPUg+r0htt+FnUdQ22OFpy
         p7fg==
X-Gm-Message-State: APjAAAVhWF55zpH5z81E/FcBSNX4qkirLq2LcJP79I1XFP+G7xQj0u52
        KLHy8JYXg2VDI5yEXr2n9Ql/dc4MLHAui8zdodM=
X-Google-Smtp-Source: APXvYqyW5t23CPvCpiYNBbUwB050BijLjhKoZGvCCP6vJyE4voxLk8m00zN6oc8wm1lTBdkVRCt4NjssIfYO0PsdD3Y=
X-Received: by 2002:a17:906:9447:: with SMTP id z7mr30023478ejx.165.1564592659700;
 Wed, 31 Jul 2019 10:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153857.4045-1-pasha.tatashin@soleen.com>
 <20190731163258.GH39768@lakrids.cambridge.arm.com> <CA+CK2bAYUFBBGo-LHBK4UWRK1tpx3AZ4Z9NkDxiDK0UYEDozaQ@mail.gmail.com>
 <20190731165007.GJ39768@lakrids.cambridge.arm.com>
In-Reply-To: <20190731165007.GJ39768@lakrids.cambridge.arm.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 31 Jul 2019 13:04:08 -0400
Message-ID: <CA+CK2bBOSC0iYjq_A18DNaNCYskTTJJTkM4N-WAqssoxpxuNPg@mail.gmail.com>
Subject: Re: [RFC v2 0/8] arm64: MMU enabled kexec relocation
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        kexec mailing list <kexec@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bhupesh Sharma <bhsharma@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 31, 2019 at 12:50 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Jul 31, 2019 at 12:40:51PM -0400, Pavel Tatashin wrote:
> > On Wed, Jul 31, 2019 at 12:33 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > Hi Pavel,
> > >
> > > Generally, the cover letter should state up-front what the goal is (or
> > > what problem you're trying to solve). It would be really helpful to have
> > > that so that we understand what you're trying to achieve, and why.
>
> [...]
>
> > > > Here is the current data from the real hardware:
> > > > (because of bug, I forced EL1 mode by setting el2_switch always to zero in
> > > > cpu_soft_restart()):
> > > >
> > > > For this experiment, the size of kernel plus initramfs is 25M. If initramfs
> > > > was larger, than the improvements would be even greater, as time spent in
> > > > relocation is proportional to the size of relocation.
> > > >
> > > > Previously:
> > > > kernel shutdown       0.022131328s
> > > > relocation    0.440510736s
> > > > kernel startup        0.294706768s
> > >
> > > In total this takes ~0.76s...
> > >
> > > >
> > > > Relocation was taking: 58.2% of reboot time
> > > >
> > > > Now:
> > > > kernel shutdown       0.032066576s
> > > > relocation    0.022158152s
> > > > kernel startup        0.296055880s
> > >
> > > ... and this takes ~0.35s
> > >
> > > So do we really need this complexity for a few blinks of an eye?
> >
> > Yes, we have an extremely tight reboot budget, 0.35s is not an acceptable waste.
>
> Could you please elaborate on your use-case?
>
> Understanfin what you're trying to achieve would help us to understand
> which solutions make sense.

An extremely high availability device with an update story utilizing
kexec functionality for a faster kernel update and also for being able
to preserve some state in memory without wasting the time of copying
it to and from a backing storage. We at Microsoft will be using a
fleet of these devices. The total reboot budget is less than half a
second, out of which 0.44s is currently spent in kexec relocation.

Pasha

>
> Thanks,
> Mark.
