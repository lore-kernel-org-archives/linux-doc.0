Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6481C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 01:35:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbiDYBh6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 21:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240175AbiDYBh3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:37:29 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B32EDB59
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650850466; x=1682386466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RA1Ay2qkBB1rB9TMmKbzRx1yRW6Y+GLFxl1gfChErqc=;
  b=NEgsuMR19g5LMhXBORTBjwmrP6TtxwYSyZB39s/+Tj2+7xTtfXUzrEjI
   4ewraZFYLWmLUL8g+IHejV4Uw84CWC/37XiZpogZxoynwbqaoA6R0hjih
   oS1opkmAG9gA/GgHH4Yk+J4l4i4n/fzHrODJqfisyXZa8Py+EGQbJbKka
   5WaU4+6OOp2BmLgKs2tbwxEfC22OHUl2atj1nxa0QaS+RuQfNZr2MG/Cp
   fV73bsYIiGTE4v9AINjs6IOlD0sEyKCnJXSm6BltpZ6aioxXZuDlqTZH3
   vkY+RzHAieFSvyNQLig7utGtUCc4Sj6Lr9MxMLLTqrCQz0k7Y17pX/TA3
   w==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="302917790"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:34:24 +0800
IronPort-SDR: x0dcTVKdKCtADqsHjvLd0jdSVc6uqjUSYcddf5WjwrnxL7FzPCV0cRpkQSmWBiqAnv+xxUan5n
 hqe3LQ7ESgte0U0hmz/aDAwJh1Q4JRxoNklSqeZ+1qObOcaPx/2K9EkK3YMVtxYI6+n94gjyzA
 37yU93agkXdPLOcamRnaJWlFi16HgQdqqFvxuTYG5jbrExsyS8P/ihmN+8BhKGhCSYfzpGmOTv
 fdn95eIbh3rGi6JO94tDrUFQ3Ftq07La1N7CuRQsuCS9vh/xGWO3YdtlYWEkaX0mCeI7Oo+Qee
 6YdyacNsqc1xdGNCHLNP1gdC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:05:20 -0700
IronPort-SDR: efYPIu1MFOCnJvmBAXCwTUIGyYmSUpKGmiqzmoNd3GnPgDOQ5k1EMTbz7U9KAcCNN3UHEWzg+c
 qJGx4YG0qV3l82EGEqYMOstor57gSNGxDkKwIGMN/nG678P3DQAC8rI9LeZXT1E1EP+BCrexDh
 mYql6bGaOwwvOd7u8sk8/yli0B5KQFvYcIxXaqGIHvGtNW1DLevWYyehLskoWgBndqJi+MIrgB
 mU2we3t1uFtvZ3FtQB8oaMby1rlg+TCDiOwB9sNo1OPi1wI6rhpvx7Uy9jwa/0NMDvtD4QdyzX
 WxE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:34:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KmncJ01Mfz1SHwl
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1650850463; x=1653442464; bh=RA1Ay2qkBB1rB9TMmK
        bzRx1yRW6Y+GLFxl1gfChErqc=; b=JXuaai8f8ojmd71xDGW9KK4kp9O+dbxAHi
        xTBsepFKqPQPW9BsIsNl4KeiFL+acJl8TkhlA5h9MwcdmppXbuy4hSnf2p2HKQDQ
        3lCaSIjK6/wWTJrPRQvy31BTSkKXQ9hCV+DU6Aje3qwh6toHoFq9AbNU9E6J+900
        jcKzZrR5fwg8K2swRpZsOBivFsEN+k0JdkJGU6B3W0K+AHMgGS9iYm311rhwUsop
        ZKktqc5EHe6gkltrACG+J6Zrb7PwrCznN399H4IsQgSvvlkIbeIul6ldbK4AHo/I
        lrvTwnQyolInhqFQ/VSg5V2OB/mjJO/I1G79ixDoFNvzGAMqgmuQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vCPqP1FFFtUd for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:34:23 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KmncG5j6mz1Rwrw;
        Sun, 24 Apr 2022 18:34:22 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 3/5] ata: libata-core: Improve link flags forced settings
Date:   Mon, 25 Apr 2022 10:34:15 +0900
Message-Id: <20220425013417.3947791-4-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
References: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Similarly to the horkage flags, introduce the force_lflag_onoff() macro
to define struct ata_force_param entries of the force_tbl array that
allow turning on or off a link flag using the libata.force boot
parameter. To be consistent with naming, the macro force_lflag() is
renamed to force_lflag_on().

Using force_lflag_onoff(), define a new force_tbl entry for the
ATA_LFLAG_NO_DEBOUNCE_DELAY link flag, thus allowing testing if an
adapter requires a link debounce delay or not.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 drivers/ata/libata-core.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index dfdb23c2bbd6..e5a0e73b39d3 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -96,7 +96,8 @@ struct ata_force_param {
 	unsigned long	xfer_mask;
 	unsigned int	horkage_on;
 	unsigned int	horkage_off;
-	u16		lflags;
+	u16		lflags_on;
+	u16		lflags_off;
 };
=20
 struct ata_force_ent {
@@ -386,11 +387,17 @@ static void ata_force_link_limits(struct ata_link *=
link)
 		}
=20
 		/* let lflags stack */
-		if (fe->param.lflags) {
-			link->flags |=3D fe->param.lflags;
+		if (fe->param.lflags_on) {
+			link->flags |=3D fe->param.lflags_on;
 			ata_link_notice(link,
 					"FORCE: link flag 0x%x forced -> 0x%x\n",
-					fe->param.lflags, link->flags);
+					fe->param.lflags_on, link->flags);
+		}
+		if (fe->param.lflags_off) {
+			link->flags &=3D ~fe->param.lflags_off;
+			ata_link_notice(link,
+				"FORCE: link flag 0x%x cleared -> 0x%x\n",
+				fe->param.lflags_off, link->flags);
 		}
 	}
 }
@@ -6153,8 +6160,12 @@ EXPORT_SYMBOL_GPL(ata_platform_remove_one);
 #define force_xfer(mode, shift)				\
 	{ #mode,	.xfer_mask	=3D (1UL << (shift)) }
=20
-#define force_lflag(name, flags)			\
-	{ #name,	.lflags		=3D (flags) }
+#define force_lflag_on(name, flags)			\
+	{ #name,	.lflags_on	=3D (flags) }
+
+#define force_lflag_onoff(name, flags)			\
+	{ "no" #name,	.lflags_on	=3D (flags) },	\
+	{ #name,	.lflags_off	=3D (flags) }
=20
 #define force_horkage_on(name, flag)			\
 	{ #name,	.horkage_on	=3D (flag) }
@@ -6209,10 +6220,11 @@ static const struct ata_force_param force_tbl[] _=
_initconst =3D {
 	force_xfer(udma/133,		ATA_SHIFT_UDMA + 6),
 	force_xfer(udma7,		ATA_SHIFT_UDMA + 7),
=20
-	force_lflag(nohrst,		ATA_LFLAG_NO_HRST),
-	force_lflag(nosrst,		ATA_LFLAG_NO_SRST),
-	force_lflag(norst,		ATA_LFLAG_NO_HRST | ATA_LFLAG_NO_SRST),
-	force_lflag(rstonce,		ATA_LFLAG_RST_ONCE),
+	force_lflag_on(nohrst,		ATA_LFLAG_NO_HRST),
+	force_lflag_on(nosrst,		ATA_LFLAG_NO_SRST),
+	force_lflag_on(norst,		ATA_LFLAG_NO_HRST | ATA_LFLAG_NO_SRST),
+	force_lflag_on(rstonce,		ATA_LFLAG_RST_ONCE),
+	force_lflag_onoff(dbdelay,	ATA_LFLAG_NO_DEBOUNCE_DELAY),
=20
 	force_horkage_onoff(ncq,	ATA_HORKAGE_NONCQ),
 	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
--=20
2.35.1

