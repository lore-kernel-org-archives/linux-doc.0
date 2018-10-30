Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ACDF97D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 17:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbeJaCBO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Oct 2018 22:01:14 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35305 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbeJaCBO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Oct 2018 22:01:14 -0400
Received: by mail-pl1-f193.google.com with SMTP id n4-v6so5281742plp.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sJmp+TrcVE0cp1ysnbfmg2a9gbYbs/fVQwhmUWhAsKM=;
        b=p1l66SWYsa9jw7rC4PMjsgTC62QiTmvIb5lE1PnTeKkdUJFayeHPDUMw6jW3+RzpFu
         pKOQdHK/b5u9j+v+6E8yGOsp0dO9E5G9WVJE6wotNmtxGeYIsom8GcQWnDNIieLtPMwM
         xigXW4Ywm9Thy8f/fQfppOcFf0vRpJptRvlODU2nlbnsra2MhrrcYXTosAjSIoNUsarb
         XbdLjn4SBUPrxtf7sJctAqhEe63yVYFXz9rBzwtsYjLNX7+riHwnd+r62e4XzN7ZkZeK
         /u3L9UQyFp87WLV1aHCGlhTtqW5Jz1NE+fSsKJvtD2Ndlj10qlKLdOxDeK1rt9YdIPRo
         yH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sJmp+TrcVE0cp1ysnbfmg2a9gbYbs/fVQwhmUWhAsKM=;
        b=HWFedfPMaKrv9COp2dnbYZFGKic9XSWHmSYD8CT5DrMYgTEeFuJ3HqON7sa7e78Xal
         DzgeB6WLj3LejP3sv7h0Rc7ChY7ZVR5PSX7eGkH6tNYUreAMRUkThBTnnBozGO0U9/F0
         QNm/gXJH3UIGD0zl3MyRl8lMbobANLvDVDu6iXQHHg3mPeJA7tq91c+ExHx4zqeB3zWl
         aDEbuHgUBgzpMAJSHV7hDN87Wu2yVOjUj/Om1s8XSsX3Fv6B8GKMC9IXszAUDL4jYC++
         dA6AY8SqAUKn8MCMO2lFpuZNB0iDv8CCH5ORDNYdphlVDDMWgNraBxB5xfpHwGS2/Jtl
         Bmgw==
X-Gm-Message-State: AGRZ1gK4VnpX6VLrvN6kDs8FoVlicHELT6GtEBtuqVyfdS2OLA6pf9Lh
        JMFUHO/EtfkIcIgYX/h8azh9Fg==
X-Google-Smtp-Source: AJdET5fnTABXu89GAubNDA3hUzdJdWV/ivDrtYqUoxQ/cSMvKdlm4RK2+Mqv63Iu2OSxu7de7vlwHA==
X-Received: by 2002:a17:902:4025:: with SMTP id b34-v6mr15610050pld.318.1540919215631;
        Tue, 30 Oct 2018 10:06:55 -0700 (PDT)
Received: from ?IPv6:2600:1010:b06f:4f72:1c47:d0f8:77c2:af6e? ([2600:1010:b06f:4f72:1c47:d0f8:77c2:af6e])
        by smtp.gmail.com with ESMTPSA id e8-v6sm948953pgh.67.2018.10.30.10.06.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 10:06:53 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/17] prmem: documentation
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
Date:   Tue, 30 Oct 2018 10:06:51 -0700
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Igor Stoppa <igor.stoppa@gmail.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Matthew Wilcox <willy@infradead.org>,
        Dave Chinner <david@fromorbit.com>,
        James Morris <jmorris@namei.org>,
        Michal Hocko <mhocko@kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Igor Stoppa <igor.stoppa@huawei.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Laura Abbott <labbott@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net>
References: <20181023213504.28905-1-igor.stoppa@huawei.com> <20181023213504.28905-11-igor.stoppa@huawei.com> <20181026092609.GB3159@worktop.c.hoisthospitality.com> <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com> <20181028183126.GB744@hirez.programming.kicks-ass.net> <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com> <20181030152641.GE8177@hirez.programming.kicks-ass.net> <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
To:     Kees Cook <keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Oct 30, 2018, at 9:37 AM, Kees Cook <keescook@chromium.org> wrote:
>=20
>> On Tue, Oct 30, 2018 at 8:26 AM, Peter Zijlstra <peterz@infradead.org> wr=
ote:
>> I suppose the 'normal' attack goes like:
>>=20
>> 1) find buffer-overrun / bound check failure
>> 2) use that to write to 'interesting' location
>> 3) that write results arbitrary code execution
>> 4) win
>>=20
>> Of course, if the store of 2 is to the current cred structure, and
>> simply sets the effective uid to 0, we can skip 3.
>=20
> In most cases, yes, gaining root is game over. However, I don't want
> to discount other threat models: some systems have been designed not
> to trust root, so a cred attack doesn't always get an attacker full
> control (e.g. lockdown series, signed modules, encrypted VMs, etc).
>=20
>> Which seems to suggest all cred structures should be made r/o like this.
>> But I'm not sure I remember these patches doing that.
>=20
> There are things that attempt to protect cred (and other things, like
> page tables) via hypervisors (see Samsung KNOX) or via syscall
> boundary checking (see Linux Kernel Runtime Guard). They're pretty
> interesting, but I'm not sure if there is a clear way forward on it
> working in upstream, but that's why I think these discussions are
> useful.
>=20
>> Also, there is an inverse situation with all this. If you make
>> everything R/O, then you need this allow-write for everything you do,
>> which then is about to include a case with an overflow / bound check
>> fail, and we're back to square 1.
>=20
> Sure -- this is the fine line in trying to build these defenses. The
> point is to narrow the scope of attack. Stupid metaphor follows: right
> now we have only a couple walls; if we add walls we can focus on make
> sure the doors and windows are safe. If we make the relatively
> easy-to-find-in-memory page tables read-only-at-rest then a whole
> class of very powerful exploits that depend on page table attacks go
> away.
>=20
> As part of all of this is the observation that there are two types of
> things clearly worth protecting: that which is updated rarely (no need
> to leave it writable for so much of its lifetime), and that which is
> especially sensitive (page tables, security policy, function pointers,
> etc). Finding a general purpose way to deal with these (like we have
> for other data-lifetime cases like const and __ro_after_init) would be
> very nice. I don't think there is a slippery slope here.
>=20
>=20

Since I wasn=E2=80=99t cc=E2=80=99d on this series:

I support the addition of a rare-write mechanism to the upstream kernel.  An=
d I think that there is only one sane way to implement it: using an mm_struc=
t. That mm_struct, just like any sane mm_struct, should only differ from ini=
t_mm in that it has extra mappings in the *user* region.

If anyone wants to use CR0.WP instead, I=E2=80=99ll remind them that they ha=
ve to fix up the entry code and justify the added complexity. And make perfo=
rmance not suck in a VM (i.e. CR0 reads on entry are probably off the table)=
.  None of these will be easy.

If anyone wants to use kmap_atomic-like tricks, I=E2=80=99ll point out that w=
e already have enough problems with dangling TLB entries due to SMP issues. T=
he last thing we need is more of them. If someone proposes a viable solution=
 that doesn=E2=80=99t involve CR3 fiddling, I=E2=80=99ll be surprised.

Keep in mind that switch_mm() is actually decently fast on modern CPUs.  It=E2=
=80=99s probably considerably faster than writing CR0, although I haven=E2=80=
=99t benchmarked it. It=E2=80=99s certainly faster than writing CR4.  It=E2=80=
=99s also faster than INVPCID, surprisingly, which means that it will be qui=
te hard to get better performance using any sort of trickery.

Nadav=E2=80=99s patch set would be an excellent starting point.

P.S. EFI is sort of grandfathered in as a hackish alternate page table hiera=
rchy. We=E2=80=99re not adding another one.=
