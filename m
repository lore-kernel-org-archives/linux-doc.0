Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877FD26AA8F
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866303; cv=none; b=nl9s/3pOPqujI/L7qDxWOQQRsurmIJM8zNnM4GcDWeqvYNcjK3r6i5jlVp6f2EcsI7d1jCeFvtZVxsIRV5BlUrogkpZ/iLB/XdeIZzz94VtcK9eoUJeXUFuR8JR7pN5lVJWA6ADGy1BRNYnLacDnXPogW0pH04v4wAowWSUYdZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866303; c=relaxed/simple;
	bh=IBY1cNO3qDPo2x35DSNukBNEFYKja79GMNoThS6fomc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=M+ueUy8CLxcS7Q9HlqSE65os5kzUSfBmMVGEFQ2yTQb+bErYHZbgo6h1i6EcoV3px7sF5uPZfjTWQUwJpozxq26+JlOfdXsvoMfxxnEXLKmM1L3Ga2CnoJeH6L2C/Nr4goM2h/sxuXRdFtihkQ1BecdxBH8/eiDNXJNoicBR8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AdZUmITh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AdZUmITh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
	b=AdZUmIThaO+7PmVyeiYExyWTUizak90Xq2SvYlC/Cu9cOT9o258bwIIUcPmh7kyuDqYlW/
	w0wgFW7BrbCn+wQ46Pya/dtXsNlIjQRp38f/NXywbxi5c4OzqVIcPtn14glxp12czAjE6g
	jC16flXV1/EKVSMTuO6KbfKBNrpyBOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-gYRw_EXdOsWqXJhzbgdUTQ-1; Thu, 13 Mar 2025 07:44:59 -0400
X-MC-Unique: gYRw_EXdOsWqXJhzbgdUTQ-1
X-Mimecast-MFC-AGG-ID: gYRw_EXdOsWqXJhzbgdUTQ_1741866298
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so5905975e9.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866298; x=1742471098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
        b=CBmik5eL8knRlIUHPbcO26gd0/pEaWwrMNluiOXFMwTAygBFMQpTIzw7FR0nhFDy34
         aPAEUbtvq7eaOuKqvaK1Xqj5IggcrEYZ9vaaAwhK6eutoU+iahT3W7/rIs6i+4gDPmfE
         z5AVR36zXKFBhAgrgf3uO50lrj/ImBT9LalLtryYrdPtMFnaY1OHq+7rxzhBcxKN/8ZX
         Wo0QLB1s7GNEfbuUz3RUVdHPFRlgY0eB7Y5/oikg7ZSh070jLtCw2/44zehuPwbeX4tj
         SKOz+kzZoI+AaVfMDw8HMtL/mUMix8xUDgWGa6jD4COwQdRG1w54PJj1VBZ5SV16nGrf
         dMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIqLm0XOAud8WYCeRMI2X0PPQzeLVc5JJrXaRDWmG5XgMKiZdOl5NFUMELEL52gWkUPb8QYCKrTYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEgaLB8CuLtyVNZyLy5xsE43QTq5w/Yf/YgGaMR7BW/Sl3YUL4
	aTdFp/Xi8GvrFOdwU9KMoewVMl6IGUEmXJ/NEBQ+a20uu5cV+KBXE3joM/GbTSLN+dIABPM7Mya
	i0bIr8u5hDeRihjfkH5Nvx/oExk3BrJWJ8duhIlexC3k2tIAxKQ5/6JUtIg==
X-Gm-Gg: ASbGncuXdVDXUVzJCEzBUtCOmNLcD7SBgD9t5LB83Lp9/cWeyBOg25SobnXabQkbyAs
	uhLnppokEK/5pTs+dRR0hS+J2XH6CtoSSybvwarzfj2aT1327vo+n5yd+y2NiqS0nbDKrzto0pY
	6q8fhG+YJq7upSCR7z6uBEoacxoKr+u148L69ujZoghpmqK6KHGAvkoqBd2NvKgGqzy5ZZ+/pK1
	BoWfySmiEQP01z+8vUqtItmOdIM1FHbVa6Qf5t77vjQ7EiRO7t8zW6mczdTyg+wqKfcZ9vgLk7I
	ZNXeLIucwo/TK7UtcywI
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198762575e9.10.1741866298372;
        Thu, 13 Mar 2025 04:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3R3Nh+MesHXp5r1AiRFiydlKhpsUv7CB4RneKkaatJviaz79nmlaZTG/mhvpsulZ3LqTgOQ==
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198761995e9.10.1741866297943;
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 13/14] riscv: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:28 +0000
Message-Id: <20250313114329.284104-14-acarmina@redhat.com>
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..79f360af4ad8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,26 +30,39 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
 #else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	__BUG_REL(%0) "\n\t"		\
+	__BUG_FUNC_PTR "\n\t"		\
+	RISCV_SHORT " %2\n\t"		\
+	RISCV_SHORT " %3"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	RISCV_SHORT " %3"
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,10 +71,11 @@ do {								\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
+			".org 2b + %4\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (__FILE__), "i" (__BUG_FUNC),		\
+		  "i" (__LINE__),				\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.34.1

