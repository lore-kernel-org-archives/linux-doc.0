Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 475617D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 15 Sep 2019 10:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfIOKHn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Sep 2019 06:07:43 -0400
Received: from ms.lwn.net ([45.79.88.28]:45624 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbfIOKHn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 15 Sep 2019 06:07:43 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 93CF82CC;
        Sun, 15 Sep 2019 10:07:42 +0000 (UTC)
Date:   Sun, 15 Sep 2019 04:07:38 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     jdelvare@suse.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: Suppress Sphinx warning
Message-ID: <20190915040738.586cf00f@lwn.net>
In-Reply-To: <20190915082718.3590-1-adam.zerella@gmail.com>
References: <20190915082718.3590-1-adam.zerella@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 15 Sep 2019 18:27:18 +1000
Adam Zerella <adam.zerella@gmail.com> wrote:

> When generating documentation output Sphinx
> outputs a warning for not including
> the page 'inspur-ipsps1.rst' in 'index.rst'.
> Assuming this documentation is useful it
> should be included in the index
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>

Thanks for working to improve the docs!  A couple of quick notes...

 - "suppress a warning" is not a particularly helpful subject line.
   Something like "include inspur-ipsps1.rst in the docs build" says a
   lot more about what you're actually doing.

>  Documentation/hwmon/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 8147c3f218bf..230ad59b462b 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -7,6 +7,7 @@ Linux Hardware Monitoring
>  
>     hwmon-kernel-api
>     pmbus-core
> +   inspur-ipsps1

 - Which tree is this against?  I don't even have that file, and mainline
   doesn't either.  If this is in linux-next, the fix should probably go
   in via the same tree.

>     submitting-patches
>     sysfs-interface
>     userspace-tools

Thanks,

jon
