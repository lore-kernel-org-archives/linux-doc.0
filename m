Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D8DF57DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 17:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756732AbeDZR5D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 13:57:03 -0400
Received: from foss.arm.com ([217.140.101.70]:57350 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755998AbeDZR5B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Apr 2018 13:57:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF0D91435;
        Thu, 26 Apr 2018 10:57:00 -0700 (PDT)
Received: from armageddon.cambridge.arm.com (armageddon.cambridge.arm.com [10.1.206.84])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F5E3F487;
        Thu, 26 Apr 2018 10:56:55 -0700 (PDT)
Date:   Thu, 26 Apr 2018 18:56:53 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-doc@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Kees Cook <keescook@chromium.org>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Kostya Serebryany <kcc@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        James Morse <james.morse@arm.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 0/6] arm64: untag user pointers passed to the kernel
Message-ID: <20180426175653.q7mqzzqvdoihn5so@armageddon.cambridge.arm.com>
References: <cover.1524077494.git.andreyknvl@google.com>
 <20180419093306.rn5bz264nxsn7d7c@node.shutemov.name>
 <CAAeHK+yb-U3h0666i3u3fF3=8XVcZUo1nxZ5CnOd9oUiDFP=Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+yb-U3h0666i3u3fF3=8XVcZUo1nxZ5CnOd9oUiDFP=Ng@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 25, 2018 at 04:45:37PM +0200, Andrey Konovalov wrote:
> On Thu, Apr 19, 2018 at 11:33 AM, Kirill A. Shutemov
> <kirill@shutemov.name> wrote:
> > On Wed, Apr 18, 2018 at 08:53:09PM +0200, Andrey Konovalov wrote:
> >> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> >> tags into the top byte of each pointer. Userspace programs (such as
> >> HWASan, a memory debugging tool [1]) might use this feature and pass
> >> tagged user pointers to the kernel through syscalls or other interfaces.
> >>
> >> This patch makes a few of the kernel interfaces accept tagged user
> >> pointers. The kernel is already able to handle user faults with tagged
> >> pointers and has the untagged_addr macro, which this patchset reuses.
> >>
> >> We're not trying to cover all possible ways the kernel accepts user
> >> pointers in one patchset, so this one should be considered as a start.
> >
> > How many changes do you anticipate?
> >
> > This patchset looks small and reasonable, but I see a potential to become a
> > boilerplate. Would we need to change every driver which implements ioctl()
> > to strip these bits?
> 
> I've replied to somewhat similar question in one of the previous
> versions of the patchset.
> 
> """
> There are two different approaches to untagging the user pointers that I see:
> 
> 1. Untag user pointers right after they are passed to the kernel.
> 
> While this might be possible for pointers that are passed to syscalls
> as arguments (Catalin's "hack"), this leaves user pointers, that are
> embedded into for example structs that are passed to the kernel. Since
> there's no specification of the interface between user space and the
> kernel, different kernel parts handle user pointers differently and I
> don't see an easy way to cover them all.
> 
> 2. Untag user pointers where they are used in the kernel.
> 
> Although there's no specification on the interface between the user
> space and the kernel, the kernel still has to use one of a few
> specific ways to access user data (copy_from_user, etc.). So the idea
> here is to add untagging into them. This patchset mostly takes this
> approach (with the exception of memory subsystem syscalls).
> 
> If there's a better approach, I'm open to suggestions.
> """
> 
> So if we go with the first way, we'll need to go through every syscall
> and ioctl handler, which doesn't seem feasible.

I agree with you that (1) isn't feasible. My hack is sufficient for the
pointer arguments but doesn't help with pointers in user structures
passed to the kernel.

Now, since the hardware allows access to user pointers with non-zero top
8-bit, the kernel uaccess routines can also use such pointers directly.
What's needed, as per your patches, is the access_ok() macro and
whatever ends up calling find_vma() (at a first look, there may be other
cases). I don't think drivers need changing as long as the in-kernel API
they use performs the untagging (e.g. get_user_pages()).

-- 
Catalin
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
