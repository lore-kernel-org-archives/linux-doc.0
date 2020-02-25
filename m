Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79289C4BA20
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E25B24650
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 23:46:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Krc9sIse"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgBYXqy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 18:46:54 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54109 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbgBYXqy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 18:46:54 -0500
Received: by mail-wm1-f66.google.com with SMTP id f15so265294wml.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 15:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TYlyvESdtJkkzEIVJoYhQjClltnzu2fIaM1HVjBTbAU=;
        b=Krc9sIsewtpswOvKmk7/S+COuYzreBWD7Ca8jY17fZ3k6AjVVACajXiS4CMmO1Nwtj
         v8D7QrhulrHl9PWsix3qtVdoUc2Z8N6LW9X0B7qS0YEKS5IP19BbEUnU++EaiUjj6wci
         KiRACC46tsHkWepzwmCV9H+GZZHdDtj4UyIxnM/IRi47C99hdartYCGwy3BZ0xASNVP+
         MDXYP48thmVn9W5WTj36Vv0peDrX/4uGae7VRvlPqThnWBRRgrTXWvdiSL88lAULo4Dx
         h6br15BkZNibYmn5UzAy/nL1OWM3dcCqrOunkGIbZP4T1dlmHaldJ/e+1HE3qalfG4tK
         03wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TYlyvESdtJkkzEIVJoYhQjClltnzu2fIaM1HVjBTbAU=;
        b=r7VXKoy85QP0hs6DMx6G5toPEm77ZZDYYLfmQLwC7sT0mGOByfN7BH4ELVTg/7HytO
         8xl2dvf78n6kdfi5ncW/MnuxwwfKhkpnsV4j2kzLzXlmNjSO6zMJ/MnpiKMRdyR9ykOf
         ag0VhgM92FmpTAjTJHUyTUfQwQCI6hGcECqO5sh3UvBGpxB3hEN89TQBwRMGUThTdvEm
         q712ozDiKEZol7vvxz68wI3PwasCiq4g2+Qj4tZUNDgxg2H2+zbsjFsExyoDs4Y2G8OF
         7ul3hLryeOb0eYeSZz6wg6qIHqmQVGcd7/8onjx2D/RgUjPn1lBA3DHH9LElIP3SKwqz
         Bu/g==
X-Gm-Message-State: APjAAAURC8tQUzFDQtn44xklQkee9lx8T2Vv3jfu854CEQMlynt6ZTMW
        mwrtALZRhg3S+EJk64sKXiFMEQ==
X-Google-Smtp-Source: APXvYqwY6Dl9BUk+IfJpxezAcmeZBSNghy55b16qrsor7bN8A4eNGfhfbLFlczmxqOt85MjNWpJtWg==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr1582353wmc.52.1582674412106;
        Tue, 25 Feb 2020 15:46:52 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:186c:5f6c:221d:5ce])
        by smtp.gmail.com with ESMTPSA id t133sm356278wmf.31.2020.02.25.15.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 15:46:51 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v10 15/15] Update MAINTAINERS to add reviewer for CoreSight
Date:   Tue, 25 Feb 2020 23:46:11 +0000
Message-Id: <20200225234611.11067-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225234611.11067-1-mike.leach@linaro.org>
References: <20200225234611.11067-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added myself as a designated reviewer for the CoreSight infrastructure
at the request of Mathieu Poirier.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80e908129509..a2ef2633ddea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1676,6 +1676,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

