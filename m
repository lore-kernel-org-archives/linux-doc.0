Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F333AC43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C38B521D43
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgIPSSq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgIPSSM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 14:18:12 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588DEC06174A;
        Wed, 16 Sep 2020 11:18:12 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B91192E5;
        Wed, 16 Sep 2020 18:18:11 +0000 (UTC)
Date:   Wed, 16 Sep 2020 12:18:10 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: stable-ABI: Document /sys/kernel/notes
Message-ID: <20200916121810.06279a5a@lwn.net>
In-Reply-To: <20200909063752.931283-1-swboyd@chromium.org>
References: <20200909063752.931283-1-swboyd@chromium.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  8 Sep 2020 23:37:52 -0700
Stephen Boyd <swboyd@chromium.org> wrote:

> Document the notes file in sysfs as the running vmlinux's .note section
> in binary format. Hopefully this helps someone like me realize the
> kernel exposes the note section in sysfs in the future. Take the date
> from when the file was introduced. It's been a while so presumably this
> is stable and not testing material.
> 
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  Documentation/ABI/stable/sysfs-kernel-notes | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 Documentation/ABI/stable/sysfs-kernel-notes
> 
> diff --git a/Documentation/ABI/stable/sysfs-kernel-notes b/Documentation/ABI/stable/sysfs-kernel-notes
> new file mode 100644
> index 000000000000..2c76ee9e67f7
> --- /dev/null
> +++ b/Documentation/ABI/stable/sysfs-kernel-notes
> @@ -0,0 +1,5 @@
> +What:		/sys/kernel/notes
> +Date:		July 2009
> +Contact:	<linux-kernel@vger.kernel.org>
> +Description:	The /sys/kernel/notes file contains the binary representation
> +		of the running vmlinux's .notes section.

Applied, thanks.

jon
