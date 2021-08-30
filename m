Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8823AC432BE
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 09:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 627BE60724
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 09:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbhH3Jtg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Aug 2021 05:49:36 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36538 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhH3Jtg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Aug 2021 05:49:36 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id C6C921FDE9;
        Mon, 30 Aug 2021 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1630316921;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kbOCtpRxV903K22pSGKiFcbfnt9pJACvwTxI1LC3mzU=;
        b=XSc3OdevWyx3UEMUcaoZ9chiYJ6iGMi7/r6SPLpeeinNDlgS4NqW5T81W/ggSblqiYEbGM
        cf/t0A6ZAbWCanNUlXKAWgj7LMqa+N7UVyueND7n5jhZhTKiBQKl070GotTOPboAWdQW/7
        YTXs8zasxEY+BTh+ALbfeKFJzC7c+r0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1630316921;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kbOCtpRxV903K22pSGKiFcbfnt9pJACvwTxI1LC3mzU=;
        b=4Gzdc4sFlaEXg2BU7jnSEOsW2h3QdJ5jbrFVqDONNyMMYtbHdGTcVVmB/3u6vpiMZ8Hx0o
        +Ks3tenm9bAN3XCA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
        by relay2.suse.de (Postfix) with ESMTP id 928DEA3BA1;
        Mon, 30 Aug 2021 09:48:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 34EF5DA733; Mon, 30 Aug 2021 11:45:51 +0200 (CEST)
Date:   Mon, 30 Aug 2021 11:45:51 +0200
From:   David Sterba <dsterba@suse.cz>
To:     kernel test robot <lkp@intel.com>
Cc:     Naohiro Aota <naohiro.aota@wdc.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        David Sterba <dsterba@suse.com>, linux-doc@vger.kernel.org
Subject: Re: [kdave-btrfs-devel:misc-next 147/154] fs/btrfs/zoned.c:1697:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <20210830094550.GA3379@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, kernel test robot <lkp@intel.com>,
        Naohiro Aota <naohiro.aota@wdc.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        David Sterba <dsterba@suse.com>, linux-doc@vger.kernel.org
References: <202108280738.xrFAzuMu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202108280738.xrFAzuMu-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 28, 2021 at 07:10:47AM +0800, kernel test robot wrote:
> tree:   https://github.com/kdave/btrfs-devel.git misc-next
> head:   18f0c5bda0dd67dedb8df3d7faf856dffa8f78d3
> commit: 770a7b4f5bd01ee953b538064068e814285df79b [147/154] btrfs: zoned: implement active zone tracking
> config: x86_64-randconfig-a005-20210827 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 1076082a0d97bd5c16a25ee7cf3dbb6ee4b5a9fe)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/kdave/btrfs-devel/commit/770a7b4f5bd01ee953b538064068e814285df79b
>         git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-devel.git
>         git fetch --no-tags kdave-btrfs-devel misc-next
>         git checkout 770a7b4f5bd01ee953b538064068e814285df79b
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/btrfs/zoned.c:1697: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Activate block group and underlying device zones
> 
> 
> vim +1697 fs/btrfs/zoned.c
> 
>   1695	
>   1696	/**
> > 1697	 * Activate block group and underlying device zones

This is from my edit, I'm dropping the function name because it's just a
few lines below so it does not bring much value and only we want the
kernel doc style to verify the parameters and keep the comment human
readable.  That the kdoc warns about the missing function name is some
recent addition.
