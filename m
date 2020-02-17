Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0FDC34022
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 20:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E53702072C
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 20:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tyhicks-com.20150623.gappssmtp.com header.i=@tyhicks-com.20150623.gappssmtp.com header.b="GwIgaR7Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbgBQUHk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 15:07:40 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38178 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbgBQUHk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 15:07:40 -0500
Received: by mail-qt1-f196.google.com with SMTP id i23so2752563qtr.5
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2020 12:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tyhicks-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WRwA/I2h7N76jJ29N/xHFETqMD8CrhcmkSDenSlSwPE=;
        b=GwIgaR7Z144hwANO37ACfKdY3X4Jfr+EmMHyMMrlZGEqnA8DLnAfUAYyTXpHjOsVpM
         LIe/nxFGGg3JkZ0SWkzZU0TCQGLEoXEk7gqL4h/ogwQaHQgiIensFgQ1MkbKyCSVxquM
         rl2JLjLH5ZfzEOx/bl2Hy6d6+Ndblf4OQrJawcSFvPidwhvWcG7IvUsvmFOe8AjJ6wgL
         rGbi2ftprZvXkLdQVaGWvhkVfHujx9e/tWa852n9W6+a0PhAVk1huB9cm92G4+ugt/ij
         swNgIeltU28qeebhIGSWklM76yWYg7uUS3ZEUDriCaZcnpv+z5neVgyH4xaJlvle2Qix
         OMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WRwA/I2h7N76jJ29N/xHFETqMD8CrhcmkSDenSlSwPE=;
        b=ora7L+5YD65eWFwSAa3d4P68O8tRuje1sVINS81N37j753R/2prUNilIJU7FrfUGXL
         Ba45BNmAAqVbFA+X4XkC/ogQo4kBojgrRcBYu4q7b/0HVV9Fp7asaeYlZIVXJU9D8lMq
         WzNpLzF6N+uEkMQDj7ArfocT1PhnmOfoEvyGFGJzQ2zkmjIj2YBU5uDAQaEBvr3KgcRw
         NPc4a45xE5ZTBQd1g411Zxu9K0yl1E8ba8rbW0boLUiXStvyDUT/2T5WEQYq+QDeav7r
         NeFdV/I2CdO9crK1+QpklA8fqsrO1SXjD8wXYl/W+uDM0sk79vut9vMie1s6/8QvhTUa
         h3OQ==
X-Gm-Message-State: APjAAAVNK9dF1ZM2vzOH6BMi07ETY/ntmpxsgw0ILd/S5sWuRN2nvsxp
        Q6GqpCGo+u3j4mvIVc36Y6y4RQ==
X-Google-Smtp-Source: APXvYqzCfnwZfo0KKey4CpVeLut5atSFfTJKjVjZ7Ss08JTsNn80ACeHv0BuWp1XUZ6gbh4Ku1WXmw==
X-Received: by 2002:ac8:6f5b:: with SMTP id n27mr13640761qtv.96.1581970057370;
        Mon, 17 Feb 2020 12:07:37 -0800 (PST)
Received: from elm ([184.169.45.4])
        by smtp.gmail.com with ESMTPSA id l10sm749766qke.93.2020.02.17.12.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 12:07:36 -0800 (PST)
Date:   Mon, 17 Feb 2020 14:07:21 -0600
From:   Tyler Hicks <code@tyhicks.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, ecryptfs@vger.kernel.org
Subject: Re: [PATCH 13/44] docs: filesystems: convert ecryptfs.txt to ReST
Message-ID: <20200217200721.GA277681@elm>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
 <6e13841ebd00c8d988027115c75c58821bb41a0c.1581955849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e13841ebd00c8d988027115c75c58821bb41a0c.1581955849.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2020-02-17 17:11:59, Mauro Carvalho Chehab wrote:
> - Add a SPDX header;
> - Add a document title;
> - use :field: markup;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add table markups;
> - Add it to filesystems/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Tyler Hicks <code@tyhicks.com>

This serves as a reminder that eCryptfs document is in serious need of
some updates. Thanks!

Tyler

> ---
>  .../{ecryptfs.txt => ecryptfs.rst}            | 44 ++++++++++++-------
>  Documentation/filesystems/index.rst           |  1 +
>  2 files changed, 28 insertions(+), 17 deletions(-)
>  rename Documentation/filesystems/{ecryptfs.txt => ecryptfs.rst} (70%)
> 
> diff --git a/Documentation/filesystems/ecryptfs.txt b/Documentation/filesystems/ecryptfs.rst
> similarity index 70%
> rename from Documentation/filesystems/ecryptfs.txt
> rename to Documentation/filesystems/ecryptfs.rst
> index 01d8a08351ac..7236172300ef 100644
> --- a/Documentation/filesystems/ecryptfs.txt
> +++ b/Documentation/filesystems/ecryptfs.rst
> @@ -1,14 +1,18 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================================================
>  eCryptfs: A stacked cryptographic filesystem for Linux
> +======================================================
>  
>  eCryptfs is free software. Please see the file COPYING for details.
>  For documentation, please see the files in the doc/ subdirectory.  For
>  building and installation instructions please see the INSTALL file.
>  
> -Maintainer: Phillip Hellewell
> -Lead developer: Michael A. Halcrow <mhalcrow@us.ibm.com>
> -Developers: Michael C. Thompson
> -            Kent Yoder
> -Web Site: http://ecryptfs.sf.net
> +:Maintainer: Phillip Hellewell
> +:Lead developer: Michael A. Halcrow <mhalcrow@us.ibm.com>
> +:Developers: Michael C. Thompson
> +             Kent Yoder
> +:Web Site: http://ecryptfs.sf.net
>  
>  This software is currently undergoing development. Make sure to
>  maintain a backup copy of any data you write into eCryptfs.
> @@ -19,13 +23,15 @@ SourceForge site:
>  http://sourceforge.net/projects/ecryptfs/
>  
>  Userspace requirements include:
> - - David Howells' userspace keyring headers and libraries (version
> -   1.0 or higher), obtainable from
> -   http://people.redhat.com/~dhowells/keyutils/
> - - Libgcrypt
>  
> +- David Howells' userspace keyring headers and libraries (version
> +  1.0 or higher), obtainable from
> +  http://people.redhat.com/~dhowells/keyutils/
> +- Libgcrypt
>  
> -NOTES
> +
> +Notes
> +=====
>  
>  In the beta/experimental releases of eCryptfs, when you upgrade
>  eCryptfs, you should copy the files to an unencrypted location and
> @@ -33,20 +39,21 @@ then copy the files back into the new eCryptfs mount to migrate the
>  files.
>  
>  
> -MOUNT-WIDE PASSPHRASE
> +Mount-wide Passphrase
> +=====================
>  
>  Create a new directory into which eCryptfs will write its encrypted
>  files (i.e., /root/crypt).  Then, create the mount point directory
> -(i.e., /mnt/crypt).  Now it's time to mount eCryptfs:
> +(i.e., /mnt/crypt).  Now it's time to mount eCryptfs::
>  
> -mount -t ecryptfs /root/crypt /mnt/crypt
> +    mount -t ecryptfs /root/crypt /mnt/crypt
>  
>  You should be prompted for a passphrase and a salt (the salt may be
>  blank).
>  
> -Try writing a new file:
> +Try writing a new file::
>  
> -echo "Hello, World" > /mnt/crypt/hello.txt
> +    echo "Hello, World" > /mnt/crypt/hello.txt
>  
>  The operation will complete.  Notice that there is a new file in
>  /root/crypt that is at least 12288 bytes in size (depending on your
> @@ -59,10 +66,13 @@ keyctl clear @u
>  Then umount /mnt/crypt and mount again per the instructions given
>  above.
>  
> -cat /mnt/crypt/hello.txt
> +::
>  
> +    cat /mnt/crypt/hello.txt
>  
> -NOTES
> +
> +Notes
> +=====
>  
>  eCryptfs version 0.1 should only be mounted on (1) empty directories
>  or (2) directories containing files only created by eCryptfs. If you
> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
> index c6885c7ef781..d6d69f1c9287 100644
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@ -59,6 +59,7 @@ Documentation for filesystem implementations.
>     cramfs
>     debugfs
>     dlmfs
> +   ecryptfs
>     fuse
>     overlayfs
>     virtiofs
> -- 
> 2.24.1
> 
