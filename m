Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A52C43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2846A20757
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 17:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9dD1g7U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389042AbgDBR0y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 13:26:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37186 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388815AbgDBR0y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 13:26:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id t11so3430434lfe.4
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2020 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YnAAIVewdymSUOCcbiK0QSVLUENXqP9+fRGyOEim5I=;
        b=B9dD1g7UyFFojuRMBuQODhcX3c4a50WUr9QXhj/8aZ2xRAiC8I2QHw00H0PLmvEeGU
         bia9y9R8yhIwwCpdOyHQ5JKS3HK6LqIEEThScVpEISiM9H6QK5CaPAoOofE8+H8cwo3S
         OfJ+PIDPjTukS6ZDRyKc6neQB9ut01G7VhVrhzqo7byAsWzsyOZyOMznMurZgYEv+c/d
         hluVE1VJ1DJW/i/r6zM/J6kRL4do6vjVbDFOHxcexkEwdhvdYb1uv92j0PNjwmMHu57t
         uoJahJPALchj/q3m4kFiQaV012Jw7EPLFGrr5iJaikjX9qeT+Swsgov5SE9O9w+E5wqt
         uCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YnAAIVewdymSUOCcbiK0QSVLUENXqP9+fRGyOEim5I=;
        b=p/NPXElLtIu3WzxHFMijT32Rghk3pyKDikPmRo164WlYzBDOsxTqYZjJ9CIALYyl2p
         f4iJnpJihz24YWkLpLymvgaYJTeI3R0fWFtE3tduiV4w37eirStm660oh6LeHfskKb0+
         o6E4dubI6s/LSjM3RTEbfnLsjtcMexRQCh+k99YF/MqPpMzjmkBCZAyfTLQwDM2nIZAI
         /ux0U5GUpH741a5653EG2KKOzmAehEK5EDcVhzc6x6Jf3pyoZ21H9tcSc0hQr3ziIp9U
         WERBkDmELIaLYc9VS/3lwSMeAnevte9YDPU5Dwt/INfprk5sGtTYnMLauWVIVOMBzvju
         P7oA==
X-Gm-Message-State: AGi0PubNuGdrcE2pL3YGxLGyEotqvtJLcJfOUdoTlJg+zszlzGN/U0YN
        LFWu99J4/zIbaAVbGCgIN45NqQU/CIA=
X-Google-Smtp-Source: APiQypJ9P2fWV/lSe2zadTFdaZ5UBbusBVy9o5TvYM5KvosyoHbfRTdBNhVt5ckSBWoXe4dWWC7ucg==
X-Received: by 2002:ac2:58d7:: with SMTP id u23mr60841lfo.182.1585848411734;
        Thu, 02 Apr 2020 10:26:51 -0700 (PDT)
Received: from localhost.localdomain (h-4-68-234.A785.priv.bahnhof.se. [155.4.68.234])
        by smtp.gmail.com with ESMTPSA id s10sm3832280ljp.87.2020.04.02.10.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 10:26:51 -0700 (PDT)
From:   Jimmy Assarsson <jimmyassarsson@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jimmy Assarsson <jimmyassarsson@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/2] docs: kernel-parameters.txt: Remove nompx
Date:   Thu,  2 Apr 2020 19:26:13 +0200
Message-Id: <20200402172614.3020-1-jimmyassarsson@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

x86/mpx was removed in commit 45fc24e89b7c
("x86/mpx: remove MPX from arch/x86"), this removes the documentation of
parameter nompx.

Fixes: 45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jimmy Assarsson <jimmyassarsson@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ed73df5f1369..e98750227fb2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -990,10 +990,6 @@
 			Documentation/admin-guide/dynamic-debug-howto.rst
 			for details.
 
-	nompx		[X86] Disables Intel Memory Protection Extensions.
-			See Documentation/x86/intel_mpx.rst for more
-			information about the feature.
-
 	nopku		[X86] Disable Memory Protection Keys CPU feature found
 			in some Intel CPUs.
 
-- 
2.26.0

