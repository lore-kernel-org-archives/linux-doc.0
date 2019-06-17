Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D1FE7D9ED
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Jun 2019 08:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbfFQI2E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Jun 2019 04:28:04 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:44523 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfFQI2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jun 2019 04:28:03 -0400
Received: by mail-qk1-f202.google.com with SMTP id c207so8507123qkb.11
        for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2019 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
        b=o3ogFQ5rdp7cs19G6mteH4rVDUn7teQlurDS0jWzA1kqGwAdqcTxbcDaERqO0pAcK0
         Eh/sClefw5IpL+NRbzQmr6gm3oBb2p8bAzIgg9VsGdKoZ8PJcp2xIjTn/DeBFhMeb7uR
         dNswLweSgYBoYpma1nvfuatrGqhK85GbkGMdIeoO4zRE00IECRglOhzr+/nawhYV39ee
         bQDQC5r2qfCqDqtCzLuaxcLPUb91JojIyYu9tnH2DTcRG9G6JLjrnwscNnQBm+FLS7Tv
         KGYroA3avaB1RnLa65qQXoiFVl6APqQtkplsbvke9XY0m46ewZR6DehJ3wQkF6J665bz
         WPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bPJF89cE4tB1wXKocb/qXW7wfYtIegjLntcYJJ0aEtU=;
        b=S2NO/gbRKBYcwBN88fTPR/YdTWWddZdugE0SYN6k3IK1qVEZLggdhyNtDtWvXQAm3Y
         LGRx6TE6pl6bATkZWK1oIT9lK45k5bh++1DKkSi2eunIiaIILN5gEh9LeHelGvhO1qtz
         r8peglrkLVGqKA0BInmqknpqfOZtILZM1D03gUk01GvsrCPYOfYKi91Q5yEf6ZpoqGIa
         fXbPq56p2TV0OuDcL2+w8HvofirUGcT7Snekc3/rxmlGRuiR2I7sNatHTbQW35HzqVX3
         RhYQ2nPOPiYeHggBfueqqQFPVvtVsdEJlsEtjKxiIwXzRrw6Lb2X9Dm3N1j9IiR/qP2F
         kY3w==
X-Gm-Message-State: APjAAAWSwxfN15EMbNkfRY8s5n5ioQrfYj9X/1sKe08KJazrT9elmsH4
        mexddnZFtM0tfSx0yjmYbcyqqof3mw2d//KCvvLl+Q==
X-Google-Smtp-Source: APXvYqyTbtjCAcLDWOBf80YN420uGxHfWPtOCpnCXNoMdm2lw18nK8fM3CaU+vc/SrSDk5njDqLK9j/e5783XfBqOv3IRQ==
X-Received: by 2002:ac8:2ac5:: with SMTP id c5mr86955007qta.332.1560760081475;
 Mon, 17 Jun 2019 01:28:01 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:11 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
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

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57f496cff9997..f3fb3fc30853e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8590,6 +8590,17 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins@google.com>
+L:	linux-kselftest@vger.kernel.org
+L:	kunit-dev@googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/dev-tools/kunit/
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.22.0.410.gd8fdbe21b5-goog

