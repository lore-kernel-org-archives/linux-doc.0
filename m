Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 567327DE7F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Jul 2018 02:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388073AbeGMCeJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 22:34:09 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33284 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbeGMCeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jul 2018 22:34:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id r5-v6so4430098pgv.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Jul 2018 19:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=VMG98WkTF/mPvmh0b4ZGZibMeOHdZxDMpo96QUx+54Q=;
        b=gBsa3UPN96SxMI/gVLHmOB3r3xQrFYHl+Y8KlJy+B2X818xJkTBTlmp56gYg9ICowf
         8BVhqjSal6A76Q4QKd1doUr3db+iDI75H5Jfo7qaay1nMdM6MutIjAeU3ut3AokwtrDY
         wcDvdXfAzqai9JGkmVd+D10lH+s0Ect9F0tzWPu9LMVG/3+EhvlfLp/bwE4TwHkvKm1j
         kh/sZxOI6k0S1H2Fw8nzyUumS1ywKUOxABt4+0KPcbVL02COwiia+OHBWYhrcR332XPI
         5X0UK6iyqGRpKoaubmSexjD9UMVuA7v0GYmkoXUFMkYTAdeie72GZDBm5qXfG4Y/dWaM
         El1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=VMG98WkTF/mPvmh0b4ZGZibMeOHdZxDMpo96QUx+54Q=;
        b=i3+6/mbPDawkZmOWJ+q3OG1z4v6FC6kIwnjctZS5Xap0m/Eeg2jauYx4fgWRCTNWem
         l/9yFwUZ+n2Ea2pwUVUqspfNUwfKHdQXwHpbqhfZxSirs5dRf+RvoBHxwras6m3CmCqr
         sJIotlaEw5D8kx+QxK7FyUlA+fiF1d2WJa105FUVPk1aMlhyCVbGPPcVXyu3H/QF+F1F
         7wFKOWk5R0fGSejpJHi8H/KvERAfQVwb0CzeE0uMa8Yza9x7J2wfjlsWpvOzUVVxPtkn
         Szcp18gx/vWaMNFJiN7GXAukxAZxNWFyeF+h3NUSsrCD+OZY63tZIqk7+/GZaJuPxRAd
         Xzlw==
X-Gm-Message-State: AOUpUlEvhpZcoQkVHy6sDB6KLk/8/RGA0Ed0geVzEJkS19BhqQ1F2nEu
        +Z5v05sW9KHeb+1sa7TM+ENsbg==
X-Google-Smtp-Source: AAOMgpfGMw8dfnxP2DIYRSVsrRbQp6mwqxV7HfhqrbJs7jULkqYDJkgjsLFNGjRuGS6DZEvX2lPvQg==
X-Received: by 2002:a62:404e:: with SMTP id n75-v6mr4937887pfa.232.1531448505785;
        Thu, 12 Jul 2018 19:21:45 -0700 (PDT)
Received: from ?IPv6:2600:1011:b01e:e4d1:54df:ba07:cac1:aeab? ([2600:1011:b01e:e4d1:54df:ba07:cac1:aeab])
        by smtp.gmail.com with ESMTPSA id n18-v6sm62228505pfa.50.2018.07.12.19.21.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jul 2018 19:21:44 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 18/27] x86/cet/shstk: Introduce WRUSS instruction
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (15F79)
In-Reply-To: <167645aa-f1c7-bd6a-c7e0-2da317cbbaba@intel.com>
Date:   Thu, 12 Jul 2018 19:21:42 -0700
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <55A0592D-0E8D-4BC5-BA4B-E82E92EEA36A@amacapital.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-19-yu-cheng.yu@intel.com> <bbb487cc-ac1c-f734-eee3-2463a0ba7efc@linux.intel.com> <1531436398.2965.18.camel@intel.com> <46784af0-6fbb-522d-6acb-c6248e5e0e0d@linux.intel.com> <167645aa-f1c7-bd6a-c7e0-2da317cbbaba@intel.com>
To:     Dave Hansen <dave.hansen@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Jul 12, 2018, at 6:50 PM, Dave Hansen <dave.hansen@intel.com> wrote:
>=20
> On 07/12/2018 04:49 PM, Dave Hansen wrote:
>>>> That seems like something we need to call out if so.  It also means we
>>>> need to update the SDM because some of the text is wrong.
>>> It needs to mention the WRUSS case.
>> Ugh.  The documentation for this is not pretty.  But, I guess this is
>> not fundamentally different from access to U=3D1 pages when SMAP is in
>> place and we've set EFLAGS.AC=3D1.
>=20
> I was wrong and misread the docs.  We do not get X86_PF_USER set when
> EFLAGS.AC=3D1.
>=20
> But, we *do* get X86_PF_USER (otherwise defined to be set when in ring3)
> when running in ring0 with the WRUSS instruction and some other various
> shadow-stack-access-related things.  I'm sure folks had a good reason
> for this architecture, but it is a pretty fundamentally *new*
> architecture that we have to account for.

I think it makes (some) sense. The USER bit is set for a page fault that was=
 done with user privilege. So a descriptor table fault at CPL 3 has USER cle=
ar (regardless of the cause of the fault) and WRUSS has USER set.

>=20
> This new architecture is also not spelled out or accounted for in the
> SDM as of yet.  It's only called out here as far as I know:
> https://software.intel.com/sites/default/files/managed/4d/2a/control-flow-=
enforcement-technology-preview.pdf
>=20
> Which reminds me:  Yu-cheng, do you have a link to the docs anywhere in
> your set?  If not, you really should.

I am tempted to suggest that the whole series not be merged until there are a=
ctual docs. It=E2=80=99s not a fantastic precedent.=
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
