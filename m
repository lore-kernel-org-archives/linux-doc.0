Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D6947D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Feb 2019 12:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfBXMxW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Feb 2019 07:53:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:49528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbfBXMxW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 24 Feb 2019 07:53:22 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A5F320645;
        Sun, 24 Feb 2019 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551012801;
        bh=N0M6TB/yZ62POD0EvAwtrXjLSgdvzfPtDOuNxj8BP2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P9kt+j4MJM0fOGuQoIOWXoIJDwbxBdFI20OQmCICCVTNGvHiypNOvysGV3BNJ1kxj
         X8/WLV7KkOgYygdFA3sqqeOb8GPMxuhSg8W4NN7SS3r4e6QKJHgowEnFa45eff7HYl
         UrkLQs/siRiYcFXqFDyXneQLlFnZF08KRRWwExa4=
Date:   Sun, 24 Feb 2019 13:53:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zenghui Yu <zenghuiyu96@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Documentation/process/howto: Update for 4.x -> 5.x
 versioning
Message-ID: <20190224125318.GB10876@kroah.com>
References: <CAKcZhuWHU+udbAyL910JW8rhZsbpomz5TXs0z2FD4m5c5Sf8hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKcZhuWHU+udbAyL910JW8rhZsbpomz5TXs0z2FD4m5c5Sf8hw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 24, 2019 at 04:43:20PM +0800, Zenghui Yu wrote:
> As linux-5.0 is coming up soon, the howto.rst document can be
> updated for the new kernel version. Change all 4.x references
> to 5.x now.
> 
> Signed-off-by: Zenghui Yu <zenghuiyu96@gmail.com>
> ---
>  Documentation/process/howto.rst | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

I think Jon already sent a patch for this last week, you might want to
look in the archives.

thanks,

greg k-h
