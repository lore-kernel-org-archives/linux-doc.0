Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB71C00140
	for <linux-doc@archiver.kernel.org>; Fri, 12 Aug 2022 22:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236724AbiHLWXb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Aug 2022 18:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiHLWXa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Aug 2022 18:23:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A832211475;
        Fri, 12 Aug 2022 15:23:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 452646151E;
        Fri, 12 Aug 2022 22:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E30C433D6;
        Fri, 12 Aug 2022 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660343008;
        bh=Ovp9XaQ1tOiEc1ge6ScilFIfcke5quzbKDIEbH7OsJM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A7A0bgBFNaEEen6den1Piukox8hcQtu7P2gkmAgOri5j81kkqc3OhWGpZWyz+CXyL
         Qday+/LY9C9MWAV/qprtI3haYoJM9/pU6JSK1cprBi82FEvge02LVCM+8acPjJ7L1H
         SuhaPzeYBbUQVOxnRduYKYpmSMrnPcq8ItNf8j3qNaMBOwwUDfugkggAS1j7EbQ2be
         d9HROj4AdAHfpmJraWXkz1i6wwFX32IE4DKpjtEqs9VP4VnlSsSH9XndR4U0+gLSOo
         Qb4DcSuR+QbrVeLVPJQ2uWAap8wiuidpNqhvjVlHC+BPqKwYmfpGadAB8wzi2JLgi1
         +ew+qbR7EIvmQ==
Date:   Fri, 12 Aug 2022 15:23:27 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Edward Cree <ecree.xilinx@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, sdf@google.com, jacob.e.keller@intel.com,
        vadfed@fb.com, johannes@sipsolutions.net, jiri@resnulli.us,
        dsahern@kernel.org, stephen@networkplumber.org, fw@strlen.de,
        linux-doc@vger.kernel.org
Subject: Re: [RFC net-next 1/4] ynl: add intro docs for the concept
Message-ID: <20220812152327.3154c64b@kernel.org>
In-Reply-To: <999354bc-4e79-73fc-e195-9b8d17b3d3b5@gmail.com>
References: <20220811022304.583300-1-kuba@kernel.org>
        <20220811022304.583300-2-kuba@kernel.org>
        <999354bc-4e79-73fc-e195-9b8d17b3d3b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 11 Aug 2022 21:17:37 +0100 Edward Cree wrote:
> > +direction (e.g. a ``dump`` which doesn't not accept filter, or a ``do``  
> 
> Double negative.  I think you just meant "doesn't accept filter" here?

Yup, thanks!
