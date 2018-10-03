Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0BBCD7D088
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Oct 2018 08:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbeJCPbF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Oct 2018 11:31:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51670 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727001AbeJCPbF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Oct 2018 11:31:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1A7CC3082A33;
        Wed,  3 Oct 2018 08:43:41 +0000 (UTC)
Received: from localhost (ovpn-8-16.pek2.redhat.com [10.72.8.16])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F77227BA1;
        Wed,  3 Oct 2018 08:43:39 +0000 (UTC)
Date:   Wed, 3 Oct 2018 16:43:37 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, thgarnie@google.com,
        corbet@lwn.net
Subject: Re: [PATCH v2 1/3] x86/KASLR: Update document about KERNEL_IMAGE_SIZE
Message-ID: <20181003084337.GA5140@MiWiFi-R3L-srv>
References: <20180926235823.3567-1-bhe@redhat.com>
 <20180926235823.3567-2-bhe@redhat.com>
 <20181003075223.GA3029@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181003075223.GA3029@gmail.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 03 Oct 2018 08:43:41 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/03/18 at 09:52am, Ingo Molnar wrote:
> 
> * Baoquan He <bhe@redhat.com> wrote:
> 
> > Currently CONFIG_RANDOMIZE_BASE=y is default set, update the relevant
> > document about KERNEL_IMAGE_SIZE.
> 
> Suggested wording:
> 
>   x86/KASLR: Update KERNEL_IMAGE_SIZE description
>   
>   Currently CONFIG_RANDOMIZE_BASE=y is set by default, which makes some of the
>   old comments above the KERNEL_IMAGE_SIZE definition out of date. Update them
>   to the current state of affairs.

Thanks, will update with this.

> 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  arch/x86/include/asm/page_64_types.h | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
> > index 6afac386a434..2288ceabdb9c 100644
> > --- a/arch/x86/include/asm/page_64_types.h
> > +++ b/arch/x86/include/asm/page_64_types.h
> > @@ -61,9 +61,10 @@
> >  /*
> >   * Kernel image size is limited to 1GiB due to the fixmap living in the
> >   * next 1GiB (see level2_kernel_pgt in arch/x86/kernel/head_64.S). Use
> > - * 512MiB by default, leaving 1.5GiB for modules once the page tables
> > - * are fully set up. If kernel ASLR is configured, it can extend the
> > - * kernel page table mapping, reducing the size of the modules area.
> > + * 1 GiB by default, leaving 1 GiB for modules once the page tables are
> > + * fully set up. If kernel ASLR is not configured, it can shrink the
> > + * kernel page table mapping to decrease the size of kernel area to 512
> > + * MiB, increase the size of the modules area to 1.5 GiB.
> >   */
> 
> I've prettified that comment some more:

Thanks, will use them.

> 
>  /*
>   * Maximum kernel image size is limited to 1 GiB, due to the fixmap living
>   * in the next 1 GiB (see level2_kernel_pgt in arch/x86/kernel/head_64.S).
>   *
>   * On KASLR use 1 GiB by default, leaving 1 GiB for modules once the
>   * page tables are fully set up.
>   *
>   * If KASLR is disabled we can shrink it to 0.5 GiB and increase the size
>   * of the modules area to 1.5 GiB.
>   */
> 
> >  #if defined(CONFIG_RANDOMIZE_BASE)
> >  #define KERNEL_IMAGE_SIZE	(1024 * 1024 * 1024)
> 
> BTW., while at it, shouldn't we make that:
> 
>    #ifdef CONFIG_RANDOMIZE_BASE

Yes, makes sense, will change.

> 
> ?
> 
> Thanks,
> 
> 	Ingo
