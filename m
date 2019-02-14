Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C42D87D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Feb 2019 04:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389067AbfBNEjs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 13 Feb 2019 23:39:48 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53712 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbfBNEjs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Feb 2019 23:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZdF3t2hI9TRWFMT7Io2Rjw8LeVr+Egc7UjmxF5rzz3Q=; b=MIokqUwosMrc+p466xFY+VE0I
        uw3FAUrtW1msV68K9GzSY6gLjmndf1ZNhGqfllDvz6HabClXq2hwHmKoHSGt1eSHKUwpAGSme6I5q
        JLynTTBE3SN2kI/1u6Rfph7XGCQjLrEG+PeqWtF1eJ/5pIDMlMQTijdT6s9EVmbCQoP9C+GNNvKKy
        1hHmskaWy2945kjyvRadIpXfZCOUAT1mPDAEKr5ZFm1oxpWLhIWBVmoRhVM0DY9ipvnFSIg6IasFX
        aSCivEPDDeFuRrboVrajvUq3Xk91KiYcN3HChj+udul5Wpimmkn+QGS62cil+KA+tBSmEi+y79SnM
        uAl8HL+pw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gu8oN-00017a-7J; Thu, 14 Feb 2019 04:39:47 +0000
Subject: Re: [PATCH 2/2] doc: add phylink documentation to the networking book
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Russell King <rmk+kernel@armlinux.org.uk>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
References: <E1gr376-0007ea-NV@rmk-PC.armlinux.org.uk>
 <f002402d-fb27-f697-f07d-de3cdff41f40@infradead.org>
 <20190214043217.GB20024@lunn.ch>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8bffeec4-d33d-2433-3749-2fd7e24b6228@infradead.org>
Date:   Wed, 13 Feb 2019 20:39:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20190214043217.GB20024@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/13/19 8:32 PM, Andrew Lunn wrote:
>>> +For information describing the SFP cage in DT, please see the binding
>>> +documentation in the kernel source tree
>>> +``Documentation/devicetree/bindings/net/sff,sfp.txt``
>> oh, so SFP means "Small Form-factor Pluggable".
>>
>> I see that this source file:
>> ./drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:1902:
>>
>> seems to imply that SFP means "single function per port (SFP) mode":
> 
> Hi Randy
> 
> rfc5513 might be relevant.
> 
> 	Andrew
> 

Definitely.  like WAD.  :)

thanks.
-- 
~Randy
