Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A6B837D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 11:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfBKLyV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 06:54:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:59696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfBKLyV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Feb 2019 06:54:21 -0500
Received: from localhost (unknown [117.99.91.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF555218D8;
        Mon, 11 Feb 2019 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549886060;
        bh=dY8kG7M54C9GaRFVgyghhQqHS148kHOPnRoTMzI1WjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rrTffWYt1X3OzHT+ofZq5QjdvKnRBKNkNTy8DHzcyIWjWKMdtJ92z+RFaiJ+H3h1K
         gDvvbpbeHAQWpEdSrYtM20huA7LnJp0lewi50AyE+LMOtw6Tx6JnDVh0BAjjomZOwR
         ba25UINhKH/Yvg1ZK1VntrUd+vpYceVVijRCufTU=
Date:   Mon, 11 Feb 2019 17:24:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     Jonathan Corbet <corbet@lwn.net>, dmaengine@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc:dmaengine: clarify DMA desc. pointer after submission
Message-ID: <20190211115411.GR4296@vkoul-mobl>
References: <20190208153038.23272-1-federico.vaga@cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190208153038.23272-1-federico.vaga@cern.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 08-02-19, 16:30, Federico Vaga wrote:
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

Consequently

> +      descriptor.
> +

Applied after fixing the typo and added tag as Documentation: dmaengine...

>  5. Issue pending DMA requests and wait for callback notification
>  
>     The transactions in the pending queue can be activated by calling the
> -- 
> 2.15.0

-- 
~Vinod
