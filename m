Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B83957DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 May 2018 21:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751736AbeEDVMK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 May 2018 17:12:10 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52065 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751655AbeEDVMJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 May 2018 17:12:09 -0400
Received: by mail-wm0-f65.google.com with SMTP id j4so5938827wme.1
        for <linux-doc@vger.kernel.org>; Fri, 04 May 2018 14:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3o9MNOdzCJFCYIAc4yMirNdMGXyQJHmjX2oZmvkALLg=;
        b=cu3Yq9XR5sZJbvD1pvUJQQaLbP1rtlWbUy+i6QJxAUtQdS1kUIKh5GXaVxlfMvc0V/
         Im3qQt64ZYH7foVYB4UuOtc1bZZTME6+nJ8ePJ71LmvNIoOPW4LaBrlhb98FX7bRmN5s
         qtJ/olJNiMrNEmvsZje5BR6UgMgbjIAoTW1ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3o9MNOdzCJFCYIAc4yMirNdMGXyQJHmjX2oZmvkALLg=;
        b=pIgsVek523KDHCaeP6Cm3kFjq3sK/gQDlzKkKYADDZ3/hHo8+YChDqriq8npuqjszG
         bkMLfm7Ri0ABLZ+fH3+Nry7gU73TjhPt3wtZjAZl4LINONdAMMurQVfNA1PrAPCNizqg
         3sldk6Nn+J5pEacm4LAogd9L4LsrTuKDhBMIRSPbJ/tPnvf3fQ7X4bcrOuG4M76LlX8J
         KyJBgMpM4ZNPbY+TcqAGZcN4KU0P+Cy6NiBJuJ5K9ITMiehxPWvWrvSoYDw/mJV+aNnp
         vM5vAeASJaHeR0MiJhgefCqDLZ/OxfrZTEDFUJ1ybBLZO85IDONCnb0XdcKNEOEAQWCB
         Fpsw==
X-Gm-Message-State: ALQs6tCu0hfbSWeATW1c6f57c5t9zpJoQnAGZyrMq9nzOKs4kTLbZ10P
        8QTqpLZtQqCfGSIDUmeXN8CElg==
X-Google-Smtp-Source: AB8JxZppL2b8dyvZ30YVM4iZ1GcajxIJwuM+7GZ/KpTv6oeSPmAPQRYP8Oq+XBXlgoRR18pMTfBKgg==
X-Received: by 10.28.181.149 with SMTP id e143mr17460994wmf.66.1525468328476;
        Fri, 04 May 2018 14:12:08 -0700 (PDT)
Received: from localhost.localdomain ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id v12-v6sm2108273wmc.35.2018.05.04.14.12.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 04 May 2018 14:12:07 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Elena Reshetova <elena.reshetova@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH] Documentation: refcount-vs-atomic: Update reference to LKMM doc.
Date:   Fri,  4 May 2018 23:11:49 +0200
Message-Id: <1525468309-5310-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The LKMM project has moved to 'tools/memory-model/'.

Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
---
 Documentation/core-api/refcount-vs-atomic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/refcount-vs-atomic.rst b/Documentation/core-api/refcount-vs-atomic.rst
index 83351c258cdb9..322851bada167 100644
--- a/Documentation/core-api/refcount-vs-atomic.rst
+++ b/Documentation/core-api/refcount-vs-atomic.rst
@@ -17,7 +17,7 @@ in order to help maintainers validate their code against the change in
 these memory ordering guarantees.
 
 The terms used through this document try to follow the formal LKMM defined in
-github.com/aparri/memory-model/blob/master/Documentation/explanation.txt
+tools/memory-model/Documentation/explanation.txt.
 
 memory-barriers.txt and atomic_t.txt provide more background to the
 memory ordering in general and for atomic operations specifically.
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
