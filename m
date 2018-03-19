Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD8577D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 09:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933016AbeCSJZP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 05:25:15 -0400
Received: from orcrist.hmeau.com ([104.223.48.154]:46436 "EHLO
        deadmen.hmeau.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933021AbeCSJZK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 05:25:10 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.84_2 #2 (Debian))
        id 1exr2L-00041j-W3; Mon, 19 Mar 2018 17:25:02 +0800
Received: from herbert by gondobar with local (Exim 4.84_2)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1exr2I-0003Nl-D1; Mon, 19 Mar 2018 17:24:58 +0800
Date:   Mon, 19 Mar 2018 17:24:58 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: doc - clarify hash callbacks state machine
Message-ID: <20180319092458.GB12302@gondor.apana.org.au>
References: <20180305103945.3517-1-horia.geanta@nxp.com>
 <20180316151642.GA6606@gondor.apana.org.au>
 <AM3PR04MB45284A83B66E00785872DE698D40@AM3PR04MB452.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM3PR04MB45284A83B66E00785872DE698D40@AM3PR04MB452.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 19, 2018 at 06:39:50AM +0000, Horia Geantă wrote:
>
> The fact that there can be multiple requests in parallel (for a given tfm) is a
> different topic.
> Each request object has its state in its own state machine, independent from the
> other request objects.
> I assume this is clear enough.

My point is that all of the state associated with a request needs
to be stored in the request object.  If you're start storing things
in the driver/hardware, then things will get ugly one way or another.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
