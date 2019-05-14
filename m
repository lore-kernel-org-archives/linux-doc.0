Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75A007D923
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 05:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfENFql (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 01:46:41 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:40883 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbfENFqi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 01:46:38 -0400
Received: by mail-yw1-f74.google.com with SMTP id k134so29131935ywe.7
        for <linux-doc@vger.kernel.org>; Mon, 13 May 2019 22:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
        b=ogDQD8ZjbQ6rQB/cWAayl+9VthgdTRB4N9+9GyMbHO4DiRsdRDrdV4hPILgY7Dd+L0
         I2RHu02OyvKeDL+lm6hCGMoAmOxcXp1iclHCDygBWy5BFLe5GT+edQ82hOKLR/JJ9KdQ
         11b1p3QAxEdg7lXAO1lNroEn+qdvSJWt3iw3DL5AYhMjgqkE31tSGZQfrWeGG6OKTYPS
         afsxa8QMIeJn+iGaVG/JH2h1LJjJKyL47IF09+kVKczWp9X/zQGgRpH1Zc1iYBbEn+oS
         scXx1DItvS3mhp2+j2MbNl8vNbIJweBsYUaOnaq+FaUIBk4qrqEB0Zys9RYKfXBLRZW1
         bh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=NNCnVCTAATMxlDMarLLJ67yqDDVFt+vwrBh9wh5mNVQ=;
        b=oXUbFoAo4ad5Uy5mOTnxEbaDq49uZqG24WeYydRaSjyOHN6huqflAiGI6yEsqPQSko
         TsDJb3DHO4+vUjLNdyOaWYxvLCsipbJbp+6aBRbNxEqKG/9fZB1yEYr9Gxvp3FJ3h/du
         MCuMI981K25jHhB14pf+KQ4lacb35UE8g5+N92o74A/LsXhYf6kseNXsEMsy4krcCJY1
         gqHATf13dpy1c6yKe/QLANS1sB8blph47UGkCkaGgPL/etKMdiCfjmCSVTXwP7mU6jet
         D9o2/EkuQdC5tiNuKZWXkKt0fZ/S2Zh6HAxTDXTaRg/+0JCjAgpNvHH8n8AxS9p1/+u0
         Si+g==
X-Gm-Message-State: APjAAAUftPDBpGoOkEEGGFNwsrnF70ZXfMRFnF7yuLJN8bQPSAa9fHB5
        Hk0Oz+kL4qs+z38R1TUVRcCfkCdlBCneV8npcDz76g==
X-Google-Smtp-Source: APXvYqzDnMJ4szPxIA4N77qJLw1e3aRJqDLenWVgRY3sM/QbVOHbh8x+6bBUoK7BNggbwfl2r5XHp/gCvYGW7uZKqd8+nw==
X-Received: by 2002:a81:9b17:: with SMTP id s23mr15952402ywg.503.1557812797962;
 Mon, 13 May 2019 22:46:37 -0700 (PDT)
Date:   Mon, 13 May 2019 22:42:52 -0700
In-Reply-To: <20190514054251.186196-1-brendanhiggins@google.com>
Message-Id: <20190514054251.186196-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514054251.186196-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v3 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com,
        joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com,
        knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au,
        pmladek@suse.com, rdunlap@infradead.org, richard@nod.at,
        rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add entry for the new proc sysctl KUnit test to the PROC SYSCTL section.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a91887c8d541..2e539647589fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12526,6 +12526,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.21.0.1020.gf2820cf01a-goog

