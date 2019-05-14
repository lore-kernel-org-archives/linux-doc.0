Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9B9A7D912
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 22:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfENWS7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 18:18:59 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:54677 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfENWS6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 May 2019 18:18:58 -0400
Received: by mail-qt1-f202.google.com with SMTP id l20so652293qtq.21
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2019 15:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hhxf3AcyDp0eVXaG87rECj9td0IjCbgyx1Cs8/dNg/A=;
        b=DWFXnp4Hv3gxia+unBmllYaYsTdEPeRc/MPliVDfhoKoHkDccBfKjOBBsFdOH4qVF4
         3CGJdM9LtOAktm1DF9ynbnqVLvb//vkXXPW7t/2caqYSYtjHk5Aaij84YmZjLohuJnsj
         duqt01BxicXxTwy4Wq1D8gJEpe7I1Bv/AntHK8CMGKACQmTwcpHMwk+lus/z1YcgauPS
         xb9wQdaOPB2kaJ1qgUx6KyFG2BH9s/HJu2I8bvz46w/Jq1pIQsjadDWuScGCXS8oRyST
         Yp+i+OKpZrGRDaOWBmMoeaAy5+jX8z364mHVYMUrFBoYt9kdi027M6YMfk5pPD9tA2HQ
         MQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hhxf3AcyDp0eVXaG87rECj9td0IjCbgyx1Cs8/dNg/A=;
        b=XBwNtSFQ2YhG5ZI0NZdMGA6xtb8vJYZL8/U2viyz6BnHy7VXmePCz2rc4fuUN/FwDc
         uSLNZW76/8V/HRqJuTHx5bP9O+Xz47JzzNz+6akolHb7sRqEbOKtfO4L9GUEBJJ88qHF
         fc140aCz/3r9+TF4GMEgY4NXz2D3dBm3DFTvpbzRaGLVqMscJvMuzYhJMlYFWJwJF9If
         LAtLnuLwh5uiKgXfR7eUv9o/Ael1VhiKHorm9o3glxeknP6BwRCCdqJ4tt9bTjl8BI11
         3xgIykcIBU66cyo73cQMcbvjUGgqO/yqv3RsGsciTqMobzmNpwXiGAG9l2p3bnOucE+9
         xWgw==
X-Gm-Message-State: APjAAAWOI8Abhpg9JMZDM5lWqol1VqkQejN34CBud1vXXw0pCiJbaZfG
        OYfYWf3MXlUckmjHjD5GkGJAzDN2dZas5neqj//PYw==
X-Google-Smtp-Source: APXvYqxBQ+PfPDI2jK3tSl4/2KK9BEIB1HtAeTqt6B2C5YgBbe+P8hDv92BaaZf8SMwpuI/42oh72dMCZGz5UE2CQk++4Q==
X-Received: by 2002:a0c:9ac8:: with SMTP id k8mr30361437qvf.132.1557872336955;
 Tue, 14 May 2019 15:18:56 -0700 (PDT)
Date:   Tue, 14 May 2019 15:17:01 -0700
In-Reply-To: <20190514221711.248228-1-brendanhiggins@google.com>
Message-Id: <20190514221711.248228-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190514221711.248228-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v4 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the following warning seen on GCC 7.3:
  kunit/test-test.o: warning: objtool: kunit_test_unsuccessful_try() falls through to next function kunit_test_catch()

kunit_try_catch_throw is a function added in the following patch in this
series; it allows KUnit, a unit testing framework for the kernel, to
bail out of a broken test. As a consequence, it is a new __noreturn
function that objtool thinks is broken (as seen above). So fix this
warning by adding kunit_try_catch_throw to objtool's noreturn list.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 479196aeb4096..be431d4557fe5 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -166,6 +166,7 @@ static int __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (func->bind == STB_WEAK)
-- 
2.21.0.1020.gf2820cf01a-goog

