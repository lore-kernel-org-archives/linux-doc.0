Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6077F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Sep 2019 08:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729029AbfIPIZm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Sep 2019 04:25:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:48522 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727068AbfIPIZl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Sep 2019 04:25:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5A0C0AD3C;
        Mon, 16 Sep 2019 08:25:40 +0000 (UTC)
Date:   Mon, 16 Sep 2019 10:25:50 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     "Adam Zerella" <adam.zerella@gmail.com>
Cc:     <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: hwmon: Suppress Sphinx warning
Message-ID: <20190916102550.0102a547@endymion>
In-Reply-To: <20190915082718.3590-1-adam.zerella@gmail.com>
References: <20190915082718.3590-1-adam.zerella@gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 15 Sep 2019 18:27:18 +1000, Adam Zerella wrote:
> When generating documentation output Sphinx
> outputs a warning for not including
> the page 'inspur-ipsps1.rst' in 'index.rst'.
> Assuming this documentation is useful it
> should be included in the index
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
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
>     submitting-patches
>     sysfs-interface
>     userspace-tools

I suggest Cc'ing the linux-hwmon mailing list for any documentation
patch touching files under Documentation/hwmon.

-- 
Jean Delvare
SUSE L3 Support
