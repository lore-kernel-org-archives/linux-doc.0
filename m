Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FA2C77B7A
	for <linux-doc@archiver.kernel.org>; Thu, 25 May 2023 04:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbjEYEVw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 May 2023 00:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjEYEVv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 May 2023 00:21:51 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1688D83
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 21:21:50 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5657dbf8cecso2721657b3.3
        for <linux-doc@vger.kernel.org>; Wed, 24 May 2023 21:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684988509; x=1687580509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h22KcdDW+e3HIJ3qCk8f6uRtdHrJbepUzOMtxc5VPwI=;
        b=CGWwt3EY0REZavrmYjs32dYAglkBR8cgjqeEK3OHeWZjUJ2pxNnkNCEg0jT0dnDBP3
         cWYJbc25APeCHHmdmS/2iGMxKJ3h2zEO658jN8FsJxZyAoVmOAlei1YO3Kuhcqi+cJ9c
         uVOiI37b9BW3E3n9eg1sGRsrAYZdBlTbnEitdiISsAZnHfFT6nlmKEXUEm7hAejLPVvC
         e+D5gRufPO4dg+RfwHEqyF/e9PqsCnqbrdsb2Vkz5+1c4G+X2mhNHqP9OqrRofcheN4u
         LsreVlXoRHtUazSWdfB+PT5+th2suuaCZzdWUsuAycqVGwUyJqpG6jMBnZkAUvEG1xz0
         XmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684988509; x=1687580509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h22KcdDW+e3HIJ3qCk8f6uRtdHrJbepUzOMtxc5VPwI=;
        b=HpnEix+kpO0kQdPgHasNMbcXkD/7Bq0PIvY8DBGWeLQ1PbfGMKQU39MHY609cmZMA4
         klP+CWo4jkHnBRSXP5bQUt+XKkcJZKYCL6KfyfG9PE6IfD5EwSQ7ZO3ddc6b5lS85qg+
         f+7Im/bAU2EvVMavlqprcN7Zdql2t4DRrXMwaAFCqdy8qBhNG0ljrsgB0bS2vBi1GAFA
         fl67c5VprP89QeNcvxZ+Pm6BDXgGOYsG4BlxhzgpAIxohY1iGYmn+/U//pYLZNHbjlKe
         kStMVCWi+8Ztwb3S+PiGc4TZ/uNkuf09ioBF2Hvcn27ch0E6abz9Wfng4VZR29kzjLLU
         ccbQ==
X-Gm-Message-State: AC+VfDyYWEvlfuegIKZJ4l/5kUmbJZk18c680rU3XVU6nTMLe6qqcEmr
        Ip7bCPeB0SS56UaqDyqX0F4p6rDs21JTJw==
X-Google-Smtp-Source: ACHHUZ4p/k/mI7qkbWk1iLn1XLxAw0HR+giP0nJeQyWa2rg7LjoEsVDivBxZDSF1BE53PGT6TSe1j5ghyfUJ8w==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a81:ae68:0:b0:561:94a8:29c5 with SMTP id
 g40-20020a81ae68000000b0056194a829c5mr11971369ywk.4.1684988509366; Wed, 24
 May 2023 21:21:49 -0700 (PDT)
Date:   Thu, 25 May 2023 12:21:29 +0800
In-Reply-To: <20230525042133.212534-1-davidgow@google.com>
Mime-Version: 1.0
References: <20230525042133.212534-1-davidgow@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230525042133.212534-2-davidgow@google.com>
Subject: [PATCH v3 2/4] kunit: executor_test: Use kunit_add_action()
From:   David Gow <davidgow@google.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Benjamin Berg <benjamin@sipsolutions.net>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Stephen Boyd <sboyd@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Rae Moar <rmoar@google.com>
Cc:     David Gow <davidgow@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Sadiya Kazi <sadiyakazi@google.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Berg <benjamin.berg@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now we have the kunit_add_action() function, we can use it to implement
kfree_at_end() and free_subsuite_at_end() without the need for extra
helper functions.

Reviewed-by: Benjamin Berg <benjamin.berg@intel.com>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes since v2:
https://lore.kernel.org/linux-kselftest/20230518083849.2631178-2-davidgow@google.com/

Changes since v1:
https://lore.kernel.org/linux-kselftest/20230421084226.2278282-3-davidgow@google.com/
- Use the kunit_action_t typedef

Changes since RFCv2:
https://lore.kernel.org/linux-kselftest/20230331080411.981038-3-davidgow@google.com/
- Don't use the no-longer-extant kunit_defer_func_t typedef.
- Don't pass a GFP pointer in.


---
 lib/kunit/executor_test.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
index 0cea31c27b23..ce6749af374d 100644
--- a/lib/kunit/executor_test.c
+++ b/lib/kunit/executor_test.c
@@ -125,11 +125,6 @@ kunit_test_suites(&executor_test_suite);
 
 /* Test helpers */
 
-static void kfree_res_free(struct kunit_resource *res)
-{
-	kfree(res->data);
-}
-
 /* Use the resource API to register a call to kfree(to_free).
  * Since we never actually use the resource, it's safe to use on const data.
  */
@@ -138,8 +133,10 @@ static void kfree_at_end(struct kunit *test, const void *to_free)
 	/* kfree() handles NULL already, but avoid allocating a no-op cleanup. */
 	if (IS_ERR_OR_NULL(to_free))
 		return;
-	kunit_alloc_resource(test, NULL, kfree_res_free, GFP_KERNEL,
-			     (void *)to_free);
+
+	kunit_add_action(test,
+			(kunit_action_t *)kfree,
+			(void *)to_free);
 }
 
 static struct kunit_suite *alloc_fake_suite(struct kunit *test,
-- 
2.41.0.rc0.172.g3f132b7071-goog

