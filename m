Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 89F287D90D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Sep 2019 12:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfI1M61 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 28 Sep 2019 08:58:27 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42390 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfI1M61 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Sep 2019 08:58:27 -0400
Received: by mail-pl1-f195.google.com with SMTP id e5so2114711pls.9
        for <linux-doc@vger.kernel.org>; Sat, 28 Sep 2019 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=kdCRVcFDbwva24KN3eH7zqeTu4HfpPd+A+XmfX8B1x0=;
        b=fVQBgpVEONa2X4k8pjlZN6UA+Cd9U8+VYxnACwVLmD/GOpTKuyrMpLYlHJ3MBglgcf
         3QvcaJHGrpMs/tCPT9Bm9AlGqThn1P6Dw2L+PVZmlIFOHeXysuJqFY6BNejGFa5C2iSV
         riX1+7CxxBmZy0f4UPE4mWoUGLWHrmyr8HtjE/CrnO4yOipef1xJy1aSod6qLIyCZ21B
         PJYlw0dQsRNicyWYimRAcs5YW9jb7VVyELk3Sk8iE2ejrr17vP3ekpPY7oXoX8oiTGCV
         Vn+0i18CnN0A9g0BnRLV/XvbovZSZPvS/wi0JonZ5BbNh01qWBA6zomIz4CVkuaA3hKa
         5v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=kdCRVcFDbwva24KN3eH7zqeTu4HfpPd+A+XmfX8B1x0=;
        b=ZXGJpz1OFr3Eb+28Ybc/ZCcf5qa+Mdj7OiT2F7uFH95eeshkQC1gAYBu03Yt9wc0lr
         FXNoLioGPPpO1Obpf+BALa68u9w7gLYYHYB91adE9Q+MRF4k5O8ZJP6zNpxYirKd0LB4
         maounOKUdn/eHKL+vUTDg+q2EUR/S39f8aDj8qrBsWXjreMP+Y0haQHzatJYWU0+cllb
         BSgV8VYBtsP9xoDItpIfvkgaY/CFqxvy1SzfhssiYBGcovuf6UyOAhOSKQP54PjNcHeI
         LPXiQjAcyLE5vCa3zZ6SqoYi3NOtEVIm5m9XV4Lb5/VWqrJ1d8lmQkNsf9w7dfqM6tHH
         z8OQ==
X-Gm-Message-State: APjAAAVCPP8MFry2Hgq0ouOS4ht9+k54FyjUTBWxx9cuwuW7ZaS3Zrpf
        fKY5b+Z7ifgKCZNx36ZvPO1hxHJUn+U=
X-Google-Smtp-Source: APXvYqy3gkEw4Vs4wT8s8HjjMWu66eBlLD+w1M2wcBpO0Aaxkk5cFh9XTtGc/X6mbE43Coc4StRjlg==
X-Received: by 2002:a17:902:8501:: with SMTP id bj1mr9669331plb.342.1569675505898;
        Sat, 28 Sep 2019 05:58:25 -0700 (PDT)
Received: from gmail.com ([45.118.67.175])
        by smtp.gmail.com with ESMTPSA id q30sm9270271pja.18.2019.09.28.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2019 05:58:25 -0700 (PDT)
Date:   Sat, 28 Sep 2019 22:58:19 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     linux-doc@vger.kernel.org, will@kernel.org,
        catalin.marinas@arm.com, adam.zerella@gmail.com
Subject: [PATCH] docs: arm64: Fix indentation and doc formatting
Message-ID: <20190928125819.GA9604@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx generates the following warnings for the arm64 doc
pages:

Documentation/arm64/memory.rst:158: WARNING: Unexpected indentation.
Documentation/arm64/memory.rst:162: WARNING: Unexpected indentation.

These indentations warnings can be resolved by utilising code
hightlighting instead.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/arm64/memory.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
index b040909e45f8..f7db6a3898c5 100644
--- a/Documentation/arm64/memory.rst
+++ b/Documentation/arm64/memory.rst
@@ -154,11 +154,16 @@ return virtual addresses to userspace from a 48-bit range.
 
 Software can "opt-in" to receiving VAs from a 52-bit space by
 specifying an mmap hint parameter that is larger than 48-bit.
-For example:
-    maybe_high_address = mmap(~0UL, size, prot, flags,...);
+
+.. code-block:: c
+
+   maybe_high_address = mmap(~0UL, size, prot, flags,...);
 
 It is also possible to build a debug kernel that returns addresses
 from a 52-bit space by enabling the following kernel config options:
+
+.. code-block:: sh
+
    CONFIG_EXPERT=y && CONFIG_ARM64_FORCE_52BIT=y
 
 Note that this option is only intended for debugging applications
-- 
2.20.1

