Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF5C433F5
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhLENtT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhLENtT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:19 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEFCC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:52 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id g19so7641780pfb.8
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AC4MWD95p+6TQoD/86M3jDD6aJB4zUkT1yHZQXt6y/0=;
        b=Jo74MlI2vVobsAb7wb0rr1YxK8bS/X8oFsL+k9ugBiwu8HZhS3PUYSYsGPl94ox0bo
         FNHSDTKAZI+iBnE73K4SvfCzmXW8jIBiCczNNW0nVouJyaXnXoTZ22QvT1qtY2GJCVFQ
         deG6LenlIrTlJxjXa70mYcurpUeONbnZ377eDQKw9wtIitN1S0nI3vkR12njqzV1CBWW
         Xa76uRDnLgPffSvICttClL8HIY5cFv38fZcAGQLQh6FTYRkJY/d1qwhinOUS+3LBArk6
         XRyy3nLy6rc55wDqdMc9CZPjoVrKOPhLVa7PAyz9MVScF584ykuXNXKJwc3sJ+HWbS5d
         PHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AC4MWD95p+6TQoD/86M3jDD6aJB4zUkT1yHZQXt6y/0=;
        b=0WGYnK0hKKxED9dt9Ey9by1mOMlRw8pQucJBK5yB1Fde7W616HVRKiKgnoV82LcGpD
         bnXyN/jriDDxF/S448L3J686lRieYAMhy4zAsASU92xJB7Mt/E0W+B89tgdzff9yR4wE
         nm/vBmHAb5v2KL3DnDg/jhX4Phis6Pay8vBAVHfG6RbOL2b6r7x1UZUlFcTwEdxgOw4u
         PXcbS0/3HEjgglT4QP1x8RACntlUjqy4+SVGLrkWicIsU/f1Ct9SmcM8Nm1mqwwYo7ON
         PGOGZt/T6INn8N8qj+Ii8bUXThzEyWz0HaHjKoKE3lhLMPXDRs022q/9aDu8Enj6SVXM
         BS6w==
X-Gm-Message-State: AOAM532dr/qsO93RiMDZRPjlpdtobpLwyYTWX7RWYQZT1gicfXxm4noJ
        mFIerqN/KBWrw8JVI3ZaaBY=
X-Google-Smtp-Source: ABdhPJyKRY3AG+DZy9NJSXf4ON4ZQfg0/9dhx99UPRcwjuf7X+NQ4+RNUKOG1YuccPbcCHq59uWh+A==
X-Received: by 2002:a63:2b11:: with SMTP id r17mr13960873pgr.494.1638711952053;
        Sun, 05 Dec 2021 05:45:52 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:51 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 11/11] docs/admin-guide: add gpio-aggregator into index
Date:   Sun,  5 Dec 2021 21:44:00 +0800
Message-Id: <899056e61b5ac273be033f6ffa1746fe3128fc9f.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add gpio-aggregator into Documentation/admin-guide/gpio/index.rst

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/admin-guide/gpio/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
index 7db367572f30..f6861ca16ffe 100644
--- a/Documentation/admin-guide/gpio/index.rst
+++ b/Documentation/admin-guide/gpio/index.rst
@@ -10,6 +10,7 @@ gpio
     gpio-aggregator
     sysfs
     gpio-mockup
+    gpio-sim
 
 .. only::  subproject and html
 
-- 
2.27.0

