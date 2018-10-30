Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0AC4B7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 18:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbeJaDqB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Oct 2018 23:46:01 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37026 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbeJaDqA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Oct 2018 23:46:00 -0400
Received: by mail-pf1-f196.google.com with SMTP id u13-v6so684976pfm.4
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 11:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rb6YvcGOAMe/gwiFBMF9WZ2MVHDY2CeNDGz9YQsONMw=;
        b=dlnDeEWl/upXbbOU895iXNU3Fv7dD34w37fudMV6cLJ0OWuqgP2au4nclePyohHbeC
         t2624op9N/hpZYLdggT+0lWOYZz0XaIaOYScrz6WpzaA8Ar45iShOgq0Lc2Y9U7yn9f0
         sS9HPVTm8/kfK2CeoXd+oV/W6ps7FkjzRvAiAOJEFq1DNTAH7y8WC3gBHSdwAD//rHch
         zxoJnEQ4Di9AwFI5VVIwM8VjExVK5S4saWiwV08gFAgIeqauKSck1AKUbds34kGgddeJ
         3YYKRpyPuC4DsexudYrLf9PY3Yau7g6crupTZJ46n6t0e51biDl9VQfxwKuPkn8Has9f
         8dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rb6YvcGOAMe/gwiFBMF9WZ2MVHDY2CeNDGz9YQsONMw=;
        b=gbBvxpdFi6se6bOOkAg7AoGG6Y1PylMNXUu+hTSf2pfaFwUBPGBcZcpMKLhTYPZjdO
         uVhiFKxfQsXtGiDY1w9bLY8697Xdw3SIwRFso6Oo4yH6CJd/6GMi8yok/p1jVTWpRdbB
         thk7DXCW7bpbkvPXkoELUekSRjPS0VOYNChwrIrhB7qq5H8j2fdCSUMtwAcyTRmGM9q5
         BFE9tSOdoA52v0AKCJ7touenO4ZtHs4dMCHF9V1TECguUn5Qk9lHwLFbKfB+l59GhzcF
         MRQNeOTliY2SUSRWrMbiUs0HjduKlSGjIZCY8RMwkR9W4F3/tx13aEtvt25/CuPmNKoI
         nB+A==
X-Gm-Message-State: AGRZ1gKmg5YjPNNCbxXm6RSC4+Uy0b9+VT7RtnY6xXCRqRpgFwHDRxfB
        xxFFzi7FQRC/G5EQT55PRudmAA==
X-Google-Smtp-Source: AJdET5dJlZ4nxUnqhdvGPbfJBzHxBH8NcYilBZIMH/rItwX1GAspFkxj86srmnWm+e37pScA+3erQg==
X-Received: by 2002:a62:5343:: with SMTP id h64-v6mr4136829pfb.226.1540925480273;
        Tue, 30 Oct 2018 11:51:20 -0700 (PDT)
Received: from ?IPv6:2600:1010:b021:f9e6:a9a5:9545:35ee:19c8? ([2600:1010:b021:f9e6:a9a5:9545:35ee:19c8])
        by smtp.gmail.com with ESMTPSA id u1-v6sm24711389pgr.61.2018.10.30.11.51.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 11:51:18 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/17] prmem: documentation
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <20181030175814.GB10491@bombadil.infradead.org>
Date:   Tue, 30 Oct 2018 11:51:17 -0700
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Igor Stoppa <igor.stoppa@gmail.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
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
Message-Id: <28C8CD2A-BDC0-49A5-854E-1E18968528B8@amacapital.net>
References: <20181023213504.28905-1-igor.stoppa@huawei.com> <20181023213504.28905-11-igor.stoppa@huawei.com> <20181026092609.GB3159@worktop.c.hoisthospitality.com> <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com> <20181028183126.GB744@hirez.programming.kicks-ass.net> <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com> <20181030152641.GE8177@hirez.programming.kicks-ass.net> <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com> <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net> <20181030175814.GB10491@bombadil.infradead.org>
To:     Matthew Wilcox <willy@infradead.org>, nadav.amit@gmail.com
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Oct 30, 2018, at 10:58 AM, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Tue, Oct 30, 2018 at 10:06:51AM -0700, Andy Lutomirski wrote:
>>> On Oct 30, 2018, at 9:37 AM, Kees Cook <keescook@chromium.org> wrote:
>> I support the addition of a rare-write mechanism to the upstream kernel.
>> And I think that there is only one sane way to implement it: using an
>> mm_struct. That mm_struct, just like any sane mm_struct, should only
>> differ from init_mm in that it has extra mappings in the *user* region.
>=20
> I'd like to understand this approach a little better.  In a syscall path,
> we run with the user task's mm.  What you're proposing is that when we
> want to modify rare data, we switch to rare_mm which contains a
> writable mapping to all the kernel data which is rare-write.
>=20
> So the API might look something like this:
>=20
>    void *p =3D rare_alloc(...);    /* writable pointer */
>    p->a =3D x;
>    q =3D rare_protect(p);        /* read-only pointer */
>=20
> To subsequently modify q,
>=20
>    p =3D rare_modify(q);
>    q->a =3D y;
>    rare_protect(p);

How about:

rare_write(&q->a, y);

Or, for big writes:

rare_write_copy(&q, local_q);

This avoids a whole ton of issues.  In practice, actually running with a spe=
cial mm requires preemption disabled as well as some other stuff, which Nada=
v carefully dealt with.

Also, can we maybe focus on getting something merged for statically allocate=
d data first?

Finally, one issue: rare_alloc() is going to utterly suck performance-wise d=
ue to the global IPI when the region gets zapped out of the direct map or ot=
herwise made RO.  This is the same issue that makes all existing XPO efforts=
 so painful. We need to either optimize the crap out of it somehow or we nee=
d to make sure it=E2=80=99s not called except during rare events like device=
 enumeration.

Nadav, want to resubmit your series?  IIRC the only thing wrong with it was t=
hat it was a big change and we wanted a simpler fix to backport. But that=E2=
=80=99s all done now, and I, at least, rather liked your code. :)
