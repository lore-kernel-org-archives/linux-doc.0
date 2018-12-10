Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 37BB17D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 18:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbeLJSE0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 13:04:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:35228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727190AbeLJSE0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:04:26 -0500
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C9032081F;
        Mon, 10 Dec 2018 18:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544465065;
        bh=PjFozuZs8E2/QO4sLTOmGCQRx+TjZqd7Wb1IgFnrDXY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yLNq4oUwRqGPhKO96YDfhm2HI89Q18lC+oRr/vnQDGLPpXBJ8FUKcXHq5boTSByvM
         Dmyqc3ntDbhM0f8wbAIocfAzzeT9w/qOPJ+uJpDbzw3xtPnS02L7MrmpzVf5uA8Lyp
         KFg2OjM5feAeQ9ISB7KTWkc06pqcUU7KCPEvEytg=
Date:   Mon, 10 Dec 2018 10:04:22 -0800
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
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config
 option
Message-ID: <20181210180422.GC92174@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
 <20181204234320.GC70682@gmail.com>
 <2062340.ny9MuQaG0V@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2062340.ny9MuQaG0V@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 08, 2018 at 12:37:20PM +0530, Chandan Rajendra wrote:
> On Wednesday, December 5, 2018 5:13:21 AM IST Eric Biggers wrote:
> > Hi Chandan,
> > 
> > On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> > > In order to have a common code base for fscrypt "post read" processing
> > > for all filesystems which support encryption, this commit removes
> > > filesystem specific build config option (e.g. CONFIG_EXT4_FS_ENCRYPTION)
> > > and replaces it with a build option (i.e. CONFIG_FS_ENCRYPTION) whose
> > > value affects all the filesystems making use of fscrypt.
> > > 
> > > Signed-off-by: Chandan Rajendra <chandan@linux.vnet.ibm.com>
> > [...]
> > > -config F2FS_FS_ENCRYPTION
> > > -	bool "F2FS Encryption"
> > > -	depends on F2FS_FS
> > > -	depends on F2FS_FS_XATTR
> > > -	select FS_ENCRYPTION
> > > -	help
> > > -	  Enable encryption of f2fs files and directories.  This
> > > -	  feature is similar to ecryptfs, but it is more memory
> > > -	  efficient since it avoids caching the encrypted and
> > > -	  decrypted pages in the page cache.
> > > -
> > [...]
> > > -config UBIFS_FS_ENCRYPTION
> > > -	bool "UBIFS Encryption"
> > > -	depends on UBIFS_FS && UBIFS_FS_XATTR && BLOCK
> > > -	select FS_ENCRYPTION
> > > -	default n
> > > -	help
> > > -	  Enable encryption of UBIFS files and directories. This
> > > -	  feature is similar to ecryptfs, but it is more memory
> > > -	  efficient since it avoids caching the encrypted and
> > > -	  decrypted pages in the page cache.
> > 
> > Will it cause problems that now f2fs encryption can be "enabled" without
> > F2FS_FS_XATTR, and ubifs encryption without UBIFS_FS_XATTR && BLOCK?
> > 
> > Otherwise I think this patch looks fine.  I'm a bit concerned about the bloat
> > from making FS_ENCRYPTION non-modular, but given that it will make sharing I/O
> > code much easier, it's probably worthwhile.
> > 
> > It would help to strip down the dependencies of FS_ENCRYPTION to just the stuff
> > needed for just AES-256-XTS and AES-256-CTS.  I already sent out a patch a
> > couple months ago (https://patchwork.kernel.org/patch/10589319/) to remove
> > CONFIG_CTR which isn't used at all; I'll remind Ted to apply that.  But we could
> > also drop CONFIG_SHA256, which is only needed for AES-128-CBC contents
> > encryption.  If we do that, it should be a separate patch, though.
> 
> Hi Eric,
> 
> fscrypt_valid_enc_modes() allows FS_ENCRYPTION_MODE_AES_128_CBC to be used for
> encryption of file's contents. This is consistent with what you had mentioned
> above.
> 
> static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
>                                            u32 filenames_mode)
> {
>         if (contents_mode == FS_ENCRYPTION_MODE_AES_128_CBC &&
>             filenames_mode == FS_ENCRYPTION_MODE_AES_128_CTS)
>                 return true;
> 
>         if (contents_mode == FS_ENCRYPTION_MODE_AES_256_XTS &&
>             filenames_mode == FS_ENCRYPTION_MODE_AES_256_CTS)
>                 return true;
> 
>         return false;
> }
> 
> Hence FS_ENCRYPTION does need to have AES-128-CBC and by extension SHA256 code
> compiled in right? 
> 

No those algorithms don't have to be compiled in if userspace doesn't use the
(FS_ENCRYPTION_MODE_AES_128_CBC, FS_ENCRYPTION_MODE_AES_128_CTS) pair, because
the algorithms are allocated dynamically on-demand through the crypto API.

- Eric
