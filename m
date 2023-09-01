Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A71DCA0FE2
	for <linux-doc@archiver.kernel.org>; Fri,  1 Sep 2023 02:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345529AbjIACff (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Aug 2023 22:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbjIACff (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Aug 2023 22:35:35 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CAEE6F;
        Thu, 31 Aug 2023 19:35:28 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qbu04-009r26-Dk; Fri, 01 Sep 2023 10:35:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 01 Sep 2023 10:35:10 +0800
Date:   Fri, 1 Sep 2023 10:35:10 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     Scott Dial <scott@scottdial.com>, Jakub Kicinski <kuba@kernel.org>,
        netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] macsec: introduce default_async_crypto sysctl
Message-ID: <ZPFN3oNu1hGPpt/a@gondor.apana.org.au>
References: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
 <20230818184648.127b2ccf@kernel.org>
 <ZOTWzJ4aEa5geNva@hog>
 <a9af0c0a-ec7c-fa01-05ac-147fccb94fbf@scottdial.com>
 <ZOdUw66jbDWE8blF@hog>
 <76e055e9-5b2b-75b9-b545-cbdbc6ad2112@scottdial.com>
 <ZOxsAR42r8t3z0Dq@hog>
 <2d34e8a8-24c2-1781-2317-687bfcbeafda@scottdial.com>
 <ZPCfYLsLycX68IeG@hog>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPCfYLsLycX68IeG@hog>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 31, 2023 at 04:10:40PM +0200, Sabrina Dubroca wrote:
>
> Herbert, can we expect ASYNC implementations of gcm(aes) to maintain
> ordering of completions wrt requests? For AESNI, the use of
> cryptd_aead_queued() makes sure of that, but I don't know if other
> implementations under drivers/crypto would have the same
> guarantee.

Absolutely as otherwise IPsec would be seriously broken (it's even
worse than plain TCP because of the replay windows).

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
