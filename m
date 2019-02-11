Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E3AA87D8A9
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 15:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388058AbfBKPXa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 10:23:30 -0500
Received: from ms.lwn.net ([45.79.88.28]:46104 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730282AbfBKPX0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Feb 2019 10:23:26 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBDD99AE;
        Mon, 11 Feb 2019 15:23:25 +0000 (UTC)
Date:   Mon, 11 Feb 2019 08:23:24 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/DMA-ISA-LPC: fix an incorrect reference
Message-ID: <20190211082324.40baa0cd@lwn.net>
In-Reply-To: <20190211134323.30856-1-hch@lst.de>
References: <20190211134323.30856-1-hch@lst.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 11 Feb 2019 14:43:23 +0100
Christoph Hellwig <hch@lst.de> wrote:

> AFAIK we never had a isa_virt_to_phys, it always was
> isa_virt_to_bus.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/DMA-ISA-LPC.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/DMA-ISA-LPC.txt b/Documentation/DMA-ISA-LPC.txt
> index 8c2b8be6e45b..b1ec7b16c21f 100644
> --- a/Documentation/DMA-ISA-LPC.txt
> +++ b/Documentation/DMA-ISA-LPC.txt
> @@ -52,8 +52,8 @@ Address translation
>  -------------------
>  
>  To translate the virtual address to a bus address, use the normal DMA
> -API. Do _not_ use isa_virt_to_phys() even though it does the same
> -thing. The reason for this is that the function isa_virt_to_phys()
> +API. Do _not_ use isa_virt_to_bus() even though it does the same
> +thing. The reason for this is that the function isa_virt_to_bus()
>  will require a Kconfig dependency to ISA, not just ISA_DMA_API which
>  is really all you need. Remember that even though the DMA controller
>  has its origins in ISA it is used elsewhere.

Applied, thanks.

jon
