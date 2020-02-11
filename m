Return-Path: <SRS0=kPt+=37=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0948DC3B186
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D54E320842
	for <linux-doc@archiver.kernel.org>; Tue, 11 Feb 2020 10:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ti4NKkbk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBKK6U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Feb 2020 05:58:20 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38136 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727878AbgBKK6U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Feb 2020 05:58:20 -0500
Received: by mail-wr1-f65.google.com with SMTP id y17so11731701wrh.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2020 02:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=Ti4NKkbkjAgYVP72llVKREnT/9iq3do5dLrmCumt+TOI+SGt9hfEaAZgn5Ew0AzAwV
         gwzbzeOhbor1ivtJLviXBrZ5vfC3P6SiwVn/0gf4JWCZDygh69+AJgmGT7B/DvqDc7Dn
         VpoDFz6rMuSFFpeQxm6aH+BSAiLyUp1e91X1Huiw6f3RUp2RHfjzDBfDlnrvBBrKqiya
         4cDXzmbSGe9Ohed78ODEM+2ZivdqetXAHsuvVLJs12MAA7FF58MUPzmsLT7K+lBr9lYn
         z45dm/tNFKi1gaMsNBCHs7oIXpY5jWVSm2TJ9d2BAjhKyMuo0HFkWEy5f6G1zWssc1G9
         0B0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mcjy2CEkG4vUV/6rKn0LaYo72M9aNFWzBHIkohtYboo=;
        b=lN3QpUmx+aejoqOkjQySe8zsIqnocr+ELg/oExQcyfm65WzI2++F2OUPtBBC1HTlPI
         MofwVVQkucRvq3npQegoHptBKfmC0Ze0GIWz40jXpp5hzkc62VI5wCQ3ov0ZacET2yaY
         xo/Q0QsQHyrLxXhw0r6Gv+RrXx3tHpuat/PW9g7oXYSVyTD68st4/FTgslB/yIjr6pB2
         6pD7pW00NhwHGWrJYEd+b4tLG1Q3W8sIfXQLVH0UF7xJboOzZkNyY1ToboCkYrpQwbhn
         lsVv2XWq9gQDzamSTKGSdiKfo4vAbNjF7zAbX6+PIT3KAAhqWpy+0SGEI1kvstprJfQP
         VLEQ==
X-Gm-Message-State: APjAAAU+DE3UPPRKFuDTOB+st87+mFzog7d41UHKRKr7CdLHhI/qX4Xt
        lCrZxIF+39lULhVfFBUB4CoGZboW9zI=
X-Google-Smtp-Source: APXvYqzot50fmcFXwimsQuijTt/kJOpNnHi0OoneA0dxGEX6mY5s1phjJSPIWu0s4zJMIXEsqz3BAw==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr8543403wrw.276.1581418698013;
        Tue, 11 Feb 2020 02:58:18 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id g21sm3171291wmh.17.2020.02.11.02.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 02:58:17 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 2/6] coresight: add return value for fixup connections
Date:   Tue, 11 Feb 2020 10:58:04 +0000
Message-Id: <20200211105808.27884-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211105808.27884-1-mike.leach@linaro.org>
References: <20200211105808.27884-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Handle failures in fixing up connections for a newly registered
device. This will be useful to handle cases where we fail to expose
the links via sysfs for the connections.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 10e756410d3c..07f66a3968f1 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -1073,18 +1073,14 @@ static int coresight_orphan_match(struct device *dev, void *data)
 	return 0;
 }
 
-static void coresight_fixup_orphan_conns(struct coresight_device *csdev)
+static int coresight_fixup_orphan_conns(struct coresight_device *csdev)
 {
-	/*
-	 * No need to check for a return value as orphan connection(s)
-	 * are hooked-up with each newly added component.
-	 */
-	bus_for_each_dev(&coresight_bustype, NULL,
+	return bus_for_each_dev(&coresight_bustype, NULL,
 			 csdev, coresight_orphan_match);
 }
 
 
-static void coresight_fixup_device_conns(struct coresight_device *csdev)
+static int coresight_fixup_device_conns(struct coresight_device *csdev)
 {
 	int i;
 
@@ -1096,6 +1092,8 @@ static void coresight_fixup_device_conns(struct coresight_device *csdev)
 		if (!conn->child_dev)
 			csdev->orphan = true;
 	}
+
+	return 0;
 }
 
 static int coresight_remove_match(struct device *dev, void *data)
@@ -1305,11 +1303,17 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	mutex_lock(&coresight_mutex);
 
-	coresight_fixup_device_conns(csdev);
-	coresight_fixup_orphan_conns(csdev);
-	cti_add_assoc_to_csdev(csdev);
+	ret = coresight_fixup_device_conns(csdev);
+	if (!ret)
+		ret = coresight_fixup_orphan_conns(csdev);
+	if (!ret)
+		cti_add_assoc_to_csdev(csdev);
 
 	mutex_unlock(&coresight_mutex);
+	if (ret) {
+		coresight_unregister(csdev);
+		return ERR_PTR(ret);
+	}
 
 	return csdev;
 
-- 
2.17.1

