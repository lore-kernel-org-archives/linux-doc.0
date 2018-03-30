Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C08557D0F4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 17:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751264AbeC3Rl3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Mar 2018 13:41:29 -0400
Received: from orcrist.hmeau.com ([104.223.48.154]:51558 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751327AbeC3Rl2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Mar 2018 13:41:28 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.84_2 #2 (Debian))
        id 1f1y1f-0001hX-1N; Sat, 31 Mar 2018 01:41:19 +0800
Received: from herbert by gondobar with local (Exim 4.84_2)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1f1y1c-0007N3-Ri; Sat, 31 Mar 2018 01:41:16 +0800
Date:   Sat, 31 Mar 2018 01:41:16 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] crypto: doc - clarify hash callbacks state machine
Message-ID: <20180330174116.GF28120@gondor.apana.org.au>
References: <20180305103945.3517-1-horia.geanta@nxp.com>
 <20180320075612.22719-1-horia.geanta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180320075612.22719-1-horia.geanta@nxp.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 20, 2018 at 09:56:12AM +0200, Horia Geantă wrote:
> Add a note that it is perfectly legal to "abandon" a request object:
> - call .init() and then (as many times) .update()
> - _not_ call any of .final(), .finup() or .export() at any point in
>   future
> 
> Link: https://lkml.kernel.org/r/20180222114741.GA27631@gondor.apana.org.au
> Signed-off-by: Horia Geantă <horia.geanta@nxp.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
