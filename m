Return-Path: <SRS0=pmrK=ZP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEADC432C0
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 18:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28D9C20674
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 18:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="nNvxwXL2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKWSvr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Nov 2019 13:51:47 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36000 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbfKWSvr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Nov 2019 13:51:47 -0500
Received: by mail-pf1-f193.google.com with SMTP id b19so5275312pfd.3
        for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2019 10:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=fW+qNDyIgT0hFMbcoK1jwShTO8vWl0Ds/OEjRZqacwc=;
        b=nNvxwXL2dQu8qouXnwh3q6FCZ5yZtbPsegLFPANNOccgfa3VIhAigD/zDcIN2TxkPa
         whMduDFVMcwoeUPLORLbb9bpRO+/4d5q+Z3jSd9/uSobOS9T2jqfJoyEH6HNqIYCio74
         FG+HRoqtPCfZV+faoog6ZNpjJojm5oXQLNelNTR0O/NGuh0j+GIKs9eRO5NpcFSEuU9y
         rnmouAjQ1kmbFJkBSeehpyXFG2/++y3v8YqZOb+bxFBh3njKME8FDRYlIqSF+i5nQmzd
         GFO2GV1paCwEFJKO7Cm3ry5KWGR74+4TTWprnfdExv2Dqfu4RFW6Jguq4DWAIVafag9f
         iW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=fW+qNDyIgT0hFMbcoK1jwShTO8vWl0Ds/OEjRZqacwc=;
        b=QhKBoN9rZ5MGenleK4hKBb6aB5toQsLPAfBzABg5d3dPwBx21DwOlXRAcUx281P/HF
         oNUURaepugqcwVs0SsHX7/+QnbeOm/KYmcq0KLN7r2lI4gI+0cRquStG2OkpCebxEIRM
         VkPjTylrUFDSgAmPuPmlTdX6IBxnbNRGKjYMJMxE7ASuoWKV1D0ivkNDuW4DHsdlvSpX
         gQwj4uBWS+msfCokvtJAbF1tMwohnxw1Q3ELuYkbMtWoIERvvLfNOwaMucGeFgCqnv14
         j0065VsGuuizWbGBqIyH3mnl+giz9W+xBOxfzXf7Zdl218WIAOXkfNgvDWAFgv6INmzJ
         pGOQ==
X-Gm-Message-State: APjAAAX4wpM0LifMuS/z1JEMSBGWsxk1CNvO/VTTlnH16Ffp7DYGdCcR
        S4TFiDp/CeTf4LNiw6Sw47vA2A==
X-Google-Smtp-Source: APXvYqz7IyhpKJ3Z3/jH1T5VJ5CuK1OMSDa3EO7ZCn5BLDWIwi5lwBHvQm4upCxj2unGJgEEMGRS/A==
X-Received: by 2002:a62:38d8:: with SMTP id f207mr25442964pfa.209.1574535106410;
        Sat, 23 Nov 2019 10:51:46 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id h13sm2464081pfr.98.2019.11.23.10.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 10:51:46 -0800 (PST)
Date:   Sat, 23 Nov 2019 10:51:41 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: remove phy_ethtool_sset()
Message-ID: <20191123105141.3a75fd7f@cakuba.netronome.com>
In-Reply-To: <20191123105021.2a7b1fb9@cakuba.netronome.com>
References: <E1iY8BQ-00066m-TG@rmk-PC.armlinux.org.uk>
        <20191123105021.2a7b1fb9@cakuba.netronome.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 23 Nov 2019 10:50:21 -0800, Jakub Kicinski wrote:
> On Fri, 22 Nov 2019 12:37:08 +0000, Russell King wrote:
> > There are no users of phy_ethtool_sset() in the kernel anymore, and
> > as of 3c1bcc8614db ("net: ethernet: Convert phydev advertize and
> > supported from u32 to link mode"), the implementation is slightly
> > buggy - it doesn't correctly check the masked advertising mask as it
> > used to.
> > 
> > Remove it, and update the phy documentation to refer to its replacement
> > function.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>  
> 
> Applied, thank you!

FWIW I've added the word "commit" before the hash, checkpatch is really
insistent on that.
