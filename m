Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 736857D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 00:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbeLEAIf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 19:08:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:48440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbeLEAIe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Dec 2018 19:08:34 -0500
Received: from gmail.com (unknown [104.132.1.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 894A12082B;
        Wed,  5 Dec 2018 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543968514;
        bh=qAZ/le5vwMfqELRtW8Jcd+Jf0HxGLN2GLo0tGYJWUYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fU+sLe2v8QrSCIrCIKNmeAg6DxeV67P8q5c6VcMCoEwKk1+gRAOigB9tmYk6x4j4Y
         dCH+LKg5x6Cu1p5EfTf+7fXUS3EB843r2D4yYbYXgjlC20sDwHJqw5nisYgcXd7HAZ
         KSCNmSCgwFXIsxFspCfr3rXYH/Vs5+3Px6q78G+I=
Date:   Tue, 4 Dec 2018 16:08:32 -0800
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
Subject: Re: [PATCH V2 7/7] fsverity: Remove filesystem specific build config
 option
Message-ID: <20181205000831.GI70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-8-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204095650.12562-8-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Chandan,

On Tue, Dec 04, 2018 at 03:26:50PM +0530, Chandan Rajendra wrote:
> In order to have a common code base for fsverity "post read" processing
> for all filesystems which support fsverity, this commit removes
> filesystem specific build config option (e.g. CONFIG_EXT4_FS_VERITY)
> and replaces it with a build option (i.e. CONFIG_FS_VERITY) whose
> value affects all the filesystems making use of fsverity.
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> ---
>  Documentation/filesystems/fsverity.rst |  4 ++--
>  fs/ext4/Kconfig                        | 20 --------------------
>  fs/ext4/ext4.h                         |  2 --
>  fs/ext4/readpage.c                     |  4 ++--
>  fs/ext4/super.c                        |  6 +++---
>  fs/ext4/sysfs.c                        |  4 ++--
>  fs/f2fs/Kconfig                        | 20 --------------------
>  fs/f2fs/data.c                         |  2 +-
>  fs/f2fs/f2fs.h                         |  2 --
>  fs/f2fs/super.c                        |  6 +++---
>  fs/f2fs/sysfs.c                        |  4 ++--
>  fs/verity/Kconfig                      |  3 ++-
>  include/linux/fs.h                     |  4 ++--
>  include/linux/fsverity.h               |  3 +--
>  14 files changed, 20 insertions(+), 64 deletions(-)
> 
[...]
> diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
> index c30c4f6ed411..f37132c640ee 100644
> --- a/include/linux/fsverity.h
> +++ b/include/linux/fsverity.h
> @@ -19,8 +19,7 @@ struct fsverity_operations {
>  	int (*get_metadata_end)(struct inode *inode, loff_t *metadata_end_ret);
>  };
>  
> -#if __FS_HAS_VERITY
> -
> +#ifdef CONFIG_FS_VERITY
>  /* ioctl.c */
>  extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
>  extern int fsverity_ioctl_measure(struct file *filp, void __user *arg);
> -- 
> 2.19.1
> 

Can you grep for __FS_HAS_VERITY?  It's still mentioned twice in comments for
this #ifdef (these should be changed to CONFIG_FS_VERITY), and it's still
defined in fs/verity/fsverity_private.h (that one should be removed).

Thanks,

- Eric
