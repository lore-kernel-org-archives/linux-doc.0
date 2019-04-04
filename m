Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CDC187D918
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Apr 2019 22:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730830AbfDDWKa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Apr 2019 18:10:30 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:55677 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730914AbfDDWKa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Apr 2019 18:10:30 -0400
Received: by mail-qk1-f202.google.com with SMTP id g25so3382434qkm.22
        for <linux-doc@vger.kernel.org>; Thu, 04 Apr 2019 15:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=eSQTnJlsVyvVkHe102MVefzKzQnpLodW/Uu/p7ocufw=;
        b=OOcaDPIBFjNNiGZw7QY6fYXsb0W4NQAQjsAcAWcfEzOlt0OwYQIc5J4fefUyP7oYKi
         wQaEczWo/9IvNvEwTixlEez5VbeP3VsrYKzrRLWwSd2r0j/jVJ6zqRWIDpR0too8sWxq
         78HAHmstJpjcRQU9/pBkMRMAjKilUpNGArEbHfPolO9bjFnpQTuU0fqv8GFAmWApoGSN
         mf+HldJP+Ktxq9DKw9MIB2LsSsDyX7Gu7v2OoLDwPZNJO1BFh/JfgobZyoXiWShFVfVQ
         LGLlmn3CdWhJgHWUMrcyqFo+Ei9bAF+4ZavRrcQCI6swKSx3Gv8segziCWQvJpPsqfWW
         2dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eSQTnJlsVyvVkHe102MVefzKzQnpLodW/Uu/p7ocufw=;
        b=aAsLYgOEpmB0BHdck2WNhsQLaDCKMyMillabj/FDTVo4vhJrCjKFeFyPJj/HNOkMa+
         jlgrnuwQIZ2O+ywpqxG5IfuLgGm92tQMcsCpalLi0vntTVXs5iEe2fIPkR5yMn5JzNN9
         +A31QCQaR0ZU8UW+qC/7UU0e15CiTBXpJJaZuCUcwYXV0eCawE4W6Ui85YAfRLhS7mDd
         oJselzqIvdG/2oM+qub1e3jWbVPhtYxpkMKZQwsVzBkgSOZI2x6a1rzxQJNCQky1dq7k
         70M2ArWZjKB3HrlVZ8jaY3Prw6TNKNuR0cuWYAFQtak4B1u+57dwPHIGdWTeqq9ODqJ4
         E4+g==
X-Gm-Message-State: APjAAAUEMOroQ4bfz2isXmSgXzmQg1wFT6gNVTMXlc8+MGeYtK2WM/UM
        XmWbDHBsEncRPjB9p7YTTI3DHCzvXt6hXSrRATZTwA==
X-Google-Smtp-Source: APXvYqyi7cwVSN26mfyq5K1f5peAkTMwJzfuWDL/4vQZGxDUFxBEI1VylCGRxLXhEnQtAHnW3y1NBIesQoTqIctaXJ2qKA==
X-Received: by 2002:ae9:e849:: with SMTP id a70mr1215066qkg.34.1554415829026;
 Thu, 04 Apr 2019 15:10:29 -0700 (PDT)
Date:   Thu,  4 Apr 2019 15:06:46 -0700
In-Reply-To: <20190404220652.19765-1-brendanhiggins@google.com>
Message-Id: <20190404220652.19765-12-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190404220652.19765-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
Subject: [PATCH v1 11/17] kunit: test: add test managed resource tests
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
        Avinash Kondareddy <akndr41@gmail.com>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Avinash Kondareddy <akndr41@gmail.com>

Tests how tests interact with test managed resources in their lifetime.

Signed-off-by: Avinash Kondareddy <akndr41@gmail.com>
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 kunit/test-test.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/kunit/test-test.c b/kunit/test-test.c
index 4bd7a34d0a6cb..54add8ca418a0 100644
--- a/kunit/test-test.c
+++ b/kunit/test-test.c
@@ -135,3 +135,125 @@ static struct kunit_module kunit_try_catch_test_module = {
 	.test_cases = kunit_try_catch_test_cases,
 };
 module_test(kunit_try_catch_test_module);
+
+/*
+ * Context for testing test managed resources
+ * is_resource_initialized is used to test arbitrary resources
+ */
+struct kunit_test_resource_context {
+	struct kunit test;
+	bool is_resource_initialized;
+};
+
+static int fake_resource_init(struct kunit_resource *res, void *context)
+{
+	struct kunit_test_resource_context *ctx = context;
+
+	res->allocation = &ctx->is_resource_initialized;
+	ctx->is_resource_initialized = true;
+	return 0;
+}
+
+static void fake_resource_free(struct kunit_resource *res)
+{
+	bool *is_resource_initialized = res->allocation;
+
+	*is_resource_initialized = false;
+}
+
+static void kunit_resource_test_init_resources(struct kunit *test)
+{
+	struct kunit_test_resource_context *ctx = test->priv;
+
+	kunit_init_test(&ctx->test, "testing_test_init_test");
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static void kunit_resource_test_alloc_resource(struct kunit *test)
+{
+	struct kunit_test_resource_context *ctx = test->priv;
+	struct kunit_resource *res;
+	kunit_resource_free_t free = fake_resource_free;
+
+	res = kunit_alloc_resource(&ctx->test,
+				   fake_resource_init,
+				   fake_resource_free,
+				   ctx);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, res);
+	KUNIT_EXPECT_EQ(test, &ctx->is_resource_initialized, res->allocation);
+	KUNIT_EXPECT_TRUE(test, list_is_last(&res->node, &ctx->test.resources));
+	KUNIT_EXPECT_EQ(test, free, res->free);
+}
+
+static void kunit_resource_test_free_resource(struct kunit *test)
+{
+	struct kunit_test_resource_context *ctx = test->priv;
+	struct kunit_resource *res = kunit_alloc_resource(&ctx->test,
+							  fake_resource_init,
+							  fake_resource_free,
+							  ctx);
+
+	kunit_free_resource(&ctx->test, res);
+
+	KUNIT_EXPECT_EQ(test, false, ctx->is_resource_initialized);
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static void kunit_resource_test_cleanup_resources(struct kunit *test)
+{
+	int i;
+	struct kunit_test_resource_context *ctx = test->priv;
+	struct kunit_resource *resources[5];
+
+	for (i = 0; i < ARRAY_SIZE(resources); i++) {
+		resources[i] = kunit_alloc_resource(&ctx->test,
+						    fake_resource_init,
+						    fake_resource_free,
+						    ctx);
+	}
+
+	kunit_cleanup(&ctx->test);
+
+	KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
+}
+
+static int kunit_resource_test_init(struct kunit *test)
+{
+	struct kunit_test_resource_context *ctx =
+			kzalloc(sizeof(*ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return -ENOMEM;
+
+	test->priv = ctx;
+
+	kunit_init_test(&ctx->test, "test_test_context");
+
+	return 0;
+}
+
+static void kunit_resource_test_exit(struct kunit *test)
+{
+	struct kunit_test_resource_context *ctx = test->priv;
+
+	kunit_cleanup(&ctx->test);
+	kfree(ctx);
+}
+
+static struct kunit_case kunit_resource_test_cases[] = {
+	KUNIT_CASE(kunit_resource_test_init_resources),
+	KUNIT_CASE(kunit_resource_test_alloc_resource),
+	KUNIT_CASE(kunit_resource_test_free_resource),
+	KUNIT_CASE(kunit_resource_test_cleanup_resources),
+	{},
+};
+
+static struct kunit_module kunit_resource_test_module = {
+	.name = "kunit-resource-test",
+	.init = kunit_resource_test_init,
+	.exit = kunit_resource_test_exit,
+	.test_cases = kunit_resource_test_cases,
+};
+module_test(kunit_resource_test_module);
-- 
2.21.0.392.gf8f6787159e-goog

