Return-Path: <SRS0=MW2i=3C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19007C33CB6
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jan 2020 21:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DED0D2084D
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jan 2020 21:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nSSsL3wN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbgAMVcb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jan 2020 16:32:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38340 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgAMVca (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jan 2020 16:32:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so11387532wmc.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2020 13:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4kF+t8rXPA54fVuTBRUcpKVz9sRuckZYn+ok89LwgHk=;
        b=nSSsL3wNKADjnYoswmrLAY+33jqF6r+FDcxlo9OsRnMJ0T2auZ3PrF/zdkrJRTqMjh
         4NjAAG2VGq+sigYr2NirFf6BWoHbykE5YxWw0qRNDdVeub9GIZwYq2Ln/78QBlxSK9wx
         Z42a8+t5qhJIOB2S6HSW/i7DMuk9DYXzdxxoLTSULPmd90pk3eiSEP9Fy+9otsl62awG
         ndDdw0a3l3Vf3J1k+rXSwlOBwtmRUMElt4jQhVVUedpukxuPFQGJs6U3GPshcBPSIrar
         +IFbtndDnSvyXfOaV8Jd7hj41R/5LsYiTEVUWfeXxDIUSNWWD9MqOZ1ZRyv4XFZdqPHa
         FHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4kF+t8rXPA54fVuTBRUcpKVz9sRuckZYn+ok89LwgHk=;
        b=XzX3pmEmAdrkspOzU+SuFSLr53U4pGdgjHAg/LGbGIg6tkOGV8mdD/fPMAvmH4iyde
         vMoUeDuDGyYwSy9kqjrQ+JckPjR8RPEWCDZ8WmVp+VNa+NEP+9W3lhwfvkDFctbRdaGZ
         rxLiLaZW9viESh1PQSrCDRfD/7LKoVkZCULDWdD873ZXXM0r6oKEoNfrshHOQkAmUk5q
         ibTj6II2IOCzFr+gWH+hTYUan9aXaGQwTpnLNdZZZRNL14zb0XRlnlScgBJ4qwJOUNv0
         UmoV1Lw/App1rHtmzTDq9Pt5IxrT7hSIuH+x7lFfmufvnJydcaFQql/XeUKmztr39Z3p
         /O4w==
X-Gm-Message-State: APjAAAVLYcUIllfcDmN36MJWBqM+Bz4Tbx7nZ86OKPuueQIrwjA/u1iT
        uulC/RALzvaybICdj1HWAApvtw==
X-Google-Smtp-Source: APXvYqyTWc0+SVAQ2AospY4KCF9spziSZOcoE3VBHgOfx5hKYIhcnlE0z6vuyV/6QSBoTHI4qG3BMQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr23287336wml.55.1578951148810;
        Mon, 13 Jan 2020 13:32:28 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id j12sm16725120wrt.55.2020.01.13.13.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:32:28 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v8 15/15] Update MAINTAINERS to add reviewer for CoreSight.
Date:   Mon, 13 Jan 2020 21:31:49 +0000
Message-Id: <20200113213149.25599-16-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113213149.25599-1-mike.leach@linaro.org>
References: <20200113213149.25599-1-mike.leach@linaro.org>
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
index 14076468dd25..256138198bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1644,6 +1644,7 @@ F:	arch/arm/mach-ep93xx/micro9.c
 ARM/CORESIGHT FRAMEWORK AND DRIVERS
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
+R:	Mike Leach <mike.leach@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-- 
2.17.1

