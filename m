Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236C9C2D0EC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECFA1206C0
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VJrCn+gP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgDGWtr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:49:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55954 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgDGWtr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Apr 2020 18:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=iUrEwRJjtM5FP00bKTtONknHIKWCdpthgFU7ierCuLg=; b=VJrCn+gPSr/8ADBwNmAvaZrwIq
        Dpyf6Togl/JmCxvC8zAp3aefvpEwEw74LJVUAn+AGsXrUGQYo6oiAGTEUYFVe3YShHNAYurLjyvF6
        aIX8EykVIXt8eTW56CBXIqsWvpSo3ARgjRyM1T408iVRXfvt/H6f9GMwJk9/aIjB2h+G/IHPD45Q+
        T4DHUn1mwXA14m+C/Af9kZbHKOsiZP2WxQ6BR3IgKrYwZTNu6Kg8aqdxiKmThniV4jhFlRHx3P35v
        MODWj0jwxaDuSE8G65GU7MvIOsXSk8M7Mlgp8BtpBemipDKF+y6RjXs1zRnUhFrj1MqO7crAxBuIV
        1U/AyGAA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLx2R-0000Vt-1N; Tue, 07 Apr 2020 22:49:47 +0000
Subject: Re: [PATCH v2] Documentation: memory - fix warning
To:     Lothar Rubusch <l.rubusch@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <20200407223455.14027-1-l.rubusch@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d0b42e44-72e2-a787-97e2-1465335d4beb@infradead.org>
Date:   Tue, 7 Apr 2020 15:49:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407223455.14027-1-l.rubusch@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/7/20 3:34 PM, Lothar Rubusch wrote:
> Running Sphinx v1.8.4 the following warning can be seen.
> 
> $ make htmldocs &> htmldocs.log
> (...)
> writing output... [ 16%] block/request .. crypto/api-akcipher
> ./include/linux/slab.h:503: WARNING: undefined label: memory-allocation
>  (if the link has no caption the label must precede a section header)
> writing output... [ 19%] crypto/api-digest .. driver-api/dmaengine/client
> (...)
> 
> This patch fixes the above warning.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>

Looks good. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  include/linux/slab.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 03a389358562..6d454886bcaf 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -501,7 +501,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
>   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
>   *
>   * The recommended usage of the @flags is described at
> - * :ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`
> + * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
>   *
>   * Below is a brief outline of the most useful GFP flags
>   *
> 


-- 
~Randy

