Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F6727D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 09:44:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752139AbeCWJoo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 05:44:44 -0400
Received: from osg.samsung.com ([64.30.133.232]:39450 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752009AbeCWJon (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:44:43 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 3EC272A12B;
        Fri, 23 Mar 2018 02:44:43 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M5RRxbRu5tJv; Fri, 23 Mar 2018 02:44:42 -0700 (PDT)
Received: from vento.lan (unknown [179.183.96.62])
        by osg.samsung.com (Postfix) with ESMTPSA id 4647A2A11D;
        Fri, 23 Mar 2018 02:44:39 -0700 (PDT)
Date:   Fri, 23 Mar 2018 06:44:35 -0300
From:   Mauro Carvalho Chehab <mchehab@s-opensource.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Subject: Re: [PATCH 1/2] COPYING: create a new file with points to the
 Kernel license files
Message-ID: <20180323064435.39df8bdc@vento.lan>
In-Reply-To: <20180322121355.GA16195@bombadil.infradead.org>
References: <20180322095414.24019-1-mchehab@s-opensource.com>
        <20180322095414.24019-2-mchehab@s-opensource.com>
        <20180322121355.GA16195@bombadil.infradead.org>
Organization: Samsung
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 22 Mar 2018 05:13:55 -0700
Matthew Wilcox <willy@infradead.org> escreveu:

> On Thu, Mar 22, 2018 at 06:54:13AM -0300, Mauro Carvalho Chehab wrote:
> > +++ b/Documentation/process/license-rules.rst
> > @@ -4,15 +4,17 @@ Linux kernel licensing rules
> >  ============================
> >  
> >  The Linux Kernel is provided under the terms of the GNU General Public
> > -License version 2 only (GPL-2.0), as published by the Free Software
> > -Foundation, and provided in the COPYING file.  This documentation file is
> > -not meant to replace the COPYING file, but provides a description of how
> > -each source file should be annotated to make the licensing it is governed
> > -under clear and unambiguous.
> > -
> > -The license in the COPYING file applies to the kernel source as a whole,
> > -though individual source files can have a different license which is
> > -required to be compatible with the GPL-2.0::
> > +version 2 only (GPL-2.0), as written at LICENSES/preferred/GPL-2.0,  
> 
> ^^^ you dropped the word 'License' here
> 
> Also, I think this should read "as provided in", not "as written at".
> 
> > +with an explicit syscall exception described at  
> 
> s/at/in/
> 
> > +LICENSES/exceptions/Linux-syscall-note, as described in the COPYING file.  
> 
> This phrasing is awkward with "desribed" used twice in the same sentence ...
> 
> > +This documentation file is not meant to replace the Kernel's license,
> > +but provides a description of how each source file should be annotated
> > +to make the licensing it is governed under clear and unambiguous.  
> 
> I'd rather this said:
> 
> This documentation file provides a description of how each source file
> should be annotated to make its license clear and unambiguous.

Thanks for your review!

I'll be submitting it again as a v2, with the following text at the
license-rules.rst preamble:


Linux kernel licensing rules
============================

The Linux Kernel is provided under the terms of the GNU General Public
License version 2 only (GPL-2.0), as provided in LICENSES/preferred/GPL-2.0,
with an explicit syscall exception described in
LICENSES/exceptions/Linux-syscall-note, as described in the COPYING file.

This documentation file provides a description of how each source file
should be annotated to make its license clear and unambiguous.
It doesn't replace the Kernel's license.

The license described in the COPYING file applies to the kernel source
as a whole, though individual source files can have a different license
which is required to be compatible with the GPL-2.0::



Regards,
Mauro


> 



Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
