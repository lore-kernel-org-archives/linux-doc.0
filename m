Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F04857D926
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Apr 2019 22:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbfDDWKk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Apr 2019 18:10:40 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:48407 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731072AbfDDWKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Apr 2019 18:10:40 -0400
Received: by mail-vs1-f74.google.com with SMTP id a17so800380vso.15
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2019 15:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PlzXyMbJNrRWSbkuwhbneGrr9P9EprhI9Q0eYW9lo6E=;
        b=qvSnv8W3pLMl5k16AFypS2Tw71YYL5YgncQV+TXHNjt4XTrEaof27DNSomOjljBRFY
         7CFZpaiGsTgsyuYxvZM3hPNaFcO9xcLav10IifjVrBHTCA5wqJo0PXIpKGl3cQSB9pBd
         QOvV7D7zfYcHUPMrYV9tDQkw1neM1HI/FpOjprYDYi5EiQMBUsB7qBCLb19vPOBOd/j8
         ZbmlGq5Us2LvYPsotDaQHHmPY5uHSWf9ZILWF+i+rL+2pjKFm0oGANUerE5oLGdepEc6
         WOJzlU8ZZQfhnQbhxEDhmCagtcqSN7De9N5X2U5MwY9UGtuK0n27gHqjehot0lG3/Z5Z
         gUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PlzXyMbJNrRWSbkuwhbneGrr9P9EprhI9Q0eYW9lo6E=;
        b=TsYlerrkvizWhOpEynk13di02JNj4XJexdCUhuEWvdPDx/7yY+LM/T1denlTRUOv4J
         ySTI2XLZ/+5sEo5v+BSTMF6ayyKZBQiRQwaEjV8zUO6scQkIDhZ3B4oPfoUbX20hGa28
         cP+VXo+ljx6EV0ofrQ0MDRwhS9+ZqxJDbt6xAlqn9RxtGgom216Vqr3JZxAdZpZIjMxT
         M0tg3O+12ZtUPBR6LA5MnKDyCP/+zzYapinRsGBxlRjImsIMUD9oPFLo9gOY+tzrcgPW
         rejrcg9k0+ef8uM0+IWVDRLkOc76qJqEw14z9MueT1tVecz/oH8ilgQHY94g09fZnQ/j
         U1aA==
X-Gm-Message-State: APjAAAX5+PMD1nlEbsHOR5+yohMUG7pfMruwJkvQkhSRX9UlHIUDYWfa
        mbRjGPOrxQQO2cUHEuPyXoB6IiuIw3mEXsQ1w0xr6A==
X-Google-Smtp-Source: APXvYqyepuUtLkj9JS9GllgzCIv9BhTUWjpEjqYwbaks96LMgza8AxqIXFbOpzPRXwAndnmOs0AZLAzYON/qHXrryJofEA==
X-Received: by 2002:ab0:2983:: with SMTP id u3mr1063922uap.8.1554415838575;
 Thu, 04 Apr 2019 15:10:38 -0700 (PDT)
Date:   Thu,  4 Apr 2019 15:06:50 -0700
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
Message-Id: <20190404220652.19765-16-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v1 15/17] MAINTAINERS: add entry for KUnit the unit testing framework
From:   Brendan Higgins <brendanhiggins@google.com>
To:     corbet@lwn.net, frowand.list@gmail.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        robh@kernel.org, shuah@kernel.org, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com,
        dan.j.williams@intel.com, daniel@ffwll.ch,
        gregkh@linuxfoundation.org, jdike@addtoit.com, joel@jms.id.au,
        julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com,
        mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at,
        rostedt@goodmis.org, wfg@linux.intel.com,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3e5a5d263f299..fc2cedbd9b43e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8448,6 +8448,16 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins@google.com>
+L:	kunit-dev@googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/kunit/
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.21.0.392.gf8f6787159e-goog

