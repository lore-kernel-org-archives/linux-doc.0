Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FD6C433E7
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 09:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7B4920776
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 09:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com header.i=@unikie-com.20150623.gappssmtp.com header.b="xFQVbgMl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729454AbgJLJgg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 05:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgJLJgb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Oct 2020 05:36:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A122EC0613D0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2020 02:36:27 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a23so15499646ljp.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2020 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Zj5mMUtLNYo6oAEdM0gEHJSI5IliC+fkGXCu4CaHdAY=;
        b=xFQVbgMlMheXwcgkBRO4AUEotBNvO6aghBndfe/QC2hUoGDcYBmALVlU5fudd+qi9Q
         EN5ev7Ul0Vsipj0qPIHIFH7i9XQJbSxDgd5xqmUhSEO3n/W73cJXFKc6YdSX3Z99QzCe
         I9KqOln2kiaJPL5FmdBMk+cprHLdfbtigSsTBUYOxGg+bpf8VT4qNOcjRi18wFIPf0ko
         35JfHeFfRWP5tN25YaHfXE6JDw0M/kV4jGwxdFW+nzvXOelgW8B/wAgpVO71I6XjAT2b
         yu/NPLkbJIj3X9TjZbb6JJOHARb+THs9BqrKdGcgEG+gAmxX8e3dGozlpA4EzsZTBzIc
         LnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zj5mMUtLNYo6oAEdM0gEHJSI5IliC+fkGXCu4CaHdAY=;
        b=S+FN2aWawD12w0JNygOdlBgycvIYjs1z6TSh9hRv9suxwTxV6Lsa6gjWTJwG4LXfK9
         8qt3yEUrUOJ4B2r+WNUO697is0+rRjGN1lUkb7V96MI4Rsefr1NB6xJjXbWO8PhMuTS3
         0xCM6vn8NcGljyud5jzJbq+/RhOY4xpJSfxDSalT20WwhyYFtDHE8V16UKpLrB+qSEXY
         R/xOEb8Rnqi34MRAcddbM4JhLCwvFGlfnK1PlPkhQ75hQZU9XC+MJ6Th0cyi286MM8Ni
         RPxEJ83Cj8/XuE6+u8myLtEUGHHqrnndTFGeJDnUq1KJw2Pbj5dyRIkwm+UgVec9alO+
         uZEA==
X-Gm-Message-State: AOAM532urPJK3VCTQgColjCpjg9wqbLfN9dAKNlTKtixrWjxJZvvGCSZ
        eC7i7auZxSURhQOkn0Z7Lih4j/h6maMzBA==
X-Google-Smtp-Source: ABdhPJwTr3UpgMO12GTqbOpxI38civjCg5KJi70qaTHruvA2YNKjuiYVr9n04EcQv2AnkSeTB2RGhw==
X-Received: by 2002:a2e:50d:: with SMTP id 13mr9492263ljf.195.1602495385226;
        Mon, 12 Oct 2020 02:36:25 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.gmail.com with ESMTPSA id f10sm3826846ljn.87.2020.10.12.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 02:36:24 -0700 (PDT)
From:   jouni.hogander@unikie.com
To:     linux-doc@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, corbet@lwn.net, masahiroy@kernel.org,
        dvyukov@google.com, Jouni Hogander <jouni.hogander@unikie.com>
Subject: [PATCH] Documentation: kbuild: Add initramfs into reproducible builds document
Date:   Mon, 12 Oct 2020 12:35:30 +0300
Message-Id: <20201012093530.10690-1-jouni.hogander@unikie.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jouni Hogander <jouni.hogander@unikie.com>

Initramfs configuration has impact on build being reproducible

Signed-off-by: Jouni Hogander <jouni.hogander@unikie.com>
---
 Documentation/kbuild/reproducible-builds.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index 3b25655e441b..559700531a48 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -119,6 +119,14 @@ To avoid this, you can make the vDSO different for different
 kernel versions by including an arbitrary string of "salt" in it.
 This is specified by the Kconfig symbol ``CONFIG_BUILD_SALT``.
 
+Initial RAM Filesystem
+----------------------
+
+If ``CONFIG_BLK_DEV_INITRD`` is enabled and ``CONFIG_INITRAMFS_SOURCE``
+doesn't contain gzipped cpio archive, an initramfs is generated during
+build. To avoid this provide gzipped cpio archive via
+``CONFIG_INITRAMFS_SOURCE``
+
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
 .. _KCFLAGS: kbuild.html#kcflags
-- 
2.17.1

