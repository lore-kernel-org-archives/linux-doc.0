Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD74C7DE5B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Jul 2019 09:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732857AbfGPJnd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Jul 2019 05:43:33 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:40182 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732768AbfGPJnc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jul 2019 05:43:32 -0400
Received: by mail-vk1-f202.google.com with SMTP id p193so9610520vkd.7
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2019 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=lZlBFQY3Us5crfW9WSC4bzJfPTy9JBI0rQpN2XrR9wI=;
        b=DX1LvNppWtT3TTQulWABcRXxpn8iTEBCN5ZSrvB8fB+IBGJFMNOzH7YL/HN+5yKRqJ
         41R44YMyFgs7gHPFM5RC4OR25wcyrJb2dRbNHBzIF8MDGN1aUqj0nQIjWPbmbCIDdiZS
         cbgtCzkOa7R72JDgOcaUDIdw3GtElQSqPValW/ciqg+U2tj3JnixmeuOd924bFFXqG4f
         z/GebTNz0Wj6zeIjBdId6Trn8NcfhaCv4E9mrcr/kEB/hlP7Y7V683cSF7qBPtXQVwqA
         OZ1pGjqpkfJcHrtSowOO3rz1QVSk8rt2UrNl+7wFdEQczKSB3unQbu1ZXA6E+PQkfKLB
         Ja9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lZlBFQY3Us5crfW9WSC4bzJfPTy9JBI0rQpN2XrR9wI=;
        b=tDakhwvQsm1cymuPKB/JJH0DAGe9XvJpouvaE5izhfvDRSaKCCshsNTsNiB8eqLZrp
         mYAo+QI8S0Ud/Zpl8q3O27O/74WVmf5r7w+vxY2jKG1yppqh0XWU69JQv3IihbizlulZ
         sYIlVnzXa12O0oe9RDsyAty/nn5tDVJCkjcbAJ+UrjnSQoDKAUbqyRAqb5H0oI7KUtSo
         P0PGXu//Ivx68h8drWdFyiPIz7vUOj0E6rW+Q/A62oq0YbP23vvjyAjvNmrQcirqtX8h
         NJ65JLYD+JdqM2K+5UhK86Yu6c1OiGp+or0VRmAeFWEvgLMAz5Mr4FN/JmeotA1iypPX
         TN9A==
X-Gm-Message-State: APjAAAVNxCrgWLYMTefOaaRSRiLBavAJPGSTe6jAHTQlTIJAbh/QP1PW
        vg7ldaquw1FWLeohT2x+huk309Df7cYo9mr1B/1AkQ==
X-Google-Smtp-Source: APXvYqxqKbel/54jGzh19qChTyrMaZnWOC/e3EUzK7J+6Pv1AZ9Pc0NWXvhp/2B+Xqkw03JSEPx72ClnYnJPihFK/5czgQ==
X-Received: by 2002:a67:e9c3:: with SMTP id q3mr19671567vso.5.1563270211546;
 Tue, 16 Jul 2019 02:43:31 -0700 (PDT)
Date:   Tue, 16 Jul 2019 02:42:52 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v10 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://www.spinics.net/lists/linux-kbuild/msg21708.html
Cc: Peter Zijlstra <peterz@infradead.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 172f991957269..98db5fe85c797 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -134,6 +134,7 @@ static int __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"usercopy_abort",
 		"machine_real_restart",
 		"rewind_stack_do_exit",
+		"kunit_try_catch_throw",
 	};
 
 	if (func->bind == STB_WEAK)
-- 
2.22.0.510.g264f2c817a-goog

