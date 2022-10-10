Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345F4C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 19:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiJJTJ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 15:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbiJJTJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 15:09:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BCE5B78F;
        Mon, 10 Oct 2022 12:09:25 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BDB96299;
        Mon, 10 Oct 2022 19:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BDB96299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665428964; bh=y6c/nIS+GBE10lnnJHqErVpUOzTp1UuI2ehkLr6RCag=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=T7Auc+anWPrWpT23i0ryoFosu4fCuph+eqnHlvbZh3AaBymrGKryxvUy7XDYdDu0T
         ERAMJ5ZIWzePcIbVfoQmmceTnYuznnBLCyoyE040pjxoonlG76G7JOKUmPYJTwubnF
         CRsjXDfIRXy9YPxQvuiA3R9lT0n/KNAtmGZP0R7fH640D/vHM+xcIf3gR0JQNO0gTR
         7VCqqHGoTto2i7I3L1XLh0jXvdLkOMQYK5H7FKxdYhSSyFWoauijU+Ovz+PiQSTFEE
         P8/okFdvOa5dytXo6o35eaQRoVBsPJ9m2400Xxq7HJJWDuo0QtAqbbq+RBrodo27ze
         IiBZRW3A18oOA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>
Subject: Re: [PATCH] docs/howto: Replace abundoned URL of gmane.org
In-Reply-To: <20220930021936.26238-1-akiyks@gmail.com>
References: <20220930021936.26238-1-akiyks@gmail.com>
Date:   Mon, 10 Oct 2022 13:09:24 -0600
Message-ID: <87r0zfpkbf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Somehow, there remains a link to gmane.org, which stopped working
> in 2016, in howto.rst. Replace it with the one at lore.kernel.org.
> Do the same changes under translations/ as well.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <src.res@email.cn>
> ---
>  Documentation/process/howto.rst                    | 2 +-
>  Documentation/translations/it_IT/process/howto.rst | 2 +-
>  Documentation/translations/ja_JP/howto.rst         | 2 +-
>  Documentation/translations/ko_KR/howto.rst         | 2 +-
>  Documentation/translations/zh_CN/process/howto.rst | 2 +-
>  Documentation/translations/zh_TW/process/howto.rst | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
