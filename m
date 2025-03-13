Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E8267B92
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866278; cv=none; b=V2x+OgJbz5yi/IkAdZYx6yxl7c5cOG0y7hgUyDKvwCkL8s8VBbKhsMItBUXBh4us51QXnG59+HT7CbEC70Vn2dMZHTIFNWaagJKbBa4QHSNwPBjnLWMer8RBoUyeDxIUF/Hen2NI58FbqKo1wGHWRznt0I2sfogiUoJ+JHVE2B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866278; c=relaxed/simple;
	bh=JbNbHCb0M8H+Mi/VSJ+AkQrazCf6qqGs/PR+WCt/JcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=LvyrD2w4LHTfscD1Rp8pRF/oBlBIPRZ7hK6L0qc9Y43fkYL8ehGJliu1mB1GtBpvpp5+cNQbjadqSCJX0jn5D/mTJ/QwkMbZRXReZhqqqEQ473pdKeqK16fzXj3MXi4f6xBsXXFYt7QDr8NHATi77ML7+o29z5bTAK6mOgdwhtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCQVbTGs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCQVbTGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
	b=CCQVbTGsElo+FrpACDCzj77GBSib9QqOEdmN3S2lVhbzeXqX4lA0kpKIvWvcTs8Q81IVcT
	WLPDEaFL/hw2ZKLRfnIlzf4Ku9Jp9JzeeqKdJmgtbsqqVTgf+vBwPZGcfp21VDEkSZRs1K
	xaWbv14lXF6seIsckbhJY8xDoga2dmk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-d_JAAvqUN_27yIdTvSa5WA-1; Thu, 13 Mar 2025 07:44:34 -0400
X-MC-Unique: d_JAAvqUN_27yIdTvSa5WA-1
X-Mimecast-MFC-AGG-ID: d_JAAvqUN_27yIdTvSa5WA_1741866273
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so4274535e9.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866273; x=1742471073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxCl1osfLw2v3G3W+1kfNU8xiBvtJTPCZorcBEjeG40=;
        b=ebhkEggo1gm/iNS5NjifWyfvFYxL+HY8ceIOT/Zox5NcQgVlCGF3a7nykUuANW1/uW
         DBCfoqIcOm/xks9M5NyY9Bd5pslFDsGQ5Qfkfz1VcsbKV44CBfDMbuL+RIF7XPz/nDE6
         qdMO9pwSLuWMjQlj8mRpOiO0F8ZqW5sf97LnWtQm7+JFWTfsd0eK565QsPJgmVlas6Hy
         V9bxyh27CdLq3Kwk6M1D3ODxv6xjVkuvH40rFk/2xGFQN86T5jG7d+nn1H92sjKg/huh
         cUwp3HChMTms2WzDjmgiTE3NwyQacY/wglb9fYYeIWqQVqoAKFcqHin9mGsjASLp0tmM
         MR7w==
X-Forwarded-Encrypted: i=1; AJvYcCVOVbIX5eXNhg8PLSzsM5wAkqBJY3xVixSGf9eKjMft2mh/CRoCmZJkhMSqFM7AYaCUyYm8n5tS9xM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo80fCHGyNIwHKDY/PkxKykrdzO5oRQSV7M4jXZc2mfCI9eRWO
	1qh0BeqEGPDy8ZRx0vHtuyI2ovfIgnFv5x3/VvJ1U1Bcyn+S8wuN4/nvMrfyjJATN7L4x8yd5uD
	GD29YqBsAs2UuRUy0CBzv0jI66SsepBMQQyecC2CM8WFgD0fEVPqN9wncVA==
X-Gm-Gg: ASbGncvB6ZuFwD7e8ypX5FK9GRhB/NfKHXKC/c0uBriAqQRqY2EDBIyXeGnMDHpDJ+v
	e09PzIkqtvVv+jSZn1czr94AnCiyxcB6YgRglM4EXLb6Vo6sA5Q3mhKULMpXs/16L9o5lCHBlyb
	yGVYV778ULZ/Qed0/kiO/DhV7hvShRSxNcSOFKBSL1/bvao91LPUY3wty/jCz/ft7AUobNLz+J4
	N71FBP8bc8TcSmjnOPGYHuWqgtXkySMI7ogVNVxgrli/jkfIaOk9nLzI8S30fn7JjEia1J7DPe0
	V6HMxLHHG+YRkKHQRzFM
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr174500595e9.31.1741866273485;
        Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs6EAEForVjkecQAM8kbehVzhKfM/0tK/SxXfrbXe4b06Gjm7InnzRnhjTKgVzk9sVgzkBAA==
X-Received: by 2002:a05:600c:190c:b0:43c:ea40:ae4a with SMTP id 5b1f17b1804b1-43cea40af7amr174500265e9.31.1741866273039;
        Thu, 13 Mar 2025 04:44:33 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:32 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 02/14] kunit: bug: Count suppressed warning backtraces
Date: Thu, 13 Mar 2025 11:43:17 +0000
Message-Id: <20250313114329.284104-3-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 0a8e62c1fcaf..44efa7d5c902 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __kunit_start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __kunit_is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define KUNIT_START_SUPPRESSED_WARNING(func) \
 	__kunit_start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __kunit_is_suppressed_warning(const char *function);
 #define KUNIT_IS_SUPPRESSED_WARNING(func) \
 	__kunit_is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define KUNIT_START_SUPPRESSED_WARNING(func)
 #define KUNIT_END_SUPPRESSED_WARNING(func)
 #define KUNIT_IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index 351f9a595a71..84c05b1a9e8b 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __kunit_is_suppressed_warning(const char *function)
 		return false;
 
 	list_for_each_entry(warning, &suppressed_warnings, node) {
-		if (!strcmp(function, warning->function))
+		if (!strcmp(function, warning->function)) {
+			warning->counter++;
 			return true;
+		}
 	}
 	return false;
 }
-- 
2.34.1

