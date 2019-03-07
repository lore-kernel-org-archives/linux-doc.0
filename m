Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2A947D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 09:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfCGJR4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 04:17:56 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46989 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725747AbfCGJR4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 04:17:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 069183687;
        Thu,  7 Mar 2019 04:17:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 07 Mar 2019 04:17:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:mime-version:content-type; s=fm2;
         bh=X3oTW5OOyghLjcGAQCeKxKToHRfOmbiWEDMJjabEwDM=; b=UsmyJm28Hksu
        DumytrLKVfPfZJMrbiu7mk1Mel0Mz35gzpVTJuTBHCpWraZr25s2H3j0yDOkd548
        GxZyGgtKtIxQNsIVucqfohXMOcV1B3YLaGMHroQ50GBcOW4vlKSOoh1oJ/fHu5Ux
        YBdoDMr5MBkVIF5+6LolTuBRO3QyxnXCa98dMEyNmsqgVP0X1rOEAUxTPdi0Gu6o
        hgb/3cOAgTWl6DHLRC2RZvM4+VM+nfMjgkmi2uDkuex1dqV4kjmkWAcWfqltBVA+
        340YRdq8hx/t92pj/sqilLG/QccyYUNJsbNkX/hhpqCuovwGSzBgvger5E1/pRKD
        I5PVQknokA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=X3oTW5OOyghLjcGAQCeKxKToHRfOm
        biWEDMJjabEwDM=; b=S+AmaVCqZcsmC6/thnQXyKHlMZJs/Bi0uF+IO307kiMlm
        3kH6AFGkWIaZaWY0dA/oe7owW02nCq/TJzsl/C5XgEKxhdf2H+Vj/8nUt97pjhWm
        pW4Z7xpjLtLwbru3qPNB50vsju0+9h9+Q+VohJfMESf4YvSd06y/TEpUTPfLrbdp
        7KU/bjfIVk+Gg/IvnEelJ9NTqwjPa9a9hgXPU9e4Y6UG6QsRkc0lQgToI6YEZOqF
        3rcVK3TJIGVPtKTbMpnyDRgIn2oVzHX2IuYD0kBl86x2hI8rgdpuy3+/qVpJe+qA
        26m0PURx0vdJ+n0WZsNiFiAVX1ZAxsDhJu+EP5fAw==
X-ME-Sender: <xms:wuGAXAJoS2PIgswDWAQj89wAY5SSjR9GbZedTIErZCKv4M9V3xuriQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdeftddmnecujfgurhepfffhvffukfggtgguofgfsehttdertdforedv
    necuhfhrohhmpedfvfhosghinhcuvedrucfjrghrughinhhgfdcuoehmvgesthhosghinh
    drtggtqeenucfkphepuddvgedrudeiledrhedrudehkeenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgvsehtohgsihhnrdgttgenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wuGAXH_QtcL4DyEUYD9RHu4RPhOs0zCuG0ybJ1ZGPpS6yRQhYZnOTg>
    <xmx:wuGAXMF4FALAXbzXtzFc4Bj7IVf2JenP5olO7O7nxpPFrw-DAUP2Pw>
    <xmx:wuGAXHMo5SFRsmuXNtbQltAdwX-r25jbqxWWvzI1O89wShinG80UKg>
    <xmx:wuGAXKhr-VpTh26IhmT9m8Ol8C_t6IkCWc2xrzYeLihP4fMTJE0ZLg>
Received: from localhost (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id 74733E4548;
        Thu,  7 Mar 2019 04:17:53 -0500 (EST)
Date:   Thu, 7 Mar 2019 20:17:34 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: undefined label
Message-ID: <20190307091734.GB9152@eros.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: Mutt 1.11.3 (2019-02-01)
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

I hit that undefined label warning again today.  Then just now I was
sitting enjoying a quite scotch and the reason came to me.  It is caused
by building part of the docs instead of the whole tree i.e. using

	make SPHINXDIRS=admin-guide htmldocs

Gives the warning

	WARNING: undefined label: numa (if the link has no caption the label must precede a section header)

This is a hell of a gotcha, I wasted a bunch of cycles baffled as to why
that label was not defined today :(  Super excited that I worked out why
while day dreaming though.

Last time I sent in the 'fix' I must built with SPHINXDIRS, patched then
built without SPHINXDIRS and thought the patch fixed it.

Anyways, hope you get a chuckle out of this.

All the best,
Tobin.
