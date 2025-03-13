Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A684C2698A3
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866294; cv=none; b=leF8r0q1iD8sg9Pdjqtt1LvRS2gGfkne0qSnzIjb22yCp06Jd3qy3V9m9DMfQ/pR7jCw59RkIvHWJF5/YBIZe07F0Ae8Xt+btYklFrUlLRROJW1Hn/npivmw7ss97FuXGpmvbPuMpf+GbKmBLM3ubbMNX6GRZRocCmS8ab4hplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866294; c=relaxed/simple;
	bh=0aizeDhwWkFKZsPeHlQzOAxiwKdPV8X3HwIBD/FO6ic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=IvzOYiNk0lqsVtctob+OLBkL2h91GDrlqFfGZzj/enJ2pY/sS3LKttNsR+JL7Jjc90lcuUBbeMUUslLOzoIYr6nCCo3qt7RvAsTikr9V7lIkT0pxtWQ4lzxgyw0rqM5i/xJdCOnWFcB9Q69Qpkq7CJCI0kvuPzlwDP8y8cRp2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhzjzNNl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhzjzNNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
	b=UhzjzNNlkWyKPCBgU3I7/myJZoQ/R4kROmu9b//6VZraxGHS6AhCciyKggGA20l9g79beY
	/xN8afHGR2yKYsqfLHEPA6onEHo9pa4tQ+hX7qqJ3Dio5eLOFE4Ub50RFbZn6WGIw3y3Kn
	C5jd4tTbTY0BapeU8xCd7KkGyqRY4C4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-bI7sVSkrPCOx31UvTREtTQ-1; Thu, 13 Mar 2025 07:44:50 -0400
X-MC-Unique: bI7sVSkrPCOx31UvTREtTQ-1
X-Mimecast-MFC-AGG-ID: bI7sVSkrPCOx31UvTREtTQ_1741866289
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913b2d355fso345407f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866289; x=1742471089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNDdusV5kHSN69Wnsdcb+ESaCAhVWZZ95i0rdnVfZIo=;
        b=FJIdIxlgSYw9ShAsAguYe9TkychuUmrCigdtO+CH1fUfF0zk8ThnJ+c9+fbd3radbI
         R7qDW4TLk+pSl89bhEU1ArITnJIHv2zdfQjq1/2rA+Tfimdh8Kvl+WUT0/oR9U/R65s2
         f2w1f3ZMV8OXuo63G2qX3d2cwZhNGwAGRdXhf9OoLLKHHaWUGcEseN4q7fTYkKRF8wLG
         +J+KyxXeX95RLtCEUeA4YI2UKeO3aQ+LjihDd/7FDJG4r3NVSy4WqhrDf3HO25g7LJY+
         JhQAMiWp1SLncMa9Q+7evy6E5gDXFz7r9mttu0Bp7QT9Dv9WfW7e1nVhzPwvTRbGTfAT
         xmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAGUI5EM2i/8SwnU6ojjj7E82tb8n5+C9aMvmESYdt3aYfsI/kHIb//+6+3poeiP+TvrhfViML/uk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4MYxG9Irc6brMWhKLfyr+a3qQ/ABrkW7rUZwU70INN7cL36A
	0+Gx9Z6saPDs7y6lV8BDzXqjEEWsA2EVLJEF0h+HrARvhLMS8v3lGYHPedt5UGQTHcLfN+LhS2t
	VIbGU3GUTTaUqjahgvl+KO4vfqHCcViKqlqVOQ3H9Cd1xre7qjo6YDWZ4DA==
X-Gm-Gg: ASbGncv1tNHnsHsjiXRoyIA4hQAHlcSab8IWlpz0K5YYuIsUG+PCBhrPPhTl0iae7a3
	/Nvjs4LMYcsR10P4NmKeAbj0yT8B365nsIu91A4mLlJm++ST6280nGxIw13NajtX/iUODDDpkiN
	tG0csJ+aivXqSWH75KCPJcRI+IopvevJnfM6GJgYmMm2CxhmbKeG1bPKDAE/ROUuBxZSKdQsF1J
	VuXqlAr7kX6TjHisnwFKheEXN6UOdBaN2kr7vDpFeDa8k+JZol2eqVtvzC8AyEAtFO7Ohl12LN1
	M1Hco3Jt93mQiWqV69n8
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39132d8afb7mr18596805f8f.31.1741866289381;
        Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYwocEA7kYpHNOe02FWF9uxS8M3FuzRDEqfu4GtiOXX78+oDlT7RdxLzaiu9BpsPlw7lldzQ==
X-Received: by 2002:a5d:6daa:0:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-39132d8afb7mr18596786f8f.31.1741866289052;
        Thu, 13 Mar 2025 04:44:49 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
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
	Helge Deller <deller@gmx.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 09/14] parisc: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:24 +0000
Message-Id: <20250313114329.284104-10-acarmina@redhat.com>
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..b59c3f7380bf 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.34.1

