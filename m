Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 377F47D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 13:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388212AbfJANWN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 09:22:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:36782 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387990AbfJANWN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:22:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1421A316;
        Tue,  1 Oct 2019 13:22:13 +0000 (UTC)
Date:   Tue, 1 Oct 2019 07:22:12 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Chester Lin <clin@suse.com>
Cc:     "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
        "palmer@sifive.com" <palmer@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
Message-ID: <20191001072212.21d55899@lwn.net>
In-Reply-To: <20190916130108.31404-1-clin@suse.com>
References: <20190916130108.31404-1-clin@suse.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Sep 2019 13:01:40 +0000
Chester Lin <clin@suse.com> wrote:

> Correct the sequence of the magic number 2 since it's little endian.
> 
> Signed-off-by: Chester Lin <clin@suse.com>
> ---
>  Documentation/riscv/boot-image-header.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

So I'm slowly digging my way through my docs folder, sorry for the delay.

> diff --git a/Documentation/riscv/boot-image-header.txt b/Documentation/riscv/boot-image-header.txt
> index 14b1492f689b..f388805aa5c3 100644
> --- a/Documentation/riscv/boot-image-header.txt
> +++ b/Documentation/riscv/boot-image-header.txt
> @@ -18,7 +18,7 @@ The following 64-byte header is present in decompressed Linux kernel image.
>  	u32 res1  = 0;		  /* Reserved */
>  	u64 res2  = 0;    	  /* Reserved */
>  	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
> -	u32 magic2 = 0x56534905;  /* Magic number 2, little endian, "RSC\x05" */
> +	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */

That's doing more than just reordering the bytes.  Was the original
completely wrong?  If so, the changelog should probably reflect that.  Or
else what am I missing?

Thanks,

jon
