Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 345EC7D6B1
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 10:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753351AbeCWK02 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 06:26:28 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:50868 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753214AbeCWK01 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Mar 2018 06:26:27 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 95163D7D;
        Fri, 23 Mar 2018 10:26:26 +0000 (UTC)
Date:   Fri, 23 Mar 2018 11:26:24 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 1/2] COPYING: create a new file with points to the
 Kernel license files
Message-ID: <20180323102624.GA10292@kroah.com>
References: <20180323095106.23108-1-mchehab@s-opensource.com>
 <20180323095106.23108-2-mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323095106.23108-2-mchehab@s-opensource.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 23, 2018 at 06:51:05AM -0300, Mauro Carvalho Chehab wrote:
> With the addition of SPDX patchset, the contents of COPYING file
> is now duplicated at two other files under LICENSE:
> 	LICENSES/preferred/GPL-2.0
> 	LICENSES/exceptions/Linux-syscall-note
> 
> It is easy to check that the contents of the licence written on
> those files are identical with COPYING using:
> 
> 	$ diff -upr COPYING LICENSES/preferred/GPL-2.0
> 	$ diff -upr COPYING LICENSES/exceptions/Linux-syscall-note|less
> 
> Also, a new file was added, with describes how SPDX should work at
> the Kernel source files:
> 	Documentation/process/license-rules.rst
> 
> Instead fo having it copying the contents of two files, and not
> even mentioning the third one, replace it by a file whose content
> points to the other tree files, preserving the Kernel's license.
> 
> Adjust license-rules.rst accordingly.
> 
> Please notice that this file preserves the Kernel license as
> is, without any changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> ---
> 
> Version 2:
>    - Did some text changes at license-rules.rst, based on Matthew
>      Wilcox review.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
