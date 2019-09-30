Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68FC27D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Sep 2019 12:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfI3M22 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Sep 2019 08:28:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfI3M21 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Sep 2019 08:28:27 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A667E20815;
        Mon, 30 Sep 2019 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569846507;
        bh=IvavshJk5ZGs4rRQODdQOs/USA0h85no2cSUtPyd6bA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PZMNwOQBmlrUV0AXQB8AU+F8p1mU//f3C1Qat8MH6W8ynfT4hrMCPeOQ+Kft+qxxg
         oaRKeCaazBTUk3yLunBFQ8UNQ2Pl4IGYPP8/e9PXq+adqsAOo1DQp69GsObmBB9NTz
         uP1Kyme7R1C6EIMmcm1yUT4ZLuvcA22kXn/iEu6M=
Date:   Mon, 30 Sep 2019 13:28:23 +0100
From:   Will Deacon <will@kernel.org>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     linux-doc@vger.kernel.org, catalin.marinas@arm.com
Subject: Re: [PATCH] docs: arm64: Fix indentation and doc formatting
Message-ID: <20190930122823.5ybc25ozel5ltxwf@willie-the-truck>
References: <20190928125819.GA9604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190928125819.GA9604@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 28, 2019 at 10:58:19PM +1000, Adam Zerella wrote:
> Sphinx generates the following warnings for the arm64 doc
> pages:
> 
> Documentation/arm64/memory.rst:158: WARNING: Unexpected indentation.
> Documentation/arm64/memory.rst:162: WARNING: Unexpected indentation.
> 
> These indentations warnings can be resolved by utilising code
> hightlighting instead.
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>  Documentation/arm64/memory.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
> index b040909e45f8..f7db6a3898c5 100644
> --- a/Documentation/arm64/memory.rst
> +++ b/Documentation/arm64/memory.rst
> @@ -154,11 +154,16 @@ return virtual addresses to userspace from a 48-bit range.
>  
>  Software can "opt-in" to receiving VAs from a 52-bit space by
>  specifying an mmap hint parameter that is larger than 48-bit.
> -For example:
> -    maybe_high_address = mmap(~0UL, size, prot, flags,...);
> +
> +.. code-block:: c
> +
> +   maybe_high_address = mmap(~0UL, size, prot, flags,...);

Why did you drop the "For example:" prefix?

Will
