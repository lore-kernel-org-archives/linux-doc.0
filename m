Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C35C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 13:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1567261210
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 13:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbhDCNEs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Apr 2021 09:04:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230343AbhDCNEs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 3 Apr 2021 09:04:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3354961003;
        Sat,  3 Apr 2021 13:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617455085;
        bh=aEvZ8An5fd9WWJ1+C/eoC5o1H8WT49ZOWyAaePYPi/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bUFSNb7Sb1L6WYQs9Is5USeCkk48rOdMkAkf/MPtnkVf1bLyCcaODEy7+oyzAW1Ph
         bWZxa9CqNstb8jwVVgwqodwnBtA4qGl4evXTd4zG0b05udogNvaMmWc4GO/w8CmuA8
         2aJN/FKbmMpOIAqQA/Z/QHb2xYpjMEVBTyO6IvLo=
Date:   Sat, 3 Apr 2021 15:04:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-model: Update the documentation for device
 class
Message-ID: <YGhn6u3GrWZyrXuI@kroah.com>
References: <20210403120050.4756-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210403120050.4756-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 03, 2021 at 05:30:50PM +0530, Manivannan Sadhasivam wrote:
> The current documentation about the device class is out of date such
> that it refers to non-existent APIs and structures. This commit updates
> them to the current device class APIs and structures, removes wordings
> that no longer valid while trying to keep the original content intact.

Thanks for working on this!

One thing that instantly jumped out at me:

> -Class drivers can export attributes using the DEVCLASS_ATTR macro that works
> -similarly to the DEVICE_ATTR macro for devices. For example, a definition
> +Class drivers can export attributes using the CLASS_ATTR_* macros that works
> +similarly to the DEVICE_ATTR_* macros for devices. For example, a definition
>  like this::
>  
> -  static DEVCLASS_ATTR(debug,0644,show_debug,store_debug);
> +  static CLASS_ATTR_RW(debug, 0644, show_debug, store_debug);

CLASS_ATTR_RW(debug);
is the correct way to write the above, what you added there will not
build.

But a meta-comment, should stuff like this go directly into the .c files
itself so that the documentation is created automatically?  the fact
that this lives so "far away" from the source ensures that it will
always be out of date.  I know other subsystems (graphics, v4l2) have
tied the documentation into their code files much better so I think the
build and markup infrastructure is there today to do this.

thanks,

greg k-h
