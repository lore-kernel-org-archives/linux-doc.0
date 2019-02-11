Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 506C87D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 15:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388028AbfBKPkl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 10:40:41 -0500
Received: from ms.lwn.net ([45.79.88.28]:46220 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388426AbfBKPkk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Feb 2019 10:40:40 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E7E97130D;
        Mon, 11 Feb 2019 15:40:39 +0000 (UTC)
Date:   Mon, 11 Feb 2019 08:40:38 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     Vinod Koul <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] doc:dmaengine: clarify DMA desc. pointer after
 submission
Message-ID: <20190211084038.0647430b@lwn.net>
In-Reply-To: <20190208153038.23272-1-federico.vaga@cern.ch>
References: <20190208153038.23272-1-federico.vaga@cern.ch>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 8 Feb 2019 16:30:38 +0100
Federico Vaga <federico.vaga@cern.ch> wrote:

> It clarifies that the DMA description pointer returned by
> `dmaengine_prep_*` function should not be used after submission.
> 
> Signed-off-by: Federico Vaga <federico.vaga@cern.ch>
> ---
>  Documentation/driver-api/dmaengine/client.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/driver-api/dmaengine/client.rst b/Documentation/driver-api/dmaengine/client.rst
> index fbbb2831f29f..d728e50105eb 100644
> --- a/Documentation/driver-api/dmaengine/client.rst
> +++ b/Documentation/driver-api/dmaengine/client.rst
> @@ -168,6 +168,13 @@ The details of these operations are:
>     dmaengine_submit() will not start the DMA operation, it merely adds
>     it to the pending queue. For this, see step 5, dma_async_issue_pending.
>  
> +   .. note::
> +
> +      After calling ``dmaengine_submit()`` the submitted transfer descriptor
> +      (``struct dma_async_tx_descriptor``) belongs to the DMA engine.
> +      Consequentially, the client must consider invalid the pointer to that
> +      descriptor.
> +
>  5. Issue pending DMA requests and wait for callback notification
>  
>     The transactions in the pending queue can be activated by calling the

Applied to the docs tree, thanks.

jon
