Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4E9C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 05:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhLPF7E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 00:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbhLPF7D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 00:59:03 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC0BC06173E
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 21:59:03 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id w9-20020a25c709000000b00608a9489fc1so18619013ybe.20
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 21:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Q/yA9sPgnWZ7PZbSTSePDzl+2+LX/jsSZ2aJXrNG7YE=;
        b=fepJWLX7hV0ztvI1hsIYqLai2r+H/vlyh8tiT5mb2MTEJhB7iaJEqryYP5IX5wuTna
         f+JgF9v4Zb7JWmoV0dz4Hweb9DXMbYrd9YgHPcrRAHIjCv0apUkX/EA3xjlZ18WltZu7
         UZ4wLUzop0/KgPgVK7QoLkwo+ey37cp+nyWjOQdu+ne/72nX1LJB4tVvoK4nrxn5D7Ma
         7FjL+0VJA9mc8mnU0/JpJp4cfcnS8QYopXk14UwhuPfKkQXIhew2EVfW+ZBpPzG+rTrZ
         6gHSEX3M/xk/BgnZBhzfRTYuNRxqyVnFBxTxDEsBunIgP7xcSWeHLG3QvgZ8+GmMUMhv
         qiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Q/yA9sPgnWZ7PZbSTSePDzl+2+LX/jsSZ2aJXrNG7YE=;
        b=Fajd84Gh3qDl9vn9UG3RdhPFMwaMHMi2l1IqCw0dn21BjJdKU0sY4sFkSVJhSl4Xin
         cffJal04ikd7opP9ynpFHdGQdbeX93YAzKepkiXaraH31FbGg0bdUI56pIjlHmiFym5Y
         v5Od37GDefdWISXd0Yq1jPRUMTH+h5VXLWxAKT9AJM6OOj9lNHJjEGOePDzu3Btn0Ld9
         9CWNFSZn16VPghSz5RO5kMBw1mprivYGTEL0FNHlZ3U87xsrglvK3gixBqNUIVmOPNa3
         dqXNzNlzwRwc0o5pqNYJwqRJ5kUNZxzWUUcGPY+kUvsmV1/4UNhqP6JDAJ17mSSuRycJ
         AgzQ==
X-Gm-Message-State: AOAM5332vT7pPSqqRdcm9vwXrMDdT72cB+foQEa8iZwF98/3vxmG28H2
        F6yj4A1GZlGcyMNhYfwdcDbuxyVGQc+ril4=
X-Google-Smtp-Source: ABdhPJwMHOwan2CP1wQt0tNbynrtfubY79jKC0FlQf2bbVcCs4J7D6XCotGncWYPS2tYwF9n51+W9fHs2z+LdVg=
X-Received: from sharinder.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:c73])
 (user=sharinder job=sendgmr) by 2002:a25:e746:: with SMTP id
 e67mr11022984ybh.476.1639634342847; Wed, 15 Dec 2021 21:59:02 -0800 (PST)
Date:   Thu, 16 Dec 2021 05:58:38 +0000
Message-Id: <20211216055845.633350-1-sharinder@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH v3 0/7] Documentation: KUnit: Rework KUnit documentation
From:   Harinder Singh <sharinder@google.com>
To:     davidgow@google.com, brendanhiggins@google.com, shuah@kernel.org,
        corbet@lwn.net
Cc:     linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tim.bird@sony.com, elver@google.com,
        Harinder Singh <sharinder@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The KUnit documentation was not very organized. There was little
information related to KUnit architecture and the importance of unit
testing.

Add some new pages, expand and reorganize the existing documentation.
Reword pages to make information and style more consistent.

Changes since v2:
https://lore.kernel.org/linux-kselftest/20211207054019.1455054-1-sharinder@google.com/T/

--Reworded sentences as per comments
--Expanded the explaination in usage.rst for accessing the current test example
--Standardized on US english in style.rst

Changes since v1:
https://lore.kernel.org/linux-kselftest/20211203042437.740255-1-sharinder@google.com/

--Fixed spelling mistakes
--Restored paragraph about kunit_tool introduction
--Added note about CONFIG_KUNIT_ALL_TESTS (Thanks Tim Bird for review
comments)
-- Miscellaneous changes

Harinder Singh (7):
  Documentation: KUnit: Rewrite main page
  Documentation: KUnit: Rewrite getting started
  Documentation: KUnit: Added KUnit Architecture
  Documentation: kunit: Reorganize documentation related to running
    tests
  Documentation: KUnit: Rework writing page to focus on writing tests
  Documentation: KUnit: Restyle Test Style and Nomenclature page
  Documentation: KUnit: Restyled Frequently Asked Questions

 .../dev-tools/kunit/architecture.rst          | 206 +++++++
 Documentation/dev-tools/kunit/faq.rst         |  73 ++-
 Documentation/dev-tools/kunit/index.rst       | 172 +++---
 .../kunit/kunit_suitememorydiagram.png        | Bin 0 -> 24174 bytes
 Documentation/dev-tools/kunit/run_manual.rst  |  57 ++
 Documentation/dev-tools/kunit/run_wrapper.rst | 247 ++++++++
 Documentation/dev-tools/kunit/start.rst       | 198 +++---
 Documentation/dev-tools/kunit/style.rst       | 105 ++--
 Documentation/dev-tools/kunit/usage.rst       | 578 ++++++++----------
 9 files changed, 1049 insertions(+), 587 deletions(-)
 create mode 100644 Documentation/dev-tools/kunit/architecture.rst
 create mode 100644 Documentation/dev-tools/kunit/kunit_suitememorydiagram.png
 create mode 100644 Documentation/dev-tools/kunit/run_manual.rst
 create mode 100644 Documentation/dev-tools/kunit/run_wrapper.rst


base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
-- 
2.34.1.173.g76aa8bc2d0-goog

