Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFD2C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 12:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236319AbhLGMhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 07:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbhLGMhY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 07:37:24 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A6BC061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 04:33:54 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id 8so13350486pfo.4
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 04:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJbaQ99qibYphgyzjubtU/OGIhjqPuwvSJDoYYgyMQ8=;
        b=FL4yxKQi8Jtk5lvTs1rv1np84ivtWmrugDV6n0d39a+up5Ev/0hB/ZfDdBRkzAajCB
         4xOS/ck4V2jHVzcdR3vEqlekUbSXUYeQStms7hDlhtYIWQ1vOgKWjmy58Eax7ZWH2sHc
         d9ZHAWU+fMAfNBasFdu5fuswoJOZM9ZfWQkUy2VoDNnx1oRhg5EmEvZjG0jb1nQi869P
         DCX8SJcsUB94fOS2rxNqABWudGxfzAoJK2Dcy5XrXK6F0l7M8sOpEpmDKevTKE6yZUMZ
         18t7w9VCMSFUEqV4I4U0psa6Spa6zi9TCQCtHz1ZRP+bOGXntQPAGAmLdpmoZJhShS//
         KfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xJbaQ99qibYphgyzjubtU/OGIhjqPuwvSJDoYYgyMQ8=;
        b=PGfj7Uk/9WrkbZTk+7jCXpEuiLwGXdWd3omuaSsBjdxZbn9/CsFeFPw1AhtK6rIZal
         HXgK4RUHEL0P8TAXKFUxgwn9yVcP9t0AN1Xa2LvILD+Y0XRtNudiM80kJxdXOjXno0Yx
         jz4fMLE5vL6Ffh1H7mBvR6bGrVTalmUsTiOeTF0vrGl5spF93/m7oBrazPrGryF0S9bk
         LudriqQ+GXqLMPHpwSrnmEKswbYZob96rrhgPY0ZcyIfQYzgK4XUmap7jN4b1vFC0EDn
         gt7yJh3w+4NbQtctnELBdDxbrNT5Jw/4t2Viv9HnqtUlKvMd3OJdf3PyNkKLvOrYK1Du
         +NWw==
X-Gm-Message-State: AOAM530R5GgtMSkE3Vh2ZbbQ33u9BTKa7W4LF7BF9dKBefpNzmRM5mev
        piXawQKXU4tkDkMIeVIknjU=
X-Google-Smtp-Source: ABdhPJzHiX+IRmLcfZG020HYDsFgmXEOPuLyU2ZhPky0p844mvRMEP0Nibd1dG/+KVpZOIx8JHax/A==
X-Received: by 2002:a05:6a00:2444:b0:4ab:15b9:20e5 with SMTP id d4-20020a056a00244400b004ab15b920e5mr27483414pfj.0.1638880434211;
        Tue, 07 Dec 2021 04:33:54 -0800 (PST)
Received: from localhost.localdomain ([8.45.42.185])
        by smtp.gmail.com with ESMTPSA id q18sm15165028pfn.83.2021.12.07.04.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:33:53 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     broonie@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, lgirdwood@gmail.com,
        siyanteng01@gmail.com, corbet@lwn.net, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2] regulato: fix bullet lists of regulator_ops comment
Date:   Tue,  7 Dec 2021 20:32:30 +0800
Message-Id: <20211207123230.2262047-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 89a6a5e56c82("regulator: add property parsing and callbacks to set protection limits")
which introduced a warning:

Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:96: WARNING: Unexpected indentation.
Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:98: WARNING: Block quote ends without a blank line; unexpected unindent.

Let's fix them.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
v2:
* Add blankline.
* a text Block which should begins with a "-", followd by whitespace.

v1:
* regulato: remove unnecessary indentation from driver.h's comments

 include/linux/regulator/driver.h | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 66219b174a8a..0228caaa6741 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -90,15 +90,19 @@ enum regulator_detection_severity {
  * @set_over_current_protection: Support enabling of and setting limits for over
  *	current situation detection. Detection can be configured for three
  *	levels of severity.
- *	REGULATOR_SEVERITY_PROT should automatically shut down the regulator(s).
- *	REGULATOR_SEVERITY_ERR should indicate that over-current situation is
- *		caused by an unrecoverable error but HW does not perform
- *		automatic shut down.
- *	REGULATOR_SEVERITY_WARN should indicate situation where hardware is
- *		still believed to not be damaged but that a board sepcific
- *		recovery action is needed. If lim_uA is 0 the limit should not
- *		be changed but the detection should just be enabled/disabled as
- *		is requested.
+ *
+ *	- REGULATOR_SEVERITY_PROT should automatically shut down the regulator(s).
+ *
+ *	- REGULATOR_SEVERITY_ERR should indicate that over-current situation is
+ *		  caused by an unrecoverable error but HW does not perform
+ *		  automatic shut down.
+ *
+ *	- REGULATOR_SEVERITY_WARN should indicate situation where hardware is
+ *		  still believed to not be damaged but that a board sepcific
+ *		  recovery action is needed. If lim_uA is 0 the limit should not
+ *		  be changed but the detection should just be enabled/disabled as
+ *		  is requested.
+ *
  * @set_over_voltage_protection: Support enabling of and setting limits for over
  *	voltage situation detection. Detection can be configured for same
  *	severities as over current protection. Units of uV.
-- 
2.27.0

