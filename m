Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9ECC433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbhLENtL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhLENtK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:10 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36E5C061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:43 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id k26so3266027pfp.10
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qxuxe22ZD8cXk+GEVFWk4nyD4Dv6l66aSEccnh0FLLk=;
        b=IEBd84Fl6qHQCwYKChaLP0sfVGLl3lSKaVGsFS0zdiMQj4ECMB4W6oNwmEFDJt/+4N
         hJwXfi+2OPZpSJYILrZcqawy734icUQW+/2vk0PuS2WNJh5Cw7QX5zdJU7tOASz7Cvsk
         Npex4FPMGYmro0wkJF4bqpsmEz1vgVuqGWlHBvzw2QHX5ge09jc6uLzEnKm39ya7i7qD
         hPYs+eG5of6Cpjit0bG69/GFhincLA3X2gXBf2Nc8l17tMkkRyV2iDvEYE+dLkyNn4pT
         tJxQscMu3hoAFEbF1jcOLdTYN+Ic2w2syjgGsoB//zBSDyWbhyUKsTa67F/h2XmwWBRM
         +FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qxuxe22ZD8cXk+GEVFWk4nyD4Dv6l66aSEccnh0FLLk=;
        b=Ug+wPEySMDbu1wLUDPcbvfa/AZJd1ihc3xlrJMfAoBiVwF0eIjIy2tS3A5KLNJJuPH
         eO5qcrHOnzCNpiDcBTWFPh5Q1/DOdXhSYrY7TB6mK3EB8AD4lFFJGkHRyZ57EiCyyxTL
         lbcHCgWoU2+hLFIasyGfHg1qoav2d3+pey8gMaOPYjk0lMneEyxUvKeNuLofO5UREHKS
         aRWU9Nl3xBE45otxupPfLhANXOYzmFuSsHh+ls8kSH1A/UeZHB9RU/VBLXIrOl74gOFm
         5h6+5IrQJ/NjSEyFPN3XQyINoM0WKxO7G9zytWfk6g9xdac/ccHZm8s5psXH3y4WZ4V4
         9RNw==
X-Gm-Message-State: AOAM532jGylbNHOCtZrEsyyqKjf0648NpCQ5R8gALLWvcfWlpPqLMd5U
        7PrZjX9okA9IEJYv1u17Chk=
X-Google-Smtp-Source: ABdhPJyoHQ6uVI3AhKhMkpQ/HJhmB8CBw+ImBc9MXAdXKAtEtyrKCAZb9d/rnDHutykn0bylc9yDjw==
X-Received: by 2002:a63:60d:: with SMTP id 13mr14141274pgg.359.1638711943503;
        Sun, 05 Dec 2021 05:45:43 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:43 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 08/11] docs/core-api: Replace Footnote Reference in document idr with Substitution Reference
Date:   Sun,  5 Dec 2021 21:43:57 +0800
Message-Id: <cfbc430429b571ff36ed5128769605c42488839a.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

linux-next/Documentation/core-api/idr.rst:20: WARNING: Unknown target name: "xarray".

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/core-api/idr.rst    | 3 ++-
 Documentation/core-api/xarray.rst | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/idr.rst b/Documentation/core-api/idr.rst
index 3a1589b70244..be6023f42472 100644
--- a/Documentation/core-api/idr.rst
+++ b/Documentation/core-api/idr.rst
@@ -17,7 +17,8 @@ solution to the problem to avoid everybody inventing their own.  The IDR
 provides the ability to map an ID to a pointer, while the IDA provides
 only ID allocation, and as a result is much more memory-efficient.
 
-The IDR interface is deprecated; please use the XArray_ instead.
+The IDR interface is deprecated; please use the
+:XArray: Documentation/core-api/xarray.rst instead.
 
 IDR usage
 =========
diff --git a/Documentation/core-api/xarray.rst b/Documentation/core-api/xarray.rst
index a91bc8aca5ab..a137a0e6d068 100644
--- a/Documentation/core-api/xarray.rst
+++ b/Documentation/core-api/xarray.rst
@@ -1,5 +1,4 @@
 .. SPDX-License-Identifier: GPL-2.0+
-.. _xarray:
 
 ======
 XArray
-- 
2.27.0

