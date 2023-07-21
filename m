Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18068EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 21 Jul 2023 05:24:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjGUFYq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Jul 2023 01:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjGUFYp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jul 2023 01:24:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02446B4;
        Thu, 20 Jul 2023 22:24:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BA7561083;
        Fri, 21 Jul 2023 05:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5010BC433C8;
        Fri, 21 Jul 2023 05:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689917083;
        bh=uP1GA5LBzxRoakiLor42MSUvmlqDpFH4ESIV2TvRqCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lq3Duzd2fRaNRhbeUDc8UBA5W9RVp9qjauw+jXEO1Ka5jdmuo9hM8OBSiQaUTGpwo
         6pOYwJckjq3Bvb8suy5j9tvrx+BpCzj9x6IPr6iyjlBj7wUp0mzdc0uCdgTZIu6Sty
         K5jf7ORuWEuEL9R4cik04yOvVr+0xmXit1TyxUgA=
Date:   Fri, 21 Jul 2023 07:24:41 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Easwar Hariharan <eahariha@linux.microsoft.com>
Cc:     stable@vger.kernel.org, easwar.hariharan@microsoft.com,
        catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
        robin.murphy@arm.com, joro@8bytes.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 5.15 0/4] ARM64 errata for stable kernel 5.15 and above
Message-ID: <2023072113-charm-manual-de9e@gregkh>
References: <1689895414-17425-1-git-send-email-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689895414-17425-1-git-send-email-eahariha@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 04:23:30PM -0700, Easwar Hariharan wrote:
> From: Easwar Hariharan <easwar.hariharan@microsoft.com>
> 
> This series works around a few ARM64 errata. Please pick these up for
> v6.1 and v6.4 as well.

The first 3 patches here are all in 6.1.y and 6.4.y, so how can they
also be added there?

thanks,

greg k-h
