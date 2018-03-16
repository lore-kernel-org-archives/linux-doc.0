Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 08B837E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 15:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751468AbeCPPQ4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 11:16:56 -0400
Received: from orcrist.hmeau.com ([104.223.48.154]:59294 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751233AbeCPPQz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 11:16:55 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.84_2 #2 (Debian))
        id 1ewr66-0001xa-C7; Fri, 16 Mar 2018 23:16:46 +0800
Received: from herbert by gondobar with local (Exim 4.84_2)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1ewr62-0001j0-Rl; Fri, 16 Mar 2018 23:16:42 +0800
Date:   Fri, 16 Mar 2018 23:16:42 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: doc - clarify hash callbacks state machine
Message-ID: <20180316151642.GA6606@gondor.apana.org.au>
References: <20180305103945.3517-1-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180305103945.3517-1-horia.geanta@nxp.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 05, 2018 at 12:39:45PM +0200, Horia Geantă wrote:
> Even though it doesn't make too much sense, it is perfectly legal to:
> - call .init() and then (as many times) .update()
> - subseqently _not_ call any of .final(), .finup() or .export()

Actually it makes perfect sense, because there can be an arbitrary
number of requests for a given tfm.  There is no requirement that
you must finalise the first request before submitting new ones.

IOW there can be an arbitrary number of outstanding requests even
without the user intentionally abandoning any hash request.

So please modify your commit description.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
