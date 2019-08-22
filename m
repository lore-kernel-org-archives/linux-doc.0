Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 58B037D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Aug 2019 23:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfHVXl3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Aug 2019 19:41:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfHVXl1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Aug 2019 19:41:27 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 684C121848;
        Thu, 22 Aug 2019 23:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566517286;
        bh=YtRCAC6fgsRgJnEx63ur5nyjptr+AEUs6gIrAbXRiQI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o8UdmRX97TswzWBvjk2gFJF6KO7BY2x+E967bHezsjBUP95XqFclydiiZxQDIWGNS
         /HK3TqMe1pG0vXyWjTqyWMiN6WOHRQ1slbrz8a4c6qtJJ6NDsk6SdUwK5hdhg43NJH
         om2HivuzvF1RXZajtMlOuiaXDG6/WAAxgrYZQZQg=
Date:   Thu, 22 Aug 2019 16:41:25 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Will Deacon <will@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        Szabolcs Nagy <szabolcs.nagy@arm.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Dave P Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v8 1/5] mm: untag user pointers in
 mmap/munmap/mremap/brk
Message-Id: <20190822164125.acfb97de912996b2b9127c61@linux-foundation.org>
In-Reply-To: <20190819162851.tncj4wpwf625ofg6@willie-the-truck>
References: <20190815154403.16473-1-catalin.marinas@arm.com>
        <20190815154403.16473-2-catalin.marinas@arm.com>
        <20190819162851.tncj4wpwf625ofg6@willie-the-truck>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Aug 2019 17:28:51 +0100 Will Deacon <will@kernel.org> wrote:

> On Thu, Aug 15, 2019 at 04:43:59PM +0100, Catalin Marinas wrote:
> > There isn't a good reason to differentiate between the user address
> > space layout modification syscalls and the other memory
> > permission/attributes ones (e.g. mprotect, madvise) w.r.t. the tagged
> > address ABI. Untag the user addresses on entry to these functions.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > ---
> >  mm/mmap.c   | 5 +++++
> >  mm/mremap.c | 6 +-----
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Andrew -- please can you pick this patch up? I'll take the rest of the
> series via arm64 once we've finished discussing the wording details.
> 

Sure, I grabbed the patch from the v9 series.

But please feel free to include this in the arm64 tree - I'll autodrop
my copy if this turns up in linux-next.

