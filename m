Return-Path: <SRS0=BR+k=EI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE9CC00A89
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 17:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC38421D91
	for <linux-doc@archiver.kernel.org>; Mon,  2 Nov 2020 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604338069;
	bh=Hs0TE/m5HmzsI6Nthw5SOQ1gCx61jcc7T8YTmy9qrWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=HTZDlexstEc/J4xmHe0oNpB6m9cCHtYSdAd7nk0W/PUtHxPpCOouQTcrJ0xa+AxYF
	 d4QjfK3AytqQYTtjM8Bi2WIhCtIU9rz1lyzUcP8qSedgAdTSaxgT7zZrIvptr73FcE
	 mIRNUGxMtxjCmFiMqLJ+t383tqARr+2flTZGre2U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgKBR1s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 12:27:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:46480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727288AbgKBR1s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Nov 2020 12:27:48 -0500
Received: from coco.lan (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 774382225E;
        Mon,  2 Nov 2020 17:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604338068;
        bh=Hs0TE/m5HmzsI6Nthw5SOQ1gCx61jcc7T8YTmy9qrWI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P1h7S18uykcFGTKKb8/NvRoCporawkXfnZGgvho1GP+cE1pT6VmXxvLAQHF7LE0yd
         sT95aFyvBoPNMotChIuel2cHuo+3wR+M0g8WpS4D6h5YHCtMji7xsQhADj6q8jFVDl
         i3f+uu4cdnLbMhA7HfOp+J46VKI7AWVoXGvKNGWQ=
Date:   Mon, 2 Nov 2020 18:27:43 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] scripts: kernel-doc: Restore anonymous enum parsing
Message-ID: <20201102182743.77b4c8df@coco.lan>
In-Reply-To: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
References: <20201102170637.36138-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon,  2 Nov 2020 19:06:37 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> The commit d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> broke anonymous enum parsing. Restore it by relying on members rather than
> its name.
> 
> Fixes: d38c8cfb0571 ("scripts: kernel-doc: add support for typedef enum")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch looks ok to me. Do you have an example about using it for
anonymous enum?

> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index f699cf05d409..9b6ddeb097e9 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1390,7 +1390,7 @@ sub dump_enum($$) {
>  	$members = $2;
>      }
>  
> -    if ($declaration_name) {
> +    if ($members) {
>  	my %_members;
>  
>  	$members =~ s/\s+$//;



Thanks,
Mauro
