Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 34DEF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 14:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387541AbfGZOm2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 10:42:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58686 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387508AbfGZOm2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jul 2019 10:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Resent-To:Resent-Message-ID:Subject:
        Resent-From:Resent-Date:Sender:Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Sender:Resent-Cc:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Phy5XDngETsW9sBLZfyPtiYDuQsve7+De1x9Fhgug7E=; b=BTQ9pfaBeV4XkHDqlVRYIvuqCE
        GCXbgJzjyjVsua9XlFGMYPTi3WNzm9PWm/+jrsbRoZ/EyRD/W+tqbatfl9aUdHd0gVAgEIu3VHXKW
        NUXQxa3uFEjTMEOGI928DHWoP9hwDoOkFsHXqcvTWwgDGW2V2LzwBHqCy8h5IVnWkXkGzsrLca8sk
        mVOa3J17B07mkzD8psevu9lfTuDeo8lPH62+RfxsbWLPzuy9sVNrHGgp/c/sO7rOr9PE1tyViR45l
        FOBESazxiY7JCQNnLfcGDjw7kWExip3Ucb29xcf1EbgWRDiRjEUJxB49j2Zji6by0Nz//1GNubfE+
        lozScyNQ==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hr1QS-000501-0G; Fri, 26 Jul 2019 14:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Phy5XDngETsW9sBLZfyPtiYDuQsve7+De1x9Fhgug7E=; b=rRqfRMbZuXs763LeCO3FwkZrlj
 /mfWCsD5IlPdN5YfY8yk5uN46V268DHjV9k6e8ipQTKLl5O2WDud5hAAdHdvsUDUN2Sba+vmNOHCS
 i50Jo4orb87WdNdrrEyLrY2htgq/skTnw9PKsadgwppSJmOdmoXmQhXrDEv6/CdjM5m6V2XG9pynz
 qRtIgE3AoU8htHGGj1ah+nkZe7Ugj4gc6naH6O6qIA0Dwsaki4mxzHOlGwWAJhjZKqBzMEPB8UvEg
 FqQPo4ykAu3ZY4ySJTDRHAlfSf8vbVV4gYrkb+0clSsyXTlPC7mC9dmk9ZMUJbt/eYUoeIdq4z5wh
 tZhSM04w==;
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qPS1241m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3509322CB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=mchehab@bombadil.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Phy5XDngETsW9sBLZfyPtiYDuQsve7+De1x9Fhgug7E=; b=qPS1241mP7CmquAYyyjjhRqEDl
 OeVd3gYIpPZPhWDL4ctOtVPSTtF2i3Ar/G1t5xhU3CjfFWWgU4pMEBKsxQa0KS1yMr+DpAx0UlI1P
 7OiI507/7BvLOXkjUaa2yXHhxI9cSFnUpd7sacZKwPbBbdDdm+5IpawMBYmWkHRjFdlf3wHTv648x
 ip7iqBzRd10KZV4Hfi4ARMhpHn16qMckelpf/DWZcLfvqMW4z0b/GC9/DZVx5YyLBlcw5fSPjMusn
 doWB23uRH6/Tx3fmShV5DmC5W6h5SKeeR8j1S0OVVfPr7uh5yJqOZ6i2zF9KWUKFYA61HjBzNOJ4i
 agiUUhiA==;
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org> (by way of
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>)
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Fri, 26 Jul 2019 08:47:27 -0300
Message-Id: <9932608f32030c886d906ea656eda8408c544776.1564140865.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1564140865.git.mchehab+samsung@kernel.org>
References: <cover.1564140865.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_124746_246988_B7EA6577 
X-CRM114-Status: GOOD (  14.09  )
Subject: [PATCH 7/7] docs: dt: fix a sound binding broken reference
Apparently-To: <mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)

Address this rename:
	Documentation/devicetree/bindings/sound/{sun4i-i2s.txt -> allwinner,sun4i-a10-i2s.yaml}

Fixes: 0a0ca8e94ca3 ("dt-bindings: sound: Convert Allwinner I2S binding to YAML")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
index 2ca3d138528e..7ecf6bd60d27 100644
--- a/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
+++ b/Documentation/devicetree/bindings/sound/sun8i-a33-codec.txt
@@ -4,7 +4,7 @@ Allwinner SUN8I audio codec
 On Sun8i-A33 SoCs, the audio is separated in different parts:
 	  - A DAI driver. It uses the "sun4i-i2s" driver which is
 	  documented here:
-	  Documentation/devicetree/bindings/sound/sun4i-i2s.txt
+	  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
 	  - An analog part of the codec which is handled as PRCM registers.
 	  See Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
 	  - An digital part of the codec which is documented in this current
-- 
2.21.0

