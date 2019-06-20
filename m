Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 886FD7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 15:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFTPVJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 11:21:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54990 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfFTPVJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jun 2019 11:21:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jLiwowGPx2AxLrT5BEMIvyKo94LZKXWSx+kjNgEU7FQ=; b=Iqp9ukQmjIkoj0PfBW5kcLvQk
        CL8chLM3cSJoUamANe0BSsYlUlLoC4vmtXmaXVLxSdWJCIw5wBbfR0MMBL/aGRo69WhFkAKDQ3RhY
        5XAgg3zwKHD/WLBpWr26Z2h7ZyFRQKwX+Vw+OPW936Nd+DFPwegV/5/y+Sl94LVD8/NMKLisJsQR3
        FbymWHt0rQiIhVLhysVxyCEEOOOFEKDui4EOcR6kNDz0ZIdWLjH3yZNiMHRoJNWBhmH25aZ5DgOCv
        QOwb0Ho3fscEExIWYjJoJmQWOkREKjz1CA+4tybuLguUfp2qx24MkzeoE/Qk7khAkWNOLfQ0WO8Sn
        42UvW3y9g==;
Received: from [177.97.20.138] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hdys2-0000E5-HC; Thu, 20 Jun 2019 15:21:02 +0000
Date:   Thu, 20 Jun 2019 12:20:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] scripts/sphinx-pre-install: fix out-of-tree build
Message-ID: <20190620122058.195ece1a@coco.lan>
In-Reply-To: <1561034637-12902-1-git-send-email-rppt@linux.ibm.com>
References: <1561034637-12902-1-git-send-email-rppt@linux.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 20 Jun 2019 15:43:57 +0300
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
> ---
>  scripts/sphinx-pre-install | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
> index 0b44d51..f710bbd 100755
> --- a/scripts/sphinx-pre-install
> +++ b/scripts/sphinx-pre-install
> @@ -5,8 +5,9 @@ use strict;
>  # Copyright (c) 2017-2019 Mauro Carvalho Chehab <mchehab@kernel.org>
>  #
>  
> -my $conf = "Documentation/conf.py";
> -my $requirement_file = "Documentation/sphinx/requirements.txt";
> +my $prefix = "$ENV{'srctree'}/";

looks OK when called from Makefile, but if someone runs the script
directly, it will fail. Better to code it as:

my $prefix = ".";
$prefix = "$ENV{'srctree'}/" if ($ENV{'srctree'});

> +my $conf = $prefix . "Documentation/conf.py";
> +my $requirement_file = $prefix . "Documentation/sphinx/requirements.txt";
>  my $virtenv_prefix = "sphinx_";
>  
>  #



Thanks,
Mauro
