Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDBDDC433ED
	for <linux-doc@archiver.kernel.org>; Mon,  3 May 2021 22:53:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92F1761186
	for <linux-doc@archiver.kernel.org>; Mon,  3 May 2021 22:53:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhECWyI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 May 2021 18:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhECWyI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 May 2021 18:54:08 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5480C061574
        for <linux-doc@vger.kernel.org>; Mon,  3 May 2021 15:53:14 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 72B3C8B2;
        Mon,  3 May 2021 22:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 72B3C8B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620082394; bh=Zj9/u4/RRf6YkOmX+rwb78YEunmbRV5Gg1aAp1hsHVI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LDw+wkjlUlEZDPYk02eU9dJwFguL9Y88ufqY58hIgAtyiWgs+fGUl25CU0sFLEJFw
         WXMuoyHemTZ7FOCTLuzwYOU+XEjWU99HzI0FTxI8E5H267+pKxKlwe2IO0KE0xoLBS
         tT9+SjXeuTohDC4QqgZdL+XlWNWsnq7Vd2na7uCOYUALgJ8/RfGmXHWe/Aohr1OBwC
         AkJ+yKSb/ymtt/8V+xiFFh+iOzMn4LhOMbA4kvOkYCqi3U64ouKCYWN4HtHk+Rau51
         EoS4P9X+zbsn1CmVCzTil9H4GHLzK2O2XPqa08O53QdZDDZpEjxnTsn9euMDaCdfqM
         IwcHu7F+6idjg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, maennich@google.com
Cc:     linux-doc@vger.kernel.org, bobwxc@email.cn, chenhuacai@kernel.org,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs/core-api: Consistent code style
In-Reply-To: <20210428100720.1076276-1-siyanteng@loongson.cn>
References: <20210428100720.1076276-1-siyanteng@loongson.cn>
Date:   Mon, 03 May 2021 16:53:14 -0600
Message-ID: <87eeenh1k5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> all `example` in this file should be replaced with ``example``.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/core-api/symbol-namespaces.rst | 26 ++++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied, thanks.

jon
