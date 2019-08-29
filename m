Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3A8C7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfH2Vdm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52466 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbfH2Vdm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id t17so5184345wmi.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LMqchkDNCkA/VR+CQ65ZbjevbERlSTiEMV0ulJAmloU=;
        b=sf5dp2X8bvpsxIvn6wB4FXN5MEzziPNs5lvsXRP3kJCsnSQVYVwDgLvB9IwLGkMA6O
         l4jqEuqk4XYjOhd+Z5MGFv1nvfEQ5/BGU4a8e1++3orNHTRRP9blczv3DTaVdGrONnaC
         VxaEpNYfQKqm5hWGtpQsQ1ojgDD0sDRAcndgNnsnkV1b7GtmezmqE8cYnToQrV/QBeRt
         NXmWxULHoAIsXmHSJCeE7ZwglVK8RSLwrRwP34V5egyI9Vq0la223NWt+kwS2zuxirK4
         As5yiUWy16VRmqGRKYVC652YcNP1TCHbaC9FSdFkXaopjZ7Nfg4CykG/hJxOnjv43rJm
         V5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LMqchkDNCkA/VR+CQ65ZbjevbERlSTiEMV0ulJAmloU=;
        b=JsoOLBimIBzK02bZYAIRJnUkSrHhIeTSgDO2Wu0qJU0dvyIh0DDKyU8bSAzb5TDXIu
         nMbNu5s0BYdveG9/8sUTKybdLxMU24HXc1GJ5M08vPyojIGCi/EfgC4ncNDn8DvzNDUJ
         NEgv55BXX7ZOuj5auU/1HskCQEB5Ix5S5EI8g/wPiCKPHYv0iaHJycMVzqpk0BdLdR6l
         SFKRJl4rZr1LMz5rWEPdcA+fj8JtzDWlX1BG8v3uCPNX0KjVmowbDsJTrRA21eZhuDWu
         13CnluzBznjWPwScNWOr3Vp56SisU9DbOqxiH/Rkw40CNlMw4HnLoNnZaCKdvB+OOyD6
         /xDw==
X-Gm-Message-State: APjAAAXaN00KM8EcvaOF5AMQxf/h+C3pMDbVmdu6kX8d5OQe2VSyMc20
        lH1juOxENqUU9H7ESGQHRA6g3A==
X-Google-Smtp-Source: APXvYqxYzvDugEFQ70Y8VTR8QhgoptFrmtrSmGzRc8ML+ta8//qmQhRHGomDstQroWyB9o/W4klv0w==
X-Received: by 2002:a1c:e709:: with SMTP id e9mr14343981wmh.65.1567114420505;
        Thu, 29 Aug 2019 14:33:40 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:39 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 10/11] coresight: docs: Create common sub-directory for coresight trace.
Date:   Thu, 29 Aug 2019 22:33:20 +0100
Message-Id: <20190829213321.4092-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two files in the Documentation/trace directory relating to
coresight, with more to follow, so create a Documentation/trace/coresight
directory and move existing files there. Update MAINTAINERS to reference
this sub-directory rather than the individual files.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 Documentation/trace/{ => coresight}/coresight-cpu-debug.txt | 0
 Documentation/trace/{ => coresight}/coresight.txt           | 0
 MAINTAINERS                                                 | 3 +--
 3 files changed, 1 insertion(+), 2 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.txt (100%)
 rename Documentation/trace/{ => coresight}/coresight.txt (100%)

diff --git a/Documentation/trace/coresight-cpu-debug.txt b/Documentation/trace/coresight/coresight-cpu-debug.txt
similarity index 100%
rename from Documentation/trace/coresight-cpu-debug.txt
rename to Documentation/trace/coresight/coresight-cpu-debug.txt
diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight/coresight.txt
similarity index 100%
rename from Documentation/trace/coresight.txt
rename to Documentation/trace/coresight/coresight.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..777b77fde29b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1582,8 +1582,7 @@ R:	Suzuki K Poulose <suzuki.poulose@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-F:	Documentation/trace/coresight.txt
-F:	Documentation/trace/coresight-cpu-debug.txt
+F:	Documentation/trace/coresight/*
 F:	Documentation/devicetree/bindings/arm/coresight.txt
 F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
 F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
-- 
2.17.1

