Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058D357A43
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739546; cv=none; b=uLIfMZUHKNR6hRUp60sfev9IXrIq12vaM6qA1IPvT2LQjDeoxIdWPNLjy5TWGzGoZYDRIyzkULe79lltrQAyUBUovx8639wWX0YfuZR6GNdHNCII7JUBxXwohB9lVbRJsCIYRJss+Pn+ysjbooFui1MeHGNd+8sno7VSmF8s4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739546; c=relaxed/simple;
	bh=NlEYLh+CSv2ptFyqAFOscytJpzqxlTIZEPiPfda0LhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXCD5zpHn8V49nbe1tddaQvm4gbT+t4zUEWRkho6KOySuT3/5VQYh/50eKacBdfIi+zcXwoltYJlfjhUtO+q2xoEOXz6gTq/xhoZDKADyWZdIfuhUr9oMrwvmxaiVwbw56WN6XBecV6uoSFAhu8tjH/tift1c/jq8L5ljeeNLwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UUrUlere; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UUrUlere"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773739544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGsi5yl8JKiyZRFNdI9Aenref4UbeHYmyNWTDritDOs=;
	b=UUrUlered6b2nMNg/6DgK8J8W7H3VzOJUOhE2vpBzLZqq4pRzH8cZbkVB9CAGu7Lisaq2n
	JLf8dqvt0zUUpN2qgs87zmwyb19tAXyD8Z1Trrn0E8NlFaz3HkySaATyGnD8m/5rE8A87/
	dEhAMw16dieew1ZIfvg/IZpuA9BxavI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-8GGVyfOnN6un6g9XQ-spTg-1; Tue,
 17 Mar 2026 05:25:39 -0400
X-MC-Unique: 8GGVyfOnN6un6g9XQ-spTg-1
X-Mimecast-MFC-AGG-ID: 8GGVyfOnN6un6g9XQ-spTg_1773739537
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4CDE18005B0;
	Tue, 17 Mar 2026 09:25:36 +0000 (UTC)
Received: from [192.168.1.153] (unknown [10.45.224.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE3161800576;
	Tue, 17 Mar 2026 09:25:29 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 17 Mar 2026 10:24:45 +0100
Subject: [PATCH v6 5/5] kunit: Add documentation for warning backtrace
 suppression API
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-kunit_add_support-v6-5-dd22aeb3fe5d@redhat.com>
References: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>
In-Reply-To: <20260317-kunit_add_support-v6-0-dd22aeb3fe5d@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Alessandro Carminati <acarmina@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Kees Cook <kees@kernel.org>, 
 David Gow <david@davidgow.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739485; l=2206;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=zffkV3aP+LRb63HE4Cugtw9tkVeluLJxk1TZs6/vS7w=;
 b=xi7QMbvvT0J1dRWy0KlqnqQitH/PSQLUAgKbbKLFYdzU0n6EX8wvnLuZoSc5f5tmfTND76HVS
 bouO5u5E76MAyvEjL9Wl88tqUS1vAldKxm8cG0kkE/uNJu+J4Va4LFO
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index ebd06f5ea4550..f1f8e2619d2d6 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -1211,4 +1239,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}

-- 
2.52.0

