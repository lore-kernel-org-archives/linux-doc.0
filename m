Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE43C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 26 Mar 2022 12:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbiCZMfh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Mar 2022 08:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbiCZMfh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Mar 2022 08:35:37 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B5012980D
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 05:34:00 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id f10so457513plr.6
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9ofNZo3w8MYHEU2tlu3ohldnf+wb/AqYYJv6h063qo=;
        b=bDykJm24Eh//uqR9FJWPqeJeJIV30EZS6A8143LHTgKN1yVvjstWlUrv2hKeSA37YW
         Y0yvWUr5a5TI/GEt5l6reo+CpYgFzUeietNFrhEYihe8rMHgXiQMViGaUb8PO6WD1nhi
         Y0QxLg+QHZ1JEmq/rVFJb/I4QlFap+DeOV4bWJh76NWS/ZdZ7b9SgnCuWt4olTKHm0AK
         0r6Lq3UZoI/R+AFn4KrYBNM+ii1Xf79mw5u/6CV3UhJUqYSieVVpabMbpXw8FpdddIl2
         1vveHpKxMDgAaVxoOAWEC+nAVbbgh30ZPXrVA7VVruZfoeHuSqj3K050F8OdBuirWXwE
         nC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H9ofNZo3w8MYHEU2tlu3ohldnf+wb/AqYYJv6h063qo=;
        b=Nv+vYftFQZ/mX5MbpLN1OlyzfWJXsN84oVumdGVCi1kbZ73sVT1iWuIDvYNOqnrPRL
         nV8I7g+YTYNFZSbEyeIZu0LQ4k6+jM3QzafFTfUeQemDQKkBcz45tHHdR6VC5PIf+iyA
         OmNRqtchQ5/aRSIQfwJgjFWi/cE+IkHPx9hT3JaI2UuH2tocEDtQg/k2qDFD/0NO09ZZ
         LKunrqC7EpRARUMCIPXGit6B4DAGfeB2Pa4o/zXPCAS7zVvqgwzRrWzd1ggLB5xFYYti
         2z2u+Hdik28EcLdft0/O+JLP4U0OICfi01hX6vDgOrRRx/kTu7WSHS8DoYOyBcohK1A/
         XrYA==
X-Gm-Message-State: AOAM53126tWwm231EsgEiPrUCQNboDs+tzouGIKdnNcmOCc09M55wUE4
        5yADaNeVhEzvcUo8ys+3CrxCqIrHme8RPQ==
X-Google-Smtp-Source: ABdhPJz7NWXPGSo2a2B72d8WubLJyQhkc+tcvhrmn4uiiqYhzsxhsfeLHMAhGRwFJrawhl5b0HJswg==
X-Received: by 2002:a17:90a:7e95:b0:1bc:5d56:8d4c with SMTP id j21-20020a17090a7e9500b001bc5d568d4cmr30362762pjl.93.1648298039479;
        Sat, 26 Mar 2022 05:33:59 -0700 (PDT)
Received: from ubuntu.mate (subs32-116-206-28-2.three.co.id. [116.206.28.2])
        by smtp.gmail.com with ESMTPSA id k62-20020a17090a4cc400b001c7ea7f487asm4872920pjh.39.2022.03.26.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 05:33:58 -0700 (PDT)
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 0/2] Documentation: doc-guide: Add missing page titles
Date:   Sat, 26 Mar 2022 19:33:36 +0700
Message-Id: <20220326123337.642536-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing page title for
Documentation/doc-guide/{kernel-doc,sphinx}.rst. Without it, top-level
TOC for doc-guide directly shows chapter headings instead.

Changes since v1 [1]:
  - Split into two patches
  - Promote "Writing kernel-doc comments" (suggested by Jonathan
    Corbet)
  - Use suggested page title from Jonathan Corbet for sphinx.rst

[1]: https://lore.kernel.org/linux-doc/20220322113645.502544-1-bagasdotme@gmail.com/

Bagas Sanjaya (2):
  Documentation: kernel-doc: Promote "Writing kernel-doc comments" to
    page title
  Documentation: sphinx: replace "Introduction" chapter heading with
    page title

 Documentation/doc-guide/kernel-doc.rst | 29 +++++++++++++-------------
 Documentation/doc-guide/sphinx.rst     |  5 +++--
 2 files changed, 18 insertions(+), 16 deletions(-)


base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
An old man doll... just what I always wanted! - Clara

