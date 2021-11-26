Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9100C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 16:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239821AbhKZQnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378651AbhKZQlq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 11:41:46 -0500
X-Greylist: delayed 449 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 26 Nov 2021 08:26:30 PST
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C9DAC0613B3
        for <linux-doc@vger.kernel.org>; Fri, 26 Nov 2021 08:26:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 526BD622E1;
        Fri, 26 Nov 2021 16:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F206C9305F;
        Fri, 26 Nov 2021 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637943417;
        bh=N15suIuxWgr1KyMACv0zVzLXpDxzRFxTfYvJFDF1ZIU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JqxCwj9gOUZDwUpQ24qGeTFrk5cj14f8cgJdRwAL/us15pH28Gljzu8jRJFXAk/mf
         yebVGUOxOpUWYwM+d7ScCChT/QpYfjoOm5XZSK+VK9w1xi6BO/aVKFUABJBO2mE0Jm
         kLI24DV98TxnsqXGOqw3VhKFTiDeY0jKoPew/rOA=
Date:   Fri, 26 Nov 2021 17:16:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     ira.weiny@intel.com
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-kernel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/auxiliary_bus: Clarify auxiliary_device
 creation
Message-ID: <YaEIdmRV2A1yclub@kroah.com>
References: <87k0hq2oxc.fsf@meer.lwn.net>
 <20211102225310.3677785-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102225310.3677785-1-ira.weiny@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 02, 2021 at 03:53:10PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> The documentation for creating an auxiliary device is a 3 step not a 2
> step process.  Specifically the requirements of setting the name, id,
> dev.release, and dev.parent fields was not clear as a precursor to the '2
> step' process documented.
> 
> Clarify by declaring this a 3 step process starting with setting the
> fields of struct auxiliary_device correctly.
> 
> Also add some sample code and tie the change into the rest of the
> documentation.
> 
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V1:
> 	From Jonathan
> 		Fix auxiliary spelling
> ---
>  Documentation/driver-api/auxiliary_bus.rst | 77 +++++++++++++++++-----
>  1 file changed, 59 insertions(+), 18 deletions(-)

Can you please resend the whole series, trying to just resend one patch
in the middle is horrible for our tools and to try to figure this out.

Would you like to have to unwind this?  Please make it simple for
maintainers to review and if ok, apply your changes.

thanks,

greg k-h
