Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7752B7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 17:13:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751280AbeERRNQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 13:13:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55990 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750957AbeERRNP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 May 2018 13:13:15 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.24])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AF75D30C3284;
        Fri, 18 May 2018 17:13:15 +0000 (UTC)
Received: from localhost (ovpn-116-18.gru2.redhat.com [10.97.116.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3738B30B7785;
        Fri, 18 May 2018 17:13:13 +0000 (UTC)
Date:   Fri, 18 May 2018 14:13:11 -0300
From:   Eduardo Habkost <ehabkost@redhat.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
        Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        qemu-devel@nongnu.org
Subject: Re: [PATCH] kvm: rename HINTS_DEDICATED to KVM_HINTS_REALTIME
Message-ID: <20180518171311.GB25013@localhost.localdomain>
References: <1526568841-35372-1-git-send-email-mst@redhat.com>
 <20180517184658.GA1543@localhost.localdomain>
 <20180517225316-mutt-send-email-mst@kernel.org>
 <20180518160431.GX25013@localhost.localdomain>
 <20180518195139-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180518195139-mutt-send-email-mst@kernel.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 18 May 2018 17:13:15 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 18, 2018 at 08:01:49PM +0300, Michael S. Tsirkin wrote:
> On Fri, May 18, 2018 at 01:04:31PM -0300, Eduardo Habkost wrote:
> > CCing qemu-devel, as I'm now discussing userspace.
> > 
> > On Thu, May 17, 2018 at 10:55:33PM +0300, Michael S. Tsirkin wrote:
> > > On Thu, May 17, 2018 at 03:46:58PM -0300, Eduardo Habkost wrote:
> > > > On Thu, May 17, 2018 at 05:54:24PM +0300, Michael S. Tsirkin wrote:
> > > > > HINTS_DEDICATED seems to be somewhat confusing:
> > > > > 
> > > > > Guest doesn't really care whether it's the only task running on a host
> > > > > CPU as long as it's not preempted.
> > > > > 
> > > > > And there are more reasons for Guest to be preempted than host CPU
> > > > > sharing, for example, with memory overcommit it can get preempted on a
> > > > > memory access, post copy migration can cause preemption, etc.
> > > > > 
> > > > > Let's call it KVM_HINTS_REALTIME which seems to better
> > > > > match what guests expect.
> > > > > 
> > > > > Also, the flag most be set on all vCPUs - current guests assume th.
> > > > > Note so in the documentation.
> > > > > 
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > ---
> > > > >  Documentation/virtual/kvm/cpuid.txt  | 6 +++---
> > > > >  arch/x86/include/uapi/asm/kvm_para.h | 2 +-
> > > > >  arch/x86/kernel/kvm.c                | 8 ++++----
> > > > >  3 files changed, 8 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/virtual/kvm/cpuid.txt b/Documentation/virtual/kvm/cpuid.txt
> > > > > index d4f33eb8..ab022dc 100644
> > > > > --- a/Documentation/virtual/kvm/cpuid.txt
> > > > > +++ b/Documentation/virtual/kvm/cpuid.txt
> > > > > @@ -72,8 +72,8 @@ KVM_FEATURE_CLOCKSOURCE_STABLE_BIT ||    24 || host will warn if no guest-side
> > > > >  
> > > > >  flag                               || value || meaning
> > > > >  ==================================================================================
> > > > > -KVM_HINTS_DEDICATED                ||     0 || guest checks this feature bit to
> > > > > -                                   ||       || determine if there is vCPU pinning
> > > > > -                                   ||       || and there is no vCPU over-commitment,
> > > > > +KVM_HINTS_REALTIME                 ||     0 || guest checks this feature bit to
> > > > > +                                   ||       || determine that vCPUs are never
> > > > > +                                   ||       || preempted for an unlimited time,
> > > > >                                     ||       || allowing optimizations
> > > > 
> > > > My understanding of the original patch is that the intention is
> > > > to tell the guest that it is very unlikely to be preempted,
> > > > so it
> > > > can choose a more appropriate spinlock implementation.  This
> > > > description implies that the guest will never be preempted, which
> > > > is much stronger guarantee.
> > > 
> > > Note:
> > > 
> > > ...  for an unlimited time.
> > 
> > Which still sounds like a stronger guarantee than the original
> > description.  But:
> > 
> > > 
> > > > 
> > > > Isn't this new description incompatible with existing usage of
> > > > the hint, which might include people who just use vCPU pinning
> > > > but no mlock?
> > > 
> > > Without mlock you should always use pv spinlocks.
> > > 
> > > Otherwise you risk blocking on a lock taken by
> > > a VCPU that is in turn blocked on IO, where the IO
> > > is not completing because CPU is being used up
> > > spinning.
> > 
> > So the stronger guarantee seems necessary.
> > 
> > Now what should host userspace do if the user is trying to run an
> > existing configuration where the CPUID hint was set but memory is
> > not pinned?
> 
> As much as we'd like to be helpful and validate input, you need a real
> time host too. I'm not sure how we'd find out - I suggest we do not
> bother for now.

I'm worried that people will start enabling the flag in all kinds
of scenarios where the guarantees can't be kept, and make the
meaning of the flag in practice completely different from its
documented meaning.

So I'd like to either detect cases where it's obviously wrong to
enable the flag, or document the requirements very clearly on
QEMU documentation.

-- 
Eduardo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
