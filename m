Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7471F7DC63
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Jul 2019 00:39:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfGDAjG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Jul 2019 20:39:06 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:37328 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfGDAir (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jul 2019 20:38:47 -0400
Received: by mail-pf1-f201.google.com with SMTP id x18so2520065pfj.4
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2019 17:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yOq03FKyvTfw/88JWebcCYFjQ+wDLwnIL9ZsmSGzZoY=;
        b=rqWRzI+VdoQ/rfAYWs+wJAt9qGoYlT+FmEZeSfQAzaVH20KzD6U58OfqalgNvRWq7i
         amSOe1o21GH4WDXzMF1heRcVHb5JJhS8lOcJdH1eA2sed1w50eK2TMHRb28oarEVVAqI
         zAwf0qJ8dWxINt8KyuIQ7b1ziwT+SMOhrULOa/pomp97DzR+c6fFqEvHQGhCltHFumFT
         dTCpV01W0drilgpn+1ZuX+iDAuM8CPlK6/6JLx/r9n5IKoaSjOojV7mjDzhEgMbXl7rr
         wlYIsOpWE53J7MjhsqjJnK4LspBE7HqSDeUUzHcHTIamen2UfAwJgNwwNGSqjm+cn7E+
         Cm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yOq03FKyvTfw/88JWebcCYFjQ+wDLwnIL9ZsmSGzZoY=;
        b=KImUVJojKF2lw5+0xT4NvnqelQC3OHsx5NWZSbuwNrbKnVmY8fvgeHMgaGeeuktO14
         JVV0xZ9ZHcuqXoMC1bn9HH6HXusnxF+XgHzYw/WdePt5VlWzn67mK9RZN9ny6Eo9Eyxi
         uDS37r+kCSlD7iNcyzhjLxzNDd1reQk/SRuQbCCy3EQqlO5wpwp7pb7LmK+aEWTbvssJ
         8Gu/Xh3mo1CBmTCLlnfmvVt5ZoRDfUdXUMZ+ZSUTg85V8WltZj2bvlV8uSGE34t+vOdG
         HZUopCm5CoDjtoUNmOCVTb1wI7tE7d8ptBSn9MQMAlf8UwKGuG8Pm8Mhd39m341xz0y6
         EgAA==
X-Gm-Message-State: APjAAAXjkETSPkYOfXpcMFLJJXkaX19jd5CSh55gKeA5wWaxRrPdBWij
        J2QtSuo4Npsjpk2VluptWfsaNeyHeNt3cP1WRY3F4w==
X-Google-Smtp-Source: APXvYqzAM3YkV212D9iXbYWHJQSzqyj9BCDvcajKIxmq/07/ntRt++FdQVosrJyuKB2bZiRSFDT8qr6QUnHcZEZJj5SipQ==
X-Received: by 2002:a63:4105:: with SMTP id o5mr41354444pga.308.1562200726339;
 Wed, 03 Jul 2019 17:38:46 -0700 (PDT)
Date:   Wed,  3 Jul 2019 17:36:13 -0700
In-Reply-To: <20190704003615.204860-1-brendanhiggins@google.com>
Message-Id: <20190704003615.204860-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190704003615.204860-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v6 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
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
index 01a52fc964dae..856a7c4f7dcf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8599,6 +8599,17 @@ S:	Maintained
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

