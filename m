Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 108BE7D08E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 17:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbeLJR0P (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 12:26:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:49106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726798AbeLJR0P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 12:26:15 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 30EC82064D;
        Mon, 10 Dec 2018 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544462773;
        bh=0gSLkdWt5ST6oT4w/dOcP7NkxBfEZdD9ALCfQgwjp6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=om1rqLaL+R9348CYm3jCB+W5qUU8DjFZX0nR/GMSxaQ7MwLCrUeSs7HRKjXP1l0wx
         vdeiX3eXMfNUE3ZczR4nGQzt9M1gqmel+tYPWM3g0Eqkks/jpghdSLxplLP3QtSfND
         mxYTF7MF7/Wk63f1Wduhf4QFQp7ulLwIirJ4+uVQ=
Date:   Mon, 10 Dec 2018 09:26:11 -0800
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
Subject: Re: [PATCH V3 8/9] fsverity: Move verity status check to
 fsverity_file_open
Message-ID: <20181210172610.GA92174@gmail.com>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
 <20181208065144.19486-9-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181208065144.19486-9-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Chandan,

On Sat, Dec 08, 2018 at 12:21:43PM +0530, Chandan Rajendra wrote:
> Instead of conditionally checking for verity status of an inode before
> invoking fsverity_file_open(), this commit moves the check inside the
> definition of fsverity_file_open().
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> ---
>  fs/ext4/file.c    | 8 +++-----
>  fs/f2fs/file.c    | 8 +++-----
>  fs/verity/setup.c | 3 +++
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 30fbd663354f..b404a857cd48 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -444,11 +444,9 @@ static int ext4_file_open(struct inode * inode, struct file * filp)
>  	if (ret)
>  		return ret;
>  
> -	if (IS_VERITY(inode)) {
> -		ret = fsverity_file_open(inode, filp);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = fsverity_file_open(inode, filp);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Set up the jbd2_inode if we are opening the inode for
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 2eb4821d95d1..925c0d9608da 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -491,11 +491,9 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>  	if (err)
>  		return err;
>  
> -	if (IS_VERITY(inode)) {
> -		err = fsverity_file_open(inode, filp);
> -		if (err)
> -			return err;
> -	}
> +	err = fsverity_file_open(inode, filp);
> +	if (err)
> +		return err;
>  
>  	filp->f_mode |= FMODE_NOWAIT;
>  
> diff --git a/fs/verity/setup.c b/fs/verity/setup.c
> index 08b609127531..bc463dc601b1 100644
> --- a/fs/verity/setup.c
> +++ b/fs/verity/setup.c
> @@ -771,6 +771,9 @@ static int setup_fsverity_info(struct inode *inode)
>   */
>  int fsverity_file_open(struct inode *inode, struct file *filp)
>  {
> +	if (!IS_VERITY(inode))
> +		return 0;
> +
>  	if (filp->f_mode & FMODE_WRITE) {
>  		pr_debug("Denying opening verity file (ino %lu) for write\n",
>  			 inode->i_ino);
> -- 
> 2.19.1
> 

This will break ext4 and f2fs when !CONFIG_FS_VERITY because then:

static inline int fsverity_file_open(struct inode *inode, struct file *filp)
{
	return -EOPNOTSUPP;
}

Can you please make it like fscrypt_file_open()?

static inline int fsverity_file_open(struct inode *inode, struct file *filp)
{
	if (IS_VERITY(inode))
		return -EOPNOTSUPP;
	return 0;
}

Same with fsverity_prepare_setattr().

- Eric
