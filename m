Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B04397D09E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 17:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966793AbeFSRHc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 13:07:32 -0400
Received: from mail-yb0-f194.google.com ([209.85.213.194]:35008 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966483AbeFSRHa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 13:07:30 -0400
Received: by mail-yb0-f194.google.com with SMTP id a16-v6so169098ybm.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=wOZlw3enDXhMGSm4qy9n+t2r0dJDmmdM7dMCIDKuAJ8=;
        b=ajIs6duIO99rlY5OnQNeepNv6MyamcMXpOU+rdn3xI5ypiC/AAFJWD+3V7Yz87RgP+
         zDY65CUwB1W8whDvJwmGaijw48AkU4BML5p/X/V2Fh9SEzs3EQw9gxuZ+skPMi8q/33M
         /utjrm4GHtrIuv5WnxUGy0VzNQrITe9wbgUEPSeAZ6ShKCkNCKgxOXi3VPNoWe/sibPl
         bo2XZhX8dPHdVbl1DaOWTD9F35tQw7lxcqQrSBPOwLQ1D/K6/oUDYxkpKZn1n5QD4deb
         IStJDpaNvyzdL84xI7u0YsQaUEFYA8slNSmuEZZnq+6zyHXA7VzOaB/px+XZ/HC6xlmj
         QxXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=wOZlw3enDXhMGSm4qy9n+t2r0dJDmmdM7dMCIDKuAJ8=;
        b=fhq/uFnl/xlKwKJihpWmLkAdHXesyt85TA+iM9gLU6+qa04S6QicBibzBxVXovzxmG
         yBSEfq6hQaJaT7rMXY+UQh4fIQyKWCjzEu29Ko1f0eYyzfE0cNUsrTHif3pR1nGI8KJ7
         K/V3b2fbNy+5cItlZa0T7qSC3SjvlObGm+Cpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc:content-transfer-encoding;
        bh=wOZlw3enDXhMGSm4qy9n+t2r0dJDmmdM7dMCIDKuAJ8=;
        b=qPX8bP5JIj3doEuYI6grHwBNOCC0ClRhduyue9Dl2JAXSjPyPh4dqCQj3EcC4lxEdT
         FuayMRF2Jz5AV+QYYR+G7xelVuyoN/EgZuZyHqpI0aE39XqgdKdFeA3Zd9+XUrjN51DB
         bNgCMzwBgzI6iNyjSXnAHnKX+cdCY2TYx0MV08cwEEwHDS7BQYxL03sfeVcfyZcIMrph
         iJ81D85fhvLZ9qbtrj9fp7P6aP57N1YYghvPc7cDBi+EmxN5cFBpQshGtQ0x6O3eDkRz
         U227Zo14znWJmsBm0rUShNAFe0tPK8ay2fFUmVipwJdWmMtRa6fg5W33P52aIDi9uxTF
         p6+Q==
X-Gm-Message-State: APt69E0W6z1/Xlj8rxr0lxxFnCc7gfl8I7v7GWt3Pn2o8DWKn6/eVDua
        wXVHQ9odK9S9/wVshP1W6TFc4GJNEl3qOSMkzcm9Mg==
X-Google-Smtp-Source: ADUXVKLeRtkzxLeSYyNm2mAM03+1xYSdS+KxgASqMyKclnH0q243RpVCs9IAC1qdoulvgo+B+9G5XTGFCriJyjWaqZQ=
X-Received: by 2002:a25:8b05:: with SMTP id i5-v6mr9113328ybl.484.1529428049750;
 Tue, 19 Jun 2018 10:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d6c5:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 10:07:28
 -0700 (PDT)
In-Reply-To: <1529427588.23068.7.camel@intel.com>
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
 <1529427588.23068.7.camel@intel.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 19 Jun 2018 10:07:28 -0700
X-Google-Sender-Auth: 6QIE2ED6Et36C34WIKxh_Z4y_V8
Message-ID: <CAGXu5jJ4ivrvi-kG0iY=4C0mQQXBDXwPdfY36Dk+JqOpX19n0w@mail.gmail.com>
Subject: Re: [PATCH 06/10] x86/cet: Add arch_prctl functions for shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     Andy Lutomirski <luto@amacapital.net>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 19, 2018 at 9:59 AM, Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> On Tue, 2018-06-19 at 09:44 -0700, Kees Cook wrote:
>> On Tue, Jun 19, 2018 at 7:50 AM, Andy Lutomirski <luto@amacapital.net
>> > wrote:
>> >
>> > >
>> > > On Jun 18, 2018, at 5:52 PM, Kees Cook <keescook@chromium.org>
>> > > wrote:
>> > > Following Linus's request for "slow introduction" of new security
>> > > features, likely the best approach is to default to "relaxed"
>> > > (with a
>> > > warning about down-grades), and allow distros/end-users to pick
>> > > "forced" if they know their libraries are all CET-enabled.
>> > I still don=E2=80=99t get what =E2=80=9Crelaxed=E2=80=9D is for.  I th=
ink the right design
>> > is:
>> >
>> > Processes start with CET on or off depending on the ELF note, but
>> > they start with CET unlocked no matter what. They can freely switch
>> > CET on and off (subject to being clever enough not to crash if they
>> > turn it on and then return right off the end of the shadow stack)
>> > until they call ARCH_CET_LOCK.
>> I'm fine with this. I'd expect modern loaders to just turn on CET and
>> ARCH_CET_LOCK immediately and be done with it. :P
>
> This is the current implementation.  If the loader has CET in its ELF
> header, it is executed with CET on.  The loader will turn off CET if
> the application being loaded does not support it (in the ELF header).
>  The loader calls ARCH_CET_LOCK before passing to the application.  But
> how do we handle dlopen?

I thought CET_LOCK would not get set in "relaxed" mode, due to dlopen
usage, and that would be the WARN case. People without dlopen concerns
can boot with "enforced" mode? If a system builder knows there are no
legacy dlopens they build with enforced enabled, etc.

>> > Ptrace gets new APIs to turn CET on and off and to lock and unlock
>> > it.  If an attacker finds a =E2=80=9Cptrace me and turn off CET=E2=80=
=9D gadget,
>> > then they might as well just do =E2=80=9Cptrace me and write shell cod=
e=E2=80=9D
>> > instead. It=E2=80=99s basically the same gadget. Keep in mind that the
>> > actual sequence of syscalls to do this is incredibly complicated.
>> Right -- if an attacker can control ptrace of the target, we're way
>> past CET. The only concern I have, though, is taking advantage of
>> expected ptracing. For example: browsers tend to have crash handlers
>> that launch a ptracer. If ptracing disabled CET for all threads, this
>> won't by safe: an attacker just gains control in two threads, crashes
>> one to get the ptracer to attach, which disables CET in the other
>> thread and the attacker continues ROP as normal. As long as the
>> ptrace
>> disabling is thread-specific, I think this will be okay.
>
> If ptrace can turn CET on/off and it is thread-specific, do we still
> need ptrace lock/unlock?

Does it provide anything beyond what PR_DUMPABLE does?

-Kees

--=20
Kees Cook
Pixel Security
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
