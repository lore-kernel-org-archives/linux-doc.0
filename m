Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D512C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BBBA601FD
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 21:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhCAV7A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 16:59:00 -0500
Received: from ms.lwn.net ([45.79.88.28]:43002 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244006AbhCAV4e (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Mar 2021 16:56:34 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 49C362BA;
        Mon,  1 Mar 2021 21:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 49C362BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614635739; bh=OfriL43I/FwmwVb3uQPXnRG9xFY9LoznRzEmiYC8tMg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CvSPUUJVYgY/+qPdTaB3tx8lkVnHitIDeiZXaEGW5tURmiJTW2o1ty9M+Ogha9YYC
         Ph+FMoW/Ly2s/MZ/dumH7UdnfPH4NZLd68YnjWDQKWHwFO0x+TmPEXJ+37IFtCUMgi
         RSDkreur3ElAJdf3OS9L/ZfinmHwtFdRVrzEz6Qf0ui+kWDDGtcigMEZo8Z3eRR/mP
         iqzC1KV/5AMpTHJsjgxTTa+TAfXglhinB9QkWEQi7TfErk9u4GGThgLMVKerPGu7Gs
         UPTQx559heVG+A3cP0bAiKA4wm5CVVw7tcIFCw19ZE6GKimkyPCDmSCa2NhfPzrufH
         T1X3Io/KCy5OQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] docs: watchdog: fix obsolete include file reference in
 pcwd
In-Reply-To: <20210223111324.309285-1-f.suligoi@asem.it>
References: <20210223111324.309285-1-f.suligoi@asem.it>
Date:   Mon, 01 Mar 2021 14:55:38 -0700
Message-ID: <87h7lu35et.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Flavio Suligoi <f.suligoi@asem.it> writes:

> The file linux/pcwd.h is not more present in the kernel
> sources. Its information is now moved into the file:
>
> include/uapi/linux/watchdog.h
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  Documentation/watchdog/pcwd-watchdog.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
