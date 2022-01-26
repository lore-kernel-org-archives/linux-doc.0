Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA88C63684
	for <linux-doc@archiver.kernel.org>; Wed, 26 Jan 2022 20:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiAZUNs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jan 2022 15:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiAZUNs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jan 2022 15:13:48 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29960C061747
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 12:13:48 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so400994ota.10
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 12:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzbj8zCgavNPOsqdAJKfKx15yXUuBarV4g88BfwJ5Uw=;
        b=EiCjf/dXx6PcwQfYyD5Mtu4jSLNd5zEa47wWx2U5haMMbtJEQhSPeTaHqEOzI96wE+
         2RGa+InuUKeD//habRPfunHmUIU05w2nCr0vL/0LA71m8HO9bM2k0p26IOaae29ZCfw6
         3LkAnT/jvGR05sDRNIQR+dYLOxsdW7rR1X7Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzbj8zCgavNPOsqdAJKfKx15yXUuBarV4g88BfwJ5Uw=;
        b=uAAatyL59EwWfH5dxhWH7hr3Lb2G2Gh3ztGs2ICqLrhHkLS7uwejCA+fhmPcgrLXMb
         lCzvrEo8ZR6JAfgeur0GwIGk1SKS6YAwr1ClAA7OnOq1Vif/0gwARaNPhK6kAwNS5TAZ
         kKYeWop4LQZvSJNhGmv+MmROHtipOoteUEE6/NHg0QQRmd+nFse7pvsQDovhAXpappOk
         7mPxp9btgKbTVApCsfVKznvM63ik7OMy2vxUEziEOrCUMktWqNa/bkS0pbOCIta1Enfx
         8rcO5UzTBUQIgPTEEYVdPUN63zRGILns8euBnqeRdafY1y0aVN/bRlRovpQLuYSTBZzi
         tljQ==
X-Gm-Message-State: AOAM5310QssLmihiRAYnN+kkciVy3lHdCNUltTnqRHJuRnyKVlII3JCc
        lJz/rFiKomvPjPS9JPi1DB3O/EzApywfkQ==
X-Google-Smtp-Source: ABdhPJwOLiJkefCmcpRy9PRna8y1Dkefx1bROzrpi2irVbbFBq3filLVRABU/M8eHV6GzXHir5v5Og==
X-Received: by 2002:a05:6830:4491:: with SMTP id r17mr319589otv.112.1643228027463;
        Wed, 26 Jan 2022 12:13:47 -0800 (PST)
Received: from shuah-tx13.internal ([71.205.29.0])
        by smtp.gmail.com with ESMTPSA id a128sm5993573oob.17.2022.01.26.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 12:13:47 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     shuah@kernel.org, corbet@lwn.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs/kselftest: clarify running mainline tests on stables
Date:   Wed, 26 Jan 2022 13:13:41 -0700
Message-Id: <20220126201341.55771-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the document to clarifiy support for running mainline
kselftest on stable releases and the reasons for not removing
test code that can test older kernels.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/dev-tools/kselftest.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index dcefee707ccd..a833ecf12fbc 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -7,6 +7,14 @@ directory. These are intended to be small tests to exercise individual code
 paths in the kernel. Tests are intended to be run after building, installing
 and booting a kernel.
 
+Kselftest from mainline can be run on older stable kernels. Running tests
+from mainline offers the best coverage. Several test rings run mainline
+kselftest suite on stable releases. The reason is that when a new test
+gets added to test existing code to regression test a bug, we should be
+able to run that test on an older kernel. Hence, it is important to keep
+code that can still test an older kernel and make sure it skips the test
+gracefully on newer releases.
+
 You can find additional information on Kselftest framework, how to
 write new tests using the framework on Kselftest wiki:
 
-- 
2.32.0

