Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA27C77B7A
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 20:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjFCUQM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 16:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjFCUQL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 16:16:11 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C366C197
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 13:16:09 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-558b6cffe03so3027eaf.3
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685823369; x=1688415369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zT3cco/xuh2kfzadCMum+FKu8VOuTo02eN7uD0vF0k=;
        b=F25Yth/+OoNGPm90Uzr2fU3a37tSiIsM/+pRe2C+aUas3JIvBISjBONg0xuONldktq
         hHbrQsmPlurisSnSdvWDTMM/QE97Ll1nhrPffCjj8mXDuxP+CMzsB4vqJtbjOUcr/vC0
         HBFvbig1gzKy7qxLk0koBJXkAGFHgzkiOx39439mF0HnuYnhtdzCY/trHp8kyR6zzhL5
         tJvyrbfIKyWpjnAJIwhUDB0/x/YX9zLLCX5RIl64VkuxLH99pjvlSBbaYX+NA2T4GUYQ
         akkyUJqSvzJfx2X4i86CkeA0lBBxHb6GeZcrtXenxE5x64T/YAN1PpxPXblhfk6rU96V
         sn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685823369; x=1688415369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zT3cco/xuh2kfzadCMum+FKu8VOuTo02eN7uD0vF0k=;
        b=deFKKYxck/H5typhe/DfmrLUgHFVtAZxQrdfy6xoC8PoLxnFIEU1cAMmpZuOXXTkCd
         KIxAC4Wdx9y0uJKI82O02CU+qu5asBdTo2Hhv4ixoR+mOZJOEFIXar3CpJ75moNXcS4s
         JtTSJim00nujTdIvLcRYLcPgNI2WOc6i/KZuG1SyxXh+NkqXbQBDG0ACHMwpkAk+gJ75
         RMJ0tmWFYsw8WBCER9X7PB/VeacEZ/m+toZeLZdOCejEUsNDleSK7s2Yomi5GBK1ub51
         fyG92BLxW8vqfuGER7FDtJ0Nll+oDu1TMCnarvkuYnMFnrpvd67nI2eta07WfUGl/XXH
         ESxg==
X-Gm-Message-State: AC+VfDyJSlEoZIUTd5WchQ05XCRz8RnTAhAbeCDTM2/eA9HjY6ct236H
        JFfQSd1Eb54tC+J1vyWk48hXFdG39F8wFw==
X-Google-Smtp-Source: ACHHUZ6Pqa71m3t7xFZPAUuizgy240P2zusZA0nPOJq/koYCRoQYj8JEvJJPbFohV/upOzKZoDfrzQ==
X-Received: by 2002:a05:6358:cc07:b0:129:bde5:24de with SMTP id gx7-20020a056358cc0700b00129bde524demr82787rwb.0.1685823368750;
        Sat, 03 Jun 2023 13:16:08 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090a1d4700b00250bf8495b3sm5001691pju.39.2023.06.03.13.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 13:16:08 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH 1/4] Fix minor grammatical error in dm-integrity.rst.
Date:   Sat,  3 Jun 2023 13:15:22 -0700
Message-Id: <20230603201525.9409-2-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603201525.9409-1-eatnumber1@gmail.com>
References: <ZHs2BHGBrJ-YGd-v@debian.me>
 <20230603201525.9409-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Russell Harmon <eatnumber1@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-integrity.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 8db172efa272..b2a698e955a3 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -25,7 +25,7 @@ mode it calculates and verifies the integrity tag internally. In this
 mode, the dm-integrity target can be used to detect silent data
 corruption on the disk or in the I/O path.
 
-There's an alternate mode of operation where dm-integrity uses bitmap
+There's an alternate mode of operation where dm-integrity uses a bitmap
 instead of a journal. If a bit in the bitmap is 1, the corresponding
 region's data and integrity tags are not synchronized - if the machine
 crashes, the unsynchronized regions will be recalculated. The bitmap mode
-- 
2.34.1

