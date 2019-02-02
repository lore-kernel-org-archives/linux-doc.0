Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7CCE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat,  2 Feb 2019 01:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfBBBuC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 20:50:02 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44735 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726183AbfBBBuC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Feb 2019 20:50:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2B49321F58;
        Fri,  1 Feb 2019 20:50:01 -0500 (EST)
Received: from imap37 ([10.202.2.87])
  by compute5.internal (MEProxy); Fri, 01 Feb 2019 20:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=
        message-id:in-reply-to:references:date:from:to:cc:subject
        :content-type; s=fm2; bh=Y5ynTG9g0A1oqKScaLyHj5ncoqfZVeiegRSExRs
        N0qQ=; b=dbEGZbxWJQQ80D1C72RY38dStTrnS2MDR88p2xp0VoWEQfmG6fFxIpS
        s+5KQFXZkbRlZ1W0Mw9czVDE40dQZFqu/mYeVlOB0d1tWVABTCHW0ZFqzLNxOHOn
        TtoY/aIz6S0Pp4GW8sTDUwa41HhvvfZofBY+phWf9sFfsFRTHRayNZ14p0lfFw97
        KJC0oEsn22M2vGT+umM4//264IEFHo7oVIK7lAF6EWpvBF6BzuilHQ9MFwXEn8Ic
        +lgqtsx9XUnkqHrfwD05th91/Ya67+a5U2XfKzrpd8P1Zk6zlUV0/hWsv06RDZJi
        11t+pxp6O9fU5xWlMxWhfKKowooiyxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:references:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Y5ynTG9g0A1oqKSca
        LyHj5ncoqfZVeiegRSExRsN0qQ=; b=wec/x1QNYq3Llz0vEGkeqQL0BEKxwAkOB
        US4bgOWmQNbIIaOAAjEhlE2WKHLXitfUMnxwkhh8IasYe8kY3C6Xck0CPANrsUVx
        omopt5kN8mDw3yB0cehrGoHsX2jeZOHHUiLeB2djMA+qwWeONywhEaFGlKNEQD3M
        yrE8UXggWVtNdpkGuaS/NYe2bBaj+y5li+LBAeUrjS+lTwthuS+F0vbPSUPbekKp
        DfwFHcJ/Q5Ww9VJN7ov26QR0j7ESk77WZT9FhPMHqKEVmb/s7ky98CD2x0OjH1fz
        wFMlcepqi+GUV3w2EEtDgdUl0jyQGl8plH32ICT7bFgSKCKSkG6uQ==
X-ME-Sender: <xms:SPdUXKe90oua5DAW6mB3nBm9F351oIjKW8CdupA6sw0MiBK6_-DATQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeelgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludehmd
    enucfjughrpefofgfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecuffhomhgrih
    hnpehlfihnrdhnvghtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdr
    tggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:SPdUXLypi0Li5J_N1yV3TSOFL79FNX9FNhpDajiYi7A6dlsUeeA4sQ>
    <xmx:SPdUXDFKfvVd9SkeBgbbIct3V-wU_VskXGaaI4SgwbaSSqHNHoUj3w>
    <xmx:SPdUXH4kzG1oCzyr2C7HgyhhbaXuIAPBapkvkGd5D7XbuD6O5sts_Q>
    <xmx:SfdUXI5Is6muuRo0cxzsyVV7FXWFkJpocIQPpohEHQ2JPsPNo2BTxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 837EDDE706; Fri,  1 Feb 2019 20:50:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-832-gba113d7-fmstable-20190201v1
X-Me-Personality: 30421017
Message-Id: <772c4bb4-f390-4b3c-9e85-ec0b13239544@www.fastmail.com>
In-Reply-To: <20190131204045.28aef19c@lwn.net>
References: <20190131012553.GA30122@eros.localdomain>
 <84dc9207-a6c3-f40d-c0be-815a4563fc83@infradead.org>
 <c81c580c-71c4-4058-9e04-dd06e8c231c2@www.fastmail.com>
 <20190131204045.28aef19c@lwn.net>
Date:   Fri, 01 Feb 2019 20:49:41 -0500
From:   "Tobin C. Harding" <me@tobin.cc>
To:     "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Randy Dunlap" <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: docs tree
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 1, 2019, at 14:41, Jonathan Corbet wrote:
> On Wed, 30 Jan 2019 21:16:21 -0500
> "Tobin C. Harding" <me@tobin.cc> wrote:
> 
> > Ouch, failing in public is fun.  Thanks Randy
> 
> That's how kernel development is done in the end...:)

It is actually one of the things I like about it.  Keeps one honest and humble.

> I'd be curious to know how you got the git3.lwn.net name in your remote,
> though, if by any chance you can remember.  That shouldn't have leaked
> out anywhere...

I don't remember how I got that remote set up, it worked at some stage because I fetched your tree when I set it up. git complained yesterday when I tried though.  Also I cannot remember the last time I successfully fetched from that remote.  If I ever see it again I'll email you.

thanks,
Tobin.
