Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF94C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  5 Nov 2022 14:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiKEOpY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Nov 2022 10:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiKEOpX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Nov 2022 10:45:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01D6F016;
        Sat,  5 Nov 2022 07:45:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6D06660B4C;
        Sat,  5 Nov 2022 14:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402D6C433D6;
        Sat,  5 Nov 2022 14:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667659521;
        bh=Uua9rMH8ov9+Gw+sFv2bzgzFPoAmAFSHy0HK4DaGsuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cwf0o+MI6eTvc8eEGGSkmY65qCb34GT2TnmxyNdEJrDRoJrtcJXox1JRT/o6Rfww/
         ihv2k3Gcf/CKm5GtqARip6tQXM5Rxgs1o1dgkaDxUI1RW8mc1EJu1djdEJTSzTyRJ+
         q5pgPo/zdF/9oveipcBqV7Zl0F1nWlRr+sIus+HBJJVmCCkeLq4gWupT3/ngcNDYjg
         tOdan45o0m+dscyG9p7Xv5rvFAelqr4xQZ/me8JGAgI0Nrr117QxS7UvGzCvNFnL6j
         wAZw4O9BdOo1snrqVsMvj/Gbp0f7JB8ZcTmsannVAJRwsbY8Z5KRYEtO9V3xe2e8/D
         G5zvdiPvM6OUw==
Date:   Sat, 5 Nov 2022 20:15:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: phy: Document typical order of API calls
Message-ID: <Y2Z2/Sz20QyZrek3@matsya>
References: <20221018175841.1906611-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018175841.1906611-1-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18-10-22, 13:58, Sean Anderson wrote:
> Document the typical order of API calls to used by new drivers and
> controllers. Many existing controllers follow this order, but some do
> not. This is especially true for controllers designed to work with one
> particular PHY driver, which may not need a call to (for example)
> phy_init.

Applied, thanks

-- 
~Vinod
