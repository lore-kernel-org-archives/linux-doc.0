Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7480C0015E
	for <linux-doc@archiver.kernel.org>; Sat, 12 Aug 2023 05:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232008AbjHLFFL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Aug 2023 01:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbjHLFFL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Aug 2023 01:05:11 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D352722;
        Fri, 11 Aug 2023 22:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=QVO+YD/A9B88x8NiWdr2MCn5pXPPZlopwlUOKBD1+Hs=; b=x9fOkwf6k49NlChnY1xxM6PETP
        P4j8i5BsNPySDLS3g3HkFJdbJ28w4pH9V5oxszkcYAZ9eRr5JvAC9aSykeZtjJ4pJjgOnXlToRQsP
        uV5NM1XRiUZtEduKEJifSEbdJC/dCp67mh3HJi0BQ18h35g7IAm4biCCqneXsi+oDQnVeDoMcMbMI
        Lj9XTwsG3f6IbJ52G1HWORVyQ687kQzXVA1vpSVDJmDyPBKifbL28cMa5+udxNimqA1HD0+Kb4T25
        w/L0qMUWxh72qF/lwB78909lAqq8rWhAj9RcasDICSiwUwszWzAqW2VLAJB2DrduGBFuIG7nLzxlO
        L1f4kaKQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qUgWl-00CdzG-1Z;
        Sat, 12 Aug 2023 04:47:03 +0000
Message-ID: <9efeeb6a-a2d4-9b56-c127-119c1ac378b6@infradead.org>
Date:   Fri, 11 Aug 2023 21:47:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH net-next 1/2] scripts: kernel-doc: parse
 DEFINE_DMA_UNMAP_[ADDR|LEN]
Content-Language: en-US
To:     Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
        netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        emil.s.tantilov@intel.com, joshua.a.hay@intel.com,
        sridhar.samudrala@intel.com, alan.brady@intel.com,
        madhu.chittim@intel.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, willemb@google.com, decot@google.com
References: <20230812002549.36286-1-pavan.kumar.linga@intel.com>
 <20230812002549.36286-2-pavan.kumar.linga@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230812002549.36286-2-pavan.kumar.linga@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 8/11/23 17:25, Pavan Kumar Linga wrote:
> At present, if the marcos DEFINE_DMA_UNMAP_ADDR() and

                     macros

> DEFINE_DMA_UNMAP_LEN() are used in the structures as shown
> below, instead of parsing the parameter in the parenthesis,

                                                 parentheses

> kernel-doc parses 'DEFINE_DMA_UNMAP_ADDR(' and
> 'DEFINE_DMA_UNMAP_LEN(' which results in the following
> warnings:
> 
> drivers/net/ethernet/intel/idpf/idpf_txrx.h:201: warning: Function
> parameter or member 'DEFINE_DMA_UNMAP_ADDR(dma' not described in
> 'idpf_tx_buf'
> drivers/net/ethernet/intel/idpf/idpf_txrx.h:201: warning: Function
> parameter or member 'DEFINE_DMA_UNMAP_LEN(len' not described in
> 'idpf_tx_buf'
> 
> struct idpf_tx_buf {
> 	DEFINE_DMA_UNMAP_ADDR(dma);
> 	DEFINE_DMA_UNMAP_LEN(len);
> };
> 
> Fix the warnings by parsing DEFINE_DMA_UNMAP_ADDR() and
> DEFINE_DMA_UNMAP_LEN().
> 
> Signed-off-by: Pavan Kumar Linga <pavan.kumar.linga@intel.com>

Looks good. Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  scripts/kernel-doc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index d0116c6939dc..cfb1cb223508 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1168,6 +1168,10 @@ sub dump_struct($$) {
>  	$members =~ s/DECLARE_KFIFO_PTR\s*\($args,\s*$args\)/$2 \*$1/gos;
>  	# replace DECLARE_FLEX_ARRAY
>  	$members =~ s/(?:__)?DECLARE_FLEX_ARRAY\s*\($args,\s*$args\)/$1 $2\[\]/gos;
> +	#replace DEFINE_DMA_UNMAP_ADDR
> +	$members =~ s/DEFINE_DMA_UNMAP_ADDR\s*\($args\)/dma_addr_t $1/gos;
> +	#replace DEFINE_DMA_UNMAP_LEN
> +	$members =~ s/DEFINE_DMA_UNMAP_LEN\s*\($args\)/__u32 $1/gos;
>  	my $declaration = $members;
>  
>  	# Split nested struct/union elements as newer ones

-- 
~Randy
