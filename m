Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89074ECAAD3
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 21:23:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbiIAVXY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 17:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbiIAVXX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 17:23:23 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3962892F40
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 14:23:23 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-11f11d932a8so413666fac.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Sep 2022 14:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=//ULS9Zb97N/4Yv+yOVhZmRoDVyyid6vRrjZb2izzYo=;
        b=Ild0fr/Bo/d+eU32YpIS4qV07R3n8jic/XXbvDwHx7N6KuxNLq5TbGQ2g9LLRgfE3K
         +T7QVQExvLmxMEHTTd78L31EhHx6DpP76KmPl0iPQt3J8tEv/JF/AjsB+8cZEFxLuPkK
         ZnGbdGES67gy6M2YjYKDzES5dMv2Z+6Ug9w2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=//ULS9Zb97N/4Yv+yOVhZmRoDVyyid6vRrjZb2izzYo=;
        b=56XEhkq2uTdPsVN68ncfaSob6T2sypoxPVbFN/A5vw4tB3BPR6cZt+/NnUn++RaE35
         Io3Xq+OFpdqoxW4GULSgUh1LuaxUuX0yfTHAk+MqXeca0N267bWYaqV8NGHFIlyH/d1o
         FGEfDBs4h+DWVsyo1r/a5fYu9ef/d8Mz4urEh8Ly+Xn+PJN7bIEPZMillS+4XxYASePZ
         vCfxVguMpSfebuMZkGhLOm/K9QSHB+UgqtEX+N6rE5VO/Lk+8R35OW6NYjqK/qBvne7t
         fXla2RFriiRRYUiZrsUHgSeV2XkaVVMoi9LUM6HM/FedPDs7KiRFkAKpMvIysP3n2tpJ
         esWQ==
X-Gm-Message-State: ACgBeo37CacY/lBdAt/jaK+8mLigUCip6XC811dUMKFtPFqSo0jMg17o
        TUmbEavyE2K56c2TATJLANqydA==
X-Google-Smtp-Source: AA6agR5HjnUA9kZExmsvmX0g3NeFaEZgpWhKxVEXFWtzcBLkFy2AMwnGLmPO4EVE30Z5o2EWk/Ostg==
X-Received: by 2002:a05:6870:1481:b0:120:6e1b:8594 with SMTP id k1-20020a056870148100b001206e1b8594mr604785oab.277.1662067401783;
        Thu, 01 Sep 2022 14:23:21 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id l15-20020a4ab0cf000000b0044884c40c8asm64153oon.30.2022.09.01.14.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 14:23:21 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     gregkh@linuxfoundation.org, corbet@lwn.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, joanna.lee@gesmer.com
Subject: [PATCH] docs: update mediator information in CoC docs
Date:   Thu,  1 Sep 2022 15:23:19 -0600
Message-Id: <20220901212319.56644-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update mediator information in the CoC interpretation document.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/process/code-of-conduct-interpretation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
index e899f14a4ba2..4f8a06b00f60 100644
--- a/Documentation/process/code-of-conduct-interpretation.rst
+++ b/Documentation/process/code-of-conduct-interpretation.rst
@@ -51,7 +51,7 @@ the Technical Advisory Board (TAB) or other maintainers if you're
 uncertain how to handle situations that come up.  It will not be
 considered a violation report unless you want it to be.  If you are
 uncertain about approaching the TAB or any other maintainers, please
-reach out to our conflict mediator, Mishi Choudhary <mishi@linux.com>.
+reach out to our conflict mediator, Joanna Lee <joanna.lee@gesmer.com>.
 
 In the end, "be kind to each other" is really what the end goal is for
 everybody.  We know everyone is human and we all fail at times, but the
-- 
2.34.1

