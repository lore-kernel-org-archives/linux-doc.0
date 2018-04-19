Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C06DC7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 08:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750858AbeDSInA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 04:43:00 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:33753 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750799AbeDSIm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 04:42:58 -0400
Received: by mail-pl0-f65.google.com with SMTP id w12-v6so2831093plp.0;
        Thu, 19 Apr 2018 01:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=n9/x//7mTQsmSgWgMURj7q1fAtWhAvsox52Fwf3IRrg=;
        b=c+nCG227G6JtmSfkkJ+hB1W+VXiAFD4a8fU5qznzFTRwhgmuDTBNtSY3aZJmlZqKJL
         J3woxWVow6dJaZUabJiaPwIhIqS13WHb+beZDv0tDtbkvKC0KZGTpLCdgFM2OPYw5sHu
         KBwYgtpWXqc31YVFMichajv6GQOP7NN9f/Dorp7LF+9Fywc2doY5S5KHzQ0CgJK4U1V0
         RHlAvHIKYRLgJKdEV3iBwqnsk9LWnqVCiGoHMVzc4EMT6UJk0p6HKNbsriLu2/WfEWI4
         Pid2WpX+Z49BpYOEtkqBxFyXyfFHJaT1fomtRLn0kMTCYbcE8IoPK0A+byS/oCppYMoO
         h+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n9/x//7mTQsmSgWgMURj7q1fAtWhAvsox52Fwf3IRrg=;
        b=khgOvjOVNT884coFTJ/dsXQ/HpwCvGiloEfalnkG7lUwGKM5qInwHd4b75S8mcpX3t
         cOHn20ZskMzPQfllwxyRLMlpmJRzxMP1ZEk3lP4yzNu+XqG3zu/0VgmuBQUEhOrPwzM7
         8Zzm4/G2KbXBKo3flhDQCy9/lpU0Rm+NRhST49rVX5GxVHpVp9Bsz3UoNsQJ7+iR21Yi
         GlAJgmTh0F3MpFtjMIWHDsos4nZTw00sxfUFSe366DMoMYQOFwuGaunen8x4wP3g8FcP
         0eggSQVNp3lTkGqr1mJHB9KhxORx9YcWqUCWd+49UFtHYrWKOnPvVJlIHCIoza/DgzBf
         DdiQ==
X-Gm-Message-State: ALQs6tCOBPM3QUWtxCHEsbigym4hTh+uixrNoTUGxS31prKafD5GCyzV
        KbISh15qRPgdoJbMYiMflvg=
X-Google-Smtp-Source: AIpwx4/ZtBfmMyoeBCq6VM4G0fCYA0qjbb4fpq/Y4FDFM5M+eQRGLOVAAhMftCRejVSxMYZCc1blDg==
X-Received: by 2002:a17:902:4303:: with SMTP id i3-v6mr5473621pld.394.1524127377990;
        Thu, 19 Apr 2018 01:42:57 -0700 (PDT)
Received: from localhost.localdomain ([147.46.241.218])
        by smtp.gmail.com with ESMTPSA id h6sm6584067pgn.65.2018.04.19.01.42.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Apr 2018 01:42:57 -0700 (PDT)
From:   SeongJae Park <sj38.park@gmail.com>
To:     paulmck@linux.vnet.ibm.com, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] atomic_ops.rst: Fix wrong example code
Date:   Thu, 19 Apr 2018 17:42:44 +0900
Message-Id: <20180419084245.17096-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.13.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Example code snippets for necessary of READ_ONCE() and WRITE_ONCE() has
an unnecessary line of code and wrong condition.  This commit fixes
them.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 Documentation/core-api/atomic_ops.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/core-api/atomic_ops.rst b/Documentation/core-api/atomic_ops.rst
index fce929144ccd..4ea4af71e68a 100644
--- a/Documentation/core-api/atomic_ops.rst
+++ b/Documentation/core-api/atomic_ops.rst
@@ -111,7 +111,6 @@ If the compiler can prove that do_something() does not store to the
 variable a, then the compiler is within its rights transforming this to
 the following::
 
-	tmp = a;
 	if (a > 0)
 		for (;;)
 			do_something();
@@ -119,7 +118,7 @@ the following::
 If you don't want the compiler to do this (and you probably don't), then
 you should use something like the following::
 
-	while (READ_ONCE(a) < 0)
+	while (READ_ONCE(a) > 0)
 		do_something();
 
 Alternatively, you could place a barrier() call in the loop.
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
