Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949D3C6FA82
	for <linux-doc@archiver.kernel.org>; Wed, 21 Sep 2022 20:10:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbiIUUKo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Sep 2022 16:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbiIUUKm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Sep 2022 16:10:42 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C619C2CC
        for <linux-doc@vger.kernel.org>; Wed, 21 Sep 2022 13:10:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 97199735;
        Wed, 21 Sep 2022 20:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 97199735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1663791036; bh=rQl+CymfSQQypN8moZ074ZUL1pvye2cOujrnDu9whYo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=L5aeFcga4dqANUzXyNiZboNQdCPf8Bwbi96o3dWSLcjHerKVJyz4d7pp4TdnxW16F
         fMNucBfvP6zcXTraAuMpZA04KH6e1U4AN9tooGES30w19savDWqrkYh7iZD0Cgy3Pd
         ebNZtolrLtCIZDJT+Pg+7fY/4Sv8IUmTrz9BcjxKrNbw9VBI0xBRFT+nZPkGCBEO22
         ieXqTSGmss4/gOi6SGq+LjJG0D+QSssyPOWDbg/3GBROOGFG/0wCx7nYJKuM75ula8
         8kqUoshDWsfWtLef+SBuDXpxLvlgzIj7oOhrtiu9YtdbVnBqpSd2HxDaeRAFTbjXBC
         uWoZ6nXGbcyEQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Jeremy Kerr <jk@ozlabs.org>,
        Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: spufs: correct a duplicate word typo
In-Reply-To: <20220829232908.32437-1-rdunlap@infradead.org>
References: <20220829232908.32437-1-rdunlap@infradead.org>
Date:   Wed, 21 Sep 2022 14:10:35 -0600
Message-ID: <878rmcv684.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

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

Applied, thanks.

jon
