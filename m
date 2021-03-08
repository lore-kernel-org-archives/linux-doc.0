Return-Path: <SRS0=NFUt=IG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76C0C433E0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 02:04:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95F446514C
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 02:04:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbhCHCE1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 7 Mar 2021 21:04:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbhCHCEQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Mar 2021 21:04:16 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2991C06174A
        for <linux-doc@vger.kernel.org>; Sun,  7 Mar 2021 18:04:15 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id x7so2735105pfi.7
        for <linux-doc@vger.kernel.org>; Sun, 07 Mar 2021 18:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5FVDzaSOdww++p4SAXAaq6RreJzmgvVTAB5j04gjJs=;
        b=fIEBIYAmNg1H8ZVeLB070cRRh5WO9bB+nHJuH1GVlvlu44j66AB2Lvos9w1QAAnSDP
         L9XswG/iAtL3o89ibFJ5LcuBTo9m5a5rGnL7J3oyuhs9S7M1JlOEhxoRiACPoEBIA7oZ
         8nsbY6+Iq+/uPCd+4mEaZS10oW4jhJSOgB/11EKGWugPtZlqG4XyjTuji/w9/AxnIFHx
         SQcjgwtp1H10DTSlhKVpvLKHf+0BBmCtZM4VXxgilb2mf0DKvxdosCVfbs6lv7K7Wttx
         qaw62RT3O9Qbv2oGRFO+Zf/mbuoNb0EZz5KlWe6MdMf2e3fHG4ZeSVqpAoNUY6xjpAlX
         JEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U5FVDzaSOdww++p4SAXAaq6RreJzmgvVTAB5j04gjJs=;
        b=HFrXQAc53rtI+Ho7TUuE942VdTKaCOgShNhZFQdQssXCFh3Iey4hAOnVtC9O95HTv9
         gNzv8l0l7QbhyirL/zD7wMjIJF5tM82/wYW7eaH31XPZxxohqurjKcYC0JVTPHFp8TkM
         SHy41LsXeNg/ZAy/FhrvsSE6J2GD530+xhqqS+P7SerT8Bf6VwKn0Dvz889s6KOBIw9T
         cbCSF4bP0ZcnofJ5fTAufv+/DuY7KBiA7pJI9M/7/d8uF1hXTSy818wjiLCI9rokjPub
         h7ZIOO1y1L/zNUdtXHlt72ODCslanVLV8ghcdX1/6G6Sv6ImZ6aq7VnTNEpu1vi2XCgo
         Bc5Q==
X-Gm-Message-State: AOAM531a90A7JWm9azk/thgb9YCtmcnnNqtJfHJWrJQUxxzcBZJ+2/mC
        WR7rYY+Xy5FlqMSSTY4mbns=
X-Google-Smtp-Source: ABdhPJx82BcthIgDFAwgcf7Ryg5nNVHzYty7D9WAUG78NdECJXY6+44jMduQ7TnRFWjYEyy5BK6NCQ==
X-Received: by 2002:aa7:96bc:0:b029:1f6:9937:fe43 with SMTP id g28-20020aa796bc0000b02901f69937fe43mr2480448pfk.68.1615169055324;
        Sun, 07 Mar 2021 18:04:15 -0800 (PST)
Received: from localhost.localdomain ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id u129sm8470393pfu.219.2021.03.07.18.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 18:04:14 -0800 (PST)
From:   Jiele zhao <unclexiaole@gmail.com>
To:     keescook@chromium.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, zhaojiele@qianxin.com,
        Jiele zhao <unclexiaole@gmail.com>
Subject: [PATCH] security/loadpin: Update the changing interface in the source code.
Date:   Mon,  8 Mar 2021 02:03:58 +0000
Message-Id: <20210308020358.102836-1-unclexiaole@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Loadpin cmdline interface "enabled" has been renamed to "enforce"
for a long time, but the User Description Document was not updated.
(Meaning unchanged)

And kernel_read_file* were moved from linux/fs.h to its own
linux/kernel_read_file.h include file. So update that change here.

Signed-off-by: Jiele zhao <unclexiaole@gmail.com>
---
 Documentation/admin-guide/LSM/LoadPin.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
index 716ad9b23c9a..dd3ca68b5df1 100644
--- a/Documentation/admin-guide/LSM/LoadPin.rst
+++ b/Documentation/admin-guide/LSM/LoadPin.rst
@@ -11,8 +11,8 @@ restrictions without needing to sign the files individually.
 
 The LSM is selectable at build-time with ``CONFIG_SECURITY_LOADPIN``, and
 can be controlled at boot-time with the kernel command line option
-"``loadpin.enabled``". By default, it is enabled, but can be disabled at
-boot ("``loadpin.enabled=0``").
+"``loadpin.enforce``". By default, it is enabled, but can be disabled at
+boot ("``loadpin.enforce=0``").
 
 LoadPin starts pinning when it sees the first file loaded. If the
 block device backing the filesystem is not read-only, a sysctl is
@@ -28,4 +28,4 @@ different mechanisms such as ``CONFIG_MODULE_SIG`` and
 ``CONFIG_KEXEC_VERIFY_SIG`` to verify kernel module and kernel image while
 still use LoadPin to protect the integrity of other files kernel loads. The
 full list of valid file types can be found in ``kernel_read_file_str``
-defined in ``include/linux/fs.h``.
+defined in ``include/linux/kernel_read_file.h``.
-- 
2.25.1

