Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_ADSP_DISCARD,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BEA07D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 09:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbeGRKRH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Jul 2018 06:17:07 -0400
Received: from services.gouders.net ([141.101.32.176]:54977 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730906AbeGRKRH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jul 2018 06:17:07 -0400
X-Greylist: delayed 1428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Jul 2018 06:17:07 EDT
Received: from lena.gouders.net ([193.175.198.193])
        (authenticated bits=0)
        by services.gouders.net (8.14.8/8.14.8) with ESMTP id w6I9DuD7028581
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Wed, 18 Jul 2018 11:14:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
        t=1531905247; bh=Ttig7I4bBJY7gQ+/MLdt4XgYmszpqezZ2QsOmkEC3UU=;
        h=From:To:Cc:Subject:Date;
        b=LWTdsitapnQ9qUkw6IhTbQ/YZa+DcUs7dJSLL5Ce13Z3k8dVXuv+hP9dhQSfevtoX
         Dv7tWF1xQdX7M7NBg1OJ01m2hycSBRf3Z/17ENRExqMBwI7pBefjIPPN8HMBgRPAoV
         Jg08S+PAcD/hR6x19MiwLDiuz+B5k+cYlsQm1YYo=
From:   Dirk Gouders <dirk@gouders.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Dirk Gouders <dirk@gouders.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: if_changed: document single use per target limitation
Date:   Wed, 18 Jul 2018 11:13:36 +0200
Message-Id: <20180718091336.4540-1-dirk@gouders.net>
X-Mailer: git-send-email 2.16.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Users of if_changed could easily feel invited to use it to divide a
recipe into parts like:

a: prereq FORCE
	$(call if_changed,do_a)
	$(call if_changed,do_b)

But this is problematic, because if_changed should not be used more
than once per target: in the above example, if_changed stores the
command-line of the given command in .a.cmd and when a is up-to-date
with respect to prereq, the file .a.cmd contains the command-line for
the last command executed, i.e. do_b.

When the recipe is then executed again, without any change of
prerequisites, the command-line check for do_a will fail, do_a will be
executed and stored in .a.cmd.  The next check, however, will still see
the old content (the file isn't re-read) and if_changed will skip
do_b, because the command-line test will not recognize a change.  On
the next execution of the recipe the roles will flip: do_a is OK but
do_b not and it will be executed.  And so on...

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
 Documentation/kbuild/makefiles.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 048fc39a6b91..01fae5a01ce7 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1105,6 +1105,12 @@ When kbuild executes, the following steps are followed (roughly):
 		target: source(s) FORCE
 	#WRONG!#	$(call if_changed, ld/objcopy/gzip/...)
 
+        Note: if_changed should not be used more than once per target.
+              It stores the executed command in a corresponding .cmd
+        file and multiple calls would result in overwrites and
+        unwanted results when the target is up to date and only the
+        tests on changed commands trigger execution of commands.
+
     ld
 	Link target. Often, LDFLAGS_$@ is used to set specific options to ld.
 
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
