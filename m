Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF3957D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Nov 2018 17:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388585AbeKPEHy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Nov 2018 23:07:54 -0500
Received: from mail.skyhub.de ([5.9.137.197]:36838 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726453AbeKPEHy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Nov 2018 23:07:54 -0500
X-Virus-Scanned: Nedap ESD1 at mail.skyhub.de
Received: from mail.skyhub.de ([127.0.0.1])
        by localhost (blast.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id r2joN7Gniaeq; Thu, 15 Nov 2018 18:59:03 +0100 (CET)
Received: from zn.tnic (p200300EC2BD00900D5714500C00E26FD.dip0.t-ipconnect.de [IPv6:2003:ec:2bd0:900:d571:4500:c00e:26fd])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4521B1EC03C8;
        Thu, 15 Nov 2018 18:59:03 +0100 (CET)
Date:   Thu, 15 Nov 2018 18:58:58 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     David Hildenbrand <david@redhat.com>
Cc:     Dave Young <dyoung@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devel@linuxdriverproject.org, linux-fsdevel@vger.kernel.org,
        linux-pm@vger.kernel.org, xen-devel@lists.xenproject.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Baoquan He <bhe@redhat.com>, Omar Sandoval <osandov@fb.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        Lianbo Jiang <lijiang@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH RFC 3/6] kexec: export PG_offline to VMCOREINFO
Message-ID: <20181115175858.GC25056@zn.tnic>
References: <20181114211704.6381-1-david@redhat.com>
 <20181114211704.6381-4-david@redhat.com>
 <20181115061923.GA3971@dhcp-128-65.nay.redhat.com>
 <20181115111023.GC26448@zn.tnic>
 <4aa5d39d-a923-87de-d646-70b9cbfe62f0@redhat.com>
 <20181115115213.GE26448@zn.tnic>
 <9d19a844-9ae0-9520-c32a-0a4491f8de43@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d19a844-9ae0-9520-c32a-0a4491f8de43@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 15, 2018 at 01:01:17PM +0100, David Hildenbrand wrote:
> Just saying that "I'm not the first to do it, don't hit me with a stick" :)

:-)

> Indeed. And we still have without makedumpfile. I think you are aware of
> this, but I'll explain it just for consistency: PG_hwpoison

No, I appreciate an explanation very much! So thanks for that. :)

> At some point we detect a HW error and mask a page as PG_hwpoison.
> 
> makedumpfile knows how to treat that flag and can exclude it from the
> dump (== not access it). No crash.
> 
> kdump itself has no clue about old "struct pages". Especially:
> a) Where they are located in memory (e.g. SPARSE)
> b) What their format is ("where are the flags")
> c) What the meaning of flags is ("what does bit X mean")
> 
> In order to know such information, we would have to do parsing of quite
> some information inside the kernel in kdump. Basically what makedumpfile
> does just now. Is this feasible? I don't think so.
> 
> So we would need another approach to communicate such information as you
> said. I can't think of any, but if anybody reading this has an idea,
> please speak up. I am interested.

Yeah but that ship has sailed. And even if we had a great idea, we'd
have to support kdump before and after the idea. And that would be a
serious mess.

And if you have a huge box with gazillion piles of memory and an alpha
particle passes through a bunch of them on its way down to the earth's
core, and while doing so, flips a bunch of bits, you need to go and
collect all those regions and update some list which you then need to
shove into the second kernel.

And you probably need to do all that through perhaps a piece of memory
which is used for communication between first and second kernel and that
list better fit in there, or you need to realloc. And that piece of
memory's layout needs to be properly defined so that the second kernel
can parse it correctly.

And so on...

> The *only* way right now we would have to handle such scenarios:
> 
> 1. While dumping memory and we get a machine check, fake reading a zero
> page instead of crashing.
> 2. While dumping memory and we get a fault, fake reading a zero page
> instead of crashing.

Yap.

> Indeed, and the basic design is to export these flags. (let's say
> "unfortunately", being able to handle such stuff in kdump directly would
> be the dream).

Well, AFAICT, the minimum work you need to always do before starting the
dumping is somehow generate that list of pages or ranges to not dump.
And that work needs to be done by the first or the second kernel, I'd
say.

If the first kernel would do it, then you'd have to probably have
callbacks to certain operations which go and add ranges or pages to
exclude, to a list which is then readily accessible to the second
kernel. Which means, when you reserve memory for the second kernel,
you'd have to reserve memory also for such a list.

But then what do you do when that memory gets filled up...?

So I guess exporting those things in vmcoreinfo is probably the only
thing we *can* do in the end.

Oh well, enough rambling... :)

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
