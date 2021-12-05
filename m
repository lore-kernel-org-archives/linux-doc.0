Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19506C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbhLENst (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:48:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232715AbhLENst (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:48:49 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A51AC061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:22 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so8794887pja.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t06m7sGrJzP18isFfuSEN67FwQhxjbPdi4l3Fop3IY8=;
        b=VPtv/pnXWU3SXznkIYT10ZuXU220Ld6L7OLyUVGYB2XhyHmlGjTLUhJsGJV/caYx9w
         +7ojvXNFRI4W1uFttn80arvQtPA/0P11nJQoKciGVJVz6IVJ+69scpXgxVjVVokyKAmI
         tnNge0ZgZJkDIOduzdqgcfejO/yCigPyBIE05npPq0/bOAKRpHhiJYrw4UDuVugKHrrH
         RYo3TI8jQnOSkRrGwhQrxTJ0vVlaHnUoptshmfswI+wZa6ImaZtp5oy6G984RvuHLH0K
         1nWk/vlEgaMNrFu3r+zSAu79dM6anjMGtzXsKKTGEXZJByhTKp/Wdf7ultk4YKl0mmiD
         PPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t06m7sGrJzP18isFfuSEN67FwQhxjbPdi4l3Fop3IY8=;
        b=TRTW6l1lKQ7OylOVajUA/pSHMABjj1705t4yl0PCjtsDmT0SmOWycUNZ5BSRXkH/oN
         UUgdyxdqzhyNF+tHfwY1VZpee6nUA7ASSPzicxGPAtCZo2ypP2WN0Kk+EKLUSxbqbW6o
         mmFtxC4LqPeQx4vGKuToF1D/9inJCWw44XjpEdo1tJ26r+V1JTY7ecM/zUUrwofSMXfd
         SQUszV/scdtBKkBhfAtdCW9oQYZZneRUiAYbXgbTVjdyqJl8g4ojspqIEuJIdlh/4WPQ
         k0fBnBm4ykG1TCUf5dICXnF1KXWEX13f2tnFrOnNmttNwFIkp+4TJ9ilIjDFGLh3vbRS
         yTRQ==
X-Gm-Message-State: AOAM533OLd3F6TfB16+8LC2EKW7NYbIlVBGVmp1Gd6x7aOnsa10JoJbp
        D2PZMjuKyCdaCkM7aexD24fS0+tANdrkgA==
X-Google-Smtp-Source: ABdhPJyZC7HbzvGapiYMdUg/yFRdk1OHdOfRJBkl6wPGkLYEy4nf1r71o/uMf1H3fWsLq/mxgSeUfA==
X-Received: by 2002:a17:902:e302:b0:141:ba08:2e44 with SMTP id q2-20020a170902e30200b00141ba082e44mr36690332plc.81.1638711921386;
        Sun, 05 Dec 2021 05:45:21 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:20 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 00/11] docs: fix build warning
Date:   Sun,  5 Dec 2021 21:43:49 +0800
Message-Id: <cover.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I can't stand these red warnings anymore, especially when I'm testing my
patches and looking for my own warnings in a sea of warnings. so, let's
fix them!

* Patch 0001 optimized the layout of the n_gsm.rst document, which would make the html rendering incorrect.

* Patch 0002-0011 Fix warning as:

linux-next/Documentation/admin-guide/device-mapper/writecache.rst:23: WARNING: Unexpected indentation.
linux-next/Documentation/arm64/tagged-address-abi.rst:52: WARNING: Unexpected indentation.
linux-next/Documentation/filesystems/netfs_library.rst:519: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/filesystems/netfs_library.rst:519: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation.
linux-next/Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation.
linux-next/Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentation.
linux-next/Documentation/virt/kvm/api.rst:6046: WARNING: Literal block ends without a blank line; unexpected unindent.
linux-next/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------
linux-next/Documentation/virt/kvm/api.rst:7296: WARNING: Title underline too short.

8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
-----------------------------
linux-next/Documentation/driver-api/serial/n_gsm.rst:23: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/driver-api/serial/n_gsm.rst:100: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/driver-api/serial/n_gsm.rst:115: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:118: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:120: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:122: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:125: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/driver-api/serial/n_gsm.rst:139: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/idr.rst:20: WARNING: Unknown target name: "xarray".
linux-next/Documentation/admin-guide/gpio/gpio-sim.rst: WARNING: 文档没有加入到任何目录树中
linux-next/Documentation/filesystems/caching/backend-api.rst:417: WARNING: undefined label: documentation/filesystems/netfs_library.rst (if the link has no caption the label must precede a section header)
linux-next/Documentation/trace/boottime-trace.rst:136: WARNING: undefined label: histogram (if the link has no caption the label must precede a section header)

* other:

<https://lore.kernel.org/linux-doc/20211205132141.4124145-1-siyanteng@loongson.cn/T/#u> Fix warning as:
linux-next/Documentation/networking/kapi:122: ./include/linux/phy.h:543: WARNING: Unexpected indentation.
linux-next/Documentation/networking/kapi:122: ./include/linux/phy.h:544: WARNING: Block quote ends without a blank line; unexpected unindent.
linux-next/Documentation/networking/kapi:122: ./include/linux/phy.h:546: WARNING: Unexpected indentation.

<https://lore.kernel.org/linux-doc/20211205131503.4122955-1-siyanteng@loongson.cn/T/#u> Fix warning as:
linux-next/Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:96: WARNING: Unexpected indentation.
linux-next/Documentation/driver-api/regulator:166: ./include/linux/regulator/driver.h:98: WARNING: Block quote ends without a blank line; unexpected unindent.

<https://lore.kernel.org/linux-doc/20211205130816.4121898-1-siyanteng@loongson.cn/T/#u> Fix warning as:
linux-next/Documentation/driver-api/generic-counter:234: ./include/linux/counter.h:43: WARNING: Unexpected indentation.
linux-next/Documentation/driver-api/generic-counter:234: ./include/linux/counter.h:45: WARNING: Block quote ends without a blank line; unexpected unindent.

<https://lore.kernel.org/linux-doc/163a4dde20b8c4b68d668977a668e281d18fcf92.1638517064.git.siyanteng@loongson.cn/T/#u> Fix warning as:
linux-next/Documentation/scheduler/sched-bwc.rst:243: WARNING: Inline emphasis start-string without end-string.

* No fix:(These seem tricky,I can't do anything about it for now.)

linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:522: WARNING: Unexpected indentation.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:516: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:522: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:522: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:523: WARNING: Block quote ends without a blank line; unexpected unindent.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:526: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:532: WARNING: Unexpected indentation.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:526: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:526: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:533: WARNING: Block quote ends without a blank line; unexpected unindent.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:542: WARNING: Unexpected indentation.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:535: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:535: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:542: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:542: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:544: WARNING: Block quote ends without a blank line; unexpected unindent.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:546: WARNING: Definition list ends without a blank line; unexpected unindent.
linux-next/Documentation/core-api/kernel-api:81: ./lib/bitmap.c:570: WARNING: Unexpected indentation.
linux-next/Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing:2: WARNING: Inline emphasis start-string without end-string.
linux-next/Documentation/ABI/testing/sysfs-class-thermal:201: WARNING: Bullet list ends without a blank line; unexpected unindent.
linux-next/Documentation/networking/kapi:147: ./drivers/net/phy/phylink.c:1657: WARNING: Unexpected indentation.
linux-next/Documentation/networking/kapi:147: ./drivers/net/phy/phylink.c:1658: WARNING: Block quote ends without a blank line; unexpected unindent.
linux-next/Documentation/gpu/drm-kms-helpers:451: ./drivers/gpu/drm/drm_privacy_screen.c:270: WARNING: Inline emphasis start-string without end-string.



Yanteng Si (11):
  docs/driver-api: Reformatting serial ngsm
  docs/admin-guide: Add the necessary blank lines to the writecache
  docs/arm64: delete a space from tagged-address-abi
  docs/vm: delele three spaces from page_owner
  docs/filesystems: add four apostrophes to _start and _len
  docs/virt: add a blank line and some - to kvm api
  docs/driver-api: Replace a comma in the n_gsm.rst with a double colon
  docs/core-api: Replace Footnote Reference in document idr with
    Substitution Reference
  docs/filesystems: fix a label of backend-api
  docs/trace: fix a label of boottime-trace
  docs/admin-guide: add gpio-aggregator into index

 .../admin-guide/device-mapper/writecache.rst  |   1 +
 Documentation/admin-guide/gpio/index.rst      |   1 +
 Documentation/arm64/tagged-address-abi.rst    |   2 +-
 Documentation/core-api/idr.rst                |   3 +-
 Documentation/core-api/xarray.rst             |   1 -
 Documentation/driver-api/serial/n_gsm.rst     | 246 +++++++++---------
 .../filesystems/caching/backend-api.rst       |   2 +-
 Documentation/filesystems/netfs_library.rst   |   2 +-
 Documentation/trace/boottime-trace.rst        |   2 +-
 Documentation/virt/kvm/api.rst                |   3 +-
 Documentation/vm/page_owner.rst               |   6 +-
 11 files changed, 139 insertions(+), 130 deletions(-)

-- 
2.27.0

