Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC41EC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233095AbiCGIRB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbiCGIRA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:17:00 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B1E60A89
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:16:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id p3-20020a17090a680300b001bbfb9d760eso15902139pjj.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ok9MXwHXQEwNkdg7uIrLkHL3a3VIPtoWGJrRtTleCmA=;
        b=mFOE5FMgIpDaDsCIBGBXJlasET60Px44dPw1Wge9890F5INqri92jFHaE+PdVnFbRy
         VjDiYFDAn3Q3P+8Kr1jUIx4raORcokuU43FXbJu5CIEpG7ETPfGhgjY1HM+FD1fbUnbO
         tYFgEDR1vcYxDW9KdSQvfZD2oXssZwW0jZRjHd44N0oOGM1VMc2Sym4fFfU7bg0AvG1R
         mJJCkloGuIOi151NHW2fwqN4mgPRsnJ3k6JO9wuaXY8Lb+YslrX7qiikmquijvzygLt0
         gtWVf1wB57Gq++LaOT8UDYr45R4LVrLP9/TRo2ixqLRNAirRBtPbV0BajPD5D45CJkBP
         rLMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ok9MXwHXQEwNkdg7uIrLkHL3a3VIPtoWGJrRtTleCmA=;
        b=0hJVrehBneZuecAIZf8wr8KdMBbgAgtJYOo0sljsYp0N22dL256EohfoVVZz0oXFQU
         hF8zOopqt6IQfcDU8K3P/Wk7M1kOhep6ExT/cHo294A16O32l9+nRWUeWPjpm1MBuPdC
         zJgH2URZnA4fQY8HqQ8mKLF19RXdGG67hdSReQp9iJE2YJ/I0f1S8x/rWdKiYoJnxigT
         ChOniNwVOTvUy62FrS7YI/iU+4NCWIfesrNIbdZxX71TcyCSn8g4Yj0/7GpRlSE59g4k
         NhUY9ljbrV+X9v3PoJrwXTaD++/qYYLB8PXcf9w33lc4rUXyTQgYORtpa5mBjOA3DhND
         T7kQ==
X-Gm-Message-State: AOAM533zTYe0TE9om8HDB299NYgUA0bjiBFHT0txlhJQ+60J8cFG33Ud
        tfmuPT8buZqCccbnRTEzDRY=
X-Google-Smtp-Source: ABdhPJz+LbSKCd+Xve5M7DW0llRjWaCSCD8brwKzUbVnyzqjN4RmlPpdC1PaG+RgGJyZA2eCupabfw==
X-Received: by 2002:a17:902:f78d:b0:14d:522e:deb3 with SMTP id q13-20020a170902f78d00b0014d522edeb3mr10759462pln.173.1646640966607;
        Mon, 07 Mar 2022 00:16:06 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id p34-20020a056a000a2200b004cd49fc15e5sm14940280pfh.59.2022.03.07.00.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:16:06 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Chengming Zhou <zhouchengming@bytedance.com>,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3 1/5] kselftest/vm: override TARGETS from arguments
Date:   Mon,  7 Mar 2022 16:17:15 +0800
Message-Id: <a43902460ff47a3aea8c7b01119cb7db647103e6.1646640696.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646640696.git.siyanteng@loongson.cn>
References: <cover.1646640696.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Chengming Zhou <zhouchengming@bytedance.com>

We can specify which testcases to build using TARGETS argument, for
example: make -C tools/testing/selftests TARGETS=vm, cause the ordinary
assignment of TARGETS in Makefile will be ignored.  So we need to use
override directive to change that.

Link: https://lkml.kernel.org/r/20220227055330.43087-1-zhouchengming@bytedance.com
Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/testing/selftests/vm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index ac720db11e00..fbccdda93629 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -58,7 +58,7 @@ CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_progra
 CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
 CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
 
-TARGETS := protection_keys
+override TARGETS := protection_keys
 BINARIES_32 := $(TARGETS:%=%_32)
 BINARIES_64 := $(TARGETS:%=%_64)
 
-- 
2.27.0

