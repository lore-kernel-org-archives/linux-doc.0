Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D43DC43381
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 13:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71618239D4
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 13:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbhAUN54 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 08:57:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbhAUNqt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 08:46:49 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67433C061793
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 05:44:46 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id by1so2698573ejc.0
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 05:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHgMDVFVKDKvtDgBJ6bSsn28+Hx3KTR2/9Rg1yeA1/0=;
        b=Epwg9MmfT84c7AZZSAtt3VkZJXSsj7soBPEhI9/0szwu/a7jQ/4TyrgBWqo2W3aFbu
         LMvaxbnkL23je/wK4jW17vQvw3ya02FEgNyU1/8YzKqq00rSXTZqNN4LzAcE9pDtqe8p
         jPGaThFu2UI8UuVqxW3fJFDeCl0U3YJRu3GFt92vr3FxqMWbv+jPMHgz2H4v82ocFTs8
         sLYqRvLcYJ98CJH/WET1F6wa+Oi+L1cghXBgEEppRk9lfVxoZLuSmDRfM6NmBkYUetkv
         mner/MhldDpbAVP6hI6RSyzfowsl8ThOcpxog3bsHPdXNwLn+1gduH+OxbiJMHd7exqZ
         QwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHgMDVFVKDKvtDgBJ6bSsn28+Hx3KTR2/9Rg1yeA1/0=;
        b=cHTcw9uAuDwR+A9WZl3jSfYrphFYCmWIbrCbMOuGqbfTbeGZtuflOUHBCaveWXpaTT
         yjMaqP6Gsm7HzcbLxskfqU4yCAR71z8flHhiBCU7rjdsbZAUTZQj1lpR5grHuIksVYh6
         4mTxDnlio4timmgr2nFfP6OXzOjlRJVolp9yGrkv57+0vLFPyB3XzrJbzcTs6KGus+cM
         waft3d1ZnQQ0cNDEsussSD1qQWpLCfr3v+jfS8o3Lpt23RTHH2wjXKMRwdIhNWkVH8mC
         OxcjxRu6PIgwHeWOR7cyl1F2F1jt4EqMX8govu7C6Wk9Z+YjIi1lVnPK6e19yuRnvWBC
         0tyg==
X-Gm-Message-State: AOAM53132VUX20jxwOs+9pDqtegH+ASJrQpqG9gffGjy+BfhCsJHC3pP
        CUTQGL7l8CkgeE9EeDjziQecQg==
X-Google-Smtp-Source: ABdhPJw3ZMcxnyc5Cnx5632MdTcRNssQjZ+YXRIFuTN+Zk3DUq06EZWaz1Nq8Laiz6fUfz7LyHJAjg==
X-Received: by 2002:a17:906:7798:: with SMTP id s24mr9380830ejm.19.1611236685185;
        Thu, 21 Jan 2021 05:44:45 -0800 (PST)
Received: from localhost.localdomain (dh207-99-51.xnet.hr. [88.207.99.51])
        by smtp.googlemail.com with ESMTPSA id j18sm2246376ejv.18.2021.01.21.05.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 05:44:44 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v5 3/3] MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE
Date:   Thu, 21 Jan 2021 14:44:34 +0100
Message-Id: <20210121134434.2782405-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121134434.2782405-1-robert.marko@sartura.hr>
References: <20210121134434.2782405-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add maintainers entry for the Texas Instruments TPS23861 PoE PSE driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes in v4:
* Add documentation file

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f95e887e5d76..2a7f22587774 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17602,6 +17602,15 @@ F:	include/dt-bindings/soc/ti,sci_pm_domain.h
 F:	include/linux/soc/ti/ti_sci_inta_msi.h
 F:	include/linux/soc/ti/ti_sci_protocol.h
 
+TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/ti,tps23861.yaml
+F:	Documentation/hwmon/tps23861.rst
+F:	drivers/hwmon/tps23861.c
+
 THANKO'S RAREMONO AM/FM/SW RADIO RECEIVER USB DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
2.29.2

