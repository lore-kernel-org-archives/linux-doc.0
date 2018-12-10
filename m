Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B68F7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 18:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbeLJSRW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 13:17:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:37116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbeLJSRW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:17:22 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 489432081F;
        Mon, 10 Dec 2018 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544465841;
        bh=//bYfdGqGUVYL/0FNdror22RkOXeaZsCMQgounoG+c8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zi7djHbPKp1usvbv1AKPJ8nF2+DyGmi9vJlJYVNPb/wYzVyI51WSH3dZsXXPqA+/Q
         ToTsGwk/gUMejI0Fm+vXFTUfFI6o/5nKVOoJvaTnbdQtf9Cw5vdOCDX26RXHxEDJib
         QH+kmnGJXB3hCB8HI336yy68zXz701EJdo2f4nDk=
Date:   Mon, 10 Dec 2018 10:17:18 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Chandan Rajendra <chandan@linux.vnet.ibm.com>
Cc:     linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-mips@linux-mips.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, tytso@mit.edu,
        adilger.kernel@dilger.ca, jaegeuk@kernel.org, yuchao0@huawei.com,
        corbet@lwn.net, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, green.hu@gmail.com, deanbo422@gmail.com,
        schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, richard@nod.at,
        dedekind1@gmail.com, adrian.hunter@intel.com,
        viro@zeniv.linux.org.uk
Subject: Re: [PATCH V3 6/9] f2fs: use IS_VERITY() to check inode's fsverity
 status
Message-ID: <20181210181718.GF92174@gmail.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
 <20181208065144.19486-7-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181208065144.19486-7-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 08, 2018 at 12:21:41PM +0530, Chandan Rajendra wrote:
> This commit removes the f2fs specific f2fs_verity_file() and makes use
> of the generic IS_VERITY() macro or file_is_verity() to check for the
> verity status of an inode.
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>

> ---
>  fs/f2fs/f2fs.h  | 7 +------
>  fs/f2fs/file.c  | 6 +++---
>  fs/f2fs/inode.c | 4 +++-
>  fs/f2fs/super.c | 1 +
>  4 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f9c8b0afc1de..54bd93c7b630 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3448,18 +3448,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>  #endif
>  }
>  
> -static inline bool f2fs_verity_file(struct inode *inode)
> -{
> -	return file_is_verity(inode);
> -}
> -
>  /*
>   * Returns true if the reads of the inode's data need to undergo some
>   * postprocessing step, like decryption or authenticity verification.
>   */
>  static inline bool f2fs_post_read_required(struct inode *inode)
>  {
> -	return f2fs_encrypted_file(inode) || f2fs_verity_file(inode);
> +	return f2fs_encrypted_file(inode) || IS_VERITY(inode);
>  }
>  
>  #define F2FS_FEATURE_FUNCS(name, flagname) \
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6c7ad15000b9..2eb4821d95d1 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -491,7 +491,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>  	if (err)
>  		return err;
>  
> -	if (f2fs_verity_file(inode)) {
> +	if (IS_VERITY(inode)) {
>  		err = fsverity_file_open(inode, filp);
>  		if (err)
>  			return err;
> @@ -701,7 +701,7 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
>  	struct f2fs_inode *ri;
>  	unsigned int flags;
>  
> -	if (f2fs_verity_file(inode)) {
> +	if (IS_VERITY(inode)) {
>  		/*
>  		 * For fs-verity we need to override i_size with the original
>  		 * data i_size.  This requires I/O to the file which with
> @@ -800,7 +800,7 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
>  	if (err)
>  		return err;
>  
> -	if (f2fs_verity_file(inode)) {
> +	if (IS_VERITY(inode)) {
>  		err = fsverity_prepare_setattr(dentry, attr);
>  		if (err)
>  			return err;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index d731d23aedee..ff9126616d65 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -45,9 +45,11 @@ void f2fs_set_inode_flags(struct inode *inode)
>  		new_fl |= S_DIRSYNC;
>  	if (file_is_encrypt(inode))
>  		new_fl |= S_ENCRYPTED;
> +	if (file_is_verity(inode))
> +		new_fl |= S_VERITY;
>  	inode_set_flags(inode, new_fl,
>  			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
> -			S_ENCRYPTED);
> +			S_ENCRYPTED|S_VERITY);
>  }
>  
>  static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 4287cf348d3c..73320202bd01 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2207,6 +2207,7 @@ static int f2fs_set_verity(struct inode *inode, loff_t data_i_size)
>  		return err;
>  
>  	file_set_verity(inode);
> +	f2fs_set_inode_flags(inode);
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  	return 0;
>  }
> -- 
> 2.19.1
> 
