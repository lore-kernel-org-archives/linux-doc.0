Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA4F57D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387542AbfGZOmn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:42:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58706 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387508AbfGZOmn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QvcsbAm0ge2AGdT/bzu+j2dPDPaGmvlR7ihMW0RLj+w=; b=c9jHTmVLzYz6I79M1HkLcaBiwy
        6xeC+XlJxkjMwQuvROTyI4X3h/LDtUmg43qaEo8DTKw7xRr89DmrRhds4Hs8g0ICCsN+woH2SKIUr
        K0hYajdjUyBY6YZB2W6jqE1H8Qrh8b9K5luNJflTTuWD0ns9nuHDjx+pB9jmfjMxv4Tprvp06BCw7
        WnfmNSUlMAtVwCJtm9U9HLfGo42f1gxni43vpzDgwjpuh0I0ZvLY8TNeDX14U6TJatyhlA0TRHq9N
        B3eCP+TohxxVLXN6TlP+yfsFU0u2fKju693TmatLn6UBOVoRXg1GdmK2+SxNVjAjZg5KzazpFfNMa
        fxLD2NPg==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1Qg-00050d-Ct; Fri, 26 Jul 2019 14:42:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvcsbAm0ge2AGdT/bzu+j2dPDPaGmvlR7ihMW0RLj+w=; b=nFDV7scxCbsstjGaUShq8Xob94
 q4dbdatFWnClU9DE3C7xE5+vFordgCDzRGlwCZ2GEX9gPqnU8g9wsVLHZEltRj1fH1SAjhBUQOm0R
 D9gXhtIsYI9XOgg8DhPuQ/MMDw7Km57q99V8To9yHiWdihuirXAcnt5lIEyqUo4hpL4A+/pmqi5KM
 eAbdh/H6yzg3XU+VP7PMDaxz6wZJYDQMQJoyXdmvTMKVxoCNCI4OX/o5MEZFp1TvxdaLs1NZy/JnF
 knDB+kNiNqG++WKDSEkclIQijF56gFB3onEafkAeQWaSrC5SZMowngMcCz3OAGVn3uK+Oxxg7SRzX
 9BEEZgxQ==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YI3o4ccZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51340229F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvcsbAm0ge2AGdT/bzu+j2dPDPaGmvlR7ihMW0RLj+w=; b=YI3o4ccZkacLFTjzYQ0/j09gFB
 tG2XaKTFUJT2OjkIh/2XRcnyas0f/fWrEqEbjiRv4qXbk4hdlOckEdTaUpWm0lVQfhDZOyvZc3r1T
 m+SOmywMPgH/TuOg40CXuMFh0HuUvmlgKk/j6O6x4ww41FyzD9+n0ayWghMnL0CF/5/iZqcBOyTx9
 Ot08l6UKftpNGzsxvnBzyPZx8NLEyuHpyfDtCU1j7F7ezwfpIp3Y31HeROQOwIfVm9nSApK3jexQq
 JP1kWVJADbmDvsh0PLoAOKdalCEqXD7/8FaJVxBabWyN0W+ZE1CeDTlbx6G+dzhmCLCNvVhODXrnx
 AU2jpF+w==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Date:   Fri, 26 Jul 2019 08:47:23 -0300
Message-Id: <9886234f4937c7d4a487ef9fd22889b31d7ee132.1564140865.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564140865.git.mchehab+samsung@kernel.org>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_124742_924212_CA354FB6 
X-CRM114-Status: GOOD (  11.72  )
Subject: [PATCH 3/7] MAINTAINERS: fix reference to net phy ABI file
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

The file sysfs-bus-mdio got removed in favor of sysfs-class-net-phydev,
with contained a duplicated set of information.

Fixes: a6cd0d2d493a ("Documentation: net-sysfs: Remove duplicate PHY device documentation")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51bdbd230174..17ec9abcce52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6061,7 +6061,7 @@ M:	Florian Fainelli <f.fainelli@gmail.com>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-mdio
+F:	Documentation/ABI/testing/sysfs-class-net-phydev
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/networking/phy.rst
-- 
2.21.0

