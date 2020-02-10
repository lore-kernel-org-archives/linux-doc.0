Return-Path: <SRS0=rYvz=36=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3341CC3B18C
	for <linux-doc@archiver.kernel.org>; Mon, 10 Feb 2020 21:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0511B21734
	for <linux-doc@archiver.kernel.org>; Mon, 10 Feb 2020 21:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gFdoLe7z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727597AbgBJVkT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Feb 2020 16:40:19 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52369 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbgBJVkT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 16:40:19 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so924297wmc.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2020 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SCiRbjJzZzwrllYyfm6P2Mav2in2VZ7vyAfMSm3q4rc=;
        b=gFdoLe7zW3MzhxuT/BRGf8IFSl2qk9HwrXAz4eHkASYgHa1YIVtZBeDmPtVMCtHeNv
         fKIWXhICFvM1YHmYoq0KJv4wI0rwtVNK3Us+gAGivIh3w1dvBt6jBYWC/1xLf+Y3q3Ws
         2kd2nVlYxkNbqDDYNMEZFDdt/id6ZeUBG35a2MDxwtwjL00cZoQrF1QhTHzIMpoJeZei
         WFwaOpiso6d9BCnytx05rJIoCarFATvyc6sEVm/QrAsQc5uxo2OLdwHd6iwJ7zbJn50x
         eMbggHJMDWvQkauMpLGUY/KFc89zr77k8PbN1CNzRbzfO/Q5AVEVTLK/OwxVFF2tXv0O
         EFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SCiRbjJzZzwrllYyfm6P2Mav2in2VZ7vyAfMSm3q4rc=;
        b=JYErOfYl59Hrylkjxj9ln1WklIP8nyM/MK3EXsI26TvKgLZTR0GTfFaDcCN+eFkkG2
         ozUzbVRJUotggUzft2cDBJ2/dwDGDIR/AfZFYWeH1KVWlJ5Cb6HFaPVZxsCoMxLh4nH3
         UA2i/O9g5AJ5Eljn7k6N4o7rpRuB86yj5oZvhXEzLWeQuUXtPIlqBqDffDkv00bvQ9Ft
         xh+QjTynJqwRG9eJGlkgLb8d7sU+Zh7sUsXg5yqd0nf8WgsrDoFI8p1iNOo5uAV8NaFE
         pebuF3tZmpuBylwQHHWgep8Pw5RlXM4oXvUym+NZ165LKodtOs0HDqZtUesKLYFXeMVz
         qYqA==
X-Gm-Message-State: APjAAAXY7ncBnw3RPb1NccqJAbl+2zY5RkE0lEGVemy2WgZm61Cs9A85
        4ss9YMhvRkaxSAGqj0GvFqSY0g==
X-Google-Smtp-Source: APXvYqwQ/YYU75x4QkwRfXeToVq56G39tKupvt9fLKoHnEygZ9u9x+PZB6YHn9wuXHgKPAYc4sSLUA==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr969416wmc.119.1581370815993;
        Mon, 10 Feb 2020 13:40:15 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id u14sm2118582wrm.51.2020.02.10.13.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 13:40:15 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v9 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 10 Feb 2020 21:39:24 +0000
Message-Id: <20200210213924.20037-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210213924.20037-1-mike.leach@linaro.org>
References: <20200210213924.20037-1-mike.leach@linaro.org>
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
index 20a6557f157b..dc9e9776c001 100644
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

