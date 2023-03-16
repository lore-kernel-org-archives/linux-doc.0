Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382DDC6FD1F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 12:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjCPMKS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjCPMKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 08:10:17 -0400
X-Greylist: delayed 334 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Mar 2023 05:10:16 PDT
Received: from violet.fr.zoreil.com (violet.fr.zoreil.com [IPv6:2001:4b98:dc0:41:216:3eff:fe56:8398])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0843D17CF6
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 05:10:15 -0700 (PDT)
Received: from violet.fr.zoreil.com ([127.0.0.1])
        by violet.fr.zoreil.com (8.17.1/8.17.1) with ESMTP id 32GC3aY3648944;
        Thu, 16 Mar 2023 13:03:36 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 32GC3aY3648944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1678968216;
        bh=Piav4BWDHwTT77PYHWbtrrc+P7V2hvQMFwsSNmtoNVk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bWdPleEfc5DWF32WBotmIy1TzTxj3pyZPEG7bTL/vy6Teh/6nIX0EfOUVPEB3OinB
         1TjkUSK/yEScxvwNKqgloc71iVBtY+XNzwNx2m2twzYYig9ixk6Y7WkhrTgRuE0gDK
         GtohJ2mRTbFpUSlz0sPelC1UkzLS3ctqSL8/aUT0=
Received: (from romieu@localhost)
        by violet.fr.zoreil.com (8.17.1/8.17.1/Submit) id 32GC3Zsf648943;
        Thu, 16 Mar 2023 13:03:35 +0100
Date:   Thu, 16 Mar 2023 13:03:34 +0100
From:   Francois Romieu <romieu@fr.zoreil.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Stephen Hemminger <stephen@networkplumber.org>,
        davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
Message-ID: <20230316120334.GA648750@electric-eye.fr.zoreil.com>
References: <20230315223044.471002-1-kuba@kernel.org>
 <20230315183846.3eb99271@hermes.local>
 <20230315195829.646db7b5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315195829.646db7b5@kernel.org>
X-Organisation: Land of Sunshine Inc.
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> :
> On Wed, 15 Mar 2023 18:38:46 -0700 Stephen Hemminger wrote:
> > On Wed, 15 Mar 2023 15:30:44 -0700
> > Jakub Kicinski <kuba@kernel.org> wrote:
[...]
> > Older pre LF wiki NAPI docs still survive here
> > https://lwn.net/2002/0321/a/napi-howto.php3
> 
> Wow, it's over 20 years old and still largely relevant!
> Makes me feel that we stopped innovating :)
> 
> Why were all the docs hosted out of tree back then?

This is not completely true.

Dave Jones's full-history-linux.git.tar shows that
Documentation/networking/NAPI_HOWTO.txt with the same content was included by
davem on 2002/03/13.

It was possible to do quite some work with the then in-tree kernel doc
(napi, locking, dma).

-- 
Ueimor
