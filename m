Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 892DB7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 07:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfGJHQi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 03:16:38 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:54729 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfGJHQh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 03:16:37 -0400
Received: by mail-qk1-f201.google.com with SMTP id b139so1167350qkc.21
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
        b=rXtTc/GOsRHQaJA6Ws9m+pPNjzj+5rLwHJOomjY2PFfSoikcebfEh5U/5Io+IpJ2JJ
         sM4s5p4wN84uuPK2wawFNwAGeY9GYiSz3gKcm4jFzMNbWra728QlSnFcIoeT+m1EAIpQ
         QYGB2VP1qrToWeK1FH7eNgzJf3m412kAZCT3ZN31EcDBjPTkvFUL4JSVf1OOOQLhkPxP
         qhKxwtWnOPYc2lStgRZSCL7PBZzLS8fq+h81Z2b/9gBDtF2PmASidrMput/8CQSYTF8q
         QhARbBGrlb61/UdpbwVrR2rxDIQXadxthWMUWtQilvHubiBfryuBwCriKQkCnPf+VzpZ
         Hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=i+cHtqqH4D1BH2a9iTheu+r071sQgiMbeMpUxd8ISoM=;
        b=PCWzqINHBSLWqTh3zTj18s2La9ZwrVlzKKt3nNh7Btvy2xE0XQN8IEbdCTAwrrwPtI
         8E7OgMDEM9SCQIqvA5iiPctGkSnpM0JzCcKp5m+n1gMP47HVcTmN18bDVWBYsFQGxevl
         Ok4LRg5dPxYeNeU4d6fUn0Ln1cNoA5/bsuERWHRwoXEJ1OgTxKAn0IhvHv6vnvIyJqWv
         qX60dqCJUM/wQlSRsOqav/Carq6Ra1ntSOZSyg1gOfLuaVmOlK63aIW37DjhssnftOV3
         7lmjekx7XQ2RL+4WtL0RdQ06Dmpbu3R6G7VR88PQh8GENCBZqbz1HQ5JZ64cenDmvJE0
         F9EQ==
X-Gm-Message-State: APjAAAVo2Qd7uz/wMVKI5KYt/KqATYQilQU3I90HYN4nKBx3OWo7gxBf
        aJpZIRdd/WI+ACuvuN8oetE2z2H82tHxpID160Vklg==
X-Google-Smtp-Source: APXvYqzYNxURl6tjKPLLeSDRwuA+Ulct62WFYCncfJUl0k0d7oT8xpOt/Y76tt3BkIrOVTj039P4TCLZz7hT/KHUodnwGg==
X-Received: by 2002:a0c:f20e:: with SMTP id h14mr19332341qvk.246.1562742996789;
 Wed, 10 Jul 2019 00:16:36 -0700 (PDT)
Date:   Wed, 10 Jul 2019 00:14:58 -0700
In-Reply-To: <20190710071508.173491-1-brendanhiggins@google.com>
Message-Id: <20190710071508.173491-9-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190710071508.173491-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v8 08/18] objtool: add kunit_try_catch_throw to the noreturn list
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
2.22.0.410.gd8fdbe21b5-goog

