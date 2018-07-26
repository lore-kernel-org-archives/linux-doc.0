Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B790F7D072
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 22:20:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730989AbeGZXiz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 19:38:55 -0400
Received: from ms.lwn.net ([45.79.88.28]:34474 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730581AbeGZXiz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 26 Jul 2018 19:38:55 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B20B72D9;
        Thu, 26 Jul 2018 22:20:05 +0000 (UTC)
Date:   Thu, 26 Jul 2018 16:20:04 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: Re: [PATCH 1/2] doc:hacking: add labels
Message-ID: <20180726162004.29004e4e@lwn.net>
In-Reply-To: <20180706220517.28623-2-federico.vaga@vaga.pv.it>
References: <20180706220517.28623-1-federico.vaga@vaga.pv.it>
        <20180706220517.28623-2-federico.vaga@vaga.pv.it>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat,  7 Jul 2018 00:05:16 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> Apparently some local links are not properly generated in locking.rst.
> This patch use the ':ref:' directive to add the link to the section label.
> 
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> ---
>  Documentation/kernel-hacking/locking.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> index f937c0fd11aa..574fc92a6f20 100644
> --- a/Documentation/kernel-hacking/locking.rst
> +++ b/Documentation/kernel-hacking/locking.rst
> @@ -177,7 +177,7 @@ perfect world).
>  
>  Note that you can also use :c:func:`spin_lock_irq()` or
>  :c:func:`spin_lock_irqsave()` here, which stop hardware interrupts
> -as well: see `Hard IRQ Context <#hardirq-context>`__.
> +as well: see :ref:`Hard IRQ Context <hardirq-context>`.

Actually, the real problem here was that the #tag was wrong.  I've applied
the following instead.

Thanks,

jon

docs: Fix the reference labels in Locking.rst

Two jump tags were misspelled, leading to non-working cross-reference
links.

Reported-by: Federico Vaga <federico.vaga@vaga.pv.it>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/kernel-hacking/locking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index f937c0fd11aa..9cc036ff57b9 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -177,7 +177,7 @@ perfect world).
 
 Note that you can also use :c:func:`spin_lock_irq()` or
 :c:func:`spin_lock_irqsave()` here, which stop hardware interrupts
-as well: see `Hard IRQ Context <#hardirq-context>`__.
+as well: see `Hard IRQ Context <#hard-irq-context>`__.
 
 This works perfectly for UP as well: the spin lock vanishes, and this
 macro simply becomes :c:func:`local_bh_disable()`
@@ -228,7 +228,7 @@ The Same Softirq
 ~~~~~~~~~~~~~~~~
 
 The same softirq can run on the other CPUs: you can use a per-CPU array
-(see `Per-CPU Data <#per-cpu>`__) for better performance. If you're
+(see `Per-CPU Data <#per-cpu-data>`__) for better performance. If you're
 going so far as to use a softirq, you probably care about scalable
 performance enough to justify the extra complexity.
 
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
