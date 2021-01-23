Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266BFC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 23 Jan 2021 20:02:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6D1B22D2B
	for <linux-doc@archiver.kernel.org>; Sat, 23 Jan 2021 20:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbhAWUCA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Jan 2021 15:02:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:43428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726414AbhAWUAn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 23 Jan 2021 15:00:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A6CE22D2B;
        Sat, 23 Jan 2021 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611432003;
        bh=2gXrf4xx4NEWR6+9LUSPcv66UdEbV9WUYwRBiyW/sC4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AqdtoHBOQ8QdrD0YNVscf19f7cfJM9dWB2HlbiPzBC4Hr8z88pG866AvFpaqjOttE
         tF2T6aUkVEn3Is335dH4S58A0aC3S9TMW505YdPczXhjUtljXLfX98vd1SeYIG+Ziz
         dXSBsdlqr6FrvUJLYOafEOGl3ii18h8/0rfsWLRf0xdDFWzMVRsPEJEdoINkg5M3On
         5+IkKaIcjKOiPxc7vEsL4mXOh1qLpdaKQh8HdcXq6cZSOjJaCXZe4ihnNerqyGn4Q4
         iVkg2PgZdSaXeu+I4I28Sj2U3bmBo196D8JdrvJwLcx8JlvX0H4OnzWHM6fNASgTUn
         FyqDl6lLlEJKQ==
Date:   Sat, 23 Jan 2021 12:00:01 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     David Ahern <dsahern@gmail.com>
Cc:     Maciej =?UTF-8?B?xbtlbmN6eWtvd3NraQ==?= <zenczykowski@gmail.com>,
        Praveen Chaudhary <praveen5582@gmail.com>,
        David Miller <davem@davemloft.net>, corbet@lwn.net,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>,
        Linux NetDev <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhenggen Xu <zxu@linkedin.com>
Subject: Re: [PATCH v3 net-next 1/1] Allow user to set metric on default
 route learned via Router Advertisement.
Message-ID: <20210123120001.50a3f676@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <bc855311-f348-430b-0d3c-9103d4fdbbb6@gmail.com>
References: <20210119212959.25917-1-pchaudhary@linkedin.com>
        <1cc9e887-a984-c14a-451c-60a202c4cf20@gmail.com>
        <CAHo-Oozz-mGNz4sphOJekNeAgGJCLmiZaiNccXjiQ02fQbfthQ@mail.gmail.com>
        <bc855311-f348-430b-0d3c-9103d4fdbbb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 22 Jan 2021 22:16:41 -0700 David Ahern wrote:
> On 1/22/21 9:02 PM, Maciej =C5=BBenczykowski wrote:
> > Why can't we get rid of the special case for 0 and simply make 1024 the
> > default value? =20
>=20
> That would work too.

Should we drop it then? Easier to bring it back than to change the
interpretation later. It doesn't seem to serve any clear purpose right
now.

(Praveen if you post v4 please take a look at the checkpatch --strict
warnings and address the ones which make sense, e.g. drop the brackets
around comparisons, those are just noise, basic grasp of C operator
precedence can be assumed in readers of kernel code).
