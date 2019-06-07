Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 94A8B7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 17:10:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731091AbfFGRKu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 13:10:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:57686 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729947AbfFGRKu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 13:10:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7693C2CD;
        Fri,  7 Jun 2019 17:10:49 +0000 (UTC)
Date:   Fri, 7 Jun 2019 11:10:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     jroedel@suse.de, hch@lst.de, m.szyprowski@samsung.com,
        linux-doc@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Message-ID: <20190607111048.7a492feb@lwn.net>
In-Reply-To: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  7 Jun 2019 16:47:13 +0900
Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:

> The exported function name is dma_max_mapping_size(), not
> dma_direct_max_mapping_size() so that this patch fixes
> the function name in the documentation.
> 
> Fixes: 133d624b1cee ("dma: Introduce dma_max_mapping_size()")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/DMA-API.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
> index 0076150..e47c63b 100644
> --- a/Documentation/DMA-API.txt
> +++ b/Documentation/DMA-API.txt
> @@ -198,7 +198,7 @@ call to set the mask to the value returned.
>  ::
>  
>  	size_t
> -	dma_direct_max_mapping_size(struct device *dev);
> +	dma_max_mapping_size(struct device *dev);
>  
>  Returns the maximum size of a mapping for the device. The size parameter
>  of the mapping functions like dma_map_single(), dma_map_page() and

Applied, thanks.

jon
