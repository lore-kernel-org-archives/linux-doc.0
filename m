Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8164AC6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 23:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjCOXUB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 19:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjCOXUA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 19:20:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD864A56AC;
        Wed, 15 Mar 2023 16:19:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D44861EA7;
        Wed, 15 Mar 2023 23:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AA5C433D2;
        Wed, 15 Mar 2023 23:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678922382;
        bh=iBn2ToOGcRBn7Fdr4Eqr1JzRC01L+yWVdW7VDFnaLfA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=b0nwW5zdorbckFYqaRNt3hNVb68U6d5v+kgaND9zXHXpG8/ZMEy1pes4aIXNPZsY5
         8oVTeoy1OS5J12XSvau8S6fMzVlwM2j9z3lV5PclPZNk+n+Ky30duhCFxdAJeUOEJO
         wRa2HwV67ukYhdfAuOfGqUU36cQXfJS90m+8wEyDWTJyDuQuKYbTA2c/P0jdUu+PCS
         BXE8S1FXtLklFm6dKnSco4SsMoK1YPn7V/ByidZ+QUcDO1CAlZE74VqKDmkYCYwbiC
         dXx/hG4sYX3WTmE1lMegqpKFJLdktXBA2m1888Rae5rMKXJAabNbhwp2ia9/gn0AgF
         MIkXYB8ONYOYQ==
Date:   Wed, 15 Mar 2023 16:19:41 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Tony Nguyen <anthony.l.nguyen@intel.com>
Cc:     <davem@davemloft.net>, <netdev@vger.kernel.org>,
        <edumazet@google.com>, <pabeni@redhat.com>,
        <jesse.brandeburg@intel.com>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230315161941.477c50ef@kernel.org>
In-Reply-To: <20230315161706.2b4b83a9@kernel.org>
References: <20230315223044.471002-1-kuba@kernel.org>
        <e7640f5c-654c-d195-23de-f0ca476242f1@intel.com>
        <20230315161706.2b4b83a9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Mar 2023 16:17:06 -0700 Jakub Kicinski wrote:
> On Wed, 15 Mar 2023 16:12:42 -0700 Tony Nguyen wrote:
> > >   .../device_drivers/ethernet/intel/e100.rst    |   3 +-
> > >   .../device_drivers/ethernet/intel/i40e.rst    |   4 +-
> > >   .../device_drivers/ethernet/intel/ixgb.rst    |   4 +-  
> > 
> > ice has an entry as well; we recently updated the (more?) ancient link 
> > to the ancient one :P
> 
> Sweet Baby J. I'll fix that in v2, and there seems to be another 
> link in CAN.. should have grepped harder :)

BTW are there any ixgb parts still in use. The driver doesn't seem
like much of a burden, but IIRC it was a bit of an oddball design
so maybe we can axe it?
