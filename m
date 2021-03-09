Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E16C433E0
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:10:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6468F6528C
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 00:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCIAJy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 19:09:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhCIAJl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 19:09:41 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18C8C06174A;
        Mon,  8 Mar 2021 16:09:40 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 657F431A;
        Tue,  9 Mar 2021 00:09:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 657F431A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615248580; bh=CXBA3uWZM5tx3rpdBOVRyRWRA/6dix551UWiS1r1zTQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=D2wYo0JoqDaY1+1Qx1mdRbE32/ajZVE4jGoSOyBQNoUEX8bQ71NJTqxsz6rRQlHx/
         eK46Ndk2CIZ1lfpHsLxx4YxHFMBAmtWPkAwZZigqPlIhogMi4Upg4ccQubwOlhBX/6
         rMR2xBFNSUyvrugCokosB58bJv7UNMgTZsRYB1Kx21pL7ZuiS3+9Yb1d1ukFKlMhJV
         SLWc+t/BBckqrjJEKfNZ7eRjYB5Oh8BMdGwdrA2cqt8EVgg44pxVBMcfNULCLHvIqb
         vv0Vx1UnZDejIey70tRfXKkYDAyLhiOWpUl3r96/BDQ2hrtIJh0ivrdvFJbaldlt/U
         UFKLC3K+zLlmw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: Re: [PATCH] Documentation: dynamic-debug-howto: fix example
In-Reply-To: <20210303091646.773111-1-martin.kepplinger@puri.sm>
References: <20210303091646.773111-1-martin.kepplinger@puri.sm>
Date:   Mon, 08 Mar 2021 17:09:39 -0700
Message-ID: <87h7ll5gsc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Martin Kepplinger <martin.kepplinger@puri.sm> writes:

> dynamic debug is "expecting pairs of match-spec <value>" so the example
> for all files of which the paths include "usb" there is "file" missing.
>
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/admin-guide/dynamic-debug-howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
> index 6c04aea8f4cd..b119b8277b3e 100644
> --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> @@ -347,7 +347,7 @@ Examples
>  				<debugfs>/dynamic_debug/control
>  
>    // enable messages in files of which the paths include string "usb"
> -  nullarbor:~ # echo -n '*usb* +p' > <debugfs>/dynamic_debug/control
> +  nullarbor:~ # echo -n 'file *usb* +p' > <debugfs>/dynamic_debug/control

Applied, thanks.

jon
