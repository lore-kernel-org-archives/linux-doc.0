Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5143C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 17 Dec 2021 04:37:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbhLQEhr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 23:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhLQEhr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 23:37:47 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D76C06173F
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 20:37:46 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id y125-20020a25dc83000000b005c2326bf744so2374088ybe.21
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 20:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=xelJswVre1tYVahXwKTZOkblh1Y4r9luAnX/6Rww7JE=;
        b=eX/gEAi3fmbR2axSllp1ltD6tZwIvalFemFA9465+8cAbjsYszkgeAdmOgioNJ2X2X
         NiPRr8qTLz97za3yorX1oT3EEXMma7QnpDRX8I2HpEjwneXLlKi1sqL8cXP/bKE+wWIp
         Quv9+kSv5Gylr/n/KjZedeXhm/D/MIfjEcoV7QrFN+SUhFRQ3S/aaPpTdoeXPZaS9pCy
         B0f+4sMcNDZRpNQkmj/oG+qCnWvrfd3o9n1xTPxr+0WaEhJFC2MiBRbvylxXAU08/jqq
         8U6xWdwuZKqmvZizNHxdWz67+zVg0yMr+jou6PCB6D4SUMopD6bG176pc2QHXDfgFlb6
         Svew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=xelJswVre1tYVahXwKTZOkblh1Y4r9luAnX/6Rww7JE=;
        b=ppdKdJ7EpSuNPAefgxlyr6lBfNk8u9tBkNxoN6glcYZwP6uzlXDE5VoqXWkT3TRLA+
         w7PM00nuSmSjtYoZt6SSpuC3QVMI1j4vLA4I6nm6NyC15+1o3cAipXUt46qNaWQqWsVX
         tabyPzSlL/nTw2UE+e4W/8m2Ue71f3O2P52psxvNCXdb1j1XM73bFRYIhAOhVLV9ZETe
         nrWh/mxFSZRVInrksxV45j88h61DrqyU6QZLjpT794Xh+zzzi5qawgiZqM2S0tn0MYSz
         dlaXu0wwi1fBXkKUJ09JRenxCQu3ZoZ41nQf5It5qxyOuiIjDhrGO4PEleol2DUj1sQA
         SnOg==
X-Gm-Message-State: AOAM531IIxez/u5YIY8NRR962McHCc3VY5V2oS+hNxOCD8R0KgoDtU1W
        3SrCe1oI3qGCp5Zx6w1RAS6YS0QYWkksiPY=
X-Google-Smtp-Source: ABdhPJxgCYj9kdrU/L7Nuux6pjcDbHKf3PY2daVPoyx3heNOB4dNiDJ6MXuc05/WZcRWeFs4CNHfcPga2Ho96uU=
X-Received: from sharinder.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:c73])
 (user=sharinder job=sendgmr) by 2002:a25:42d7:: with SMTP id
 p206mr1996514yba.765.1639715865881; Thu, 16 Dec 2021 20:37:45 -0800 (PST)
Date:   Fri, 17 Dec 2021 04:37:09 +0000
Message-Id: <20211217043716.794289-1-sharinder@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH v5 0/7] Documentation: KUnit: Rework KUnit documentation
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

Changes since v4:
https://lore.kernel.org/linux-kselftest/20211216055958.634097-1-sharinder@google.com/T/
-- Replaced kunit_suitememorydiagram.png with kunit_suitememorydiagram.svg


Changes since v3:
https://lore.kernel.org/linux-kselftest/20211210052812.1998578-1-sharinder@google.com/T/#m0a85e6a36f13c66470844d92553d19c19239ebed

--Reworded sentences as per comments
--Replaced Elixir links with kernel.org links or kernel-doc references


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

 .../dev-tools/kunit/architecture.rst          | 204 +++++++
 Documentation/dev-tools/kunit/faq.rst         |  73 ++-
 Documentation/dev-tools/kunit/index.rst       | 172 +++---
 Documentation/dev-tools/kunit/run_manual.rst  |  57 ++
 Documentation/dev-tools/kunit/run_wrapper.rst | 247 ++++++++
 Documentation/dev-tools/kunit/start.rst       | 198 +++---
 Documentation/dev-tools/kunit/style.rst       | 105 ++--
 Documentation/dev-tools/kunit/usage.rst       | 578 ++++++++----------
 8 files changed, 1047 insertions(+), 587 deletions(-)
 create mode 100644 Documentation/dev-tools/kunit/architecture.rst
 create mode 100644 Documentation/dev-tools/kunit/run_manual.rst
 create mode 100644 Documentation/dev-tools/kunit/run_wrapper.rst


base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
-- 
2.34.1.173.g76aa8bc2d0-goog

