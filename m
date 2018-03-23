Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DFF987D0F4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 18:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751999AbeCWS3D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 14:29:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:42340 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751595AbeCWS3C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 14:29:02 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CE07D306;
        Fri, 23 Mar 2018 18:29:01 +0000 (UTC)
Date:   Fri, 23 Mar 2018 12:29:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-doc <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonas Oberg <jonas@fsfe.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 0/2] COPYING: create a new file with points to the
 Kernel license files
Message-ID: <20180323122900.733d9d42@lwn.net>
In-Reply-To: <20180323095106.23108-1-mchehab@s-opensource.com>
References: <20180323095106.23108-1-mchehab@s-opensource.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Mar 2018 06:51:04 -0300
Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> The contents of COPYING file is now duplicated at two other
> files under LICENSE:
> 	LICENSES/preferred/GPL-2.0
> 	LICENSES/exceptions/Linux-syscall-note
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

It looks like we're about there with these, so I went ahead and applied
them.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
