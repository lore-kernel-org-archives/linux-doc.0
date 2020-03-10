Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CB8C18E5B
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F83D21D7E
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 18:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCJSg5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 14:36:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53926 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgCJSg4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 14:36:56 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jBjkN-0006GY-1Q
        for linux-doc@vger.kernel.org; Tue, 10 Mar 2020 18:36:55 +0000
Received: by mail-wm1-f69.google.com with SMTP id m4so717090wmi.5
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 11:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M+NOQNpvhvH3Mta8jMCkiQEkAzDoTgoDN+MCQM8KMJk=;
        b=mbF9e8dEnG9syhaYs+3E0Tfnanm2jK9+wrNOtlM8i+dm9EuMwaJ+j1ROdtCNrKMphg
         vqa8GUp9e8vZ7l5sfenXeZc1NSpDujqiOAZFw2DARZB0Fd8UGotWO9j0QcdvPgaGFuTA
         LKzNu9M8NTsqVt8Jq8pVN5j28t4nsebdNNo/iry+850nBcd8Z/oYgMOB0PzLGD1+e+u7
         XiIDenhgE7MuQ9cfUuqFqwmZMmt+EBQYCtcDzSVEeVYURh6F+g1IMG12PfKonCpFbrXy
         hP52s9L2EGzbMFiIuxGS4INlT04Dq5Xc4/wQn8mpljpR87plPqr83iLR9BsRzOJd7vvL
         ky0w==
X-Gm-Message-State: ANhLgQ3X1cPRGlhj4x4hyroU5nBLvIvcsvngkF/Wzv+6ZDN3Zb0NBCb0
        IN/VliEPGIuN0mj0/1XJGGn7tMaIFojyLlX4PePaUMMBH87oj1s7Y2qggqS/bnR8A72zfXbD/mL
        8q6LK1azxG+oAjDAy7h4lVuKbXOQhOdk54vsoqQ==
X-Received: by 2002:adf:de10:: with SMTP id b16mr27529282wrm.145.1583865414206;
        Tue, 10 Mar 2020 11:36:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsCf8pVbjwUxH536PBWlDZKzwrtesqkq2+TuE8mRLhskWkQRt8m4pbkZ9wA7tWmh7D1Hfn+dg==
X-Received: by 2002:adf:de10:: with SMTP id b16mr27529263wrm.145.1583865413988;
        Tue, 10 Mar 2020 11:36:53 -0700 (PDT)
Received: from localhost (189-47-87-73.dsl.telesp.net.br. [189.47.87.73])
        by smtp.gmail.com with ESMTPSA id h18sm4816377wmm.6.2020.03.10.11.36.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 11:36:52 -0700 (PDT)
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, linux-kernel@vger.kernel.org, swood@redhat.com,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        mingo@kernel.org, gpiccoli@canonical.com, kernel@gpiccoli.net
Subject: [PATCH v2] Documentation: Better document the softlockup_panic sysctl
Date:   Tue, 10 Mar 2020 15:36:49 -0300
Message-Id: <20200310183649.23163-1-gpiccoli@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 9c44bc03fff4 ("softlockup: allow panic on lockup") added the
softlockup_panic sysctl, but didn't add information about it to the file
Documentation/admin-guide/sysctl/kernel.rst (which in that time certainly
wasn't rst and had other name!).

This patch just adds the respective documentation and references it from
the corresponding entry in Documentation/admin-guide/kernel-parameters.txt.

This patch was strongly based on Scott Wood's commit d22881dc13b6
("Documentation: Better document the hardlockup_panic sysctl").

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++----
 Documentation/admin-guide/sysctl/kernel.rst     | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04615690e69e..b24fb0d11955 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4578,10 +4578,10 @@
 			Format: <integer>
 
 			A nonzero value instructs the soft-lockup detector
-			to panic the machine when a soft-lockup occurs. This
-			is also controlled by CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC
-			which is the respective build-time switch to that
-			functionality.
+			to panic the machine when a soft-lockup occurs. It is
+			also controlled by the kernel.softlockup_panic sysctl
+			and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
+			respective build-time switch to that functionality.
 
 	softlockup_all_cpu_backtrace=
 			[KNL] Should the soft-lockup detector generate
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 1c48ab4bfe30..335696d3360d 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1036,6 +1036,20 @@ NMI.
 = ============================================
 
 
+softlockup_panic
+=================
+
+This parameter can be used to control whether the kernel panics
+when a soft lockup is detected.
+
+= ============================================
+0 Don't panic on soft lockup.
+1 Panic on soft lockup.
+= ============================================
+
+This can also be set using the softlockup_panic kernel parameter.
+
+
 soft_watchdog
 =============
 
-- 
2.25.1

