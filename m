Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8EC6F7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 20:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755475AbeFSUrg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 16:47:36 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:35904 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755280AbeFSUrf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 16:47:35 -0400
Received: by mail-pl0-f67.google.com with SMTP id a7-v6so479388plp.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 13:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Hna65Qii4Y07/hwRcMlHHRl8clNAP2YSD03xwzMcGr0=;
        b=VNBQe/r0okWsKxg7Vcf0OgNXm9yHLR5IEm0SwusV58SL9lH0AINptiTMKCYVFLpk+V
         CRiPjwbQy4Hph4MJkhS+N9eH+ZhzYbH/lZbvgRFVHyTMY5iPbNHuYMSJ0AXLHfjrU9Tf
         HozJc18MqIrdt5QjWpzsAXIP/+DsC+pMATTrDPJyvdsgFF8xuWRajihBNbjjAE7Fm2LN
         OXV+fKsccm1SkDELdPwmtPqjQ8ZxO8hJDjWzEJf1+1AhpaDz7RJGq70uPvd+knT3tzLv
         xfBnK+wOTN6qisnJpKBfinRcP7mP9wu+4QsQrmbJ4xaUYYqn9QZ+Pn6VlmT8LrNUx+Lw
         Sizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Hna65Qii4Y07/hwRcMlHHRl8clNAP2YSD03xwzMcGr0=;
        b=pDjFhrb+4U+QNbw1cZ0xUxpxpbodVyoe21w9CWKUeaj4JvHgW8yUDgeETwOzYvqWA7
         QXrV0J6ugrbJJ9a8zwrsZKcTIr+hIzSHd2noFv5n3yEBXFxloJCTeArrpt3rIZ10K28p
         0mgxd9/DPAvY5huX2e2ejaTnYRwnigJpyDsUI+pZLnTt+2O7E01N0OLmxyC5SpabqRxE
         W7fOFMJpg7uoLT+DPEpJ9UpB5Dp5HI9d7pFJLO9e+Qr56K3XD4ULyJM0u5p3+g9TMkY1
         PNNyCNalYBSQq1z3iaB74WBaazDGAmOW9/JBE2RJmq8NpoCVBJYDzmA3f2y6ZZeAzgAI
         ZaGw==
X-Gm-Message-State: APt69E0Ruuve2zX14lg4bS/iMwg+LvSu7gUhIG/iLsseMI7PRm2fiFv3
        eLjZUDzrgeXRuiPjBnxJBfqVcQ==
X-Google-Smtp-Source: ADUXVKJzK+AQUr7SJX2e23MfUWF76NJkZhfCynWMhtR4HdBtmszqtZqf/NelictHSl8ZhqJkVTLtpw==
X-Received: by 2002:a17:902:aa87:: with SMTP id d7-v6mr14984009plr.215.1529441254854;
        Tue, 19 Jun 2018 13:47:34 -0700 (PDT)
Received: from ?IPv6:2601:646:c200:7429:d482:e0fa:500f:80eb? ([2601:646:c200:7429:d482:e0fa:500f:80eb])
        by smtp.gmail.com with ESMTPSA id j127-v6sm504773pgc.10.2018.06.19.13.47.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jun 2018 13:47:33 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 06/10] x86/cet: Add arch_prctl functions for shadow stack
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (15F79)
In-Reply-To: <CAGXu5jLEMy_T_5OtXLT+pUCt=Nk53nBbuRvrUgJBhq-4RZ=yCA@mail.gmail.com>
Date:   Tue, 19 Jun 2018 13:47:32 -0700
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com, Florian Weimer <fweimer@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <446EB18D-EF06-4A04-AF62-E72C68D96A84@amacapital.net>
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-7-yu-cheng.yu@intel.com>
 <CALCETrU6axo158CiSCRRkC4GC5hib9hypC98t7LLjA3gDaacsw@mail.gmail.com>
 <1528403417.5265.35.camel@2b52.sc.intel.com> <CALCETrXz3WWgZwUXJsDTWvmqKUArQFuMH1xJdSLVKFpTysNWxg@mail.gmail.com>
 <CAMe9rOr49V8rqRa_KVsw61PWd+crkQvPDgPKtvowazjmsfgWWQ@mail.gmail.com>
 <alpine.DEB.2.21.1806121155450.2157@nanos.tec.linutronix.de>
 <CAMe9rOoCiXQ4iVD3j_AHGrvEXtoaVVZVs7H7fCuqNEuuR5j+2Q@mail.gmail.com>
 <CALCETrXO8R+RQPhJFk4oiA4PF77OgSS2Yro_POXQj1zvdLo61A@mail.gmail.com>
 <CAMe9rOpLxPussn7gKvn0GgbOB4f5W+DKOGipe_8NMam+Afd+RA@mail.gmail.com>
 <CALCETrWmGRkQvsUgRaj+j0CP4beKys+TT5aDR5+18nuphwr+Cw@mail.gmail.com>
 <CAMe9rOpzcCdje=bUVs+C1WrY6GuwA-8AUFVLOG325LGz7KHJxw@mail.gmail.com>
 <alpine.DEB.2.21.1806122046520.1592@nanos.tec.linutronix.de>
 <CAMe9rOrGjJf0aMnUjAP38MqvOiW3=iXGQjcUT3O=f9pE85hXaw@mail.gmail.com>
 <CALCETrVsh5t-V1Sm88LsZE_+DS0GE_bMWbcoX3SjD6GnrB08Pw@mail.gmail.com>
 <CAGXu5jK0gospOXRpN6zYiQPXOZeE=YpVAz2qu4Zc3-32v85+EQ@mail.gmail.com>
 <569B4719-6283-4575-A16E-D0A78D280F4E@amacapital.net> <CAGXu5jJNgu4bW_Zthqjfpe9gLxK0zxG8QFEqqK+pJNebz6tUaw@mail.gmail.com>
 <1529427588.23068.7.camel@intel.com> <CAGXu5jJ4ivrvi-kG0iY=4C0mQQXBDXwPdfY36Dk+JqOpX19n0w@mail.gmail.com>
 <0AF8B71E-B6CC-42DE-B95C-93896196C3D7@amacapital.net> <CAGXu5jLEMy_T_5OtXLT+pUCt=Nk53nBbuRvrUgJBhq-4RZ=yCA@mail.gmail.com>
To:     Kees Cook <keescook@chromium.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Jun 19, 2018, at 1:12 PM, Kees Cook <keescook@chromium.org> wrote:
>=20
>> On Tue, Jun 19, 2018 at 10:20 AM, Andy Lutomirski <luto@amacapital.net> w=
rote:
>>=20
>>> On Jun 19, 2018, at 10:07 AM, Kees Cook <keescook@chromium.org> wrote:
>>>=20
>>> Does it provide anything beyond what PR_DUMPABLE does?
>>=20
>> What do you mean?
>=20
> I was just going by the name of it. I wasn't sure what "ptrace CET
> lock" meant, so I was trying to understand if it was another "you
> can't ptrace me" toggle, and if so, wouldn't it be redundant with
> PR_SET_DUMPABLE =3D 0, etc.
>=20

No, other way around. The valid CET states are on/unlocked, off/unlocked, on=
/locked, off/locked. arch_prctl can freely the state unless locked. ptrace c=
an change it no matter what.  The lock is to prevent the existence of a gadg=
et to disable CET (unless the gadget involves ptrace, but I don=E2=80=99t th=
ink that=E2=80=99s a real concern).=
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
