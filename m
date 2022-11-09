Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B5FC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 20:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiKIUdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 15:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiKIUdL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 15:33:11 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40EF1DA5E;
        Wed,  9 Nov 2022 12:33:09 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6F6A2735;
        Wed,  9 Nov 2022 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6F6A2735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668025989; bh=Ktj4Ju320TNrN83Jdb75n+OnSn/xfGhemx1ROTVxYnM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=AcVNt6yCC+W5lKua+6bboNYdih2B5y1VeAbh/y0tKusl1k1XJqV3SmE6NxoJvUw4B
         sAMff9vmO6BBpE7bya1UYajYeCzdHGT/cjOmEvDyYgWqcryF6jFsA9h/YGrKiz077H
         Q25fD+xtGYCUT/kbrx7oeV0uwtdjYvLlMr/AfYJ+V3LsW188AU39pSrLyWqLku9PDx
         HjshSMyyanQmGsOoIrTdWLjJOuNeokiAqcATYuTEOvVGRGi822Q67YnJXnno/eXFaF
         LqiRfy9Mbn1EaX29/YaKZO13ovbka5rt9BvwP2o5ZpSZQVPt3nMx6rsJ4kYv0RY2zi
         SYWTIFXZHhcsg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexander Potapenko <glider@google.com>, glider@google.com
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, kasan-dev@googlegroups.com,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH] docs: kmsan: fix formatting of "Example report"
In-Reply-To: <20221107142255.4038811-1-glider@google.com>
References: <20221107142255.4038811-1-glider@google.com>
Date:   Wed, 09 Nov 2022 13:33:08 -0700
Message-ID: <87wn83kgvv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexander Potapenko <glider@google.com> writes:

> Add a blank line to make the sentence before the list render as a
> separate paragraph, not a definition.
>
> Fixes: 93858ae70cf4 ("kmsan: add ReST documentation")
> Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Alexander Potapenko <glider@google.com>
> ---
>  Documentation/dev-tools/kmsan.rst | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

jon
