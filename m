Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F6A47D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Jun 2019 09:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfFXJdF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Jun 2019 05:33:05 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45870 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfFXJdF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jun 2019 05:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=FHhmLH1gkyg4EjQkTP5/C8Esd0xpLpA4PfSBtxjuzEc=; b=TbOktyRnOe/PM4kof98k9XerX
        TD/wSa+YmjHtR/o3oizTu8gj5xz07598p0I6sFB+i4ecg+ug/zcEtxQgnILC3tZP7K6jPgpYdmUp1
        E6p9rGNrLxmuJ5HzaCzsben65kZytHtlVnhFAhiCBBx+onhZYqZzIoU6LkqrOAG2bMes98nVBOQbS
        6l/vg7d1qp6zMvXS7/qGPr4KIoxKLv+CiBdRRzLbfQQievayyF8OJftScNgqRiCKtP+12RDrS4aNr
        1qgI15sa2luvMZfmW7tFx3xKK5XcRPdegJt7P9LnQkjoL+aiTDbEMkQC5V/E62TR5KhpYPIySvvjY
        GyQhvmoOA==;
Received: from [179.95.45.115] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfLLT-0002LU-A0; Mon, 24 Jun 2019 09:33:03 +0000
Date:   Mon, 24 Jun 2019 06:32:59 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] scripts/sphinx-pre-install: fix out-of-tree build
Message-ID: <20190624063259.6c9d992f@coco.lan>
In-Reply-To: <1561353907-19911-1-git-send-email-rppt@linux.ibm.com>
References: <1561353907-19911-1-git-send-email-rppt@linux.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 24 Jun 2019 08:25:07 +0300
Mike Rapoport <rppt@linux.ibm.com> escreveu:

> Build of htmldocs fails for out-of-tree builds:
> 
> $ make V=1 O=~/build/kernel/ htmldocs
> make -C /home/rppt/build/kernel -f /home/rppt/git/linux-docs/Makefile htmldocs
> make[1]: Entering directory '/home/rppt/build/kernel'
> make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=scripts/basic
> rm -f .tmp_quiet_recordmcount
> make -f /home/rppt/git/linux-docs/scripts/Makefile.build obj=Documentation htmldocs
> Can't open Documentation/conf.py at /home/rppt/git/linux-docs/scripts/sphinx-pre-install line 230.
> /home/rppt/git/linux-docs/Documentation/Makefile:80: recipe for target 'htmldocs' failed
> make[2]: *** [htmldocs] Error 2
> 
> The scripts/sphinx-pre-install is trying to open files in the current
> directory which is $KBUILD_OUTPUT rather than in $srctree.
> 
> Fix it.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
> v2: use "./" as default prefix as Mauro suggested
> 
>  scripts/sphinx-pre-install | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index 0b44d51..f230e65 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -5,8 +5,11 @@ use strict;
>  # Copyright (c) 2017-2019 Mauro Carvalho Chehab <mchehab@kernel.org>
>  #
>  
> -my $conf = "Documentation/conf.py";
> -my $requirement_file = "Documentation/sphinx/requirements.txt";
> +my $prefix = "./";
> +$prefix = "$ENV{'srctree'}/" if ($ENV{'srctree'});
> +
> +my $conf = $prefix . "Documentation/conf.py";
> +my $requirement_file = $prefix . "Documentation/sphinx/requirements.txt";
>  my $virtenv_prefix = "sphinx_";
>  
>  #



Thanks,
Mauro
