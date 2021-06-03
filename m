Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121CFC47098
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 06:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE525613E6
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 06:34:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbhFCGgR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Jun 2021 02:36:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCGgR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jun 2021 02:36:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B359161263;
        Thu,  3 Jun 2021 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622702073;
        bh=xOFWuH0MVFFLTaHz3Tuu8WFq+g8rE9NbEZzHqo0poEw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a6etlp4/GacmX1t7VgfbO+hR9XPvSdWPtJe6mt/uLvN54oHu5wEgHb6y1Mg990ezR
         KKhNynChCzNefJtgdgCJc8k+7ha1uI+HssvdpRjLLt16x3LXmz0lxqc4K97myy1kGO
         x1DIZckE0YJGSDeNbZdWI/W/nFqc66cEGU816crwqMkzKhjTnoZh4rRXqpTTWUEeFy
         KAwk0/9Tu1GzdtsL4c0mgj3SCffpwZBSL8Rrane7mk+Las41ouKPaa0opt94YbCxdX
         ynX+35j0u0BY/24mtG5bkDvuThet3IXPSAkonCtCtVy0+Q0H6IdZVLBHB4VyQltdQP
         4hRTOI5WrfaBQ==
Date:   Thu, 3 Jun 2021 08:34:28 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] documentation-file-ref-check: Make git check work for
 multiple working directories
Message-ID: <20210603083428.1b205131@coco.lan>
In-Reply-To: <20210603012806.331132-1-robh@kernel.org>
References: <20210603012806.331132-1-robh@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed,  2 Jun 2021 20:28:06 -0500
Rob Herring <robh@kernel.org> escreveu:

> With multiple git working directories, '.git' may also be a text file
> linking to the actual git tree instead of a directory.

Good catch! Never tested inside a git worktree, as I use a separate git
for docs patches due to a different [format] settings (due to a
different c/c list).

> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  scripts/documentation-file-ref-check | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/documentation-file-ref-check b/scripts/documentation-file-ref-check
> index c71832b2312b..7187ea5e5149 100755
> --- a/scripts/documentation-file-ref-check
> +++ b/scripts/documentation-file-ref-check
> @@ -24,7 +24,7 @@ my $help = 0;
>  my $fix = 0;
>  my $warn = 0;
>  
> -if (! -d ".git") {
> +if (! -e ".git") {
>  	printf "Warning: can't check if file exists, as this is not a git tree\n";
>  	exit 0;
>  }



Thanks,
Mauro
