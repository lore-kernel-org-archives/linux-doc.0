Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45BDC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 15:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbiAOPa1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 10:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiAOPa1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 10:30:27 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E66AC061574
        for <linux-doc@vger.kernel.org>; Sat, 15 Jan 2022 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=eRJg0emsuIT8/qzz/Z8MdIqXmt3RqDjEvOTHfOHW0QU=; b=UY8EO1XM07ChTDC8Q4olCKtGzk
        jt5rFhxBRa9gD6qD3Elx2Rl84ECtsPTi0Q4Sx2jHdaOLq5VcrYI3I3d0xfqOXGefOtv5OrVamrFnC
        WBWVDs3jde7pmTkAUXjpZV+aYpdUCP3xh45tTn2DGzMHwMj7eR38L5zae9auVmuMK5/t525VR+nTd
        xOxLPT/Liyt6HZS315L8oZhN5fv57tc5VzDddLCvFDoQ1+inoj5+S679Tp5pBp2bGZDLHlZXfVBD7
        VND2Wq8zez1+8hQHImw6iEqR54ixRl+TF4S5q9mR92q/WJHRm4Lsdhts/ZODdBf9CvUoKgOidKSrL
        aP0AkN6Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n8l0W-006dg6-56; Sat, 15 Jan 2022 15:30:20 +0000
Message-ID: <a6b32e17-9aba-4a03-12db-0d707e0f8d26@infradead.org>
Date:   Sat, 15 Jan 2022 07:30:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] docs: staging/tee.rst: fix two typos found while reading
Content-Language: en-US
To:     Wang Cheng <wanngchenng@gmail.com>, jens.wiklander@linaro.org,
        corbet@lwn.net
Cc:     op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org
References: <20220115125236.34886-1-wanngchenng@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220115125236.34886-1-wanngchenng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 1/15/22 04:52, Wang Cheng wrote:
> Signed-off-by: Wang Cheng <wanngchenng@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/staging/tee.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
> index 3c63d8dcd61e..498343c7ab08 100644
> --- a/Documentation/staging/tee.rst
> +++ b/Documentation/staging/tee.rst
> @@ -255,7 +255,7 @@ The following picture shows a high level overview of AMD-TEE::
>   +--------------------------+      +---------+--------------------+
>  
>  At the lowest level (in x86), the AMD Secure Processor (ASP) driver uses the
> -CPU to PSP mailbox regsister to submit commands to the PSP. The format of the
> +CPU to PSP mailbox register to submit commands to the PSP. The format of the
>  command buffer is opaque to the ASP driver. It's role is to submit commands to
>  the secure processor and return results to AMD-TEE driver. The interface
>  between AMD-TEE driver and AMD Secure Processor driver can be found in [6].
> @@ -290,7 +290,7 @@ cancel_req driver callback is not supported by AMD-TEE.
>  
>  The GlobalPlatform TEE Client API [5] can be used by the user space (client) to
>  talk to AMD's TEE. AMD's TEE provides a secure environment for loading, opening
> -a session, invoking commands and clossing session with TA.
> +a session, invoking commands and closing session with TA.
>  
>  References
>  ==========

-- 
~Randy
