Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD41C4321A
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 14:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62AF264EC8
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 14:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbhBXOoY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232203AbhBXOcj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Feb 2021 09:32:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDAF0C061797
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 06:29:39 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g3so2719296edb.11
        for <linux-doc@vger.kernel.org>; Wed, 24 Feb 2021 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pk1g4YWzo6VwJKO38vFnTY5sBug7k2N7+iy6yJchA38=;
        b=AtV2Mti+arEONOj6IkYoOLOU39J3eSG6sV+Y2CgdKyW7qlsUDWH4UTCzdQHjyr7oZw
         jYy799awSQHnOC8tBB9D0W4H0+Uol0Tislkp1nNMsVTcfSFSkEQSYM5/aLHjFGaI5Ow7
         /a0iaL5TdDnDXewofuR4ACnzuRcmWC+swrexY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pk1g4YWzo6VwJKO38vFnTY5sBug7k2N7+iy6yJchA38=;
        b=EmY4rFIfuSe0gKkX+dVR0cZ3SdZM/h2m19iVbqOY8yvS7Umh1rfpuCpei3eqN4pt7o
         iFi89jhrhYAIO5roOyfZLyU7L3sFnH8z7aIEw1K/2UyxHsgKdo4SEEc+g2ZZ+W72CP4d
         GtL3N7/KMIDIneXrcxwlOag5LaGol55kAgnPkHsphRlZo7Qe38kDMpmSma8RM9EEy6V8
         ltnqVpBogJe7m3RdcX37wocIbd8/w/dv28CgpolFRVz1lhO8j01bproCyC/bDKj1oInX
         lDth0/y3n4ImcjZgthzpnV4t3jWFWEyhEE3iY7HkudUlvE9rCchu4t8iCew03bU1LlXl
         LyXA==
X-Gm-Message-State: AOAM531QBjocPfrlV+U+NKCo+v0eKKvP4acDX3hfJ2YAqO0FRSKJP3V7
        loWqijolHy3hJaCORowIzBkTCQ==
X-Google-Smtp-Source: ABdhPJy002PwwVJ91nV7U/8hILf+8atfkd7Sqz0P7heviYkTxfMFXbSJ4Rsw2e4eWWvqWePBzMwDlQ==
X-Received: by 2002:a05:6402:4ce:: with SMTP id n14mr33624345edw.309.1614176978588;
        Wed, 24 Feb 2021 06:29:38 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id f1sm1493651ejt.21.2021.02.24.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 06:29:38 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     linux-kernel@vger.kernel.org
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH/RFC 0/2] background initramfs unpacking, and CONFIG_MODPROBE_PATH
Date:   Wed, 24 Feb 2021 15:29:07 +0100
Message-Id: <20210224142909.2092914-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

These two patches are independent, but better-together.

The second is a rather trivial patch that simply allows the developer
to change "/sbin/modprobe" to something else - e.g. the empty string,
so that all request_module() during early boot return -ENOENT early,
without even spawning a usermode helper.

The first patch allows delegating decompressing the initramfs to a
worker thread, allowing do_initcalls() in main.c to proceed to the
device_ and late_ initcalls without waiting for that decompression
(and populating of rootfs) to finish. Obviously, some of those later
calls may rely on the initramfs being available, so I've added
synchronization points in the firmware loader and usermodehelper paths
- there might be other places that would need this.

There's not much to win if most of the functionality needed during
boot is only available as modules. But systems with a custom-made
.config and initramfs can boot faster, partly due to utilizing more
than one cpu earlier, partly by avoiding known-futile modprobe calls
(which would still trigger synchronization with the initramfs
unpacking, thus eliminating most of the first benefit).

Rasmus Villemoes (2):
  init/initramfs.c: allow asynchronous unpacking
  modules: add CONFIG_MODPROBE_PATH

 .../admin-guide/kernel-parameters.txt         | 12 +++++
 drivers/base/firmware_loader/main.c           |  2 +
 include/linux/initrd.h                        |  7 +++
 init/Kconfig                                  | 12 +++++
 init/initramfs.c                              | 51 ++++++++++++++++++-
 init/main.c                                   |  1 +
 kernel/kmod.c                                 |  2 +-
 kernel/umh.c                                  |  2 +
 usr/Kconfig                                   | 10 ++++
 9 files changed, 97 insertions(+), 2 deletions(-)

-- 
2.29.2

