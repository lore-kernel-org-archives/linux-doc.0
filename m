Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 852357D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Feb 2019 16:27:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfBGQ1J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Feb 2019 11:27:09 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45110 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfBGQ1I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Feb 2019 11:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2014; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=e1gr0vv+5Gj5JX7Lj4Mbqj00ui75u4QG9qC6bfiq+gQ=; b=AC6ZzNRiU3iIcVuSAMN46gNH4
        qJ6O6daIXRMKwGJc/6wJyV54jgKeJ6ZHUQmCs4EF4zPpBI7npYAS/Q2oT/0mX2Hz6q0svtiztabGE
        6ohfQQcCPc8EjX1GDDh2StKRT2/PQZxkTB7U2C7GYKV2x/0sayGih6ZG9jt1L9Yzw54lU=;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:36606)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1grmW1-0002WU-IK; Thu, 07 Feb 2019 16:27:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1grmW0-0006K6-9f; Thu, 07 Feb 2019 16:27:04 +0000
Date:   Thu, 7 Feb 2019 16:27:04 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     David Miller <davem@davemloft.net>
Cc:     linux-doc@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/2] net: phylink: update mac_config() documentation
Message-ID: <20190207162704.ww3q5ptts7jfhfay@shell.armlinux.org.uk>
References: <E1gr371-0007eK-Gd@rmk-PC.armlinux.org.uk>
 <20190206.173032.1315062430415479623.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190206.173032.1315062430415479623.davem@davemloft.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 06, 2019 at 05:30:32PM -0800, David Miller wrote:
> 
> These two patches do not apply cleanly to net nor net-next.
> 
> Please send me something that does apply, and please always
> clearly indicate which tree your changes are targetting.

I've just tried this patch on current net-next, and there does not
seem to be any problem.  What problem are you seeing specifically
with this patch?  Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
