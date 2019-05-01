Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8056D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  1 May 2019 23:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfEAXFW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 1 May 2019 19:05:22 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:51002 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbfEAXFD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 May 2019 19:05:03 -0400
Received: by mail-qt1-f202.google.com with SMTP id f48so330257qtk.17
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2019 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=afBg8MXFYLPd4ElKfFZ/trSYMLXMP5LFZoVsy/mQzmY=;
        b=PS4XqgmjxFmmLNG4a7+Yce39oWOBnGeJYietXRtGGHG0s3tkKrTLVv7t3JuVJrcTc1
         KutFoAYJImIE74KhH7bcdjYmLxEqwrGbPqelhF2X00dTLnac17nc5IPrwiXTTicbz2f9
         yHnW72a+93CtmfTKR5QnGRSzt8et/Ly4ZcAVMfSHn+SCxSXzw1zkw1nB3vFldf3GmDRW
         V4jWuf1z1oJKJ/mTHNywIeCyEt6ToYpE7TZ6xlVusdVzZZyPSGv5HNpNNowdGSJw2egz
         dfdafxGTQxLWVkGcavQ+2Y+ar4k87+QhgoKGq5GA6P9r8ZHVHqdJk/unxr+39pqN5T9x
         Di2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=afBg8MXFYLPd4ElKfFZ/trSYMLXMP5LFZoVsy/mQzmY=;
        b=IdNO8LmS3fJNPTPg48Etow0Gm5H5fMlNhJgQO7rqLCgAlgYYGqffI2V6IogRBADzAX
         4+QHs9vPP7B16xZCGOxHI541cO6VcXN0W5OxZm8jeM5IhGj+46hWTDQjsCPY7onMMcym
         ewrwfyMBKprKygUhr4VkfvvkmyNtrW5p+zXek7nXXcA0LZye2CbgDewnprmvMlenAg3M
         0dutp5bkukF9XO1k/jJMuWq8EJQXZVuu17KTwjc6AyfYKdKWhdigtCq29buEuhOn3fAc
         9G0XRVxLLLfbyypcpNihuZ8f2yg6ijySvI66rFTjpSE2ECSK9de0TgZ5cGentBt45mSw
         yRlw==
X-Gm-Message-State: APjAAAXsgHJbN32fTcE1a71cp15taZbknmzjkDmjoBhYehsmKa2M2TmJ
        WR08db3Dlo1PlxRXO5uWsRxCwd/ZT10uoKpNyQzdaA==
X-Google-Smtp-Source: APXvYqyrbTtQWB061i/IuTmGR1fZJktprQX+nOIOp8d1N9azYCgnL4QkQ8IwHRr2AUs5hUUYn4R+op23q7+ENLYHRpSNog==
X-Received: by 2002:ad4:5365:: with SMTP id e5mr604591qvv.197.1556751902442;
 Wed, 01 May 2019 16:05:02 -0700 (PDT)
Date:   Wed,  1 May 2019 16:01:24 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-16-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 15/17] MAINTAINERS: add entry for KUnit the unit testing framework
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        keescook@google.com, kieran.bingham@ideasonboard.com,
        mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org
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
        pmladek@suse.com, richard@nod.at, rientjes@google.com,
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
index 5c38f21aee787..c78ae95c56b80 100644
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
2.21.0.593.g511ec345e18-goog

