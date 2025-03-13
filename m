Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EDC26A1CF
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 11:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866300; cv=none; b=Mt6N7OACzOIXVvwunq9c1BkXDX3MBNojM3uu+48P0IA5Z5moPp9BKZ3gnY/nUQUDgnvvnCE0ClL3pnqVrn/d0IR5wYiOQP9EB7LldOeJaTr0fFq60KyLtRSqyFUKxgSdHp9hNCo6ODVDyMA118J0LXB9EwjhCLGyvuYgILi6Oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866300; c=relaxed/simple;
	bh=LkqKUNYGs/ePGkjxR4/GakhMBC+dOQkDGsyg7Jru2eY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=kiyGrmJXcUaS7mIFQ8kUZV+suR/v5U41mAbuOc7tt2UHVn+haElBZWGZ+QdQHbudiK5SSO+mkxbfhIVU+xnCH9SqAeBheQrRdMg35zoJ5ma+DWco9tG3HwBhgxRJakq+WT9XUGukDOZkAl1nrkAouckRB4Cl87DUGE8/CVfCKgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KMQ9dFVA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KMQ9dFVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
	b=KMQ9dFVAw0PY8UoGH2ZnQtv2EV1wkdO5uMIhmgRIISCHv2e6UOaDaVi7LvbwZbNh7n7E4v
	rpZttcOhxtu+k3vFQyVx1b9bXyRJvVjAlEWjpsuJ4piW3btDMboUi+UlsJ7nfie3PM21rl
	iSt6HWBX/qir8+M8pUGYWT8Z2x0h6lo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-VvLF_xVhPxOfXgTrNQ5rew-1; Thu, 13 Mar 2025 07:44:57 -0400
X-MC-Unique: VvLF_xVhPxOfXgTrNQ5rew-1
X-Mimecast-MFC-AGG-ID: VvLF_xVhPxOfXgTrNQ5rew_1741866296
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912e4e2033so382958f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866296; x=1742471096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td98jnkcLGUCy3vrjbMOv35ZA5bivtUA493Q3YOVPt4=;
        b=TvvhVadW4EVKQzewcJmBOkMaGl8l4+NZ72RJ6eY8zuvcYMgbWzkr/TP1NwDnrSxdgh
         gvOjS2eC5Q+XRAq5pL8aSJw54wNiWV8bDM4uprY43rSsqWmhbG4kHNRFMIotAWYwSvka
         maSp6qzZK4By7wofobri5B+03y+52Zru6bXS/ZgWFRE++/DtaD1YT2HrQb+QZy4p8hOb
         kqOdpGJIz3uGI+vB0HNgxOtL8Aw5Xy+SPLvcWHBvPbu2qbByGdWRdbv5zqCUhvhuotFC
         OmDOFUnPjk3DUklK2Gxl0QGFR5ACtDzbDtoxR1AdztmQYF4PGzVdlc0iYHiun48bSR6X
         UDTA==
X-Forwarded-Encrypted: i=1; AJvYcCX9oojqqNqT2cgiUCwO89w5bJ9Rt1qcDTA2Zw8aBfi+q+D6G51eVdVdsbE4zIXxeUAlw20gP5lX/0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEt62wq62BXcDyhiIb/s7cpQpc+0r7yCjU9Hcc/Ci9bfz3Ulad
	VxpHEaM1sjyemcWz3IfTTuRgYoRY0rwki/oAmDcfWFkD5glBshFyePm5IuaLI13KJ+J5qqXebaq
	g20V3wEMNvJr00SwP+12M81xNcm4mICagwtIrLWm2C0tAsTXxJxj1kIhf0Q==
X-Gm-Gg: ASbGncskjeCYyhkpwauA8yb7PIbrtMVFVXz5ZpHY+Fj9Hb3aUXOsNen6Dqseo/jfYCx
	C8XZ1fZyD7Z9SxOt9T5GBH6P/+aL5F+nM03dODS3CMxsCPVMxSKAVcTLp59vDjK7GeKSm2WmsSU
	kymNDJnjK7ysSSiDJsFv/imFiKsHdJkN3Jp7kB/+EikO1nWt6N9hQtSsed0vZqIWjm7k3FOU3Lg
	wtsAO6KKen8i6G4q7fd7p1Pswl1B8c9PaN4CxFy2h8C3eJ/8dgZNEe69kGwyKgRTKlRX1q+7b4I
	PxGF+U/YE19vRBIUrBPm
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836112f8f.47.1741866296126;
        Thu, 13 Mar 2025 04:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyU2ePtAFWyqCZMakOsiK4/iIhrDziNVQawXJEAak4gPJli8tipIq38M0q9zksW0XKC08fAA==
X-Received: by 2002:a5d:64a8:0:b0:391:23e7:968d with SMTP id ffacd0b85a97d-39132db703cmr17836093f8f.47.1741866295677;
        Thu, 13 Mar 2025 04:44:55 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 12/14] sh: Move defines needed for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:27 +0000
Message-Id: <20250313114329.284104-13-acarmina@redhat.com>
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

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.34.1

