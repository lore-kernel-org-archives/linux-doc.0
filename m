Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33619C7EE24
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jun 2023 03:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjFBDyL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 23:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjFBDyK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 23:54:10 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E1B18D
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 20:54:08 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-568fd72993cso53251137b3.1
        for <linux-doc@vger.kernel.org>; Thu, 01 Jun 2023 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685678047; x=1688270047;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4rpaRYhp9pezQBgGgl7jQUhQdvTwr6KJlRlk+rOPp+4=;
        b=oy7uyJW5kSVKl5JSZ/Uud8NxX96LuyPz1MBYWsWFDACRtnYfZ1CykuEc2PuIU66iaC
         nPGpUMcz+eLB6jycjZt1gVbGp4FGxaTUDJbaAWFE9qLsiXIPMFlFNTs7ymDceTA3fszR
         T52SUG0LFVyp50KWfFp4BrB78tpk+y11glHpxWmJ0IOh6CcMCPlkb957vcAWhEs/KT3K
         cXrSV9Y4YNMOWee17PUB5H+ggHFhVEqXycwu25L/+KLR/bWyA1nqzOeG2rbG7Kvudu4s
         R5vrkEk5r6zFr9seW2+eyeZp/02I+rUHk8MMYmq11yLTl/47oyZCUKm68jpRxRlnCyis
         GFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685678047; x=1688270047;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rpaRYhp9pezQBgGgl7jQUhQdvTwr6KJlRlk+rOPp+4=;
        b=YtQeWtTKcevhuGIjGLSb3eDSAGA1LNKn2/cV8rdA8gc1fKX5AffDwV4czK7RcaO3QA
         orbSsVyP9FF4yLUCEChaWXezJ6PObHYJuoFPh26iTH7eX9Q/MiguFnXN+mBWNwt4LXk/
         z5Asl5ZjW21wuex16yF7hwJYp63BAx+2w6dGwgxXWWVc7sQql0L/bA95ufPPNKk+MAuF
         rlJBhn7cqTthfEUjH1uONVhfnx2k006NGnqXXQiReE2SPPh1RfvPc4K5mBs54Lk3ADSy
         ab0mNmjHQbg8sPgyAQM6983lZ9W7xdxu8HpwlA/KvyUGxncIwXxKphsM64msWxOtqfgr
         YFZw==
X-Gm-Message-State: AC+VfDwbOXcGAldNw7EQRD+kdpY5DeYlXgtCVrGDItY+XgcmbIV0jFc2
        JHnKMbJ/4+OUa/SDgq8BTf+ohrWQJM6FRQ==
X-Google-Smtp-Source: ACHHUZ4kDJe2xZPeYgvJPMDUZ6UocdXCqm7Vq9ZTHKGva9YUiMBK+nsyd/mpj/y1ZSiphFIx6Cj3S9zv926dBQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:d404:0:b0:bad:2828:479 with SMTP id
 m4-20020a25d404000000b00bad28280479mr1058303ybf.6.1685678047749; Thu, 01 Jun
 2023 20:54:07 -0700 (PDT)
Date:   Fri,  2 Jun 2023 11:53:59 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc2.161.g9c6817b8e7-goog
Message-ID: <20230602035400.2333527-1-davidgow@google.com>
Subject: [PATCH] Documentation: kunit: Rename references to kunit_abort()
From:   David Gow <davidgow@google.com>
To:     Daniel Latypov <dlatypov@google.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Rae Moar <rmoar@google.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kunit_abort() function has been renamed __kunit_abort(), update the
references to it in the documentation.

Suggested-by: Daniel Latypov <dlatypov@google.com>
Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/dev-tools/kunit/architecture.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kunit/architecture.rst b/Documentation/dev-tools/kunit/architecture.rst
index e95ab05342bb..f335f883f8f6 100644
--- a/Documentation/dev-tools/kunit/architecture.rst
+++ b/Documentation/dev-tools/kunit/architecture.rst
@@ -119,9 +119,9 @@ All expectations/assertions are formatted as:
 	  terminated immediately.
 
 		- Assertions call the function:
-		  ``void __noreturn kunit_abort(struct kunit *)``.
+		  ``void __noreturn __kunit_abort(struct kunit *)``.
 
-		- ``kunit_abort`` calls the function:
+		- ``__kunit_abort`` calls the function:
 		  ``void __noreturn kunit_try_catch_throw(struct kunit_try_catch *try_catch)``.
 
 		- ``kunit_try_catch_throw`` calls the function:
-- 
2.41.0.rc2.161.g9c6817b8e7-goog

