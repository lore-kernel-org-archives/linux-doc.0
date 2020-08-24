Return-Path: <SRS0=Idq9=CC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60831C433DF
	for <linux-doc@archiver.kernel.org>; Mon, 24 Aug 2020 22:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 447482078D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Aug 2020 22:06:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHXWGA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Aug 2020 18:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXWGA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Aug 2020 18:06:00 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFD3C061574
        for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2020 15:06:00 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 337EC2CB;
        Mon, 24 Aug 2020 22:06:00 +0000 (UTC)
Date:   Mon, 24 Aug 2020 16:05:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Theodore Dubois <tblodt@icloud.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] devices.txt: fix typo of "ubd" as "udb"
Message-ID: <20200824160559.2fcb089f@lwn.net>
In-Reply-To: <20200816233823.86316-1-tblodt@icloud.com>
References: <20200816233823.86316-1-tblodt@icloud.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 16 Aug 2020 16:38:23 -0700
Theodore Dubois <tblodt@icloud.com> wrote:

> Signed-off-by: Theodore Dubois <tblodt@icloud.com>
> ---
>  Documentation/admin-guide/devices.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> index 2a97aaec8b12..ee05cb38e696 100644
> --- a/Documentation/admin-guide/devices.txt
> +++ b/Documentation/admin-guide/devices.txt
> @@ -1661,7 +1661,7 @@
>  
>    98 block	User-mode virtual block device
>  		  0 = /dev/ubda		First user-mode block device
> -		 16 = /dev/udbb		Second user-mode block device
> +		 16 = /dev/ubdb		Second user-mode block device
>  		    ...

Applied, thanks.

jon
