Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41587C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 17:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1BD1223DB
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 17:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbhATRqy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 12:46:54 -0500
Received: from ms.lwn.net ([45.79.88.28]:57158 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbhATRo1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jan 2021 12:44:27 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 041346133;
        Wed, 20 Jan 2021 17:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 041346133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611164583; bh=t10z/9IsGKuL0EHjMm0YRCyX2MRbbRcllIYkA3Oblow=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=InB65MkkxlBevNgPOKeV8RBG//YJUhsA2r8PVWvyNp2Mw5g/HNf5JeJ4xBBrfpNeo
         YLiRFHpJjNRbBK2QfAcWa0TIPN6QdapdsXeur7r+4kbN9572oTXcIUFMchzrhQsGEU
         JQ1/Xhp0vafrkWbJZg2tqjanqpyh6jlrzQXz480/KsYbpLwDrlNOinLdq7MVyCC2sO
         8vlZ/cJNL19q9y6bW+1P8ey8JE8ZPHBiVKBXNc2+JUKEG9gqrvg5s0gaAO/SNyorrS
         OPybZ7wtWIQwUAJWcusMDEVgpkFhNQLzeCkxX9k36h+d2ob6LB/VVKBYBykRWTRHsk
         1ynMQWpV/glHg==
Date:   Wed, 20 Jan 2021 10:43:01 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kir Kolyshkin <kolyshkin@gmail.com>
Cc:     linux-doc@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH 04/10] docs/scheduler/sched-bwc: add proper ref
Message-ID: <20210120104301.2aeda8f9@lwn.net>
In-Reply-To: <20210120001824.385168-5-kolyshkin@gmail.com>
References: <20210120001824.385168-1-kolyshkin@gmail.com>
        <20210120001824.385168-5-kolyshkin@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Jan 2021 16:18:18 -0800
Kir Kolyshkin <kolyshkin@gmail.com> wrote:

> Add a proper reference instead of just using the file name.
> 
> Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
> ---
>  Documentation/scheduler/sched-bwc.rst      | 3 ++-
>  Documentation/scheduler/sched-rt-group.rst | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/scheduler/sched-bwc.rst b/Documentation/scheduler/sched-bwc.rst
> index a44860d33ffc..dcec7440c222 100644
> --- a/Documentation/scheduler/sched-bwc.rst
> +++ b/Documentation/scheduler/sched-bwc.rst
> @@ -4,7 +4,8 @@ CFS Bandwidth Control
>  
>  .. note::
>     This document only discusses CPU bandwidth control for SCHED_NORMAL.
> -   The SCHED_RT case is covered in Documentation/scheduler/sched-rt-group.rst
> +   The SCHED_RT case is covered in
> +   :ref:`Documentation/scheduler/sched-rt-group.rst <sched-rt-group>`.
>  
>  CFS bandwidth control is a CONFIG_FAIR_GROUP_SCHED extension which allows the
>  specification of the maximum CPU bandwidth available to a group or hierarchy.
> diff --git a/Documentation/scheduler/sched-rt-group.rst b/Documentation/scheduler/sched-rt-group.rst
> index 655a096ec8fb..a3b4aa51c271 100644
> --- a/Documentation/scheduler/sched-rt-group.rst
> +++ b/Documentation/scheduler/sched-rt-group.rst
> @@ -1,3 +1,5 @@
> +.. _sched-rt-group:
> +

So why do you need to do this?  The build system in recent kernels will
generate that reference automatically without the extra markup.

Thanks,

jon
