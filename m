Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 21A317D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 00:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbeLEAFb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Dec 2018 19:05:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:48184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbeLEAFb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Dec 2018 19:05:31 -0500
Received: from gmail.com (unknown [104.132.1.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 596482082B;
        Wed,  5 Dec 2018 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1543968331;
        bh=Ge63kjaTdMeKXm8mIRUVW8ukpV3BLMEC/bUgh7XtWs0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cein/VqK8YziSnLrm/wvaqp3nkep11lbmo50JE1tWogqCFWkIfV0svdophM8ARSKl
         02yeYnVrSknbzalYJzF9yLg750wm6TLnwFFD149PAXZGI30aLocoh3+vgrHgfAQ489
         zX7jIgSh8hftQ/Lcsen8VR/GHoqC+yOC0q6NXzSs=
Date:   Tue, 4 Dec 2018 16:05:28 -0800
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
Message-ID: <20181205000528.GH70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 952ab97af325..6ba193c23f37 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -2,9 +2,8 @@
>  /*
>   * fscrypt.h: declarations for per-file encryption
>   *
> - * Filesystems that implement per-file encryption include this header
> - * file with the __FS_HAS_ENCRYPTION set according to whether that filesystem
> - * is being built with encryption support or not.
> + * Filesystems that implement per-file encryption must include this header
> + * file.
>   *
>   * Copyright (C) 2015, Google, Inc.
>   *

There's still a definition of __FS_HAS_ENCRYPTION in
fs/crypto/fscrypt_private.h.  This patch removes everything that checks
__FS_HAS_ENCRYPTION, so that should be removed too.

Thanks,

- Eric
