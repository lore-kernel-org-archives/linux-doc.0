Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F57B7D8AB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 May 2019 08:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731309AbfETItG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 May 2019 04:49:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:60084 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbfETItG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 May 2019 04:49:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 57DCAAF7F;
        Mon, 20 May 2019 08:49:05 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id AC1011E3ED6; Mon, 20 May 2019 10:49:04 +0200 (CEST)
Date:   Mon, 20 May 2019 10:49:04 +0200
From:   Jan Kara <jack@suse.cz>
To:     Chengguang Xu <cgxu519@zoho.com.cn>
Cc:     jack@suse.com, corbet@lwn.net, linux-ext4@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: ext2: update description of quota options for ext2
Message-ID: <20190520084904.GA2172@quack2.suse.cz>
References: <20190520062116.28400-1-cgxu519@zoho.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520062116.28400-1-cgxu519@zoho.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 20-05-19 14:21:16, Chengguang Xu wrote:
> ext2 support user/group disk quota by specifying
> usrquota/grpquota option on mount, so fix the
> description in the doc properly.
> 
> Signed-off-by: Chengguang Xu <cgxu519@zoho.com.cn>

Thanks. Applied.

								Honza

> ---
>  Documentation/filesystems/ext2.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/ext2.txt b/Documentation/filesystems/ext2.txt
> index a19973a4dd1e..94c2cf0292f5 100644
> --- a/Documentation/filesystems/ext2.txt
> +++ b/Documentation/filesystems/ext2.txt
> @@ -57,7 +57,13 @@ noacl				Don't support POSIX ACLs.
>  
>  nobh				Do not attach buffer_heads to file pagecache.
>  
> -grpquota,noquota,quota,usrquota	Quota options are silently ignored by ext2.
> +quota, usrquota			Enable user disk quota support
> +				(requires CONFIG_QUOTA).
> +
> +grpquota			Enable group disk quota support
> +				(requires CONFIG_QUOTA).
> +
> +noquota option ls silently ignored by ext2.
>  
>  
>  Specification
> -- 
> 2.20.1
> 
> 
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
