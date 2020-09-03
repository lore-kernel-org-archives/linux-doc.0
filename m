Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC182C433E9
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94EED20775
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgICPuK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 11:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgICPuK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Sep 2020 11:50:10 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB71DC061244
        for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2020 08:50:09 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BA3967DA;
        Thu,  3 Sep 2020 15:50:06 +0000 (UTC)
Date:   Thu, 3 Sep 2020 09:50:05 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] Documentation/maintainer: rehome sign-off process
Message-ID: <20200903095005.7616a146@lwn.net>
In-Reply-To: <20200902155759.55895-4-sir@cmpwn.com>
References: <20200902155759.55895-1-sir@cmpwn.com>
        <20200902155759.55895-4-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Sep 2020 11:57:58 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> The repeated sign-offs necessary when a subsystem maintainer modifies an
> incoming patch has been moved from submitting-patches.rst to
> Documentation/maintainer, since the affairs of a subsystem maintainer
> are not especially relevant to someone reading a guide for how to submit
> their first patch.

So this is generally what I wanted, but...

> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
>  Documentation/maintainer/index.rst            |  1 +
>  .../maintainer/modifying-patches.rst          | 50 +++++++++++++++++++
>  Documentation/process/submitting-patches.rst  | 46 -----------------
>  3 files changed, 51 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/maintainer/modifying-patches.rst
> 
> diff --git a/Documentation/maintainer/index.rst b/Documentation/maintainer/index.rst
> index d904e74e1159..f0a60435b124 100644
> --- a/Documentation/maintainer/index.rst
> +++ b/Documentation/maintainer/index.rst
> @@ -13,4 +13,5 @@ additions to this manual.
>     rebasing-and-merging
>     pull-requests
>     maintainer-entry-profile
> +   modifying-patches
>  
> diff --git a/Documentation/maintainer/modifying-patches.rst b/Documentation/maintainer/modifying-patches.rst
> new file mode 100644
> index 000000000000..d7c3f557bf6e
> --- /dev/null
> +++ b/Documentation/maintainer/modifying-patches.rst
> @@ -0,0 +1,50 @@
> +.. _modifyingpatches:
> +
> +Modifying Patches
> +=================
> +
> +If you are a subsystem or branch maintainer, sometimes you need to slightly
> +modify patches you receive in order to merge them, because the code is not
> +exactly the same in your tree and the submitters'. If you stick strictly to
> +rule (c), you should ask the submitter to rediff, but this is a totally

"rule (c)" has not context here; readers won't know what is being talked
about.  At a minimum, it should be "rule (c) of the developers certificate
of origin".

Also, "submitter's", might as well fix it while you're at it.

Thanks,

jon
