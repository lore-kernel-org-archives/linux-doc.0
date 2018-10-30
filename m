Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DAC7C7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 21:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbeJaF5V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 01:57:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41512 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbeJaF5V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 01:57:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id e22-v6so3444468pfn.8
        for <linux-doc@vger.kernel.org>; Tue, 30 Oct 2018 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6dY837RQhEmGwvz9vbze/eT+gbXOrsHQHQPFduJSgN0=;
        b=wtlh+YOUjRSN6oC/c4JvA5EAWBxuor+FSzHoEDhcIqcBqFVyoVBNtL6jyfHcDmlN0N
         xnElEL66EgOYVxrXy+IG29L0tTU2VwFGVUJG7Yb/KDkILMNsiuU88Gub+Qqheage9e/4
         YorOF4RLHUjJrtACPZnECW/R00mQdJtXfDiy7aB0CeTFFM291Jzt35ZSxXQxE5ISMT3K
         k/bHOTCbY0oef4v7M/V9kB67GtKOoGBkPz5vxlDUbR6Imk3cv+ajBmbUbhhWleXLMnsV
         rY6Z40NqZzfqC3OYK7TKbsK2jp8/xBOnJu+SRYeJKv/YggkM3ZW+cKmT/LY+LQgBB4zl
         iHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6dY837RQhEmGwvz9vbze/eT+gbXOrsHQHQPFduJSgN0=;
        b=gIyoAVJzvRoh75W3PBiOPv76Q8P4+LQkNvqvz7RLeqSD4O7g23YnZZdrtAiuDzGFiG
         VhHjlD4unmcUI48eANVncQ4T7I+COZH8UXqJv+fNLjQWcZ949nX5UX4VFnBAx6BD2Qhr
         AOCz2OvQjUdSE9Q4Ro4KGUciso43kLb53uVbJuTmcpyMJqGg5Jgxjmmz6GzJIh3Eqr+n
         hq9d68AfTvI93uoiJ5I+AC65TJFMpvFT3aed3HObTvOe8brvynOrk8zMMLSsxSqGqDZm
         CJnVCVozICcj0H3jwHE2DcQ7fcVYj6K5Ue3JJeqTfzrcl3qjm8fI6kJN+iN6VijMJDae
         nDtQ==
X-Gm-Message-State: AGRZ1gJbX1zZrraKHMy5srvrcrlyfJfTxck/zK1ePX0OBFI1CCnoUIiR
        8qhX+Fs5b/kJpMwYKjPWS1v8gg==
X-Google-Smtp-Source: AJdET5fS1xJL+nycTTrL8Be3Jq5vtgnwxCO6ZpbPxMxvSIQcdV7HAeGx78CJqVAXtaq0VqB5KAKUNw==
X-Received: by 2002:a62:a50d:: with SMTP id v13-v6mr333447pfm.18.1540933335870;
        Tue, 30 Oct 2018 14:02:15 -0700 (PDT)
Received: from ?IPv6:2600:1010:b021:f9e6:a9a5:9545:35ee:19c8? ([2600:1010:b021:f9e6:a9a5:9545:35ee:19c8])
        by smtp.gmail.com with ESMTPSA id m12-v6sm24976627pgd.81.2018.10.30.14.02.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 14:02:14 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/17] prmem: documentation
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <9edbdf8b-b5fb-5a82-43b4-b639f5ec8484@gmail.com>
Date:   Tue, 30 Oct 2018 14:02:12 -0700
Cc:     Matthew Wilcox <willy@infradead.org>,
        Tycho Andersen <tycho@tycho.ws>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
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
Message-Id: <BAA65A07-F3AF-4209-9D18-7075CEF11EE8@amacapital.net>
References: <20181023213504.28905-11-igor.stoppa@huawei.com> <20181026092609.GB3159@worktop.c.hoisthospitality.com> <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com> <20181028183126.GB744@hirez.programming.kicks-ass.net> <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com> <20181030152641.GE8177@hirez.programming.kicks-ass.net> <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com> <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net> <20181030175814.GB10491@bombadil.infradead.org> <20181030182841.GE7343@cisco> <20181030192021.GC10491@bombadil.infradead.org> <9edbdf8b-b5fb-5a82-43b4-b639f5ec8484@gmail.com>
To:     Igor Stoppa <igor.stoppa@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Oct 30, 2018, at 1:43 PM, Igor Stoppa <igor.stoppa@gmail.com> wrote:
>=20
>> On 30/10/2018 21:20, Matthew Wilcox wrote:
>>> On Tue, Oct 30, 2018 at 12:28:41PM -0600, Tycho Andersen wrote:
>>>> On Tue, Oct 30, 2018 at 10:58:14AM -0700, Matthew Wilcox wrote:
>>>> On Tue, Oct 30, 2018 at 10:06:51AM -0700, Andy Lutomirski wrote:
>>>>>> On Oct 30, 2018, at 9:37 AM, Kees Cook <keescook@chromium.org> wrote:=

>>>>> I support the addition of a rare-write mechanism to the upstream kerne=
l.
>>>>> And I think that there is only one sane way to implement it: using an
>>>>> mm_struct. That mm_struct, just like any sane mm_struct, should only
>>>>> differ from init_mm in that it has extra mappings in the *user* region=
.
>>>>=20
>>>> I'd like to understand this approach a little better.  In a syscall pat=
h,
>>>> we run with the user task's mm.  What you're proposing is that when we
>>>> want to modify rare data, we switch to rare_mm which contains a
>>>> writable mapping to all the kernel data which is rare-write.
>>>>=20
>>>> So the API might look something like this:
>>>>=20
>>>>    void *p =3D rare_alloc(...);    /* writable pointer */
>>>>    p->a =3D x;
>>>>    q =3D rare_protect(p);        /* read-only pointer */
>=20
> With pools and memory allocated from vmap_areas, I was able to say
>=20
> protect(pool)
>=20
> and that would do a swipe on all the pages currently in use.
> In the SELinux policyDB, for example, one doesn't really want to individua=
lly protect each allocation.
>=20
> The loading phase happens usually at boot, when the system can be assumed t=
o be sane (one might even preload a bare-bone set of rules from initramfs an=
d then replace it later on, with the full blown set).
>=20
> There is no need to process each of these tens of thousands allocations an=
d initialization as write-rare.
>=20
> Would it be possible to do the same here?

I don=E2=80=99t see why not, although getting the API right will be a tad co=
mplicated.

>=20
>>>>=20
>>>> To subsequently modify q,
>>>>=20
>>>>    p =3D rare_modify(q);
>>>>    q->a =3D y;
>>>=20
>>> Do you mean
>>>=20
>>>     p->a =3D y;
>>>=20
>>> here? I assume the intent is that q isn't writable ever, but that's
>>> the one we have in the structure at rest.
>> Yes, that was my intent, thanks.
>> To handle the list case that Igor has pointed out, you might want to
>> do something like this:
>>    list_for_each_entry(x, &xs, entry) {
>>        struct foo *writable =3D rare_modify(entry);
>=20
> Would this mapping be impossible to spoof by other cores?
>=20

Indeed. Only the core with the special mm loaded could see it.

But I dislike allowing regular writes in the protected region. We really onl=
y need four write primitives:

1. Just write one value.  Call at any time (except NMI).

2. Just copy some bytes. Same as (1) but any number of bytes.

3,4: Same as 1 and 2 but must be called inside a special rare write region. T=
his is purely an optimization.

Actually getting a modifiable pointer should be disallowed for two reasons:

1. Some architectures may want to use a special write-different-address-spac=
e operation. Heck, x86 could, too: make the actual offset be a secret and sh=
ove the offset into FSBASE or similar. Then %fs-prefixed writes would do the=
 rare writes.

2. Alternatively, x86 could set the U bit. Then the actual writes would use t=
he uaccess helpers, giving extra protection via SMAP.

We don=E2=80=99t really want a situation where an unchecked pointer in the r=
are write region completely defeats the mechanism.=
