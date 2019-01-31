Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B69B37D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 01:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfAaB0A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 20:26:00 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38555 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbfAaB0A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 20:26:00 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0A4E02318F;
        Wed, 30 Jan 2019 20:25:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 30 Jan 2019 20:25:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=date
        :from:to:cc:subject:message-id:mime-version:content-type; s=fm2;
         bh=jxsTM3TCvAndNgZoeMwg06XPhVO+w/RBCEvagbe2Oso=; b=Xau+bxkSdMtb
        8YlyQgx2RGqDRyfMJM42dGU3BxdkD7G+5W+MV4dZel9qkKv9o3t4VtU8SAmgwPYm
        moaOBtsMB1IEUVwKMvaJsGlMupAhw4d77BhTK37TDp0WDX8rOpE2o81D8xXpUzwi
        y6VZ7qq7TAIAqv5yZS9pF9KJaMYHiSYLcDT0dCNREPH2cfj0mnDIBvvsA5uKPISe
        W8UaGTtjaQjVziiktFwuq1UI8MrEqXZh6CRuTdDjiykbQROWAUVOzXBIZhwVcSNo
        /2/veby5qyBlXodk2T7MnJoUQ2sbltLMxKSwxlq7f2Jyx6hnNtbiwiV2yLHES5z0
        8Qm+LkaCVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=jxsTM3TCvAndNgZoeMwg06XPhVO+w
        /RBCEvagbe2Oso=; b=LbpljpMJxjHVgbZloZi88N2k62cbdeehk9pIsmGSvl9WT
        yNlHAp3IsFWASjAwQSjtWxzzkMT6jI2w0NyRtwRxxkfUU4SyM9LHucIqiz3V6sqL
        yGhZiAe71JCprsUx3JC0f5xVd4V7oaES0vbsl+R7UbyEWKjvT1y8bp0oNqycgMoL
        Y8aPthkZqhhOLqPo6HbmQyizttIkEHG/mbV8O6BsqVg328hMasVxtTDtyfNu7XoV
        a++I4ygkHk7HHJPPxgPPDN9qgiAKVRTBTlLVnH1TtsNbhOohpUa1JkKWLqhiGDDz
        6d1fa73+lVsxoiVfkdHuRKR25S8WrhdeO2TpBLeQQ==
X-ME-Sender: <xms:pk5SXKE_F7m9fzBF7IivSe8OR033boJOIoaNGp_2aLgCsjpCk3BYFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeehgdeffecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
    tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlfedtmd
    enucfjughrpeffhffvuffkgggtugfofgesthdtredtofervdenucfhrhhomhepfdfvohgs
    ihhnucevrdcujfgrrhguihhnghdfuceomhgvsehtohgsihhnrdgttgeqnecuffhomhgrih
    hnpehlfihnrdhnvghtnecukfhppeduudekrddvuddurddvudefrdduvddvnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmvgesthhosghinhdrtggtnecuvehluhhsthgvrhfuihiivg
    eptd
X-ME-Proxy: <xmx:pk5SXPmyoZmtnmsbftkRBe3xCW3unwqTGxtgICoZh7BFujMG0s9Z1w>
    <xmx:pk5SXPLW213j9YhiYy-aS_1sGGmPXAapeFMKE4dMgxU0A6lZPEUWXQ>
    <xmx:pk5SXIb6zouHu7_H8sRoYJwStax340Nlg3bkxL3ojFj6_tuZn8RX1Q>
    <xmx:pk5SXGPNBHa9RrGUGSzR1qYiREYPY8B6V9DrLXIEb-niVAqBe-X_Ww>
Received: from localhost (ppp118-211-213-122.bras1.syd2.internode.on.net [118.211.213.122])
        by mail.messagingengine.com (Postfix) with ESMTPA id EF2C0E44A4;
        Wed, 30 Jan 2019 20:25:57 -0500 (EST)
Date:   Thu, 31 Jan 2019 12:25:53 +1100
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: docs tree
Message-ID: <20190131012553.GA30122@eros.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: Mutt 1.11.2 (2019-01-07)
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

Has the docs tree moved?  I haven't fetched it lately and this morning I
get:

	$ git fetch corbet
	fatal: unable to connect to git3.lwn.net:
	git3.lwn.net[0: 45.79.184.34]: errno=Connection refused

All my other trees fetch ok.  Relevant .git/config entry is:

        [remote "corbet"]
     		url = git://git3.lwn.net/linux.git
		fetch = +refs/heads/*:refs/remotes/corbet/*
		pushurl = no_push


thanks,
Tobin.
