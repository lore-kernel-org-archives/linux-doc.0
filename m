Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B71D57DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 09:03:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438804AbfIWJDS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 05:03:18 -0400
Received: from mail-pl1-f201.google.com ([209.85.214.201]:43833 "EHLO
        mail-pl1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438820AbfIWJDR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Sep 2019 05:03:17 -0400
Received: by mail-pl1-f201.google.com with SMTP id f8so427326plj.10
        for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2019 02:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Ps4mUI1wXYQhLtVI103dUb/qTWn9bG8Bcp8PtHYLuE4=;
        b=qFxdsLMix9SuTOm0MqeSjHtbvUU/0+OVOoudDPyyuONAd7hDphar1IPavEzQZvPuKF
         4zApBd/WkrRJaMotHA8Gz8e364EwfwrjcSj2Q+OgpEFUlBWHejV7VwF5SxR3jXc3iwTm
         +KueNreMBToJhGaIwgcRWU2ncBL2txp5eZa9EeYIdKtYAC74wbaFkI/zcNThcsgV0LHt
         4pJu+ofH8cxDOingwsv26mOPBC5gk5MG8HIO0L6v/8d7ZvscGBi3MWx5+l8SyLzH2Eey
         9KV+cYRLRYJQoFhhWy7zrsF/glsxruQ50pQ+Ri2tg5svkFiEkHLGdUrTr2UyJpXuokUB
         IYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Ps4mUI1wXYQhLtVI103dUb/qTWn9bG8Bcp8PtHYLuE4=;
        b=FWmQ4RLOypVwSDcHOhoAqQhU8vOHrh3ZuehgA0UofNUXDo3PYChbvc7ZtXHVHPDJ1U
         kGZ9Z/RujHnj+v/1vjPNgAFp7POsJGF6dXhlQVpaEASUC87lTLfFf3Ix1Q5RS7vkpneX
         dVHbr8cNZ4xzH6kZI49I32F2n6eY/noZUkEqs9YSCcSyGiGsDPqWV3v8DYdcddH7yGRr
         secuxB4ZlyGHQ/hl42itJQOyMswxiKxC/71PhRPrl1JtMWpkKoKU5l53FYz9+YJlnQ19
         1rCRtj40Ci1U47uWG6RU4DMhd+E6XeecDPu3eaJEqap/A4NGVmNUEon0NFXXou8M3EAY
         59Qg==
X-Gm-Message-State: APjAAAVEEgx8HpS5fdOy+ateAtyzVAEezRpzOP2Advp8JQ9ECAwd0I/t
        K7PBC8H/CWREFp1zboDaNiBI9hiUuOhi4TPu5BHi4A==
X-Google-Smtp-Source: APXvYqxZtpb+vxVfs6KdEpv95n2czjshe/ga6Yeu5rhPTDLYFp2Lda7Njju8cJbWVakX1V0GRGWCC35NALYsFoQ/9SEM6Q==
X-Received: by 2002:a65:6659:: with SMTP id z25mr1323921pgv.23.1569229396529;
 Mon, 23 Sep 2019 02:03:16 -0700 (PDT)
Date:   Mon, 23 Sep 2019 02:02:38 -0700
In-Reply-To: <20190923090249.127984-1-brendanhiggins@google.com>
Message-Id: <20190923090249.127984-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190923090249.127984-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
Subject: [PATCH v18 08/19] objtool: add kunit_try_catch_throw to the noreturn list
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
        wfg@linux.intel.com, torvalds@linux-foundation.org,
        Brendan Higgins <brendanhiggins@google.com>,
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
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
Cc: Peter Zijlstra <peterz@infradead.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 176f2f084060..0c8e17f946cd 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -145,6 +145,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (!func)
-- 
2.23.0.351.gc4317032e6-goog

