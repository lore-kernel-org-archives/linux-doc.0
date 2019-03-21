Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E96BE7D099
	for <lwn-linux-doc@archive.lwn.net>; Thu, 21 Mar 2019 13:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbfCUNes convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 21 Mar 2019 09:34:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:55495 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728296AbfCUNes (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Mar 2019 09:34:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Mar 2019 06:34:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,252,1549958400"; 
   d="scan'208";a="157046882"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.172])
  by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2019 06:34:46 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Tom Levy <tomlevy93@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Trivial Patch Monkey <trivial@kernel.org>,
        Tom Levy <tomlevy93@gmail.com>
Subject: Re: [PATCH] docs: remove spaces from shell variable assignment
In-Reply-To: <20190321013756.13028-1-tomlevy93@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190321013756.13028-1-tomlevy93@gmail.com>
Date:   Thu, 21 Mar 2019 15:36:30 +0200
Message-ID: <87imwce4dd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Mar 2019, Tom Levy <tomlevy93@gmail.com> wrote:
> The instructions for generating patches are given as shell commands
> with variables as placeholders. They use the syntax "SRCTREE= linux",
> which is wrong for the Bourne shell family (it runs the command
> "linux" with the variable "SRCTREE" set to the empty string).
>
> Remove the spaces to avoid confusion. This breaks the pretty alignment
> but helps new contributors who try to run the commands as written.

The change looks fine.

Note that new contributors should *never* follow this section anyway. In
fact, I think *nobody* should follow this section...

BR,
Jani.


>
> Signed-off-by: Tom Levy <tomlevy93@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/process/submitting-patches.rst                    | 6 +++---
>  Documentation/translations/it_IT/process/submitting-patches.rst | 6 +++---
>  Documentation/translations/ja_JP/SubmittingPatches              | 6 +++---
>  Documentation/translations/zh_CN/SubmittingPatches              | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index be7d1829c3af..33098adc5381 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -60,8 +60,8 @@ not in any lower subdirectory.
>  
>  To create a patch for a single file, it is often sufficient to do::
>  
> -	SRCTREE= linux
> -	MYFILE=  drivers/net/mydriver.c
> +	SRCTREE=linux
> +	MYFILE=drivers/net/mydriver.c
>  
>  	cd $SRCTREE
>  	cp $MYFILE $MYFILE.orig
> @@ -73,7 +73,7 @@ To create a patch for multiple files, you should unpack a "vanilla",
>  or unmodified kernel source tree, and generate a ``diff`` against your
>  own source tree.  For example::
>  
> -	MYSRC= /devel/linux
> +	MYSRC=/devel/linux
>  
>  	tar xvfz linux-3.19.tar.gz
>  	mv linux-3.19 linux-3.19-vanilla
> diff --git a/Documentation/translations/it_IT/process/submitting-patches.rst b/Documentation/translations/it_IT/process/submitting-patches.rst
> index 2ab9c1401aa1..713fba075b9d 100644
> --- a/Documentation/translations/it_IT/process/submitting-patches.rst
> +++ b/Documentation/translations/it_IT/process/submitting-patches.rst
> @@ -67,8 +67,8 @@ sulla radice dei sorgenti del kernel, e non sulle sue sottocartelle.
>  
>  Per creare una patch per un singolo file, spesso è sufficiente fare::
>  
> -	SRCTREE= linux
> -	MYFILE=  drivers/net/mydriver.c
> +	SRCTREE=linux
> +	MYFILE=drivers/net/mydriver.c
>  
>  	cd $SRCTREE
>  	cp $MYFILE $MYFILE.orig
> @@ -80,7 +80,7 @@ Per creare una patch per molteplici file, dovreste spacchettare i sorgenti
>  "vergini", o comunque non modificati, e fare un ``diff`` coi vostri.
>  Per esempio::
>  
> -	MYSRC= /devel/linux
> +	MYSRC=/devel/linux
>  
>  	tar xvfz linux-3.19.tar.gz
>  	mv linux-3.19 linux-3.19-vanilla
> diff --git a/Documentation/translations/ja_JP/SubmittingPatches b/Documentation/translations/ja_JP/SubmittingPatches
> index 02139656463e..ad979c3c06a6 100644
> --- a/Documentation/translations/ja_JP/SubmittingPatches
> +++ b/Documentation/translations/ja_JP/SubmittingPatches
> @@ -58,8 +58,8 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>  1個のファイルについてのパッチを作成するためには、ほとんどの場合、
>  以下の作業を行えば十分です。
>  
> -	SRCTREE= linux-2.6
> -	MYFILE=  drivers/net/mydriver.c
> +	SRCTREE=linux-2.6
> +	MYFILE=drivers/net/mydriver.c
>  
>  	cd $SRCTREE
>  	cp $MYFILE $MYFILE.orig
> @@ -71,7 +71,7 @@ Linux カーネルに対する全ての変更は diff(1) コマンドによる
>  なわち変更を加えてない Linux カーネルを展開し、自分の Linux カーネル
>  ソースとの差分を生成しないといけません。例えば、
>  
> -	MYSRC= /devel/linux-2.6
> +	MYSRC=/devel/linux-2.6
>  
>  	tar xvfz linux-2.6.12.tar.gz
>  	mv linux-2.6.12 linux-2.6.12-vanilla
> diff --git a/Documentation/translations/zh_CN/SubmittingPatches b/Documentation/translations/zh_CN/SubmittingPatches
> index e9098da8f1a4..04d9a1f89b58 100644
> --- a/Documentation/translations/zh_CN/SubmittingPatches
> +++ b/Documentation/translations/zh_CN/SubmittingPatches
> @@ -51,8 +51,8 @@ Documentation/process/submitting-drivers.rst 。
>  何子目录。
>  为一个单独的文件创建补丁，一般来说这样做就够了：
>  
> -        SRCTREE= linux-2.6
> -        MYFILE=  drivers/net/mydriver.c
> +        SRCTREE=linux-2.6
> +        MYFILE=drivers/net/mydriver.c
>  
>          cd $SRCTREE
>          cp $MYFILE $MYFILE.orig
> @@ -63,7 +63,7 @@ Documentation/process/submitting-drivers.rst 。
>  为多个文件创建补丁，你可以解开一个没有修改过的内核源代码树，然后和你自
>  己的代码树之间做 diff 。例如：
>  
> -        MYSRC= /devel/linux-2.6
> +        MYSRC=/devel/linux-2.6
>  
>          tar xvfz linux-2.6.12.tar.gz
>          mv linux-2.6.12 linux-2.6.12-vanilla

-- 
Jani Nikula, Intel Open Source Graphics Center
