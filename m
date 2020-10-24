Return-Path: <SRS0=S9Hd=D7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E99EC2D0A3
	for <linux-doc@archiver.kernel.org>; Sat, 24 Oct 2020 05:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20D172226B
	for <linux-doc@archiver.kernel.org>; Sat, 24 Oct 2020 05:28:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CP9G7WUn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759607AbgJXF2b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Oct 2020 01:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20705 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1759606AbgJXF2b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Oct 2020 01:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603517309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vd2I/f5RofY3x7C2jd1o0wXMsUuljuM8vhhKZ0yIIvg=;
        b=CP9G7WUnLsJkj5xbgAzNTr7Cj048cbT1R5cnTKOwgcSR0g5pOG5XwPlM3k5xG6ml89MAFm
        YKFq2+j2aWTrSSPuuZgTHGCDdzznQIzovlscCuNI8iaiHDvoNvrsNu7mbOexWGQKNC4P8v
        19+wfw1lwOEFkSEGTEP0w41979nYo6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-uXiFPTrvMD60sm5BzdsBww-1; Sat, 24 Oct 2020 01:28:24 -0400
X-MC-Unique: uXiFPTrvMD60sm5BzdsBww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C47C5804B81;
        Sat, 24 Oct 2020 05:28:20 +0000 (UTC)
Received: from mail (ovpn-116-241.rdu2.redhat.com [10.10.116.241])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id F09055D9D5;
        Sat, 24 Oct 2020 05:28:16 +0000 (UTC)
Date:   Sat, 24 Oct 2020 01:28:16 -0400
From:   Andrea Arcangeli <aarcange@redhat.com>
To:     Nick Kralevich <nnk@google.com>
Cc:     Lokesh Gidra <lokeshgidra@google.com>,
        Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, Peter Xu <peterx@redhat.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Daniel Colascione <dancol@dancol.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Kalesh Singh <kaleshsingh@google.com>,
        Calin Juravle <calin@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Shaohua Li <shli@fb.com>, Jerome Glisse <jglisse@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@techsingularity.net>,
        Nitin Gupta <nigupta@nvidia.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v4 0/2] Control over userfaultfd kernel-fault handling
Message-ID: <20201024052816.GD19707@redhat.com>
References: <20200924065606.3351177-1-lokeshgidra@google.com>
 <CA+EESO7kCqtJf+ApoOcceFT+NX8pBwGmOr0q0PVnJf9Dnkrp6A@mail.gmail.com>
 <20201008040141.GA17076@redhat.com>
 <CAFJ0LnGoD9NaKhbsohdXo5zt5nyMOX=g1aMRX0b0W1zBSNaSBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFJ0LnGoD9NaKhbsohdXo5zt5nyMOX=g1aMRX0b0W1zBSNaSBg@mail.gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, Oct 08, 2020 at 04:22:36PM -0700, Nick Kralevich wrote:
> I haven't tried to verify this myself. I wonder if the usermode
> hardening changes also impacted this exploit? See
> https://lkml.org/lkml/2017/1/16/468

My plan was to:

1) reproduce with the old buggy kernel

2) forward port the bug to the very first version that had both the
   slub and page freelist randomization available and keep them
   disabled

3) enable the freelist randomization features (which are already
   enabled by default in the current enterprise kernels) and see if
   that makes the attack not workable

The hardening of the usermode helper you mentioned is spot on, but it
would have been something to worry about and possibly roll back at
point 2), but I couldn't get past point 1)..

Plenty other hardening techniques (just like the usermode helper) are
very specific to a single attack, but the randomization looks generic
enough to cover the entire class.

> But again, focusing on an exploit, which is inherently fragile in
> nature and dependent on the state of the kernel tree at a particular
> time, is unlikely to be useful to analyze this patch.

Agreed. A single exploit using userfaultfd to enlarge the race window
of the use-after-free, not being workable anymore with randomized slub
and page freelist enabled, wouldn't have meant a thing by itself.

As opposed if that single exploit was still fairly reproducible, it
would have been enough to consider the sysctl default to zero as
something providing a more tangible long term benefit. That would have
been good information to have too, if that's actually the case.

I was merely attempting to get a first data point.. overall it would
be nice to initiate some research to verify the exact statistical
effects that slub/page randomization has on those use-after-free race
conditions that can be enlarged by blocking kernel faults, given we're
already paying the price for it. I don't think anybody has a sure
answer at this point, if we can entirely rely on those features or not.

> Seccomp causes more problems than just performance. Seccomp is not
> designed for whole-of-system protections. Please see my other writeup
> at https://lore.kernel.org/lkml/CAFJ0LnEo-7YUvgOhb4pHteuiUW+wPfzqbwXUCGAA35ZMx11A-w@mail.gmail.com/

Whole-of-system protection I guess helps primarily because it requires
no change to userland I guess.

An example of a task not running as root (and without ptrace
capability) that could use more seccomp blocking:

# cat /proc/1517/cmdline ; echo ; grep CapEff /proc/1517/status; grep Seccomp /proc/1517/status
/vendor/bin/hw/qcrild
CapEff: 0000001000003000
Seccomp:        0

My view is that if the various binaries started by init.rc are run
without a strict seccomp filter there would be more things to worry
about, than kernel initiated userfaults for those.

Still the solution in the v5 patchset looks the safest for all until
we'll be able to tell if the slub/page randomizaton (or any other
generic enough robustness feature) is already effective against an
enlarged race window of kernel initiated userfaults and at the same
time it provides the main benefit of avoiding divergence in the
behavior of the userfaultfd syscall if invoked within the Android
userland.

Thanks,
Andrea

