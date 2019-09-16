Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E05B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Sep 2019 15:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfIPPZF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Sep 2019 11:25:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38550 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbfIPPZF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Sep 2019 11:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4h2929n6bTm5LRvrUkbqXYO9I98jIbausOJWK862niU=; b=nOTb+U36nvlQm3aN0oY+nTqC5
        ZwQf/QTs1cwSW6ginqTlPGor0hT8MjC2CmcdoIoj8/eHtAQGb6VAVHAnZRidJiTr7FUKhcFQ5s5zW
        bFS6vj7ognIDbXgJor+iuxLROhogHJDnR/Iq3nnL9ozXfbd+SOavehGMOZZEigzZz/CxwXsa/Ipk8
        U6imM2iOPeruvkmeAZvKdzU8aV+Fv5n9sMXdr8hYDRgj2A5zx8KdeYgk/AyOJ1Wse6rK2C7ER0KpW
        e/4T4jVu3nR3kxyuk4JSj5Kj5vECN+onXohMsIFiXaQIzWkVPczkH+/OubZ5vABhj6WOeAGyLwsxR
        WJYmlL1cQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1i9ssB-0006kx-FI; Mon, 16 Sep 2019 15:25:03 +0000
Subject: Re: [PATCH] Documentation: document earlycon without options for more
 platforms
To:     Christoph Hellwig <hch@lst.de>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        schwab@suse.de
References: <20190916070316.7371-1-hch@lst.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3e24518a-9e01-c244-3d58-ffd21dab6701@infradead.org>
Date:   Mon, 16 Sep 2019 08:25:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916070316.7371-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/16/19 12:03 AM, Christoph Hellwig wrote:
> The earlycon options without arguments is supposed on all device

                                         is supposed to work on all device

> tree platforms, not just arm64.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I would add a comma, but that can be up to Jon.

Thanks.

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 4c1971960afa..fe81d8922edd 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -977,12 +977,10 @@
>  
>  	earlycon=	[KNL] Output early console device and options.
>  
> -			[ARM64] The early console is determined by the
> -			stdout-path property in device tree's chosen node,
> -			or determined by the ACPI SPCR table.
> -
> -			[X86] When used with no options the early console is
> -			determined by the ACPI SPCR table.
> +			When used with no options the early console is
			                  options,

> +			determined by stdout-path property in device tree's
> +			chosen node or the ACPI SPCR table if supported by
> +			the platform.
>  
>  		cdns,<addr>[,options]
>  			Start an early, polled-mode console on a Cadence
> 


-- 
~Randy
