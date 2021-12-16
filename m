Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DE4C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 06:00:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbhLPGAJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 01:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhLPGAI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 01:00:08 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E20C06173E
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 22:00:08 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id l75-20020a25254e000000b005f763be2fecso47911178ybl.7
        for <linux-doc@vger.kernel.org>; Wed, 15 Dec 2021 22:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=aJH+lCrCj/FCAEAw+OVjC7PHR7hNdrehYFIH6GhhY+M=;
        b=tTH+FDKL8a6uXwQeRiZm+e98anzVyUEmmbJ85hLHy0yEamPt1ILynrqX7bBviubDUW
         CJrXHlBabCSqhC9Y0Sm/eYfnazJOiTNojza5XgXMP6coyedocU6Kp9A5odccaktcalwY
         11kjaNz8I6JdFmobMTgcYlwvyL5dnV0SqXfYSix0LWGDVqOqMLrfD14CE2c0nHSTT+ID
         C4dtENcSFk0tmJzf/uGyBkKLfabT8TuR3FRPQgwrpgDeWFKfqQTYB5Ti3E4hIAJhJpE5
         NiWkxNcFRVixa8BJkRIlSQR2dDrnIcWHW+uD6OilQ/ZpPeUgTX9W1ck6NrJGBTKyzkvW
         tzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=aJH+lCrCj/FCAEAw+OVjC7PHR7hNdrehYFIH6GhhY+M=;
        b=aoqA902EPJynVI3TInUom62VOztGZ7rqCfwx04UXWn18vFUYhVnc6LLFRiw7EVwXbQ
         a42rtXWLG15MF0bQqdM6ohvTO0H3T7Ht/n69sEMbjdeIs8JLko3gZOeSD4ygXcJ4pMZF
         +F+kMUihTA4fE53Qo9PKKddieQb3I5YipFNoJC0do5VyFkPv6VJgHv3vVHqXYwMi+K+Y
         EGxek0NbdDR008faC4oPfRKY5trhyi8dx1+K073WstxxkFDIDtmOyZW4Ejs3miCFXzyh
         iCxbcJAK7aEFNT50ypiCQOLqse9GNbCr2TIE38l170aaX4GH0tgwMYSmksZqwBk/88Fx
         CIkQ==
X-Gm-Message-State: AOAM530W9dwFzKBRcLruLHeN9mKzZfb9k0BvH4ly+70tM661IJNx1nEd
        753phVzNkcY0ZYBQql8rMOow46kYTrBnL88=
X-Google-Smtp-Source: ABdhPJwccA/YgCl1BpryK2Vgg3slqBUEr5qAZLGb0+zAVgYeDO0W6rN/qSt16FDkdUFy247/dyGGY1r+7c/Kp2Y=
X-Received: from sharinder.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:c73])
 (user=sharinder job=sendgmr) by 2002:a25:ac06:: with SMTP id
 w6mr12338192ybi.85.1639634407935; Wed, 15 Dec 2021 22:00:07 -0800 (PST)
Date:   Thu, 16 Dec 2021 05:59:51 +0000
Message-Id: <20211216055958.634097-1-sharinder@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH v4 0/7] Documentation: KUnit: Rework KUnit documentation
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
 .../kunit/kunit_suitememorydiagram.png        | Bin 0 -> 24174 bytes
 Documentation/dev-tools/kunit/run_manual.rst  |  57 ++
 Documentation/dev-tools/kunit/run_wrapper.rst | 247 ++++++++
 Documentation/dev-tools/kunit/start.rst       | 198 +++---
 Documentation/dev-tools/kunit/style.rst       | 105 ++--
 Documentation/dev-tools/kunit/usage.rst       | 578 ++++++++----------
 9 files changed, 1047 insertions(+), 587 deletions(-)
 create mode 100644 Documentation/dev-tools/kunit/architecture.rst
 create mode 100644 Documentation/dev-tools/kunit/kunit_suitememorydiagram.png
 create mode 100644 Documentation/dev-tools/kunit/run_manual.rst
 create mode 100644 Documentation/dev-tools/kunit/run_wrapper.rst


base-commit: 4c388a8e740d3235a194f330c8ef327deef710f6
-- 
2.34.1.173.g76aa8bc2d0-goog

