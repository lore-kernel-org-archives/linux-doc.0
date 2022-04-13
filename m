Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F84C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 20:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238753AbiDMU6k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 16:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238750AbiDMU6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 16:58:39 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0226371EF7;
        Wed, 13 Apr 2022 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=4SUV3QKc2PeFbGEOkTMHkroVVA1hixGKro9sHV+dNI8=; b=qvtwZYYhTdUKbwRrR99YdVWOXf
        7xzI3uhGh/90sgoIHpOFSX97MeoExDJ5b7YL9ikpOxUXBDrgq1l74YmK+Rm32tD9PBLvDkfOM91me
        IoDi50uvjeUW/3JEI/Jz83+GEBqjQUpOVMOyswsP7Q/RpzOxyNwIpGTibDNerP+7EATM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nek28-00FjQu-5B; Wed, 13 Apr 2022 22:56:12 +0200
Date:   Wed, 13 Apr 2022 22:56:12 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Vladimir Oltean <vladimir.oltean@nxp.com>
Cc:     Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        George McCollister <george.mccollister@gmail.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v2] docs: net: dsa: describe issues with
 checksum offload
Message-ID: <Ylc47F5w/rgzGx1x@lunn.ch>
References: <20220411230305.28951-1-luizluca@gmail.com>
 <20220413200841.4nmnv2qgapqhfnx3@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413200841.4nmnv2qgapqhfnx3@skbuf>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 13, 2022 at 08:08:41PM +0000, Vladimir Oltean wrote:
> I've copied a bunch of new people to this email.
> 
> TL;DR: Kurt/George/Andrew, on your systems with hellcreek/xrs700x/mv88e6060,
> does the DSA master declare any of the following features as "on"?
> 
> ethtool -k eth0 | grep tx-checksum-ip
> 
> I would expect not. Otherwise, we've either found a bug, or discovered the Sasquatch.

Easier than i was expecting. As i said, Marvell Kirkwood with a
mv643xx as master:

root@dir665:~# ethtool -k eth0 | grep tx-checksum-ip
        tx-checksum-ipv4: on
        tx-checksum-ip-generic: off [fixed]
        tx-checksum-ipv6: off [fixed]

	Andrew
