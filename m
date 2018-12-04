Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DFE3C7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Dec 2018 23:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbeLDXtM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 18:49:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:46528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbeLDXtM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Dec 2018 18:49:12 -0500
Received: from gmail.com (unknown [104.132.1.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0381A206B6;
        Tue,  4 Dec 2018 23:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543967351;
        bh=Bk/P93DRzeThH+TvTAwymY1qUPvqceRqZmxBmFDykbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qgf4kRTcOFCh72QcqyFb1nsIdty3/NmjDohOt3b8eFPwo6k7aMbrmHAZX3Pq+hk6P
         /XSnZz2lFmK42nRSy9Qzdiv11q0yGMSh8FTlUbWsvs+t899HV8WxNFxnUqE+ok9Bwg
         wtT97JZIhGROlV2oID6mivz0rKU8AV3ZskgVRiTY=
Date:   Tue, 4 Dec 2018 15:49:09 -0800
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
Subject: Re: [PATCH V2 4/7] Add S_VERITY and IS_VERITY()
Message-ID: <20181204234908.GE70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-5-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204095650.12562-5-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 04, 2018 at 03:26:47PM +0530, Chandan Rajendra wrote:
> Similar to S_ENCRYPTED/IS_ENCRYPTED(), this commit adds
> S_VERITY/IS_VERITY() to be able to check if a VFS inode has verity
> information associated with it.
> 
> Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> ---
>  include/linux/fs.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 389a35e028bf..de602d9f8d0e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1938,6 +1938,7 @@ struct super_operations {
>  #define S_DAX		0	/* Make all the DAX code disappear */
>  #endif
>  #define S_ENCRYPTED	16384	/* Encrypted file (using fs/crypto/) */
> +#define S_VERITY	32768	/* Verity file (using fs/verity/) */
>  
>  /*
>   * Note that nosuid etc flags are inode-specific: setting some file-system
> @@ -1978,6 +1979,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
>  #define IS_NOSEC(inode)		((inode)->i_flags & S_NOSEC)
>  #define IS_DAX(inode)		((inode)->i_flags & S_DAX)
>  #define IS_ENCRYPTED(inode)	((inode)->i_flags & S_ENCRYPTED)
> +#define IS_VERITY(inode)	((inode)->i_flags & S_VERITY)
>  
>  #define IS_WHITEOUT(inode)	(S_ISCHR(inode->i_mode) && \
>  				 (inode)->i_rdev == WHITEOUT_DEV)
> -- 
> 2.19.1
> 

Reviewed-by: Eric Biggers <ebiggers@google.com>
