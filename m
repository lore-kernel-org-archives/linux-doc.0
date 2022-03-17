Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C26FC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Mar 2022 15:29:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235748AbiCQPaY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Mar 2022 11:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235876AbiCQPaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Mar 2022 11:30:23 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E92F16E7C4
        for <linux-doc@vger.kernel.org>; Thu, 17 Mar 2022 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=tWQsVqkqToufo68cqzWhpewUcTXKHKMSz5ToRcdsd00=; b=bYJoXHrP7oC2A0dZAOgMNP/QTR
        a3zkDVqmtFZqVKAaFwyG4hYd3XKpLj6iqItMCD30yGaWjT2B5Isf1djZekdWe2FByBXcDlCFdty65
        r0aWtI8zfW2KFBJ2u2LypWXuNsDvPtymFq8MxWYLpMKFnPPuK+WToi2Vk9J66QJCQ5jl18AKpNH56
        B3mEe6ca9wYQOju9pyeNqBWAxvx6fkqAwgiEllT6QIws9tvIzt2/NQnGMflnP291uT4tp4ik9XTyz
        Je+WTIYiHxEAN7sdq34zYpBUb+Qdto7sss5+3d9KN9vCZIQomn1zKEhMvMjzyqavMubaompNdVF0a
        w+gfiHLQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nUs3i-0075AH-Bt; Thu, 17 Mar 2022 15:29:02 +0000
Message-ID: <82331905-8b04-ccd4-0317-384ad16bb4bb@infradead.org>
Date:   Thu, 17 Mar 2022 08:28:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [ PATCH ] Documentation: fixed typos
Content-Language: en-US
To:     kushagra765@outlook.com, linux-doc@vger.kernel.org
References: <SI2PR01MB3929000E406A2DCA53A25F55F8129@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <SI2PR01MB3929000E406A2DCA53A25F55F8129@SI2PR01MB3929.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/17/22 08:25, kushagra765@outlook.com wrote:
> From ade08e81a63db0faf39791f9cd7c87e5787186f5 Mon Sep 17 00:00:00 2001
> From: Kushagra Verma <kushagra765@outlook.com>
> Date: Thu, 17 Mar 2022 20:37:36 +0530
> Subject: [PATCH] Documentation: fixed typos
> 
>    1. Documentation/admin-guide/bootconfig.rst:207: fixed a typo in the word 'concatenated`
>    2. Documentation/atomic_t.txt:327: fixed a typo in the word `architecture`
> 
> Signed-off-by: Kushagra Verma <kushagra765@outlook.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

for the text changes.
But you should Cc one or more maintainers and the file's "owner". (done now)

> ---
>  Documentation/admin-guide/bootconfig.rst | 2 +-
>  Documentation/atomic_t.txt               | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
> index a1860fc0ca88..d4ea063aca0c 100644
> --- a/Documentation/admin-guide/bootconfig.rst
> +++ b/Documentation/admin-guide/bootconfig.rst
> @@ -204,7 +204,7 @@ In addition to the kernel command line, the boot config can be used for
>  passing the kernel parameters. All the key-value pairs under ``kernel``
>  key will be passed to kernel cmdline directly. Moreover, the key-value
>  pairs under ``init`` will be passed to init process via the cmdline.
> -The parameters are concatinated with user-given kernel cmdline string
> +The parameters are concatenated with user-given kernel cmdline string
>  as the following order, so that the command line parameter can override
>  bootconfig parameters (this depends on how the subsystem handles parameters
>  but in general, earlier parameter will be overwritten by later one.)::
> diff --git a/Documentation/atomic_t.txt b/Documentation/atomic_t.txt
> index 0f1ffa03db09..d7adc6d543db 100644
> --- a/Documentation/atomic_t.txt
> +++ b/Documentation/atomic_t.txt
> @@ -324,7 +324,7 @@ atomic operations.
>  
>  Specifically 'simple' cmpxchg() loops are expected to not starve one another
>  indefinitely. However, this is not evident on LL/SC architectures, because
> -while an LL/SC architecure 'can/should/must' provide forward progress
> +while an LL/SC architecture 'can/should/must' provide forward progress
>  guarantees between competing LL/SC sections, such a guarantee does not
>  transfer to cmpxchg() implemented using LL/SC. Consider:
>  

thanks.
-- 
~Randy
