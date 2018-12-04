Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7AEF87D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 23:57:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbeLDX55 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 18:57:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:47340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbeLDX54 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Dec 2018 18:57:56 -0500
Received: from gmail.com (unknown [104.132.1.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C80E2064D;
        Tue,  4 Dec 2018 23:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543967876;
        bh=vrpFYUDLN/gjs+hiCLB7nze3ldYP/xAozKtz2ZOaZJI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qTEBmyN5FFq9Y+GGCqv/zgWfRkVawqG93D1Crd/xLQzoTTMxB+pbiQqt1LHERegT8
         p7Dz5xp919EakWvrQ2ZC4p6fpKLujiPJnGHgID1p+LwXeNWczqSheW6DfBbEanx+DB
         Z+duFmFN3u5XJzPboq2mhlSWgRZIcKTdTi2rSfYE=
Date:   Tue, 4 Dec 2018 15:57:54 -0800
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
Subject: Re: [PATCH V2 6/7] f2fs: use IS_VERITY() to check inode's fsverity
 status
Message-ID: <20181204235753.GG70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-7-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204095650.12562-7-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Chandan,

On Tue, Dec 04, 2018 at 03:26:49PM +0530, Chandan Rajendra wrote:
> This commit now uses IS_VERITY() macro to check if fsverity is
> enabled on an inode.
> 
> Acked-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> ---
>  fs/f2fs/file.c  | 6 +++---
>  fs/f2fs/inode.c | 4 +++-
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
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
> index ddef483ad689..02806feed64c 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -45,9 +45,11 @@ void f2fs_set_inode_flags(struct inode *inode)
>  		new_fl |= S_DIRSYNC;
>  	if (f2fs_encrypted_inode(inode))
>  		new_fl |= S_ENCRYPTED;
> +	if (f2fs_verity_file(inode))
> +		new_fl |= S_VERITY;
>  	inode_set_flags(inode, new_fl,
>  			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|
> -			S_ENCRYPTED);
> +			S_ENCRYPTED|S_VERITY);
>  }
>  
>  static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
> -- 
> 2.19.1
> 

Similar to what I said for fscrypt: why not remove f2fs_verity_file() entirely
and always use IS_VERITY() or file_is_verity() as appropriate?

- Eric
