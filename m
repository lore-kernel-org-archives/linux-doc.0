Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AE4C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 23:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F241E60201
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 23:13:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236268AbhCAXE5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 18:04:57 -0500
Received: from ms.lwn.net ([45.79.88.28]:45348 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240226AbhCAWbX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Mar 2021 17:31:23 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 848A12C4;
        Mon,  1 Mar 2021 22:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 848A12C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614637755; bh=IYpxAgImicoAB1RFYUiRMNAXttIJP9xmnbwf82RXiS8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=T3PzFUiFQihYhyauqoTtF9S8w/HUHprInsNF+UArKChZWwlJtHE8hfsZQTPG3JrW+
         9l18ywSMh4rW/sni6d6CySD0zKkUPCPDcbC9p1Ou1+Hj+ddr1Ky1kgaWRKZhkZWaAb
         YixSusHuqEEMNteTGGLGr4xSDmOXglg/FBg6xIgp0XnThzBY74cYLqobn5vk5Rnaf/
         vkP4GFNiB3iqwai3OfpPyjDx+xOrN6jgvm39kpXjjQDgMDXTOACXB9Ou3YsmevIrfp
         w+o5Bqqaw7jGryoa4Fhl7iE8Gl8ScinPQxwaxZr5iQfYsTsRlRM5aS1BQoj1gtk7H7
         lsk6RrvpHiG+A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] docs: arm: /chosen node parameters
In-Reply-To: <20210206084120.43305-1-xypron.glpk@gmx.de>
References: <20210206084120.43305-1-xypron.glpk@gmx.de>
Date:   Mon, 01 Mar 2021 15:29:15 -0700
Message-ID: <87eegy1pac.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Heinrich Schuchardt <xypron.glpk@gmx.de> writes:

> Add missing items to table of parameters set in the /chosen node by the EFI
> stub.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>  Documentation/arm/uefi.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
> index f732f957421f..9b0b5e458a1e 100644
> --- a/Documentation/arm/uefi.rst
> +++ b/Documentation/arm/uefi.rst
> @@ -64,4 +64,11 @@ linux,uefi-mmap-desc-size   32-bit   Size in bytes of each entry in the UEFI
>                                       memory map.
>
>  linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
> +
> +linux,initrd-start          64-bit   Physical start address of an initrd
> +
> +linux,initrd-end            64-bit   Physical end address of an initrd
> +
> +kaslr-seed                  64-bit   Entropy used to randomize the kernel image
> +                                     base address location.
>  ==========================  ======   ===========================================

Applied, thanks.

jon
