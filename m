Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B521C2BB9A
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D4423B31
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730827AbgLHRop (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 12:44:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:37656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730828AbgLHRop (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Dec 2020 12:44:45 -0500
X-Gm-Message-State: AOAM533vKOP+FnHiFOpvTunF870cfgUBc+hCdZySO0ZGAc0JXDN8Mi4f
        kQA9tVecZQEFGzXQr4mE9vnZGkqndK6rYcZK+RoEoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607449444;
        bh=qOJEF76l9wC8yLqJEJDwkrt5AGUmhLvlKmfUMREz+ko=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lSvfib7P3AVlYu9q9V6tcDuI3qysM4wFPn9GuC4qRGsSzNkj9hjl+RoVLxhua80cV
         EBp4Ga5h0wGdym1LJBAGrLr6WnHo3t2NqpvbvkTpA4gLNz0wltb7rQvcbKz/C14eQi
         xCeso8k50bFfPQfVOj+odi/hIeGu4L/cgT+bvGI30N0kRm/Tz1FM8fk5DMpjDfMVpI
         vESGtTyYmraV3BDegT+pvbBZ45F7gn+bxeLrut/vfjSAbtS2tgBRUJzZZ2umCs8+wb
         h/WMpQ6bl1vk8gtgOxeFqTnwjrZdjomXgJ0fq7pT29EMasjbALLdr/DENEBQ6qAtq+
         mFKFh1zH5504Q==
X-Google-Smtp-Source: ABdhPJxx38F+AYzAUbFPiyi/arpdYMpWh2pcmMLnvFDFDjtyr8BqYrmCqo4vk1YSkwXojlzdjAdLKo7OSbBpcW6fBRw=
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr4943071wmd.49.1607449442016;
 Tue, 08 Dec 2020 09:44:02 -0800 (PST)
MIME-Version: 1.0
References: <636fecc20b0143128b484f159ff795ff65d05b82.camel@redhat.com>
 <885C1725-B479-47F6-B08D-A7181637A80A@amacapital.net> <20201207231127.GB27492@fuller.cnet>
In-Reply-To: <20201207231127.GB27492@fuller.cnet>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 8 Dec 2020 09:43:50 -0800
X-Gmail-Original-Message-ID: <CALCETrX7F3EgshyTfsNZy8R=NzyQNOY6JAULfiuOCxc1Fz8mPQ@mail.gmail.com>
Message-ID: <CALCETrX7F3EgshyTfsNZy8R=NzyQNOY6JAULfiuOCxc1Fz8mPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: x86: implement KVM_{GET|SET}_TSC_STATE
To:     Marcelo Tosatti <mtosatti@redhat.com>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kvm list <kvm@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Mattson <jmattson@google.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Borislav Petkov <bp@alien8.de>,
        Shuah Khan <shuah@kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Oliver Upton <oupton@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 8, 2020 at 6:23 AM Marcelo Tosatti <mtosatti@redhat.com> wrote:
>
> On Mon, Dec 07, 2020 at 10:04:45AM -0800, Andy Lutomirski wrote:
> >
> >
> > I do have a feature request, though: IMO it would be quite nifty if the=
 new kvmclock structure could also expose NTP corrections. In other words, =
if you could expose enough info to calculate CLOCK_MONOTONIC_RAW, CLOCK_MON=
OTONIC, and CLOCK_REALTIME, then we could have paravirt NTP.
>
> Hi Andy,
>
> Any reason why drivers/ptp/ptp_kvm.c does not work for you?
>

It looks like it tries to accomplish the right goal, but in a rather
roundabout way.  The host knows how to convert from TSC to
CLOCK_REALTIME, and ptp_kvm.c exposes this data to the guest.  But,
rather than just making the guest use the same CLOCK_REALTIME data as
the host, ptp_kvm.c seems to expose information to usermode that a
user daemon could use to attempt (with some degree of error?) to use
to make the guest kernel track CLOCK_REALTIME.  This seems inefficient
and dubiously accurate.

My feature request is for this to be fully automatic and completely
coherent.  I would like for a host user program and a guest user
program to be able to share memory, run concurrently, and use the
shared memory to exchange CLOCK_REALTIME values without ever observing
the clock going backwards.  This ought to be doable.  Ideally the
result should even be usable for Spanner-style synchronization
assuming the host clock is good enough.  Also, this whole thing should
work without needing to periodically wake the guest to remain
synchronized.  If the guest sleeps for two minutes (full nohz-idle, no
guest activity at all), the host makes a small REALTIME frequency
adjustment, and then the guest runs user code that reads
CLOCK_REALTIME, the guest clock should still be fully synchronized
with the host.  I don't think that ptp_kvm.c-style synchronization can
do this.

tglx etc, I think that doing this really really nicely might involve
promoting something like the current vDSO data structures to ABI -- a
straightforward-ish implementation would be for the KVM host to export
its vvar clock data to the guest and for the guest to use it, possibly
with an offset applied.  The offset could work a lot like timens works
today.

--Andy
