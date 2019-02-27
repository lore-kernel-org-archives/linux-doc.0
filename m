Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3AFE97D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 21:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730363AbfB0VvQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 16:51:16 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfB0VvP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Feb 2019 16:51:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VfBKsFuer8a7SZA1+mFCHueugnztnVaxwr1yZpActI8=; b=VSXnJ5OciTgIiz5vChr0PwEeJ
        o/dfV+jHwGQtIWA0ItG/2wMyqxiSHClRPzJ22dJFLL1C3OAb+W0nlJxZx5xgJxTpO1HPwiEO5Ecvc
        e79u8CaC4MDNJdSvBwYSqSUATO1+U5FeWstKbQpqU4O0/+eUcY4qSRnTA7JKX6mdCq/pPQvANTN4A
        CyDZE/wPLdJiJA6mcz4CAcWuBfg1DRoL8WrEUZumCjPKI/LurhLFgmnV3qiZjqxTqPZGDnbXxkgzH
        es2jWxB/Dppu+/yNsSJLyCC4YOqPwGHugTNZDzVeGj1LihQFD6jKpXlPNKETOmfmNPMF+njOfDd6N
        nFRGapcyA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gz76h-0004vU-6P; Wed, 27 Feb 2019 21:51:15 +0000
Subject: Re: [PATCH 1/2] doc: net: ieee802154: introduce IEEE 802.15.4
 subsystem doc in rst style
To:     Stefan Schmidt <stefan@datenfreihafen.org>, davem@davemloft.net,
        corbet@lwn.net
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-wpan@vger.kernel.org
References: <20190227195914.4594-1-stefan@datenfreihafen.org>
 <20190227195914.4594-2-stefan@datenfreihafen.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <12e09441-6666-7e59-d4c3-d950bec8721f@infradead.org>
Date:   Wed, 27 Feb 2019 13:51:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20190227195914.4594-2-stefan@datenfreihafen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/27/19 11:59 AM, Stefan Schmidt wrote:
> Moving the ieee802154 docs from a plain text file into the new rst
> style. This commit only does the minimal needed change to bring the
> documentation over. Follow up patches will improve and extend on this.
> 
> Signed-off-by: Stefan Schmidt <stefan@datenfreihafen.org>
> ---
>  Documentation/networking/ieee802154.rst | 180 ++++++++++++++++++++++++
>  Documentation/networking/index.rst      |   1 +
>  2 files changed, 181 insertions(+)
>  create mode 100644 Documentation/networking/ieee802154.rst

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
