Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 671AF7D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 06:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751015AbeGJGLv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 02:11:51 -0400
Received: from Galois.linutronix.de ([146.0.238.70]:35510 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751258AbeGJGKX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Jul 2018 02:10:23 -0400
Received: from p4fea482e.dip0.t-ipconnect.de ([79.234.72.46] helo=nanos.glx-home)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1fclqo-00067n-KN; Tue, 10 Jul 2018 08:10:14 +0200
Date:   Tue, 10 Jul 2018 08:10:14 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Michael Ellerman <mpe@ellerman.id.au>
cc:     corbet@lwn.net, keescook@chromium.org, konrad.wilk@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] Documentation: Add powerpc options for
 spec_store_bypass_disable
In-Reply-To: <20180710020836.23571-1-mpe@ellerman.id.au>
Message-ID: <alpine.DEB.2.21.1807100809320.1590@nanos.tec.linutronix.de>
References: <20180710020836.23571-1-mpe@ellerman.id.au>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Jul 2018, Michael Ellerman wrote:

> Document the support for spec_store_bypass_disable that was added for
> powerpc in commit a048a07d7f45 ("powerpc/64s: Add support for a store
> forwarding barrier at kernel entry/exit").
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> I tried documenting the differences between the PPC options and X86 ones in one
> section, but it got quite messy, so I went with this instead. Happy to take
> advice on how better to structure it if anyone has opinions.

Looks good to me.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
