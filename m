Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74A2C77B7E
	for <linux-doc@archiver.kernel.org>; Tue,  2 May 2023 16:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbjEBQz3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 May 2023 12:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbjEBQzU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 May 2023 12:55:20 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D0430F5
        for <linux-doc@vger.kernel.org>; Tue,  2 May 2023 09:55:14 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C935031A;
        Tue,  2 May 2023 16:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C935031A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1683046514; bh=bt4LPq744zslTyRHQEVAXieEFzUUEC2OE3DAM9c8cys=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CwNPfEKoJfP5gtt989gcQpfFwpL2w/8jf5xsiq9o/0PaPwjwdTYz5vksR+ULss/Pi
         qn40Xo3S35Dy6TyKWYNeB4USlTP9WVDqJrj0YTRC09QTFTnP94d7IWuBKcZoGTzAeQ
         uh0yWlLHJmPZg7A0gchcAd9UORYmLGO1egtZBWDuhkLvPR0W2/7yaI1LrYlPp7ZMPW
         gBZ+VSIwEPj2SjRGAcTqrEDmhEpcpRzEesN5Y+g7w2ql0fqXDCCXe5GWNOCxmArsjk
         +dfUAwA0FukfvCyOsTF/CdmOeEcHq7Yo5SmMRiZYt1IEJuFbYwhh1w9PdkAEl3vWuM
         bvMEDsoSGKrdQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tao Liu <ltao@redhat.com>, alexs@kernel.org, siyanteng@loongson.cn,
        src.res@email.cn
Cc:     linux-doc@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Tao Liu <ltao@redhat.com>
Subject: Re: [PATCH] Remove the unnecessary unicode character
In-Reply-To: <20230426021452.9745-1-ltao@redhat.com>
References: <20230426021452.9745-1-ltao@redhat.com>
Date:   Tue, 02 May 2023 10:55:13 -0600
Message-ID: <87v8ha7jwu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tao Liu <ltao@redhat.com> writes:

> There is a non-printable unicode char '\u202a' or "0xe2 0x80 0xaa" in hex
> in the translation doc. It is unnecessary and should be removed for better
> text formatting when using editors like vi.
>
> Signed-off-by: Tao Liu <ltao@redhat.com>
> ---
>  Documentation/translations/zh_CN/process/magic-number.rst | 2 +-
>  Documentation/translations/zh_TW/process/magic-number.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
