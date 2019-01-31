Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D779B7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 02:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfAaCQZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 21:16:25 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42507 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbfAaCQZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 21:16:25 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5646721AFB;
        Wed, 30 Jan 2019 21:16:24 -0500 (EST)
Received: from imap37 ([10.202.2.87])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 21:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=
        message-id:in-reply-to:references:date:from:to:cc:subject
        :content-type; s=fm2; bh=8Ol4BQ0IxxerjIAug/ySYZZrLqG50k2NCarWWeE
        LAYY=; b=Se7DdSUjhhobnH4oHWb1mO8z1co0ApuUJa2L7qbtNaxPR0mNZtJvRrf
        CrmZOBGWpIHBpXsS09A7NCkAN1DrVLfe2EB6wUDwkpoWb8nDQ4urdBZQsrvKBkR/
        G/nhlWbpbks45NzEY5IYTTMCNHnlD2vNSLD6ckpuEeSHIiESEn50zZafEjiobn96
        SgE6qd+4NivPw0WtIXW7j3Fi358S8ZjEZM1LbT1NgiO+dPUfbfLkGquK/LonBWtz
        +OeyxIUzrBG6g3ouqRS/6OV6PZsB6/1S+x3++xrqXPBvad8Xs8D0WRSBCEJV/WSH
        KdosHry3wNotaQdVZGsR8f0obp4RMWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:references:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8Ol4BQ0IxxerjIAug
        /ySYZZrLqG50k2NCarWWeELAYY=; b=l/0K3UfORmZtZB84Fl1LmV9WT06fvsXmD
        Szy8BtP9hs2R+PlSoP7ooIUo5Wg44XS790KJDugY0EppPsnX2PwKPaMlO8ETNdy0
        3rl8FMlQvfom4MTDDYV0jnpURoJDb+vsg6Y5n2Zzz6pH2KirOn6jgJto9LNYmrNZ
        vDZQqEgWmWzmySAoi/okl5n52tzn6InJafdTUEN2O+hGQJjaXxeyzhmM3zXYriE4
        C9PfDoEJAIwSVPaKDf9yrY2f5ixJg5crA2dLv3B5RibyZVqKfzSYaDXDk5eCHPov
        W6KbEt9CX6LrYs0DafCrzanyNFLuqW5QnncxKxt8xtC/TQjXmgwbg==
X-ME-Sender: <xms:d1pSXN3zdcTpbc2ZC0FcNoi_c_zXFx-xVav9YsT4hhAkqkHXA3nRCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludehmd
    enucfjughrpefofgfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecuffhomhgrih
    hnpehlfihnrdhnvghtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesthhosghinhdr
    tggtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:d1pSXIVYMraFfZTSZORtx71436hj1Y0nktvPvDWzYtdLDRFUiT4yjQ>
    <xmx:d1pSXI4bPoF-QuFMzqED1koZp0f9FUo47VSP5OGdjl902FF2p1GDNg>
    <xmx:d1pSXPJYGm45eKWhfA1jDvsPZvGwTMUL7dqvF07KDbpxVs_-0N5LmQ>
    <xmx:eFpSXFDQQPmhfuKv_vj58W_MhhdZ_o4rK2Y6e358-AHHJQhAO_z3Gw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8049BDE68C; Wed, 30 Jan 2019 21:16:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-825-ge9fd767-fmstable-20190130v1
X-Me-Personality: 30421017
Message-Id: <c81c580c-71c4-4058-9e04-dd06e8c231c2@www.fastmail.com>
In-Reply-To: <84dc9207-a6c3-f40d-c0be-815a4563fc83@infradead.org>
References: <20190131012553.GA30122@eros.localdomain>
 <84dc9207-a6c3-f40d-c0be-815a4563fc83@infradead.org>
Date:   Wed, 30 Jan 2019 21:16:21 -0500
From:   "Tobin C. Harding" <me@tobin.cc>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        "Randy Dunlap" <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: docs tree
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 31, 2019, at 12:37, Randy Dunlap wrote:
> On 1/30/19 5:25 PM, Tobin C. Harding wrote:
> > Hi Jon,
> > 
> > Has the docs tree moved?  I haven't fetched it lately and this morning I
> > get:
> > 
> > 	$ git fetch corbet
> > 	fatal: unable to connect to git3.lwn.net:
> > 	git3.lwn.net[0: 45.79.184.34]: errno=Connection refused
> > 
> > All my other trees fetch ok.  Relevant .git/config entry is:
> > 
> >         [remote "corbet"]
> >      		url = git://git3.lwn.net/linux.git
> > 		fetch = +refs/heads/*:refs/remotes/corbet/*
> > 		pushurl = no_push
> > 
> > 
> > thanks,
> > Tobin.
> 
> 
> Hi Tobin,
> 
> The MAINTAINERS file says:
> T:	git git://git.lwn.net/linux.git docs-next

Ouch, failing in public is fun.  Thanks Randy
