Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A6DECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 23:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiH2X2J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 19:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiH2X2I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 19:28:08 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CB980B43
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 16:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=6xQEdG7I9afDLgCCUha+gwHY9cLRtcimEOVscS0Vf0o=; b=rjJ8YNnonvQ5RrIZ+ITQSavEFB
        kfjis5MP1EGOwqpxe39b72YWYmwfI+abk2P/VcQxLZgwADjs8dvM8HHmbf8i0v6KHmeHlJ9sjhIQG
        IPSgBqZ8Tyi8M+gHJJzTaf0YOD+nXX8icEgigutZrc8x3eJuTo11iYDfUVSlIPU9q1JjOvXSzieIF
        EytzLuBYMpgc9GjWZkyjmSmYcRrluihfBqZi3SuwNZPEwas3YUCsy+67pXkHLTp/zMHiXxAKjxf4a
        ubkDmb/WMPZXMn+o8pLIhkIGP+oQeOnGKswErH+IgyUsCyaFSYxG8GhbsuYDKfVJy0QKOUoY4O3fF
        np743/aA==;
Received: from [2601:1c0:6280:3f0::a6b3]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oSoAp-00DBzI-3i; Mon, 29 Aug 2022 23:28:07 +0000
Message-ID: <65f56cde-3df5-d912-82c6-fbac9eceffbf@infradead.org>
Date:   Mon, 29 Aug 2022 16:28:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] >>>>>>>>>>>>>>>>>>>>>>>>> BLURB <<<<<<<<<<<<<<<<<<<
Content-Language: en-US
To:     linux-doc@vger.kernel.org
Cc:     Jeremy Kerr <jk@ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
        linuxppc-dev@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>
References: <20220829232653.25060-1-rdunlap@infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220829232653.25060-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Oops.
I'll correct the Subject and resend.


On 8/29/22 16:26, Randy Dunlap wrote:
> Fix a typo of "or" which should be "of".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jeremy Kerr <jk@ozlabs.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/filesystems/spufs/spufs.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/Documentation/filesystems/spufs/spufs.rst
> +++ b/Documentation/filesystems/spufs/spufs.rst
> @@ -227,7 +227,7 @@ Files
>                from the data buffer, updating the value of the specified signal
>                notification register.  The signal  notification  register  will
>                either be replaced with the input data or will be updated to the
> -              bitwise OR or the old value and the input data, depending on the
> +              bitwise OR of the old value and the input data, depending on the
>                contents  of  the  signal1_type,  or  signal2_type respectively,
>                file.
>  

-- 
~Randy
