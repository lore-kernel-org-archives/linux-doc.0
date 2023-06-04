Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA505C77B73
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 19:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjFDTGi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 15:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjFDTGh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 15:06:37 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE8BB3
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 12:06:37 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b0424c5137so35599125ad.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 12:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685905596; x=1688497596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG3Hy7n4oCrePrc6XsNght2qZ/b76zbKsk6sMW+iZsQ=;
        b=SNExni+RWnZSCWO/L3q/9D8I/428t+HoQzSV4cbONgJ1P0wEon48YAibjrI5PEqoqn
         XPBobm+0v+khFn2FmfK3Tj/Azc1zDM+RbUTLnNhC5ogN8tCFrHN0jX+Hg+fq7WhTbJP+
         TjfNfOKY2sr+3vujoCf4iTpNethyhsnv8KGTJQugb64N2wAlRtSFvfAMXaVfy74zL2Ab
         053L/J3r9ae+xWqKV2p8yjzukujwzF5yp1tP433WgDsfuBpr7IkG8cKB8/9y7xbCqoCm
         o9S/f8vKo1Q3+I4UHuGiO+eZfp8iT1vDdTjjZfnwqIFHn7MG1avPA+c14wO4ijw1eImP
         LEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685905596; x=1688497596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG3Hy7n4oCrePrc6XsNght2qZ/b76zbKsk6sMW+iZsQ=;
        b=ZJ5oXOZgHMX3re5AP3U/xnxjYirnTuRfrVL3oU9qOPOJHc1kGnskYaEnmPJCeQ4WeO
         BS3F9sz7Km2tLMXm6WxPHfMHBNAzDxapQlCN7EZDcOP1kttefxn/cIsjNNYT5GAI+Qdt
         Ijee538jVzLLeeoJfdqAGlkuWVP7SgPrRjw4Ay5MhIBkHPDiRGElhgGF8HCStEq1binp
         GyU18GzmLoe4e9nvZpqmjPw4QO7sTN3osfVwPNbfCIOdyppEtkOeN3yLGRRZOkWUpCSd
         25hM7q9O0UMWbqc11NAdKzz5Y2y4nU6wxoLiYO/IC19p7SW7bNxl2CKpHlu7LsO4n8Gz
         a9Hg==
X-Gm-Message-State: AC+VfDzaUHBd5QIUyR2RYmItQfvU0JCM7bPLaVLdCnYBxCqvqYFia6vh
        jxZ2AgzNRFNtcR50KINHKpxZbdijPUrC1A==
X-Google-Smtp-Source: ACHHUZ5pvsmZXxQML0usbfB4Onm1WEYm3om0LDI/OSvyhEtbDdsMhpgRo4e5YYhi9zts2K9eeziOxg==
X-Received: by 2002:a17:902:6b0a:b0:1ac:5717:fd5 with SMTP id o10-20020a1709026b0a00b001ac57170fd5mr6023028plk.60.1685905596187;
        Sun, 04 Jun 2023 12:06:36 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001a6ed2d0ef8sm4979072plx.273.2023.06.04.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:06:35 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v3 1/4] Fix minor grammatical error in dm-integrity.rst.
Date:   Sun,  4 Jun 2023 12:06:01 -0700
Message-Id: <20230604190604.4800-2-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"where dm-integrity uses bitmap" becomes "where dm-integrity uses a
bitmap"

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

