Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4136FC35DFB
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 09:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22F5E20656
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 09:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729065AbgBYJpn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 04:45:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:52964 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbgBYJpn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 04:45:43 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F2AB1738;
        Tue, 25 Feb 2020 09:45:41 +0000 (UTC)
Date:   Tue, 25 Feb 2020 02:45:37 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linux-doc@vger.kernel.org, keescook@chromium.org
Subject: Re: [PATCH] docs/core-api: Add Fedora instructions for GCC plugins
Message-ID: <20200225024537.658adf8e@lwn.net>
In-Reply-To: <20200221004843.1709-1-mpe@ellerman.id.au>
References: <20200221004843.1709-1-mpe@ellerman.id.au>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 21 Feb 2020 11:48:43 +1100
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Add an example of how to install the necessary packages for GCC
> plugins on Fedora.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/core-api/gcc-plugins.rst | 4 ++++
>  1 file changed, 4 insertions(+)

I've applied this, thanks.

I do wonder if this document maybe belongs with the kbuild docs rather
than in the core-api book, but that's a separate matter...

Thanks,

jon
