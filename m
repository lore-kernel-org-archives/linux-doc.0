Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 652BE7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Sep 2019 19:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfICT7z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Sep 2019 15:59:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:47222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725990AbfICT7y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Sep 2019 15:59:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEC9721881;
        Tue,  3 Sep 2019 19:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567540794;
        bh=ycljeCAmClp03XbUOdy8sNXQZo4K4izNNKh1URmNfAA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y25ZpP4GCaWHXKWfHDLO6cS1oIcawgesUtTdE7qUqydUzmp00gP6jomZv6pToQABL
         u6ARa1osIOZ9IVShYHq7Vu/Rd4giIcU1At5T5Th42Gm2UgkkTSsNQrxpKNxQAUmOdQ
         oYsYAxhJq8liFcPyDZAsUjvP6bBUaFy+Swq+yL6s=
Date:   Tue, 3 Sep 2019 21:59:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org,
        suzuki.poulose@arm.com, corbet@lwn.net
Subject: Re: [PATCH v2 09/11] coresight: etm4x: docs: Update ABI doc for
 sysfs features added.
Message-ID: <20190903195951.GA25008@kroah.com>
References: <20190829213321.4092-1-mike.leach@linaro.org>
 <20190829213321.4092-10-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829213321.4092-10-mike.leach@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 29, 2019 at 10:33:19PM +0100, Mike Leach wrote:
> Update document to include the new sysfs features added during this
> patchset.
> 
> Updated to reflect the new sysfs component nameing schema.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../testing/sysfs-bus-coresight-devices-etm4x | 183 +++++++++++-------
>  1 file changed, 115 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> index 36258bc1b473..112c50ae9986 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm4x
> @@ -1,4 +1,4 @@
> -What:		/sys/bus/coresight/devices/<memory_map>.etm/enable_source
> +What:		/sys/bus/coresight/devices/etm<N>/enable_source

You are renaming sysfs directories that have been around since:

>  Date:		April 2015

???

Really?

That's brave.

What tool did you just break?

greg k-h
