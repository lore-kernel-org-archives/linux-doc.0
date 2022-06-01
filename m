Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A4DC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jun 2022 15:31:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344874AbiFAPbB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jun 2022 11:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344745AbiFAPbB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jun 2022 11:31:01 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918BB57B27
        for <linux-doc@vger.kernel.org>; Wed,  1 Jun 2022 08:31:00 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 45CF0723;
        Wed,  1 Jun 2022 15:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 45CF0723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654097460; bh=CfeB3kU5usGm0zqDG5CsWTnfroR8Gg+gcVcXKsOATsY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=r3g5ylBKcvn6nyuIuIdoNhil3AlzxQtpMh2Df4nHIxcOvwQlgoaInTS3a37hdpQ+R
         1fTJRDL3UYSZBqilyKvbGInqALV5xahldI6I2BcDVmLJmcsHJRRGh40RtBG7dhr0uC
         V0Ba2F/6UgPP7rIaMsqspxv5elldmnU25oJ+n2UjIGjeWfIUjpCVvPJM/M5WTDIV5U
         ksXzFUbUCIaO2Ilp/XEJPG4nA7aBvrBsGTLv5ZtKQOpqMZ+clO8vDv1Bvf0ENYQ4qm
         NhXQy9RhOmfWA+SDU6elkHkyEk0Z6sXy/xAPAITjbngrQq7XFIfQ8IfA4DDvpa+esG
         cNsenRMBVzTtw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Joel Colledge <joel.colledge@linbit.com>, linux-doc@vger.kernel.org
Cc:     Joel Colledge <joel.colledge@linbit.com>
Subject: Re: [PATCH] docs: blockdev: change title to match section content
In-Reply-To: <20220530142849.717-1-joel.colledge@linbit.com>
References: <20220530142849.717-1-joel.colledge@linbit.com>
Date:   Wed, 01 Jun 2022 09:31:10 -0600
Message-ID: <875ylk5rk1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Joel Colledge <joel.colledge@linbit.com> writes:

> This index.rst was added in commit
> 39443104c7d3 docs: blockdev: convert to ReST
>
> It appears that the title from the RapidIO index page was copied. This
> title does not match the content of this directory. Change it to match.
>
> Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
> ---
>  Documentation/admin-guide/blockdev/index.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/blockdev/index.rst b/Documentation/admin-guide/blockdev/index.rst
> index b903cf152091..957ccf617797 100644
> --- a/Documentation/admin-guide/blockdev/index.rst
> +++ b/Documentation/admin-guide/blockdev/index.rst
> @@ -1,8 +1,8 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  
> -===========================
> -The Linux RapidIO Subsystem
> -===========================
> +=============
> +Block Devices
> +=============

Applied, thanks.

jon
