Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F1C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 21:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbiKUVcx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 16:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbiKUVcu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 16:32:50 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B574BCB4;
        Mon, 21 Nov 2022 13:32:48 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DAF9B5CC;
        Mon, 21 Nov 2022 21:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DAF9B5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669066368; bh=8v8bBumhpFUbPpAyoup1gu5frBVIAXj5Um/jiYj0WBg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GTk6RnsnGFOnVPZJ7UwLeAtiQQjDQOvZ6IjdiZ9BvPXBkc79CSR5cukvG4Rd+PNBh
         AxWyCQCCjA69X+Ok+3h4oI7SY66TcDii4moZ9CR/AP4gUbFs6hOhNVx8awW4/YX2gb
         WlmbcvPz9mAiEyJlbKYFvWkPaHlPM3qkqF1Q+yiwVtm4XydQ8Yz6UlkctM1BRyvYbW
         1bKrDAoRdVwWL4hCZUdFR+sDu/bbT11Gi6FocHm+YbnABHlRNuCuSfvFkaJ+dQvotG
         JgThcEcdBy7fFwa+E910JeXfixC9BqFz5+O6QmG39YVMDe4qi2VbZ46+0TaV470ttk
         3RHDQOorQQliw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Liam Beguin <liambeguin@gmail.com>,
        Liam Beguin <liambeguin@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] math64: favor kernel-doc from header files
In-Reply-To: <20221118182309.3824530-1-liambeguin@gmail.com>
References: <20221118182309.3824530-1-liambeguin@gmail.com>
Date:   Mon, 21 Nov 2022 14:32:46 -0700
Message-ID: <87wn7o803l.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Liam Beguin <liambeguin@gmail.com> writes:

> Fix the kernel-doc markings for div64 functions to point to the header
> file instead of the lib/ directory.  This avoids having implementation
> specific comments in generic documentation.  Furthermore, given that
> some kernel-doc comments are identical, drop them from lib/math64 and
> only keep there comments that add implementation details.
>
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/core-api/kernel-api.rst |  3 ---
>  include/linux/math64.h                | 12 ++++++------
>  lib/math/div64.c                      | 15 ++-------------
>  3 files changed, 8 insertions(+), 22 deletions(-)

I've applied the series, thanks.

jon
