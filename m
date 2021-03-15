Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D25C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:33:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 700E364F42
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbhCOTdN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhCOTc7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 15:32:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A389EC06174A
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 12:32:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 388BF372;
        Mon, 15 Mar 2021 19:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 388BF372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615836778; bh=atPvTP/Jlb/yBH0H8bUIZ+40Tk8ZHBlM050pcGHyyto=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=cuCkNsBg2QmH2OK/gRJy/zfDGtgttas6BRnGbfhp6cmwbJ8e8PKXprbdCeXk0C02u
         hpayZnes9XScQWsYlQLrCnWKDyoa7duKQLZtY1+Ba4OQixHvX28fHKWMQSAdRD+pXJ
         KHs7duad49R33YHh1VX/SfiPvx/nus05t/9cj8vu/px8W0zrLDwi0Ycm0e9TtK+dUd
         DDhJQQrTdHPRKU1uI+IVFx47oEXgtZnwLHfVeKLDUgpBU6HCbdolBCz2Vda8RCV7Q/
         xTxr5ApsYA50H/lRW7Ky4GzfghqgLn96zWcH9Q/8X11dgfmn3/uH04qePZTE1e6mfL
         f4e6JfX/v1vzQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jiele zhao <unclexiaole@gmail.com>, keescook@chromium.org
Cc:     linux-doc@vger.kernel.org, zhaojiele@qianxin.com,
        Jiele zhao <unclexiaole@gmail.com>
Subject: Re: [PATCH] security/loadpin: Update the changing interface in the
 source code.
In-Reply-To: <20210308020358.102836-1-unclexiaole@gmail.com>
References: <20210308020358.102836-1-unclexiaole@gmail.com>
Date:   Mon, 15 Mar 2021 13:32:57 -0600
Message-ID: <87o8fk1ac6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jiele zhao <unclexiaole@gmail.com> writes:

> Loadpin cmdline interface "enabled" has been renamed to "enforce"
> for a long time, but the User Description Document was not updated.
> (Meaning unchanged)
>
> And kernel_read_file* were moved from linux/fs.h to its own
> linux/kernel_read_file.h include file. So update that change here.
>
> Signed-off-by: Jiele zhao <unclexiaole@gmail.com>
> ---
>  Documentation/admin-guide/LSM/LoadPin.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This all looks correct as far as I can tell, so I've applied the patch.

Thanks,

jon
