Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A08527D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Nov 2018 14:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728505AbeKLAsP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 11 Nov 2018 19:48:15 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38432 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728331AbeKLAsP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Nov 2018 19:48:15 -0500
Received: by mail-pg1-f193.google.com with SMTP id f8-v6so2885564pgq.5
        for <linux-doc@vger.kernel.org>; Sun, 11 Nov 2018 06:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cHMilXDw5bUH21G67l5k/4SMtxENZT+u2nIi09szgtg=;
        b=VUEtPQcSNtpd4xatCW/9XAdxj9mvvPthKzgeKrLJMJ6X8vXylFtUjvwieZTRu1zTeo
         Nn//7iQGmhIlUyv33f7Lsj2PGv8j3aYcyrkkCXsmTEdB9C9vJbTvyNTbMKIww7JigqyG
         UtDrKElDXWc6TdXy4HQaEpqIzNxm6dUWU6otSQLvD+jc1iN6i2UqW67sVwO6/+qXxcLB
         cyEP4MHcm+0+ZkpNHhwSfJOTsaGhZIotyr5WrKVuF705Zfla715+piRR/RXJIbco7kZ4
         7cOJRv0rpsdGE33VX3kj3A9clE2QankaVSdDjVUrBUTn522XuiKOH8CpKaiFu/a+BOmT
         ktIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=cHMilXDw5bUH21G67l5k/4SMtxENZT+u2nIi09szgtg=;
        b=Hik390drAwh9Wl70fcOmEBSIQDN4k17N1+eSq8BY3HSH1Zf73OzmRUnHio9ZsqX85G
         EFkGU25YdmC0qeA5Vnu7JilPfApD8x0g1YfhSgMOOR43hXhLue13PSQGE4Ly0P1mKH4w
         kvH4izsEoy4QUoCuMlDSJN3rQ/7moA3M768owcg0TUxZuiSJugQT2AtglLAVifuZW0So
         qRbO70mUy1AS/nI3b+ss7PveCR6aEeqB7BH0f/DNOcru0mL5L1imSEH1pYbfLskomUYe
         ttcTnQAxaxYeP1NeBEnTGYPYWUWTWlqQRhQPKaCLGx0IAwj0LivzlX385a4JH4fn8BUo
         tQbw==
X-Gm-Message-State: AGRZ1gJoubJOsfLAo7HYBdFG9dgeptYDdTFOX2k2DeQYXXq+WR7UuMor
        hRW7nKEZsBzrThHmORZU6SeCow==
X-Google-Smtp-Source: AJdET5dNEybi+r790bTJYFynd4NbV2xibsj/RUUGotHEJhvyeitpfc5tshSP/O6YHMM7l/qKtf0vBg==
X-Received: by 2002:a63:e54:: with SMTP id 20-v6mr13210060pgo.369.1541948367818;
        Sun, 11 Nov 2018 06:59:27 -0800 (PST)
Received: from ?IPv6:2600:1010:b064:bb40:4943:9d87:c587:e641? ([2600:1010:b064:bb40:4943:9d87:c587:e641])
        by smtp.gmail.com with ESMTPSA id v20-v6sm27195306pfj.107.2018.11.11.06.59.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Nov 2018 06:59:26 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 04/27] x86/fpu/xstate: Add XSAVES system states for shadow stack
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <20181111113103.GG27666@amd>
Date:   Sun, 11 Nov 2018 06:59:24 -0800
Cc:     Borislav Petkov <bp@alien8.de>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E917DA9-5192-48E2-8857-08C3ABE08AFE@amacapital.net>
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-5-yu-cheng.yu@intel.com> <20181108184038.GJ7543@zn.tnic> <20181111113103.GG27666@amd>
To:     Pavel Machek <pavel@ucw.cz>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Nov 11, 2018, at 3:31 AM, Pavel Machek <pavel@ucw.cz> wrote:
>=20
> Hi!
>=20
>>> +/*
>>> + * State component 12 is Control flow Enforcement kernel states
>>> + */
>>> +struct cet_kernel_state {
>>> +    u64 kernel_ssp;    /* kernel shadow stack */
>>> +    u64 pl1_ssp;    /* ring-1 shadow stack */
>>> +    u64 pl2_ssp;    /* ring-2 shadow stack */
>>=20
>> Just write "privilege level" everywhere - not "ring".
>=20
> Please just use word "ring". It is well estabilished terminology.
>=20
> Which ring is priviledge level 1, given that we have SMM and
> virtualization support?

To the contrary: CPL, DPL, and RPL are very well defined terms in the archit=
ecture manuals. =E2=80=9CPL=E2=80=9D is privilege level. PL 1 is very well d=
efined.

SMM is SMM, full stop (unless dual mode or whatever it=E2=80=99s called is o=
n, but AFAIK no one uses it).  VMX non-root CPL 1 is *still* privilege level=
 1.

In contrast, the security community likes to call SMM =E2=80=9Cring -1=E2=80=
=9D, which is cute, but wrong from a systems programmer view. For example, S=
MM=E2=80=99s CPL can still range from 0-3.

>=20
>                                    Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/bl=
og.html
