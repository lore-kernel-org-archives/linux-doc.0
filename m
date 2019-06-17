Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B570D7D910
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Jun 2019 08:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfFQI2N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Jun 2019 04:28:13 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:42245 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbfFQI2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jun 2019 04:28:07 -0400
Received: by mail-yw1-f73.google.com with SMTP id k142so11540829ywa.9
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2019 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EsSBOAivkaHwi6D12Cv8eKMrxsdP+T6KPHsvwbMQYm0=;
        b=C7EmzIa5t1p3To0eH+Btt+UKnk2zWoDCRcHlxDDez+EJGzuX5/OCX+VtE4f/+IBxBU
         mGEeX0YKVsmTpTHqWxwdvH8hqIG3FELhUYhSlXikfd0094SnjH2SPp0dcm0R005htjts
         6D/xP0jMwTBwY1jE9/ZxkY0+RYLVqYuSTLbgUEKmyJPUnfix1cU3MelrOVMNgQTKcGe9
         cFGgfxb8WDzOX4wGL98vqfITN9oZvAZ6ZQuIixRxb8VtiucW8A40EeqqX9/1t6jRhzWX
         B1r5Tw0xfFTV6bdsPqlvoEcQ0Y0C9kM0VAB1WtVyge15d2r4CngkCHzpB/WflMNr6YDF
         mQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EsSBOAivkaHwi6D12Cv8eKMrxsdP+T6KPHsvwbMQYm0=;
        b=my99SgGrTuFrHtr5XPAsJ9zZrg+m65K2TX8yC0eByIgzrLtv+7P4UFjcx0bu1LfKM4
         l1773sarM4aYulCO9AXb5ex4LWP71dS4dEyjzKIXMsj2HZoNQ5ZF4mjA5E5jmGfY+++y
         b02pjCjolhRdRaaiETK6NCvLUMmUklATNEx0z4OiL/yNoBnbqzZbKKObnKnB1IzUvt71
         BOnW8EbsmvuizhsYJvYN+yuSKVLN4TTNSRxcxWha97QCnuk7bmX7PQfQ8eGhihnZDyAe
         CD8jjOXhEK4vFw0OkJ+P6mBXY5E70nRC/B89RvFyCx5gayd4ySawohhEbN7mu9GbQRfA
         RZ9w==
X-Gm-Message-State: APjAAAUbiIuqrrwKZtafDIp8TR8CorDsOua1eS7ZCEhAoBtYpbQ7xT8/
        t5Xe7dtdyi7C98gnpXr9XnCeufeAHczGF9iXgAKIrA==
X-Google-Smtp-Source: APXvYqygaxiZVfos+CJ+dORKXgXbsd4xQo+Oa0IXMYwFW3jHO/QMUCpEYOoJXhDPIYS8TyQgU0luKfcb92R2UWUxnJ1x6Q==
X-Received: by 2002:a25:7642:: with SMTP id r63mr57620375ybc.253.1560760086697;
 Mon, 17 Jun 2019 01:28:06 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:13 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-19-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 18/18] MAINTAINERS: add proc sysctl KUnit test to PROC
 SYSCTL section
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
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
index f3fb3fc30853e..05cd8ffd33c8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12718,6 +12718,7 @@ S:	Maintained
 F:	fs/proc/proc_sysctl.c
 F:	include/linux/sysctl.h
 F:	kernel/sysctl.c
+F:	kernel/sysctl-test.c
 F:	tools/testing/selftests/sysctl/
 
 PS3 NETWORK SUPPORT
-- 
2.22.0.410.gd8fdbe21b5-goog

