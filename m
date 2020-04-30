Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56228C47247
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 22:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC8C20873
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 22:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="j/cqKE2I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgD3W5K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 18:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727799AbgD3W5K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 18:57:10 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE940C035495
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 15:57:09 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id v18so3960247qvx.9
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 15:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
        b=j/cqKE2I9ySEFXVhi1aXMr5JuwvMm7JmEKZQt9D1LKparoBCiIz9P+hclLYO3dpOK6
         wEnlqwAeq1CjQyzGb7mYaSuxL1S5DmlqXLKRy9DU9YesLL6oQFLCHrGATgtWl0lZjuHA
         8f9Pu+RFSIvkBO1IzH+dfKLlUDQf0/f33yIRIep/p4XsfICyiHk5vYhzM/NZ77znJjeD
         M7aDOETzdkccWELfAyjE1Y2SnynbI0ZnmBaOoUDGuop4Ziv9AVMSsXOxlWn6e+QbQhHm
         S8XwlhdU7DYpNR04zkVp8pzbtjtBKFN1AhOSlbH98Xeua0/yvQ3JaFsRNB2cqLYmokso
         E4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JwaXAKuRd0apGvpDhNCHAFUyDcZ/LeyJTl3LHyQWiwI=;
        b=AqI0CPnxfvIDn7tU1Y7GuQpPrc25N2HHhz8JI3ZZW3mWrHfxfUmsm+unpNyaXygqWx
         nxePlx1v9DI8Uuc4UNNITyAxStPu/VCNFjhGG+x6JD7059q64cNlObaiYZ2p+vDnPNs0
         mvkThxKxwgX/pyKOEkD1shzWhZWkhv+/8r2XKhEjB1CH/fBuoDBSAb9TSvz4W2daFFZI
         JF/eSRD73Z13JGraqCAVU7PuP5G2B16Xw5csZFO4ra/N4YmNK5Nt/M/gsCLnRZvQcyuo
         4HNNI+p50Zic/8JNhoENVtovHCelZgojRt0YN6lqJvoKXLU0a++rkb4d9xg9kAoz2wd1
         9TZg==
X-Gm-Message-State: AGi0PuYDEIWNAg4ntXyjW9Bs+UHNV8CL/im9x6wH0k/amIoVC27vDTaP
        rlXrHvkCel7DTbSJn1A5eABSc4dHZqLr3A==
X-Google-Smtp-Source: APiQypLmKZaE8wkTc6wcMU+OIG30tDXPV6fy6mEI5P2ZFUFQRWrRo5Vo6qL0nK17U8rkzEV1qNLerw==
X-Received: by 2002:a0c:fd8c:: with SMTP id p12mr1343371qvr.163.1588287428897;
        Thu, 30 Apr 2020 15:57:08 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id x194sm1258439qkb.131.2020.04.30.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:57:08 -0700 (PDT)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     linux-doc@vger.kernel.org
Cc:     mchehab@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] doc: misc-device: add uaccee to toctree(index)
Date:   Thu, 30 Apr 2020 19:57:03 -0300
Message-Id: <20200430225703.113909-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This fixes:

Documentation/misc-devices/uacce.rst: WARNING: document isn't included in any toctree

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/misc-devices/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index c1dcd2628911..1ecc05fbe6f4 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -21,4 +21,5 @@ fit into other categories.
    lis3lv02d
    max6875
    mic/index
+   uacce
    xilinx_sdfec
-- 
2.25.1

