Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0982A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 11:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfBKLu4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 06:50:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:58686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfBKLu4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Feb 2019 06:50:56 -0500
Received: from localhost (unknown [117.99.91.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B3D720844;
        Mon, 11 Feb 2019 11:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549885855;
        bh=GJutoL7ceYdvA1epM9oPd978hp2xog4CTJlNaDwg4PM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0dS0PqWyx+4bok7Gj7f7fcNc90/5ECBPN8K4fYMz6ZPAGLNAp6zf3mG1FKam4AJrM
         K+krCW2B09FeTIM7K2d8P1O2c6ip+xHsLndAjE30PHGWzsFWCqeypmlKd6MfWg4XyT
         nWer/X8Qe5eEjs97oDfpqRSNu64EaP/yObSY/+jU=
Date:   Mon, 11 Feb 2019 17:20:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        dmaengine@vger.kernel.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: driver-api: fix dmatest.rst warning
Message-ID: <20190211115047.GQ4296@vkoul-mobl>
References: <da8b9103-5203-13da-65c5-232233ab0bfb@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da8b9103-5203-13da-65c5-232233ab0bfb@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10-02-19, 22:26, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix markup warning: insert a blank line before the hint.
> 
> Documentation/driver-api/dmaengine/dmatest.rst:63: WARNING: Unexpected indentation.

Applied after adding dmaengine subsystem tag, thanks

> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dmaengine@vger.kernel.org
> ---
>  Documentation/driver-api/dmaengine/dmatest.rst |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- lnx-50-rc6.orig/Documentation/driver-api/dmaengine/dmatest.rst
> +++ lnx-50-rc6/Documentation/driver-api/dmaengine/dmatest.rst
> @@ -59,6 +59,7 @@ parameter, that specific channel is requ
>  is created with the existing parameters. This thread is set as pending
>  and will be executed once run is set to 1. Any parameters set after the thread
>  is created are not applied.
> +
>  .. hint::
>    available channel list could be extracted by running the following command::
>  
> 

-- 
~Vinod
