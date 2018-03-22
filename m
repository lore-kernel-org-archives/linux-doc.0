Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D97F7DE76
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 12:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752199AbeCVMN6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 08:13:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33388 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbeCVMN5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 08:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=lZIutr6gtbbFpuS0zZDPfguJNG8bxszrBBoTu2KiFTo=; b=bjD562Re1S/GijpasT+EFyUSM
        +7TkLjeWdYKGrXgkErZ1s4hxlfuMuD2OAYDlFnxUl5PSJaQrDxrYVmEDPzUZkZ/KrBa+GvLDK1wT1
        BiSywCzp+cFpJmGZ7MZPyoVo171Cu5nePZXbdGX1RDCbpQ5K2ZIB/R4fxfNtMLNqEpC8FKo9TtZOM
        gUrxwEtBJR4yNW16FV+bWZvN4WWYQVI4t+IkYAGOuf5H8U2Pt0nVCN9Go8VRHpfwJRY130XYuaKku
        /5FSGa6s+lT+lM6h+YQBrdoSb4XDXv9P+SGMpKYYdgnSfGTzhFGebt0bO0GOSVhyiUI+5QC/pill1
        Xmrwo1MTQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1eyz6S-0002S8-6X; Thu, 22 Mar 2018 12:13:56 +0000
Date:   Thu, 22 Mar 2018 05:13:55 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
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
Subject: Re: [PATCH 1/2] COPYING: create a new file with points to the Kernel
 license files
Message-ID: <20180322121355.GA16195@bombadil.infradead.org>
References: <20180322095414.24019-1-mchehab@s-opensource.com>
 <20180322095414.24019-2-mchehab@s-opensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322095414.24019-2-mchehab@s-opensource.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 22, 2018 at 06:54:13AM -0300, Mauro Carvalho Chehab wrote:
> +++ b/Documentation/process/license-rules.rst
> @@ -4,15 +4,17 @@ Linux kernel licensing rules
>  ============================
>  
>  The Linux Kernel is provided under the terms of the GNU General Public
> -License version 2 only (GPL-2.0), as published by the Free Software
> -Foundation, and provided in the COPYING file.  This documentation file is
> -not meant to replace the COPYING file, but provides a description of how
> -each source file should be annotated to make the licensing it is governed
> -under clear and unambiguous.
> -
> -The license in the COPYING file applies to the kernel source as a whole,
> -though individual source files can have a different license which is
> -required to be compatible with the GPL-2.0::
> +version 2 only (GPL-2.0), as written at LICENSES/preferred/GPL-2.0,

^^^ you dropped the word 'License' here

Also, I think this should read "as provided in", not "as written at".

> +with an explicit syscall exception described at

s/at/in/

> +LICENSES/exceptions/Linux-syscall-note, as described in the COPYING file.

This phrasing is awkward with "desribed" used twice in the same sentence ...

> +This documentation file is not meant to replace the Kernel's license,
> +but provides a description of how each source file should be annotated
> +to make the licensing it is governed under clear and unambiguous.

I'd rather this said:

This documentation file provides a description of how each source file
should be annotated to make its license clear and unambiguous.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
