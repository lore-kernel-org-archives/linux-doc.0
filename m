Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF70C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:06:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D6496121E
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:06:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhDMVHQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 17:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhDMVHP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 17:07:15 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D656C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 14:06:55 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id ED13C823;
        Tue, 13 Apr 2021 21:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ED13C823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618348015; bh=Yjgpv8KXv+Ddl0mEFiMDKraAgNnsJAbqaob6CC17Bds=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kRlF02dYDgqXUryxdv/J9Y1jmc6v53udaK/wAsajwde2kvSz810v+7RpnkZF/3faH
         qdYBYMbv0UO9ZM7p3VoKjeGYQBHpbrdsV9Sw56x7dd6S8yC5QRNwHCJ4d2vDI3JSto
         EdzTRg0/n/5he302WowK514w0bhUzUjQZ6P+kt0tZyfjIMGRNG16VmpAb73uQkcF8R
         5wkXG7iUCtHcOYoGfHitMRXINuuA/tQzpS8nmMOSQuk8Un5YUIwCO7tG1Jxcpspiw6
         KMyfspsdHPjC714Jc/W2YRSbC7d23uWQQdvHD7FGNN7vNKIV2lREkPCGyE3X5TlSdv
         Cf6/rh8h40qWQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <seakeel@gmail.com>, YanTeng Si <sterlingteng@gmail.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/7] docs/zh_CN: Add translations in zh_CN/doc-guide/
In-Reply-To: <cover.1618295149.git.bobwxc@email.cn>
References: <cover.1618295149.git.bobwxc@email.cn>
Date:   Tue, 13 Apr 2021 15:06:54 -0600
Message-ID: <87h7k9sxld.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Hi all,
>
> This set of patches add some translations in zh_CN/doc-guide/ .
>
> V5:
> * Modified some words under YanTeng Si and Alex Shi's suggestions.
>   Thanks for theirs rewiew!
> * Make title signs number equal to the title chars
> * Drop [PATCH v3 2/8] docs/zh_CN: Add two image example files, use original
>   images
> * Pick YanTeng Si's Review-by tag for [Patch 5/7]

I've applied this set, thanks.  If you want to adopt Alex's suggestion
on patch 3, please send a separate update containing just that.

Thanks,

jon
