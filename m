Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C75EE7D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Nov 2019 19:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfKAT27 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Nov 2019 15:28:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40723 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbfKAT26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Nov 2019 15:28:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id w9so9974318wmm.5
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2019 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kragniz.eu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Mutma0I285HLAM6Sw5PmtAvnBP2OZbW46A3J1dY9kk=;
        b=TGRoCxKACJ9VtmiTGZQHEaYEdxpZQOpr/Q2KzvtQoVIJMdZqdG5NtWy3ZhNQyoIlWL
         rUCsxm3aeT62XLB1CWUyTKX/z2ChTvUZ6BfGjDCFBhZMkOCcnLnoJHIgcCdUHKvgqiXn
         F6+3ChT8uGSArJQlizjjRlF/C8sN/OZq4Nrsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Mutma0I285HLAM6Sw5PmtAvnBP2OZbW46A3J1dY9kk=;
        b=fbhWb5hl7Q0mUbCVRIWZJU9JytIRKoweKH5bSnbatCdUzzx5H37Fdo4Dg2qo9wWguZ
         ZpYODCBjLOy2pwjGF/dvYWbpupKhbFVzUxuFFsrwoE6Xuh1dn8wFwhxpF5Ev4o2dVJ7I
         3DukxkW6PwkAM+jLYpwop7pRVl35MTjY8HxYfkChNof7JdUzi6xx1sQi2W/yvE8qglHT
         NLN0eTWhBOHRFp6BPJzflFTCNNkszSPpvIg8jKDShvdTGA3E5dz2FCyIXswNxmvpBPKN
         uRsSfpu28A6qQ6hNHpfSf3vOt1h8ahyFj5FHiNHEr7ucIlZrN8LoL3DeYAqSGy3Z0/+v
         HRRQ==
X-Gm-Message-State: APjAAAVXkAPTcLJVNSH46a6EUx/Mb1AKa7dvziW5PTbTGMbm6Wpq5ApV
        bErlKscwESMxPnjSYThqq9G8/SzLnc0=
X-Google-Smtp-Source: APXvYqzLIKewNStvLv8a4CM24iYDjlSWZc7mf3HWJvdAslTWYLuXcXhtD9k/sua9kX7hD0Tu22Zn/g==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr11509610wmj.126.1572636535053;
        Fri, 01 Nov 2019 12:28:55 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.245])
        by smtp.gmail.com with ESMTPSA id a8sm9786395wme.11.2019.11.01.12.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 12:28:54 -0700 (PDT)
From:   Louis Taylor <louis@kragniz.eu>
To:     georgi.djakov@linaro.org
Cc:     corbet@lwn.net, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Louis Taylor <louis@kragniz.eu>
Subject: [PATCH] docs: driver-api: make interconnect title quieter
Date:   Fri,  1 Nov 2019 19:33:14 +0000
Message-Id: <20191101193314.67994-1-louis@kragniz.eu>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This makes it consistent with the other headings in the Linux driver
implementer's API guide.

Signed-off-by: Louis Taylor <louis@kragniz.eu>
---
 Documentation/driver-api/interconnect.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/interconnect.rst b/Documentation/driver-api/interconnect.rst
index c3e004893796..cdeb5825f314 100644
--- a/Documentation/driver-api/interconnect.rst
+++ b/Documentation/driver-api/interconnect.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 =====================================
-GENERIC SYSTEM INTERCONNECT SUBSYSTEM
+Generic System Interconnect Subsystem
 =====================================
 
 Introduction
-- 
2.23.0

