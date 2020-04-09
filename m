Return-Path: <SRS0=w6yw=5Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC664C2BB86
	for <linux-doc@archiver.kernel.org>; Thu,  9 Apr 2020 13:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA41120A8B
	for <linux-doc@archiver.kernel.org>; Thu,  9 Apr 2020 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586439995;
	bh=DouuFTChj8F6MMN7DQu4fFEfbZeGGKdPEdfcp6+GHo8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:List-ID:
	 From;
	b=QYXajLN6HDd+d4ujnEqyiAQ4dACpNIBRSb4Vv9eA/oz7TLarjT8oX78dVu3d7tguL
	 Gar7cMjbeMFfQn0J6oVbj8z1SPC8Re2RsQcdzV4A5eDrq8GeKM81+QbiH9/lmFhILD
	 D5Qr2a5JXsg9yPa3FrnedpRH+x8D6GNBS+YuRFJs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgDINqe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Apr 2020 09:46:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgDINqe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 9 Apr 2020 09:46:34 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5505F2083E;
        Thu,  9 Apr 2020 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586439994;
        bh=DouuFTChj8F6MMN7DQu4fFEfbZeGGKdPEdfcp6+GHo8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=geQkM2o5YlFrewdfKdPl3e+GRXGxT4tdw6bqWcs5T5mB4ikq9dyFMtNKDDN1tp60D
         EVkV3azy29sW/ybENhsQQTmXHDXOFRKRfEtTCtA85pWnbEgv9+W0gkC8P/A5SDv1qw
         SwtNoZQIHniapzwz/6q/nlU8aWCP5m+nd9kJOb6Q=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 2DC0935208E2; Thu,  9 Apr 2020 06:46:34 -0700 (PDT)
Date:   Thu, 9 Apr 2020 06:46:34 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Wei Yang <richard.weiyang@gmail.com>
Cc:     rcu@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/rcu: fix a typo in RTFP
Message-ID: <20200409134634.GL17661@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200409132437.11531-1-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409132437.11531-1-richard.weiyang@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 09, 2020 at 01:24:37PM +0000, Wei Yang wrote:
> If I am correct, this character should be 'u'.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

Nice!!!  ;-)

This is a play on words between the word you are thinking of and the
old UNIX "fsck" (filesystem check) utility.  It stays, but rest assured
that you did get point!

							Thanx, Paul

> ---
>  Documentation/RCU/RTFP.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
> index 9bccf16736f7..261eeb501ba5 100644
> --- a/Documentation/RCU/RTFP.txt
> +++ b/Documentation/RCU/RTFP.txt
> @@ -1,4 +1,4 @@
> -Read the Fscking Papers!
> +Read the Fucking Papers!
>  
>  
>  This document describes RCU-related publications, and is followed by
> -- 
> 2.23.0
> 
