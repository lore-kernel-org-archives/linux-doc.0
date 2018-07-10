Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D4E07D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 00:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754611AbeGJAqh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Jul 2018 20:46:37 -0400
Received: from mail-qt0-f193.google.com ([209.85.216.193]:35661 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933422AbeGJAq2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Jul 2018 20:46:28 -0400
Received: by mail-qt0-f193.google.com with SMTP id a5-v6so2471603qtp.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Jul 2018 17:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tWiyJeGvC5zdp0sRApZQtqvGHxQUko6rZedkHxbyDtU=;
        b=WODPSP/5L1Z81kXHA75mQAWoK9kUS536qPdhru93iU0cg+c5yDop7rtQTZLc6h2req
         XwikVXyXxVzXOQ0K5oOvkz66lQAKkCAItFUICKyv7s+klLa3LBbp8pasvb049BB5JsQM
         fILF+WlhRWFJSwAdGmJnLrZkEOJTwUcIL/6KDhKyArrx9oejNaE1Sk4leTeqFQK4n4W/
         f4AbNG16biiERr+5/MSkh/u+Qy4eGrpwGsJbTMndeYn12pI2BZRZNK7TTShS8EuXOdyA
         3/VU0KfT7gZC+Vmgr0MP8pCcC/b9Hm5HyE+WTINEWl+UGvLXyI9Hs4n5/X4CjMl2swVY
         Y2+w==
X-Gm-Message-State: APt69E1roJIZtapW6+TYrVNWalVvtETrbqAtwSdKPvtey4T2CT84L9VR
        G4KBrV+MKmhm9tq8fT7JvuF22A==
X-Google-Smtp-Source: AAOMgpdZ5iID0peRzm7lqvJvb02pQkLpCP/bGfHAcqzNb45e2VJiVs5oNubwOBtAjdFwubYV3N8F0A==
X-Received: by 2002:ac8:709:: with SMTP id g9-v6mr21415585qth.110.1531183588250;
        Mon, 09 Jul 2018 17:46:28 -0700 (PDT)
Received: from labbott-redhat.redhat.com ([2601:602:9802:a8dc::1941])
        by smtp.gmail.com with ESMTPSA id l36-v6sm1816792qtk.12.2018.07.09.17.46.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jul 2018 17:46:27 -0700 (PDT)
From:   Laura Abbott <labbott@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Olsa <jolsa@kernel.org>
Cc:     Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCHv2 7/7] Kbuild: Use HOST*FLAGS options from the command line
Date:   Mon,  9 Jul 2018 17:46:02 -0700
Message-Id: <20180710004602.21599-8-labbott@redhat.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Now that we have the rename in place, reuse the HOST*FLAGS options as
something that can be set from the command line and included with the
rest of the flags.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Use the correct name for HOSTLDLIBS, update documentation.
---
 Documentation/kbuild/kbuild.txt | 16 ++++++++++++++++
 Makefile                        |  9 +++++----
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6c9c69ec3986..9847a5974826 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -238,3 +238,19 @@ KBUILD_VMLINUX_LIBS
 All .a "lib" files for vmlinux.
 KBUILD_VMLINUX_INIT, KBUILD_VMLINUX_MAIN, and KBUILD_VMLINUX_LIBS together
 specify all the object files used to link vmlinux.
+
+HOSTCFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTCC) when building host programs.
+
+HOSTLDFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTLD) when building host programs.
+
+HOSTCXXFLAGS
+--------------------------------------------------
+Additional flags to be passed to $(HOSTCXX) when building host programs.
+
+HOSTLDLIBS
+--------------------------------------------------
+Additional libraries to link against when building host programs.
diff --git a/Makefile b/Makefile
index 96e34381d9ee..c2ee1d4c12c9 100644
--- a/Makefile
+++ b/Makefile
@@ -360,10 +360,11 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 HOSTCC       = gcc
 HOSTCXX      = g++
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
-		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
-KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
-KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
-KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS)
+		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
+		$(HOSTCFLAGS)
+KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
+KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
+KBUILD_HOSTLDLIBS := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
