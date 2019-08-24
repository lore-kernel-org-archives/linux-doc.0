Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB3BC7DCEA
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Aug 2019 01:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbfHXBfX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Aug 2019 21:35:23 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:56022 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbfHXBfW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Aug 2019 21:35:22 -0400
Received: by mail-pf1-f201.google.com with SMTP id 22so7681930pfn.22
        for <linux-doc@vger.kernel.org>; Fri, 23 Aug 2019 18:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Q7v6rEQoCsNNbU95UVuiGKqKwX05H1mjzimMiwgdjks=;
        b=kTDliowP7o3AiRgwqQlGdSorwzrpE74OzrYLBSyQym+RMD9BcY3HKgRqyUg56Jh5m2
         I0kSBhwhcQDEAp90nh3ZujDoa38kQhvTP1Jc+/wt8WWFrQiFg8l/9HyGs9d14T1TjS1K
         Iw0FVBL+/zSCAfzOAcwGjAtR42R3mpopg+GAsodk20VK3Hx90/Z6GucUnjkTQWGo6oql
         bMw16WK1ZxXYYN0eEFBOFKGaezq1RdQqMO8lXVb1eJIA70O3pkzZs/U8eRTUz/d/bNJT
         yjpEiEVsNfRUxPdw7uiUvTOiKewWG+vAZPNE1VIsegRpZQeLlLR0Qo6aFDH1RA0oJYKp
         WGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Q7v6rEQoCsNNbU95UVuiGKqKwX05H1mjzimMiwgdjks=;
        b=Wd7fPvF3TlNUVpSbDHi1pV5AYjzsWcZxAsZBtKc5kUwGRW+RerBZEvzPn1P3WUBgsS
         kRoNknybQEJZlMXVOlnCJR14LpPjkC5EDVZR7K8dWHK/i4wDy/Q9wBml4lNoi6xTr68h
         laUEjimi4/Z7RonGgrKhWLgDARz4KILBXnoTxPEW4oxmbTZ5Woca9UZ1hkfnOlktHBUM
         uIILc6lMUn5R4qkDgoTgbwnB6vrsYy/HWfL8/7tXfdAXZKq8rrWOwMPsI6O2wvEmIVtp
         mwaC3O+4AR1DahBhYDL11XnSKECRsWuNYaLRXGl6qYMXhpNCnK7NHiW4Ky9xQhVURKpI
         UN+Q==
X-Gm-Message-State: APjAAAVHv3yld2Gjx1WgtYcZyf+ytESGMv6jDewtD6OASxa3vUS9LHo1
        dj4PxTJawUN+uXyFpAOYCYUvUqNKeylFO1jO+iTKoQ==
X-Google-Smtp-Source: APXvYqzJyyLtfmAOBIQlbX+eop2/oig96oKMIaKGeExSCTI7BXDWjOnL13u84fw7hBXw+uulsexqobHzTGtoBwBytj+Rlg==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr6412047pgq.130.1566610521287;
 Fri, 23 Aug 2019 18:35:21 -0700 (PDT)
Date:   Fri, 23 Aug 2019 18:34:23 -0700
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Message-Id: <20190824013425.175645-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190824013425.175645-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v15 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
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
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2c343ee3b2c..f0bd77e8a8a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8799,6 +8799,17 @@ S:	Maintained
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
2.23.0.187.g17f5b7556c-goog

