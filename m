Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A811C54EE9
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 00:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbiI1AaY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Sep 2022 20:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbiI1AaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Sep 2022 20:30:13 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A64189390
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 17:30:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id n10so17302651wrw.12
        for <linux-doc@vger.kernel.org>; Tue, 27 Sep 2022 17:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=0TVnztzgA/fHhw0MXWPFSGn//WSv6/nNHP9m1VIFhLY=;
        b=MrqewpEuj9opcwzpnzknmGckUNvWLVCVT1qDO7idANPPys77KRN9VrWO1NDRp+4SAB
         asLeMD9kvPy3ynTsbEVkcYDEV0KrhQzU2HX7+81jY15ZKixbGSDYf+jemEhlcUkwAmYu
         B54WGN+Pu9yEqArF4vbuJv7bPSftFOsy+bfHptJyXXy0+/O2CRvczu0v+iusM1gLoiEn
         vneix2NdpMQw8Kqxmr0naUzWXjXcOWRPqVqwFRVju5p4mImSQTof5pmxIl0dqOspzG09
         a7S/ycp9CBulFM49oAEzfd07VFi8jCF9F1qS6tWHnTVjM+E4JE8nDpsfqGJ6iCsorT8T
         kN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=0TVnztzgA/fHhw0MXWPFSGn//WSv6/nNHP9m1VIFhLY=;
        b=mdjzEFJLxsYtzfB/RjaQEO2DoqKy1VZyV9z8Sj8S2e0KJ7fWK7wFIEbOv7jjnFQLMk
         M40xsne6d/8+iqOCmniIzAgpKl1/yjUoy8MhXCLFQus2UTrLXPqy+tvzaVHwwtvEHLSV
         iLtQS/POXz2q9igIuIOMcTRiGkwu34nVMBK6F795cSu+G253CktBwQiydRgkIZvLaoEb
         Q77ufHirlFxXyUip0fpqo8NjlFlEe2niEmwI2FiXK0InR32YwkNwnHQaFa8R5UeJe3pF
         5BtgVvA9ORrwJ6zrCoHrQ7tPlUy0I+FGDo8pYJFTKUS0unSU6zesFjXlAuUySZWA2z3Z
         oXEg==
X-Gm-Message-State: ACrzQf0jZbNCEZ/rKz7m45xrlD1auJOUJumqkIuwR/7dhJ068AIBxj0/
        CTOlYBbIw6D+vY1O2LZg5G6Lr2Q790/XDQ==
X-Google-Smtp-Source: AMsMyM6iSC03qDsPN9C0eK8ei5S3otrqjfcIOylT0h7NeQTK38pa4PSUvAkqOBtSwe+8AuPw1HMhiA==
X-Received: by 2002:a05:6000:1e01:b0:22b:cee:e927 with SMTP id bj1-20020a0560001e0100b0022b0ceee927mr18739804wrb.133.1664325009892;
        Tue, 27 Sep 2022 17:30:09 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bk8-20020a0560001d8800b0022af865810esm2685892wrb.75.2022.09.27.17.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 17:30:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH] Documentation/process: Add text to indicate supporters should be mailed
Date:   Wed, 28 Sep 2022 01:30:06 +0100
Message-Id: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently when submitting a yaml change I found that I had omitted the
maintainer whose tree the change needed to go through.

The reason for that is the path in MAINTAINERS is marked as Supported not
Maintained. Reading MAINTAINERS we see quote:

           Supported:   Someone is actually paid to look after this.
           Maintained:  Someone actually looks after it.

The current submitting-patches.rst only says to mail maintainers though not
supporters. When we run scripts/get_maintainer.pl anybody who is denoted a
paid maintainer will appear as a supporter.

Let's add some text to the submitting-patches.rst to indicate that
supporters should similarly be mailed so that you can't do as I did and
mail every maintainer get_maintainer.pl tells you to, without actually
mailing the one supporter you need to.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/process/submitting-patches.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index be49d8f2601b4..5f97379da41da 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -227,9 +227,11 @@ You should always copy the appropriate subsystem maintainer(s) on any patch
 to code that they maintain; look through the MAINTAINERS file and the
 source code revision history to see who those maintainers are.  The
 script scripts/get_maintainer.pl can be very useful at this step (pass paths to
-your patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
-maintainer for the subsystem you are working on, Andrew Morton
-(akpm@linux-foundation.org) serves as a maintainer of last resort.
+your patches as arguments to scripts/get_maintainer.pl).  You should mail
+everyone who appears as "maintainer" or "supporter" in the
+scripts/get_maintainer.pl output.  If you cannot find a maintainer for the
+subsystem you are working on, Andrew Morton (akpm@linux-foundation.org) serves
+as a maintainer of last resort.
 
 You should also normally choose at least one mailing list to receive a copy
 of your patch set.  linux-kernel@vger.kernel.org should be used by default
-- 
2.37.3

