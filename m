Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F990EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 19:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235438AbjGNTHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbjGNTHN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 15:07:13 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C42B35A4;
        Fri, 14 Jul 2023 12:07:12 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 353525BF;
        Fri, 14 Jul 2023 19:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 353525BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689361632; bh=oTYn6fWCw/euRBRZ073H79b9T/81K4oSe0c8M8C0axY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=l1qDTmZ6R1JHbQnyKwMtNIOb/gvUMtreKNbqMbjXDWiieK8ZlT6Vf287l7K4ko5QX
         XceYmg8UcYwM6cic7Fquv2WGcSF/hvvFa1rIdtfUWCARuM4eWm2aWGYl/5ky3Byiui
         xtdntEPRdRCEDu7U2+RwwVvYVCZX9nW70iUIAJ3VSIaHcLzaJhJwjlHhLdEVc0AlUk
         Zc41yZFbITIg8St8sXuWsuitjtbXt5uVF31b4qUtBxdvHfg3Baxulsw6CdhTJzalqM
         CM7N7ZuyKGoZPnTDrzr8Sf3IQzV1q83Dv83dfueFbQJ2RUJQCPzcJCLnXdv2iUhqg9
         i/TnPIi+mGp/A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hu Haowen <src.res.211@gmail.com>, siyanteng@loongson.cn,
        bobwxc@email.cn, alexs@kernel.org, gregkh@linuxfoundation.org,
        nabijaczleweli@nabijaczleweli.xyz, carlos.bilbao@amd.com
Cc:     Hu Haowen <src.res.211@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: change my own email address
In-Reply-To: <20230707160119.26873-1-src.res.211@gmail.com>
References: <20230707160119.26873-1-src.res.211@gmail.com>
Date:   Fri, 14 Jul 2023 13:07:11 -0600
Message-ID: <877cr21fds.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hu Haowen <src.res.211@gmail.com> writes:

> The previous email address was abandoned due to some reasons by myself, and
> thus shift the email contents mentioned from the old email address
> (src.res@email.cn) to the current version (src.res.211@gmail.com).
>
> Signed-off-by: Hu Haowen <src.res.211@gmail.com>
> ---

Applied, thanks.

jon
