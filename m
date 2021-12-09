Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CD3C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:06:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233716AbhLIJKA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233755AbhLIJJo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:09:44 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A64C07E5C4
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:06:08 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so5750898pjj.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRXCyhw4wkhxfGMgjYl9BWVJU1I5JFOqnfHVC0lq1XQ=;
        b=NfAOJ0F7mzT/QBhXi19KwcewCbxHD5TSOaiy7k+W68jPJMvjKLZMk6CwL8oGTXYKnr
         +gZLJe3i+fCtZZKTtGWDlsfHWDSg7eBBCDKTqwVUfGlJA/5z3ejPJ+FPrymgBoWP11Ye
         ml4rHG5DtVCy4TZF3qlCVRfwatDrdWkX2Lm7oVZtXXBzmfk2+/ZJmNpkCzKcWE0FhWt5
         KrxegnGCgyfxfbN7wpZONV936OBE/tzJ0bE949947l4i2J7k9CGfemmnjVPZr2uNqokT
         a6znZ2+CeJ8zwRkty1ljcB93GYqpMJZwFC9RqL++dTBqNGcTXmTdNk4NQgtx0K9t+jU2
         h57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xRXCyhw4wkhxfGMgjYl9BWVJU1I5JFOqnfHVC0lq1XQ=;
        b=1DgChMXpZWtqc80iYPDkIeP1YZTirobw8YaFpGLt286EepAGBe0uHba7QhsljxW0Cq
         zT88A1281LD3IqvVH1FyzZi/HSNo1m4kJywAX6isVhaP0vaIvCdozXepUft8n+K0IHbT
         odkpLyxVqG7Jkbr8E1S8bN28R6gceQc54NBTtfCr7OcJsD5zSV2ZH+J1Z3AXlYhdlVr9
         07/m2C2JmOGoAR39/C1f+6LG6tbAEa8+9HKFfnScnR+UKbW8O/C0eNOEvlT8xtcrU+fG
         xbZCDJIwq64jJHF1VENJgKzt4uyI+ZXl+qqOtFzff2ln/2xvSBPrqSqBVIEAWslMLLzV
         gNfg==
X-Gm-Message-State: AOAM530708JYYe+l2iGCx3ehtV2KE11aBBN+WwLqtJybbL1lqMJhiGch
        v/Lz5jPGNQSPSF9NE8ueNSk=
X-Google-Smtp-Source: ABdhPJyILqYAPuXRLRTBz7Np3Bg946bWe8RjOjHLiwXDxNu66AbjK1+pbiKC4mtf1xDriLzeOeoQUA==
X-Received: by 2002:a17:90b:1806:: with SMTP id lw6mr13996766pjb.59.1639040768292;
        Thu, 09 Dec 2021 01:06:08 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id ne7sm8953874pjb.36.2021.12.09.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:06:07 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     heiko.stuebner@theobroma-systems.com
Cc:     dafna.hirschfeld@collabora.com, hverkuil-cisco@xs4all.nl,
        mchehab+huawei@kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/bpf: Add rkisp1 into index
Date:   Thu,  9 Dec 2021 17:04:40 +0800
Message-Id: <20211209090440.544128-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since cd42f8023f1 ("media: rockchip: rkisp1: add support for v12 isp variants") which
introduced a warning:

linux/Documentation/driver-api/media/drivers/rkisp1.rst

Add it into index.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/driver-api/media/drivers/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
index 426cda633bf0..9631115a710e 100644
--- a/Documentation/driver-api/media/drivers/index.rst
+++ b/Documentation/driver-api/media/drivers/index.rst
@@ -27,6 +27,7 @@ Video4Linux (V4L) drivers
 	vimc-devel
 	zoran
 	ccs/ccs
+	rkisp1
 
 
 Digital TV drivers
-- 
2.27.0

