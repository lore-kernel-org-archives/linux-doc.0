Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0B7C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  7 Apr 2022 12:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245287AbiDGMkA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Apr 2022 08:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245292AbiDGMj6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 08:39:58 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F0825844E
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 05:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649335076; x=1680871076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AHFecJtTnXKctSENm8ITt50lChhW2egFo1kg2CIowKg=;
  b=HCZA+CUXn6VzcSStLrhTc97V47CgNju1riMhKig2VSkODSq53l5vMo5q
   pUv2PNJZzuY9onQiA1nIm1QCrpdsLyEHvywG5WIAD99QNdaJv93cTSpn8
   LPT4q3NmAr1yECIHYBy6OjdjGIi9c5beybneTYe8DCMGDNuiKGBB8LC/b
   hMIbc3SAIxQlHUsTXNvDOM5oq4Si3ncNPByBduyF77pKTlt9/ipYCyz5J
   U9YaRFDauS4FlL0xzGpKBzoFBaUOlz0l+xjnHSel+xE+ryAwDyLicmP2Z
   fBd8Pl3LYh5XBEO2gebVD6SWy+Dsn1OXn/yJhTcyp2BGe1gn6yxC8toRm
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,242,1643644800"; 
   d="scan'208";a="301515563"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 20:37:55 +0800
IronPort-SDR: 73C2Txmgr89ddXxY53fAkkkp5vDw37ztDFFubytH4m3g/Ei8Pd5F/pRHC4xbHvpivkjOVdt5gX
 p7uRBb4HOHoYRjeWuFPYKAg3lmpmu0p2ZiQ9bb6buDKFRVqbP07AUNth4nOF7iwze4lSndVnAZ
 r9WHlJ5WpLyzmHOOUvf55uBKcKnyYql1yhnLz6l35vA9D12/P8dgbgqXHH4o3flr6YA158iMOD
 DWcW/lryqt7QCGdyHCzgl2Hg8d7wZmQd2073KYUMr2wbgapILpQxm8ZqzGtGclW4klbmokGtH+
 JtjmV3YkPHH43QbcbOMc78j1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Apr 2022 05:09:25 -0700
IronPort-SDR: bwNXFRWrii3t8rz6YSCKYbt6+IJoMsEGRUsJIYEpmpNPzu5lKIYDt8dEkSy882czFYxXZauoUN
 /n1d1jh8/Y+/D+VcA+OcOBfg0eN97jlv9EcnthjdF+lDQZg7o2zJ3rY0FnnZ1jBsT1Txrgb6K+
 yjhntrbd8tVEC9A+/Ma3xAGeuqy/ly5g+EHpF5Tu4gycAXRD0CZedvd3SOuWOLc0JK6S+deP1Y
 t1jIJGiinhxdIf7/WjppVk9bsWgLbP0lOEOWNOgbU9YGdq+3XkuaUL8AN30R4CLizqLso8Yf50
 WeI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Apr 2022 05:37:56 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KZ1BC3KcWz1SVp2
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 05:37:55 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:mime-version
        :references:in-reply-to:x-mailer:message-id:date:subject:to
        :from; s=dkim; t=1649335075; x=1651927076; bh=AHFecJtTnXKctSENm8
        ITt50lChhW2egFo1kg2CIowKg=; b=fLIQArLY9PONgyIuIa7283yM1hIr/+dj+y
        ANkgk7RzwBt2scHov8XFtPtb6L2CrqXhxMTXlK7Dou8s9bZMhZtGe8PvuWc36Q4v
        yOEt5QQ2xgPJSqz0wravc8yFrdm7RR2dX4ev25eJEX1s3cop9HNZxDQTK5FEODcf
        sTjIgNxw4n221KSYJqHr2cwcr3+gp55bIMqx+GmoMBGy78OZXN8sUf8diAX0yxfq
        nYDArikXcUgKEIKb4uPVMaKZQB6crw+vmrFOkGwPD684vUqMN3o+yK9sHn4nbbVv
        rSVhK7j2gD+H/s8txW+u7wNBwkSqX2ciOLqexE943/5txoLUit3w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id eO1eKMGpN97p for <linux-doc@vger.kernel.org>;
        Thu,  7 Apr 2022 05:37:55 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KZ1BB2StMz1Rvlx;
        Thu,  7 Apr 2022 05:37:54 -0700 (PDT)
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH 4/5] ata: libata-core: Allow forcing most horkage flags
Date:   Thu,  7 Apr 2022 21:37:47 +0900
Message-Id: <20220407123748.1170212-5-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
References: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

To facilitate debugging of drive issues in the field without kernel
changes (e.g. temporary test patches), add an entry for most horkage
flags in the force_tbl array to allow controlling these horkage
settings with the libata.force kernel boot parameter.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 drivers/ata/libata-core.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 75856f4210d7..121cb55a219a 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -6230,9 +6230,27 @@ static const struct ata_force_param force_tbl[] __=
initconst =3D {
 	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
 	force_horkage_onoff(ncqati,	ATA_HORKAGE_NO_NCQ_ON_ATI),
=20
-	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
+	force_horkage_onoff(trim,	ATA_HORKAGE_NOTRIM),
+	force_horkage_onoff(trim_zero,	ATA_HORKAGE_ZERO_AFTER_TRIM),
+	force_horkage_on(max_trim_128m, ATA_HORKAGE_MAX_TRIM_128M),
+
+	force_horkage_onoff(dma,	ATA_HORKAGE_NODMA),
 	force_horkage_on(atapi_dmadir,	ATA_HORKAGE_ATAPI_DMADIR),
-	force_horkage_on(disable,	ATA_HORKAGE_DISABLE)
+	force_horkage_on(atapi_mod16_dma, ATA_HORKAGE_ATAPI_MOD16_DMA),
+
+	force_horkage_onoff(dma_log,	ATA_HORKAGE_NO_DMA_LOG),
+	force_horkage_onoff(id_dev_log,	ATA_HORKAGE_NO_ID_DEV_LOG),
+	force_horkage_onoff(log_dir,	ATA_HORKAGE_NO_LOG_DIR),
+
+	force_horkage_on(max_sec_128,	ATA_HORKAGE_MAX_SEC_128),
+	force_horkage_on(max_sec_1024,	ATA_HORKAGE_MAX_SEC_1024),
+	force_horkage_on(max_sec_lba48,	ATA_HORKAGE_MAX_SEC_LBA48),
+
+	force_horkage_onoff(lpm,	ATA_HORKAGE_NOLPM),
+	force_horkage_onoff(setxfer,	ATA_HORKAGE_NOSETXFER),
+	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
+
+	force_horkage_on(disable,	ATA_HORKAGE_DISABLE),
 };
=20
 static int __init ata_parse_force_one(char **cur,
--=20
2.35.1

