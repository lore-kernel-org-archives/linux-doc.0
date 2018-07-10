Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A0A07DF97
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 21:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732574AbeGJVOx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 17:14:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:35448 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732265AbeGJVOx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:14:53 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 93F3F2E5;
        Tue, 10 Jul 2018 21:13:58 +0000 (UTC)
Date:   Tue, 10 Jul 2018 15:13:56 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     keescook@chromium.org, tglx@linutronix.de, konrad.wilk@oracle.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] Documentation: Add powerpc options for
 spec_store_bypass_disable
Message-ID: <20180710151356.10c4834e@lwn.net>
In-Reply-To: <20180710020836.23571-1-mpe@ellerman.id.au>
References: <20180710020836.23571-1-mpe@ellerman.id.au>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 10 Jul 2018 12:08:36 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Document the support for spec_store_bypass_disable that was added for
> powerpc in commit a048a07d7f45 ("powerpc/64s: Add support for a store
> forwarding barrier at kernel entry/exit").
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
