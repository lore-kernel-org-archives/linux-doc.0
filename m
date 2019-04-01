Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE07D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 05:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfDAFni (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 01:43:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55434 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfDAFni (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Apr 2019 01:43:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6B47860850; Mon,  1 Apr 2019 05:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1554097417;
        bh=S8iNxG/BFVlMxnUKNmA4SdQSOdf98Y19BeYNMl9EsTg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ast4lQp1gIw7AeYrpgiZT7J1w+p3iTa9yG30BeuP9pxjDMC5EFb1sGw110Om+XFDS
         LrJXHVXyTYL0f7wuTRWAuyyJ51OY0UMFbf2IOSNLQp5PRqmYbcyGyZnyWQfT/2mjnB
         0V9JP6ja8rb3dRAZ15ukYqCpN0giozNMk8Hh+IXE=
Received: from [10.204.79.83] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mojha@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93979602F2;
        Mon,  1 Apr 2019 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1554097416;
        bh=S8iNxG/BFVlMxnUKNmA4SdQSOdf98Y19BeYNMl9EsTg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lIIVFfhP3aOCLc5J3DvtD5jmfzpdAC3pMu4MhuZqDwviAELL5Zc0+X6SjKI4wlMON
         I7d7/OYUylF3z0WtYwh3onTZ1/WKp6eyiM67Jj+w/hgC2javeR41Z9M5QXPR5Nem0E
         SoBHMVcVyWlW+juldb67oJvDikEnwHweTcGupWfQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93979602F2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH v3 20/24] docs: filesystems: vfs: Use SPDX identifier
To:     "Tobin C. Harding" <tobin@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Neil Brown <neilb@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190327051717.23225-1-tobin@kernel.org>
 <20190327051717.23225-21-tobin@kernel.org>
From:   Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <a2ae24f6-8221-9668-6dab-c80b2512dd4c@codeaurora.org>
Date:   Mon, 1 Apr 2019 11:13:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190327051717.23225-21-tobin@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 3/27/2019 10:47 AM, Tobin C. Harding wrote:
> Currently the licence is indicated via a custom string.  We have SPDX
> license identifiers now for this task.
>
> Use SPDX license identifier matching current license string.
>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tobin C. Harding <tobin@kernel.org>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   Documentation/filesystems/vfs.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/filesystems/vfs.txt b/Documentation/filesystems/vfs.txt
> index 0bc45c3a33db..dcc1f66932e7 100644
> --- a/Documentation/filesystems/vfs.txt
> +++ b/Documentation/filesystems/vfs.txt
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>   =========================================
>   Overview of the Linux Virtual File System
>   =========================================
> @@ -9,8 +11,6 @@ Overview of the Linux Virtual File System
>     Copyright (C) 1999 Richard Gooch
>     Copyright (C) 2005 Pekka Enberg
>   
> -  This file is released under the GPLv2.
> -
>   
>   Introduction
>   ============
