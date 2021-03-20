Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42ECC433DB
	for <linux-doc@archiver.kernel.org>; Sat, 20 Mar 2021 22:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A4C461935
	for <linux-doc@archiver.kernel.org>; Sat, 20 Mar 2021 22:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCTWjm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 20 Mar 2021 18:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhCTWj3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Mar 2021 18:39:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E673AC061574;
        Sat, 20 Mar 2021 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:Content-Type:MIME-Version:
        References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1we7ri4G88aaS26AiNrI9cflC5QqUhWRPUP45uaw7wc=; b=xZgrxCuy8LwUN5OR6MWHxtPj1V
        ivAz/wVrX7HlC0leumvjGlpGx5ZPE+aV8DC20bPIDCsLHrGripZFn4sKWcNEZRO1CLW7Ehy2NvVOA
        ukTbs5ul78PbCveF57TGMlUUlqWqK+iqZHcYbfLVliQqzW2cn4NibnyfoyuDlNhqY7B6Xm89si4Ja
        0YlfJPKViiklr5gCZEmguriSyCBATUzm42slildIaImH0TwyR5Wliu7AM5nJrLdgBM1vSp6yX9Ggk
        vwLtrQZLORNyG8O5lu68w342JH7+0+VXCbphMLFeJOQioIMzcDk7HiMVSmnaf1nxZcB/gUftuXyJG
        lRyEpQGA==;
Received: from rdunlap (helo=localhost)
        by bombadil.infradead.org with local-esmtp (Exim 4.94 #2 (Red Hat Linux))
        id 1lNkFh-0024eL-T5; Sat, 20 Mar 2021 22:39:26 +0000
Date:   Sat, 20 Mar 2021 15:39:25 -0700 (PDT)
From:   Randy Dunlap <rdunlap@bombadil.infradead.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
cc:     davem@davemloft.net, kuba@kernel.org, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: networking: Fix a typo
In-Reply-To: <20210320210703.32588-1-unixbhaskar@gmail.com>
Message-ID: <15f3198-c7c1-a49c-af96-50bc736508b@bombadil.infradead.org>
References: <20210320210703.32588-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_153925_961940_E7A279C6 
X-CRM114-Status: GOOD (  11.83  )
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Sun, 21 Mar 2021, Bhaskar Chowdhury wrote:

>
> s/subsytem/subsystem/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> Documentation/networking/xfrm_device.rst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/xfrm_device.rst b/Documentation/networking/xfrm_device.rst
> index da1073acda96..01391dfd37d9 100644
> --- a/Documentation/networking/xfrm_device.rst
> +++ b/Documentation/networking/xfrm_device.rst
> @@ -50,7 +50,7 @@ Callbacks to implement
>
> The NIC driver offering ipsec offload will need to implement these
> callbacks to make the offload available to the network stack's
> -XFRM subsytem.  Additionally, the feature bits NETIF_F_HW_ESP and
> +XFRM subsystem.  Additionally, the feature bits NETIF_F_HW_ESP and
> NETIF_F_HW_ESP_TX_CSUM will signal the availability of the offload.
>
>
> --
> 2.26.2
>
>
