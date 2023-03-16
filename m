Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38333C6FD1F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 22:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjCPW7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 18:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjCPW7d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 18:59:33 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA90777E35
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 15:59:29 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-54463468d06so29786857b3.7
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 15:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679007569;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gGeUgxe/1yHHKJzZIvgo8HNFnFtZ5+Ir0LKegjncLo=;
        b=nU+s31O6XUrExG2+IkDUugT8+lf/OaQ8H2ME0WVv7bRAaRFLw9lVbwYODS/QFWZ7ND
         Cge64ktgUo18Icp4uJtxpZCbKK3akeBgF7T5M8V9g0aLMQQrNoRCMH/MGUEIY2j9x+Gk
         opPsZmuFL0byKjBOp8y+g5LYGitEWDVuGFR8TtS6vSjkGAh18u/KbuXtrBL6Mc6BpKrR
         BByVhp3aR1le8pUz35NZb9QIpXLu3pW/+lxNRGVvm6XsMY2drtFRMT8ZRFR2QvGrSW6+
         7QO10slikd8g5/VFHaEMTr5WQcjJauQihSNs4O4UKvK06a7ckAlIxH+eVdVmWnnHVg1W
         eJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679007569;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gGeUgxe/1yHHKJzZIvgo8HNFnFtZ5+Ir0LKegjncLo=;
        b=pZdJIu4Qrqb6PIB/qCSbZlH/VuSr5xoSgtz//0PfDr4MHcI5uUR2OCxr48gqIG+LCO
         9aeM+UoLV4Sapz0f/xekjdhNItBn0V6cXf2R8SKDFBtXS7n0VYMnU+xdZW3v49rYVGii
         BtfQdeUNpRXXmZGBLhhbnEk4/PFo1H4FwLvgmuTpAinWR8CyXKuWytscmMNt9XYTdxGh
         c6uDA6J18cioavRNLCGb8S2l0eCTE3/HCZz4xEXbzGvGc8d65e9+rhSHew3VqkN2R+hM
         bo0ZAt/75o8Ewf1rO9h2tQU6ick8/eN57QOi2GCra86YTPkB2b4OWEto8ilVClAL2smA
         8wtA==
X-Gm-Message-State: AO0yUKW1bdsbRxlRF2dtAmW4qV4DgeIPH33SHkq2uKShpH+ww75AoD7K
        8F3UFMu5NhEStiNGy2KWFJwmTzYTnQ==
X-Google-Smtp-Source: AK7set+9FDok9VAPoFoL0WwiG7Ec3vRyzYu+zKmIVCCYMYA1eDY64pozKGnBDXEpRtsJHHR6Ul9DEHbfVA==
X-Received: from rmoar-specialist.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:45d3])
 (user=rmoar job=sendgmr) by 2002:a5b:68c:0:b0:b30:d9c:b393 with SMTP id
 j12-20020a5b068c000000b00b300d9cb393mr15063973ybq.12.1679007568796; Thu, 16
 Mar 2023 15:59:28 -0700 (PDT)
Date:   Thu, 16 Mar 2023 22:59:26 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230316225926.494921-1-rmoar@google.com>
Subject: [KTAP V2 PATCH] ktap_v2: allow prefix to KTAP lines
From:   Rae Moar <rmoar@google.com>
To:     frowand.list@gmail.com, davidgow@google.com,
        skhan@linuxfoundation.org, keescook@chromium.org,
        Tim.Bird@sony.com, brendanhiggins@google.com
Cc:     corbet@lwn.net, guillaume.tucker@collabora.com,
        dlatypov@google.com, kernelci@lists.linux.dev,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Change the KTAP v2 spec to allow variable prefixes to KTAP lines,
instead of fixed indentation of two spaces. However, the prefix must be
constant on the same level of testing (besides unknown lines).

This was proposed by Tim Bird in 2021 and then supported by Frank Rowand
in 2022 (see link below).

Link: https://lore.kernel.org/all/bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com/

As cited in the original proposal, it is useful in some Fuego tests to
include an identifier in the prefix. This is an example:

 KTAP version 1
 1..2
 [batch_id 4] KTAP version 1
 [batch_id 4] 1..2
 [batch_id 4] ok 1 cyclictest with 1000 cycles
 [batch_id 4] # problem setting CLOCK_REALTIME
 [batch_id 4] not ok 2 cyclictest with CLOCK_REALTIME
 not ok 1 check realtime
 [batch_id 4] KTAP version 1
 [batch_id 4] 1..1
 [batch_id 4] ok 1 IOZone read/write 4k blocks
 ok 2 check I/O performance

Here is a link to a version of the KUnit parser that is able to parse
variable length prefixes for KTAP version 2. Note that the prefix must
be constant at the same level of testing.

Link: https://kunit-review.googlesource.com/c/linux/+/5710

Signed-off-by: Rae Moar <rmoar@google.com>
---

This idea has already been proposed but I wanted to potentially
restart the discussion by demonstrating this change can by
implemented in the KUnit parser. Let me know what you think.

Note: this patch is based on Frank's ktap_spec_version_2 branch.

 Documentation/dev-tools/ktap.rst | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index ff77f4aaa6ef..ac61fdd97096 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -192,9 +192,11 @@ starting with another KTAP version line and test plan, and end with the overall
 result. If one of the subtests fail, for example, the parent test should also
 fail.
 
-Additionally, all lines in a subtest should be indented. One level of
-indentation is two spaces: "  ". The indentation should begin at the version
-line and should end before the parent test's result line.
+Additionally, all lines in a subtest should be indented. The standard for one
+level of indentation is two spaces: "  ". However, any prefix for indentation
+is allowed as long as the prefix is consistent throughout that level of
+testing. The indentation should begin at the version line and should end
+before the parent test's result line.
 
 "Unknown lines" are not considered to be lines in a subtest and thus are
 allowed to be either indented or not indented.
@@ -229,6 +231,19 @@ An example format with multiple levels of nested testing:
 	not ok 1 example_test_1
 	ok 2 example_test_2
 
+An example of a test with two nested subtests using prefixes:
+
+::
+
+	KTAP version 2
+	1..1
+	[prefix_1] KTAP version 2
+	[prefix_1] 1..2
+	[prefix_1] ok 1 test_1
+	[prefix_1] ok 2 test_2
+	# example passed
+	ok 1 example
+
 
 Major differences between TAP and KTAP
 --------------------------------------

base-commit: 906f02e42adfbd5ae70d328ee71656ecb602aaf5
-- 
2.40.0.rc1.284.g88254d51c5-goog

