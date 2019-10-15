Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F32C7D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 18:32:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729156AbfJOScY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 14:32:24 -0400
Received: from ms.lwn.net ([45.79.88.28]:36184 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727200AbfJOScY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Oct 2019 14:32:24 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 76FB1382;
        Tue, 15 Oct 2019 18:32:23 +0000 (UTC)
Date:   Tue, 15 Oct 2019 12:32:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     gor@linux.ibm.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: Extend short title underline in
 sysctl
Message-ID: <20191015123222.46527701@lwn.net>
In-Reply-To: <20191014110008.GA3814@gmail.com>
References: <20191014110008.GA3814@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Oct 2019 22:00:08 +1100
Adam Zerella <adam.zerella@gmail.com> wrote:

> Title underlines should extend the full length of a title,
> Sphinx is currently displaying the following warning when
> building the htmldocs:
> 
> sysctl/kernel.rst:397: WARNING: Title underline too short.
> 
> hung_task_interval_warnings:
> ===================
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index 614179dc79a9..383eda89f411 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
>  
>  
>  hung_task_interval_warnings:
> -===================
> +============================
>  
>  The same as hung_task_warnings, but set the number of interval
>  warnings to be issued about detected hung tasks during check

So this is a good fix, but it's not an actual patch that I can apply.
Randy meanwhile says he fixed it, but the patch wasn't sent to me.  I
guess this warning will live a little longer...:(

Thanks,

jon
