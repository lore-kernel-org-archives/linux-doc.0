Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4892AC433F5
	for <linux-doc@archiver.kernel.org>; Sat,  8 Oct 2022 08:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJHIdC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Oct 2022 04:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiJHIdB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Oct 2022 04:33:01 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9029520B3
        for <linux-doc@vger.kernel.org>; Sat,  8 Oct 2022 01:33:00 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y8so6756029pfp.13
        for <linux-doc@vger.kernel.org>; Sat, 08 Oct 2022 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g2+zmkPwl+G0YLDiQrCjhamJbw1PvG/z0mV21D7/zEw=;
        b=helOohmfQK7SaLm/GgIOYpZHrJ5nDzJLkgOckmyYFU+bxIVOf9FoKLiPQsit2RQM3L
         6Qch+qBdUdbEZQFzxvhah388RKh9lyLmRSlhAyZxOiUOe46mddrhpugeJV4HJPH7/aOQ
         +PKa1BvOP/0Agu4ce24RNKILESjhXtqqD3kFE/qRjNF1zq0r6q7ZqfIj+GGiiDvPUd/h
         IHJeP2dBKfmHsF+bJV26sRtFzfyJOpP1lD6MqpUb1uSl4OEKeczVrTV5poafDtsMObaa
         8E+YWNh0Trm9MLJ+ZElamCD4ONA3JP2O7V6xlWJGSeye4ZJ0LpxFETar2YhaGoooeoOt
         u8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2+zmkPwl+G0YLDiQrCjhamJbw1PvG/z0mV21D7/zEw=;
        b=g3TZeO6aqEZz6XjHYiLYsO6ViCDTDaVyWwEQDRTQCER91kCFRLCJWOX6EsS/k069vX
         mTwR6H4KpliK5gPxuUXlrRsVxOp6HkswT0EcN73eA8bNl/X+R6NKjzt6g2rhDWva1LJv
         dYrwEH7Mr5UsLDxbgKCUdP1kny1s2E6YPRcBZ3GUvfGDSI6iDzlXdeZELrVMiA8qK7ZY
         EMKLwfMBMC93HPAgwR5yEmpqvHAw9mm6NaKgKgCuHULF9NaNM417U9sUkCgheVc5M2TF
         +0uwGNa4XlR1zH3tjfkSCsCEa0NL8FSB+NmvmlF7LLEsw2diO5+MKocKAcdJqHqn1+k9
         aROA==
X-Gm-Message-State: ACrzQf1DUx+kj9otrNilXwgoJjR1H6F4hb6dopZtxPaZJQtlFJcvcLmH
        GPoCShK5UTp+HIsCcobovHudl8XJ8MFP/AaT
X-Google-Smtp-Source: AMsMyM5UrR7OZxRCAUkAbiLivVZ4YvPChxjhW3bt6h1olO4EL4CBTCgCTYTCksGXAcdF3VPNntZ/jw==
X-Received: by 2002:a05:6a00:1503:b0:540:e2c7:2387 with SMTP id q3-20020a056a00150300b00540e2c72387mr9208321pfu.48.1665217979997;
        Sat, 08 Oct 2022 01:32:59 -0700 (PDT)
Received: from leoy-huangpu.lan (45.78.18.36.16clouds.com. [45.78.18.36])
        by smtp.gmail.com with ESMTPSA id x24-20020aa79418000000b00537f16e25d3sm2963504pfo.75.2022.10.08.01.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 01:32:58 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] docs: ftrace: Correct access mode
Date:   Sat,  8 Oct 2022 08:32:50 +0000
Message-Id: <20221008083250.3160-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation gives an example for opening trace marker with
write-only mode, but the flag WR_ONLY is not defined by glibc.

Use O_WRONLY to replace it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/trace/ftrace.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index b37dc19e4d40..60bceb018d6a 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -564,7 +564,7 @@ of ftrace. Here is a list of some of the key files:
 
 	start::
 
-		trace_fd = open("trace_marker", WR_ONLY);
+		trace_fd = open("trace_marker", O_WRONLY);
 
 	Note: Writing into the trace_marker file can also initiate triggers
 	      that are written into /sys/kernel/tracing/events/ftrace/print/trigger
-- 
2.34.1

