Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67733C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 21:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiGAVkO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 17:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiGAVkN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 17:40:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D92369D5;
        Fri,  1 Jul 2022 14:40:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D87B621D8;
        Fri,  1 Jul 2022 21:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B72C3411E;
        Fri,  1 Jul 2022 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656711611;
        bh=pPgErvNCAX2U7bc3Q1SofrffghA90sAaxQVNIRgB31Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZWvHYxGQzM8heCrs4N4bVXe/XXaZ19S1hzsvqvuliM7hiRtup0w5K5AsIUkUbyWJr
         AKNUxVGz1kibVJ33MS64kW0sJZvNsKXwog4RBDDJ3mhYCyU+D0xv+U9i+KXCmRNKS4
         RY5CjMVQYWPKoCW1uU8NmwwaqoiusVHBff0lLvkb5Eqt1nl1N41DGLqqlnqaYDVQmV
         ulwxToGvlHwhuzUza2LoaE8aO4KNLYSCXW6MvK4is/fjkQ0i92QTyPWlta9ChtXiST
         SVUOBOL8uotyRcZz8AgHo/iH+VPnKApG8b6j9Al1ieUMb6JsjLvo89PkWjK7CH4fJb
         3t+HhFuWyALzA==
Date:   Fri, 1 Jul 2022 14:40:10 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Francois Romieu <romieu@fr.zoreil.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, jdmason@kudzu.us,
        vburru@marvell.com, jiawenwu@trustnetic.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <20220701144010.5ae54364@kernel.org>
In-Reply-To: <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
References: <20220701044234.706229-1-kuba@kernel.org>
        <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 1 Jul 2022 19:12:43 +0200 Francois Romieu wrote:
> Jakub Kicinski <kuba@kernel.org> :
> > The last meaningful change to this driver was made by Jon in 2011.
> > As much as we'd like to believe that this is because the code is
> > perfect the chances are nobody is using this hardware.  
> 
> It was used with some success in 2017:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=197881

Nice find! Quoting for the list:

  vxge.ko can work nicely for kernel version 4.1 (I tried 4.1.44)
  However, for any version beyond that (I tried 4.4, 4.8, 4.13)
  the card can be initiated - but when I tried to do some network
  transfer (for example, ssh) I saw something like.... 

  [Tx queue timeout stack trace follows]

I didn't see any fixes since 2017 so the problem must still be there.
Could be just a particular version of FW that's broken, tho.

> > Because of the size of this driver there is a nontrivial maintenance
> > cost to keeping this code around, in the last 2 years we're averaging
> > more than 1 change a month. Some of which require nontrivial review
> > effort, see commit 877fe9d49b74 ("Revert "drivers/net/ethernet/neterion/vxge:
> > Fix a use-after-free bug in vxge-main.c"") for example.  
> 
> vxge_remove() calls vxge_device_unregister().
> 
> vxge_device_unregister() does unregister_netdev() + ... + free_netdev().
> 
> vxge_remove() keeps using netdev_priv() pointer... :o/
> 
> Imho it is not nontrivial enough that top-level maintainers must handle it
> but it is just mvho that maintainers handle too much low-value stuff.

Ack, this particular bug is just an excuse, it can be fixed.

> Regarding the unused hardware side of the problem, it's a bit sad that
> there still is no centralized base of interested users for a given piece
> of hardware in 2022.

100%, I really wish something like that existed. I have a vague memory
of Fedora or some other distro collecting HW data. Maybe it died because
of privacy issues?

Knowing that stuff gets used would be a great motivation. Handling all
the academic / bot patches for stuff I think goes completely unused is
weighing down my psyche.
