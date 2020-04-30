Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C86C47257
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 20:51:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8EC2208C3
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 20:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgD3Uvt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 16:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726654AbgD3Uvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 16:51:49 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E9BC035494
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 13:51:49 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 865192C4;
        Thu, 30 Apr 2020 20:51:48 +0000 (UTC)
Date:   Thu, 30 Apr 2020 14:51:47 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [Patch] [Docs] Convert HTTP links to HTTPS
Message-ID: <20200430145147.28be9d84@lwn.net>
In-Reply-To: <e87ffce7-d775-5f7c-b86c-7854d90bd937@al2klimov.de>
References: <e87ffce7-d775-5f7c-b86c-7854d90bd937@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 Apr 2020 18:54:43 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> first of all please don't blame if I've chosen the recipients (you) not 
> 100% correctly. I *did* run
> 
> git diff $(git merge-base master HEAD)..HEAD |\
> perl scripts/get_maintainer.pl
> 
> but it output obviously IMAO too many recipients for the following 
> patches. (Please read on.)
> 
> Also please don't hit the roof because I didn't include all these (699!) 
> commits as attachments, but just provide a Git remote and a branch:
> 
> https://github.com/Al2Klimov/linux.git
> 
> feature/https-links
> 
> Head commit: 879e8d83fbcc623a702e4ae6531e3ff7f3671716 (just to be sure)
> 
> I just noticed that Torvalds even (implicitly?) merges GitHub PRs 
> nowadays, so what?

He won't pull from GitHub in the absence of a maintainer signature that he
recognizes.

Anyway, fixing these URLs seems like worthwhile work, but there is no way
that I can pull this patch series.  Let's just say that the response to 
pushing it into linux-next would make me very glad that social distancing
is in effect.

If you want to get this work merged, you're going to have to take a
different approach.  I see a couple of options:

 - Split the patches apart by subsystem, do what you can to reduce their
   number (combine all changes to a set of related files into one patch,
   for example), and submit the relevant patches to each subsystem
   maintainer.  I will take patches for files under Documentation/ with
   this kind of change, for example.  I can guarantee that some
   maintainers will be more welcoming of this work than others, but many
   will probably accept it.

 - Take your series directly to Linus and see if he is willing to merge it
   as an "end of the merge window" item.  My feeling is that your chances
   for success would be quite low, but I've been wrong before.

Thanks,

jon
