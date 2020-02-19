Return-Path: <SRS0=7zml=4H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB3FC5ACC4
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 22:14:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F115E206EF
	for <linux-doc@archiver.kernel.org>; Wed, 19 Feb 2020 22:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gowdgx08"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgBSWOJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Feb 2020 17:14:09 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43407 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726703AbgBSWOJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Feb 2020 17:14:09 -0500
Received: by mail-pg1-f196.google.com with SMTP id u12so795497pgb.10
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2020 14:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TWI4qCqMhEw1k6KAKhbqnH5AxNi8DQe8QpDA2F+2Frk=;
        b=gowdgx08ONSh35NJGdAHXGTosBs3S9E8JqmodD8dWAoGkWtezQQSFKUzC67dNWtv23
         KzhIDrHsK3H9KMW4ZtXg39qY9wANloeIKW3+6/j6CAfAAnaZ+n2zVBjccNj93s8ibvJq
         8xEPi3vm7Z5JWCs47CXt1gCyp1Tc1kzr4/h3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TWI4qCqMhEw1k6KAKhbqnH5AxNi8DQe8QpDA2F+2Frk=;
        b=jjHeVA16ZY5tnrxBo1lpvdTv0dFXhgc7jUmRE55Fvgx8Z2fAEgm0Uco0PW0eV2Uh9+
         0oIqE0kLoNIzHI4sTlHPUrv+3vz+Xk42wL9V5dZ4gASyDgena962hDkUh3H/W+hrRExy
         A8KQo/F6jJfWhkRnDhY/AOqu4sb1ERox8iW6tQixgDl37yYn7rGbBBCvFINKRZ70qVex
         HJlaf5now321rk6PyDMqfm5xLGblZlkv3oVljkBVMnz5c2UcDTKXgAOn0FqndaqJWgxF
         FM422WnMUWsR/lxjxsrxVL6r3ONVIIQzW2FlJWN+c+Gfn0rJ3LjyHJdnx+iWjQwUvsUc
         bT1A==
X-Gm-Message-State: APjAAAXwDIXE+vcNGRGAQA2wii8GdTXZp+JP1Ybwq4eMRmFoXkV5wycF
        Oeq+gQZ0VQdqfHeXZNLFVLIEsg==
X-Google-Smtp-Source: APXvYqw4uvtiO4n3G17rwQUbo02TkzNpy6L/IWvWcQw3KdjXAzbBj9fgqxQitCAt4fbZbLU89Ec+sg==
X-Received: by 2002:a65:468d:: with SMTP id h13mr3298099pgr.359.1582150448869;
        Wed, 19 Feb 2020 14:14:08 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id k8sm723327pgg.18.2020.02.19.14.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:14:08 -0800 (PST)
From:   Scott Branden <scott.branden@broadcom.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH] docs: arm64: fix trivial spelling enought to enough in memory.rst
Date:   Wed, 19 Feb 2020 14:14:03 -0800
Message-Id: <20200219221403.16740-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix trivial spelling error enought to enough in memory.rst.

Cc: trivial@kernel.org
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 Documentation/arm64/memory.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arm64/memory.rst b/Documentation/arm64/memory.rst
index 02e02175e6f5..cf03b3290800 100644
--- a/Documentation/arm64/memory.rst
+++ b/Documentation/arm64/memory.rst
@@ -129,7 +129,7 @@ this logic.
 
 As a single binary will need to support both 48-bit and 52-bit VA
 spaces, the VMEMMAP must be sized large enough for 52-bit VAs and
-also must be sized large enought to accommodate a fixed PAGE_OFFSET.
+also must be sized large enough to accommodate a fixed PAGE_OFFSET.
 
 Most code in the kernel should not need to consider the VA_BITS, for
 code that does need to know the VA size the variables are
-- 
2.17.1

