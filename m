Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE10C43334
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 17:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiGARRA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 13:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGARQ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 13:16:59 -0400
X-Greylist: delayed 217 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Jul 2022 10:16:58 PDT
Received: from violet.fr.zoreil.com (violet.fr.zoreil.com [IPv6:2001:4b98:dc0:41:216:3eff:fe56:8398])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BC9167C9
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 10:16:58 -0700 (PDT)
Received: from violet.fr.zoreil.com ([127.0.0.1])
        by violet.fr.zoreil.com (8.17.1/8.17.1) with ESMTP id 261HCj7S884685;
        Fri, 1 Jul 2022 19:12:45 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 261HCj7S884685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1656695565;
        bh=ywsfycTY9ZIZPgwIWZIdLJhLXWG90UHWkrGjfJhLaso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MSwxqyn9pmlBZy8glBTrCHEzw3dfY5ISXF2PSzTjc0LtnYM7tSROdR4lvwUtqxfZP
         lMHyubg3hyQF6QkP3hEoIpgbJxhnIKYvIwcBK0t+AeBmEEJjlTbQdyK+rZfPMn+V6g
         eG1LT3PiC5o3rLGkhIPg083dxzVmmbYHheuOQ89k=
Received: (from romieu@localhost)
        by violet.fr.zoreil.com (8.17.1/8.17.1/Submit) id 261HChj3884684;
        Fri, 1 Jul 2022 19:12:43 +0200
Date:   Fri, 1 Jul 2022 19:12:43 +0200
From:   Francois Romieu <romieu@fr.zoreil.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, jdmason@kudzu.us,
        vburru@marvell.com, jiawenwu@trustnetic.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
References: <20220701044234.706229-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701044234.706229-1-kuba@kernel.org>
X-Organisation: Land of Sunshine Inc.
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> :
> The last meaningful change to this driver was made by Jon in 2011.
> As much as we'd like to believe that this is because the code is
> perfect the chances are nobody is using this hardware.

It was used with some success in 2017:

https://bugzilla.kernel.org/show_bug.cgi?id=197881

> Because of the size of this driver there is a nontrivial maintenance
> cost to keeping this code around, in the last 2 years we're averaging
> more than 1 change a month. Some of which require nontrivial review
> effort, see commit 877fe9d49b74 ("Revert "drivers/net/ethernet/neterion/vxge:
> Fix a use-after-free bug in vxge-main.c"") for example.

vxge_remove() calls vxge_device_unregister().

vxge_device_unregister() does unregister_netdev() + ... + free_netdev().

vxge_remove() keeps using netdev_priv() pointer... :o/

Imho it is not nontrivial enough that top-level maintainers must handle it
but it is just mvho that maintainers handle too much low-value stuff.

Regarding the unused hardware side of the problem, it's a bit sad that
there still is no centralized base of interested users for a given piece
of hardware in 2022.

-- 
Ueimor
