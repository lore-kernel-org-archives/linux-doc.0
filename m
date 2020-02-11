Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567E3C352A3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 16:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C2EB20714
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581439694;
	bh=AwF6jLo2EIYhlBVRL0/X/wKZa+957aXEIFiWWCJ36T0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-ID:From;
	b=gS86/VY3e2EM2boZpRpiM0RQdHhqwR+m/Mdy1V0li0OPLn+0fPQOhHXMMs4UHZTnD
	 KYEi6lu5pkycdwYXR/la7uJs6TR/KW4A5kevHKsw6NLHRd62KyPQy51wNlHUr1t1ok
	 ZahiA8ccmp2CmIulPe/UEZ00gJ0qgUhROLEAkcOo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbgBKQsN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 11:48:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728188AbgBKQsN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Feb 2020 11:48:13 -0500
Received: from tleilax.poochiereds.net (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 791F720708;
        Tue, 11 Feb 2020 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581439693;
        bh=AwF6jLo2EIYhlBVRL0/X/wKZa+957aXEIFiWWCJ36T0=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=aFc7u8XA2ewXaoq3Wzt7womuGgewHsgdgW9sOfCw4nsBYpcVpaNH3/Bsl9M8HyhpL
         DKFypxM9RCeie6vWAKUhYwaKt3q13z7DE2o2bF3CQGi2ac2MZWtggJFhWnF3ROm9Px
         KzvpsBOG0bMYVkDIDD9SSP7avQKysAyqlsHimT4U=
Message-ID: <537a2c4a37f601fe402fa7b893061fd9f4270f56.camel@kernel.org>
Subject: Re: [RFC PATCH] ceph: fix description of some mount options
From:   Jeff Layton <jlayton@kernel.org>
To:     xiubli@redhat.com, idryomov@gmail.com
Cc:     sage@redhat.com, zyan@redhat.com, pdonnell@redhat.com,
        ceph-devel@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
Date:   Tue, 11 Feb 2020 11:48:11 -0500
In-Reply-To: <20200211153120.21369-1-xiubli@redhat.com>
References: <20200211153120.21369-1-xiubli@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-02-11 at 10:31 -0500, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> Based on the latest code, the default value for wsize/rsize is
> 64MB and the default value for the mount_timeout is 60 seconds.
> 
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
> 
> Checked the history of the code, I am a little confused about the
> default values for wsize/rsize, there never been 16MB as the default,
> and for the mount_timeout, never seen 30 as default.
> 
> So did I miss something important about this ?
> 

It looks like the default rsize/wsize were 16M prior to 94e6992bb560b.
It then went to 32 and then 64 a little while afterward. I don't see
where the mount_timeout was ever 30s though.

Merged into testing branch since this seems obviously correct.

> 
>  Documentation/filesystems/ceph.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/ceph.txt b/Documentation/filesystems/ceph.txt
> index b19b6a03f91c..92ffc9b3b018 100644
> --- a/Documentation/filesystems/ceph.txt
> +++ b/Documentation/filesystems/ceph.txt
> @@ -103,17 +103,17 @@ Mount Options
>  	address its connection to the monitor originates from.
>  
>    wsize=X
> -	Specify the maximum write size in bytes.  Default: 16 MB.
> +	Specify the maximum write size in bytes.  Default: 64 MB.
>  
>    rsize=X
> -	Specify the maximum read size in bytes.  Default: 16 MB.
> +	Specify the maximum read size in bytes.  Default: 64 MB.
>  
>    rasize=X
>  	Specify the maximum readahead size in bytes.  Default: 8 MB.
>  
>    mount_timeout=X
>  	Specify the timeout value for mount (in seconds), in the case
> -	of a non-responsive Ceph file system.  The default is 30
> +	of a non-responsive Ceph file system.  The default is 60
>  	seconds.
>  
>    caps_max=X

-- 
Jeff Layton <jlayton@kernel.org>

