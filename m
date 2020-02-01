Return-Path: <SRS0=YSo4=3V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2915C35240
	for <linux-doc@archiver.kernel.org>; Sat,  1 Feb 2020 00:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E4042465B
	for <linux-doc@archiver.kernel.org>; Sat,  1 Feb 2020 00:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TgtQby4e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgBAABO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Jan 2020 19:01:14 -0500
Received: from mail-ua1-f73.google.com ([209.85.222.73]:47906 "EHLO
        mail-ua1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgBAABO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Jan 2020 19:01:14 -0500
Received: by mail-ua1-f73.google.com with SMTP id b18so2196589uap.14
        for <linux-doc@vger.kernel.org>; Fri, 31 Jan 2020 16:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=xCsmu4aj8EN/ECCHKtP+kWyAhx9ybdR5E/pP0+fGVsg=;
        b=TgtQby4eRqpgOeGBlTU4dTD9h1ULNYnndcMLety++EJ4HQjpz37LvWy5bzeabDJald
         un27UOLZ+XU1TkH8XBnm61cmDpNZ0vd7CIuKCla88JAqJUDjBYc768VJ9Ej3fM09iwIo
         2eIu8RVWOLsNMFvgBfBJn403Fb0kpJhMdD/MymRVosVO0fYldLhc9+kpv2Et0I5J4XNF
         QQLDhJRoZI08J6f7Ejp32X6v0T40f92d3OCkfw+OzB2vtpocZbBZdC52jfBH7gYU4CSj
         RCdQzPXpp/cL2UbtO1M77KJglkXTizVM32CBPRw14l09uchxQqiE2ibVw59vA+ltW+b2
         iB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=xCsmu4aj8EN/ECCHKtP+kWyAhx9ybdR5E/pP0+fGVsg=;
        b=FowZUAGtaa01WIRnHx6J/lVlmog+TPi09Gf2aPxInAu7/07nX7lFQovA+TEDAk1smZ
         8s/duY8u/a2o5pqiFV3kDHi0Mn1n4STHR5ee64DNmpG3v+QnvDTMpcOlTteALeObgu+H
         INocZ8bsTakge3jy2SZbTf1nG4ugsr1P4WF04evpcP98TTj3Xdr2mytTHg5HUq8QIJMt
         XxdLjOb4v5V3AhUz7RiaND3/ViEFt3b5drzvuq7v8P2CKzxAiv3u7GBFWcsqPdyD/UDK
         bFcsQlDs49QFyO5FZ7wqqOL8LFM2QQwXgE3c0CgGTnk1JDVsHNm8JgEcVCTlG7dFJGAg
         rHIQ==
X-Gm-Message-State: APjAAAWtuZ2fGSiwac0687k40wMsbl8C39CPbUnqclxAtU2A6yGKcTGh
        jiPGBqb2Smnv0HX+fBvsESp5AcLHvgEA1KRmrQlpyQ==
X-Google-Smtp-Source: APXvYqxlrR68AJPQzIEvwHccod9/5UKO3hKIkgEkI9aMx1JBOe57PrDtQ41vCE3bZBQcm1E2nsuDWstTBUfbyFdGvDNwUw==
X-Received: by 2002:a1f:d5c5:: with SMTP id m188mr8311853vkg.7.1580515271831;
 Fri, 31 Jan 2020 16:01:11 -0800 (PST)
Date:   Fri, 31 Jan 2020 16:01:02 -0800
Message-Id: <20200201000102.69272-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v1] Documentation: kunit: fixed sphinx error in code block
From:   Brendan Higgins <brendanhiggins@google.com>
To:     shuah@kernel.org
Cc:     kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net, davidgow@google.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a missing newline in a code block that was causing a warning:

Documentation/dev-tools/kunit/usage.rst:553: WARNING: Error in "code-block" directive:
maximum 1 argument(s) allowed, 3 supplied.

.. code-block:: bash
        modprobe example-test

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 7cd56a1993b14..607758a66a99c 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -551,6 +551,7 @@ options to your ``.config``:
 Once the kernel is built and installed, a simple
 
 .. code-block:: bash
+
 	modprobe example-test
 
 ...will run the tests.
-- 
2.25.0.341.g760bfbb309-goog

