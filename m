Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCE1C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 12:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiAOMwn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 07:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiAOMwm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 07:52:42 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E87BC061574
        for <linux-doc@vger.kernel.org>; Sat, 15 Jan 2022 04:52:42 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id y16-20020a17090a6c9000b001b13ffaa625so24948646pjj.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Jan 2022 04:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6zizSoOwsc1F6bv5vEKHYlrVIknSRl9t91hRZUhytwg=;
        b=mtpu11UhfMRGp7YM4DLpRE6/88FOorZ4ozp5WXZSteuRCmDXsE9wkzhbkpDv3SgPap
         N7BM4UIPQTZape0j/3pvVyNiio3viRKDasVsrtWoJGzrLgmKb/21lS/ZBb5qIxstPcw4
         4qxLHPpg8MdncfFiTn/rG7ZZrEDRqSJCw92l9iAc+OYLnuKuDDKTlwEILhOmQNckh/BO
         QLdeO217Kt61WMeEDmRFXRzP6voTEXOd3TIls7wbiqSQ2VM2nkRNFK5uTEQqQn4NWNeL
         2bVvjPypahYbHNwvtKLTVCJwlgmeKY+pB3aEFRE6gfmfP/y9riArxfWhd3T6yQ8WsEUh
         0rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6zizSoOwsc1F6bv5vEKHYlrVIknSRl9t91hRZUhytwg=;
        b=nBr3F0S+f5K0nOTe/mVrwNjCk/+wNfHxkV70w3zJVlVnsm6I5ljEFTndfjjodpXTRm
         D3gWczZSkyI9guUMuzfYYJSolld0riI+bzsN2IheNgnekRpyie4fpmArzzQtCekd+7ny
         AYGmLPkcoCgFNYdkMxC3baSh6Fvj2FXz4z33zFbXGM2Q3NyA4cye4SSi5SqWbdw+tV0q
         3heLbdpo+0P3xxorv3P/QUeLX94HrQ1WO7NJ9ORThpGkqqNLAC8xStTfuwicTeRZVfEk
         NOxe41FILAqgYPeAEwrp5NqiS7i+MNS8hDbgt2B4cZ9dJ6Lox0cYkBhTHxLjWpkTz+td
         ldEA==
X-Gm-Message-State: AOAM533xLg9wPEn50WV9zizbIqy0qMcMTQAQZcAlgB0ZCzqRoF72mq56
        bILi3bowpHuC5XAVu+86XsIPVrjhjqKm/A==
X-Google-Smtp-Source: ABdhPJyAJsjSPvV5vu4LhccZW/UlTC/D8lskpyihHmY8CH7XMQzihW6NcB57oiPmqIP9Rm6fQb/bug==
X-Received: by 2002:a17:90b:3b83:: with SMTP id pc3mr25207432pjb.3.1642251161986;
        Sat, 15 Jan 2022 04:52:41 -0800 (PST)
Received: from ppc.localdomain ([152.70.90.187])
        by smtp.gmail.com with ESMTPSA id b14sm8588987pfm.122.2022.01.15.04.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 04:52:41 -0800 (PST)
From:   Wang Cheng <wanngchenng@gmail.com>
To:     jens.wiklander@linaro.org, corbet@lwn.net
Cc:     op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: staging/tee.rst: fix two typos found while reading
Date:   Sat, 15 Jan 2022 20:52:36 +0800
Message-Id: <20220115125236.34886-1-wanngchenng@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
---
 Documentation/staging/tee.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
index 3c63d8dcd61e..498343c7ab08 100644
--- a/Documentation/staging/tee.rst
+++ b/Documentation/staging/tee.rst
@@ -255,7 +255,7 @@ The following picture shows a high level overview of AMD-TEE::
  +--------------------------+      +---------+--------------------+
 
 At the lowest level (in x86), the AMD Secure Processor (ASP) driver uses the
-CPU to PSP mailbox regsister to submit commands to the PSP. The format of the
+CPU to PSP mailbox register to submit commands to the PSP. The format of the
 command buffer is opaque to the ASP driver. It's role is to submit commands to
 the secure processor and return results to AMD-TEE driver. The interface
 between AMD-TEE driver and AMD Secure Processor driver can be found in [6].
@@ -290,7 +290,7 @@ cancel_req driver callback is not supported by AMD-TEE.
 
 The GlobalPlatform TEE Client API [5] can be used by the user space (client) to
 talk to AMD's TEE. AMD's TEE provides a secure environment for loading, opening
-a session, invoking commands and clossing session with TA.
+a session, invoking commands and closing session with TA.
 
 References
 ==========
-- 
2.33.1

