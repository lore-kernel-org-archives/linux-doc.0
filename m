Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F0368947
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700453; cv=none; b=H9SpTjce4Kr2TbGV2RmQM2n8wQ5fxbG3ajLD2MQZBN3ICKTUxpMYY6EdgLFX917Lx7+azCnt5FJJgrrvw9yDWXfz0/7IpIOISBqBTcEbEtgxY/xiSvnP/cGnczuDSF+DEaEkC7gA+6h+lZhuvtCTcQdo0UONZnt4h67AKrEa+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700453; c=relaxed/simple;
	bh=0xCjTnQlG1U8KFxdCHLVY8uV/kewZx19MaNmIpedMpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dg9vh6POMmO3Q1QEl10QrForhiNoo9eeskz0/3d9/4HkNV8s/gMlciZc/JplCXe5MZyaj/u6GzSBfBVNIYz3Q7k51ZxQVp4W/IY8j8vyf9LHe9IK1Wlaqta11rCNtGOxNzENu0mzMXRCDnBk0Km4zjWvk1FcDRUkNGI9Kdbyt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TT46cK/D; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqHs7PTY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TT46cK/D";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqHs7PTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773700449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
	b=TT46cK/Dn+ovVCNUOVis3n2aSuFpJ/LpKyAxZZ7GeeOVWO4xOcsocr+USQso3Y8TdZUT4D
	8Cd9SH9UVqJkw5RzH990YWSHmtp5ebjhUFecTwEdJJEt63FfV8D+RJpX9s2dOfyAPY5zBs
	hb6i1H3mEw5ldI2wH8hDu0PWC0TESbY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-HpwIcVZYMQOewlbKGG2MFw-1; Mon, 16 Mar 2026 18:34:08 -0400
X-MC-Unique: HpwIcVZYMQOewlbKGG2MFw-1
X-Mimecast-MFC-AGG-ID: HpwIcVZYMQOewlbKGG2MFw_1773700448
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509159f57e0so14028231cf.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773700448; x=1774305248; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
        b=LqHs7PTYmhjYdhWa5YjGW7wiKN0ntn67HZ9iT4Nw/hiPjoel9KLnKW6a0M7bnRmRfK
         atQCRJwSKCPemgZnYj7+ewEApHn1/jt6Y6MuhAd+mBrUBI1lkXptgJmzhwsHtsEaOXVe
         7prTGLUXbKQSjvMmYoAbreG1l3ciZX5PQci+L6Wf2kpwhNvNN0ZFf8Du/iEl28x53Lao
         E1ifiZL2jsW25RkoV+xoaAqYtuCM21cPBAmspcN7ZMr9WJMpTWJOu/Kyd/NwUgS+DO+6
         F7Vvr15AEqTMX9/hOiy3sMXYNJsYkJWK0QmoFvjV5luDcLmmFg6NOIx+haRHnbGcXUyo
         +mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700448; x=1774305248;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx0g/lXtOSAsHLoQef9D9a+6NzioK6yUmBA2sZSWyI4=;
        b=npmPeITt5LC/G7gfaZWTzY3sCqNuWSv8xq5/KiiGk/419/JQai5UZTEKNZEADdG6nO
         3pjezhlUCAjGWAxCmqdggn8yacsZxrxWmJRsMaVnQYILc1L8ItV6ddNwRpmGfp77Y/fA
         zOvvw+UN/nFTg+BVQpoYMZD+fWRpMlW8hgkNpmunRwjrFyjTLcGT2R0LUNbgugGr2cLu
         CN93u4X6axaBH8PbFpaUotACSV58Z78VObspOdfOclsNdDE0OpTQ31dNsDY7qAXkTvhL
         Gu6uM4i65vSHZf8NxWJ6rlUzVIu+1P9wcIvrvzETYufVHcZwKEATBYWtiUIM86ki8D9f
         j9cw==
X-Gm-Message-State: AOJu0YykvdABx7eAHpGuhnQzP+lQM13/0mE3mV+qeyDm/4D8Cj6SRJM+
	/j83vHI/jHHZmd6hElNGXyybecG+UdmI9PpkVpIkMJUs4+ntiGgjxGX0otO/KCXAtfP7N/wFTva
	Ew+bdv76P7LdtNqKZu3dD9ReiP99YCONI41iytaUnNOP9DDbR56lVzBy5AloIBA==
X-Gm-Gg: ATEYQzxCsbOBXT1RJsDMq36IdFvGqVn+AwlxM/2h1XCC7CCSvvVwV6omri0fqhXDR2Z
	pPd+29lEEh06pfWF03o+m2gZaQG/b1eCTtLNoBBcPRpaNHtdPVdv9wtpkMjRaWgqN9Amb4ZmoqF
	imVt4dqXhN67aw9irA9NsLKeF+SWczQI3EvJEjZOJnvXC6pUZ91zUh/n/WxPEf2j+62DdOVTkkC
	sM0wwhcouGP3Mn2VX2zSkVshLCxCC9czsRZ4QWLkjnbEw+s/MFkEmdah+L5H8C8K1Tu6FfndIrG
	rIG+totShevbIC1vEIUL7KLH7mTPu4sbYtnsCPs5oYF0co6BWnc80BASym4r/GbRdBfyaTMc1Ur
	3gw6uc9d8/21S+HRtLIPXlAgyFgx/fw6Fr3YB6xPW1P1ZrNX6RBeQFEzynT0D
X-Received: by 2002:ac8:5782:0:b0:509:1b01:8916 with SMTP id d75a77b69052e-50957cf51d8mr212787871cf.4.1773700448050;
        Mon, 16 Mar 2026 15:34:08 -0700 (PDT)
X-Received: by 2002:ac8:5782:0:b0:509:1b01:8916 with SMTP id d75a77b69052e-50957cf51d8mr212787461cf.4.1773700447549;
        Mon, 16 Mar 2026 15:34:07 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0e9658sm155941071cf.21.2026.03.16.15.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:34:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 16 Mar 2026 18:33:45 -0400
Subject: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrB2ISpPiVYoLjb/poExKglII3
 r2hy2/xXqGMJMg0NoUSLskStaJrG/LvWQNY1mrqTW/N0Fn2x84SNCbwqWfGyruPuklgB+ewPJb
 nYCzV/pOwyff/fk33/QM/YYCTawAAAA==
X-Change-ID: 20260316-clk-ignore-unused-kconfig-7e77eb5b8306
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6205; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=0xCjTnQlG1U8KFxdCHLVY8uV/kewZx19MaNmIpedMpI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ3tEb9e+Bsy3LH9ekkvVKOWImLrUkH7vxM7GIOkz16Z
 dtTb3W+jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyxY+R4eIa/q+eigJWS5Qz
 SxtLJ992r3fUyv/AsPde5lS5jI/2kgz/wwQ2fFzB8V5jefVL43fbkrZ8f1nKWWcxq0++9SLH8X9
 NfAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

At the 2023 Linux Plumbers Conference in Richmond VA, there was a
discussion about how large number of systems need to boot with
clk_ignore_unused. Per the discussions at the conference, the existing
behavior in the clk core is broken, and there is a desire to completely
remove this functionality.

This series introduces a new Kconfig called
CONFIG_COMMON_CLK_DISABLE_UNUSED that when set has the existing
behavior as clk_ignore_unused so that people no longer have to specify
this parameter on the kernel command line. This Kconfig is disabled by
default to keep compatibility with existing systems. A kernel that was
compiled with this Kconfig enabled can have the clk subsystem disable
the unused clocks by passing clk_ignore_unused=0 on the kernel command
line.

Note: The existing clk code calls __setup("clk_ignore_unused", ...)
without the equals in the name. So someone can actually pass a kernel
parameter today clk_ignore_unused_foo that'll also match the existing
parameter. We can't change the existing behavior, so we need to look
for the equals sign in the value.

Link: https://lpc.events/event/17/contributions/1432/
Link: https://www.youtube.com/watch?v=tXYzM8yLIQA
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
I searched the mailinglist archive, and couldn't find where anyone
submitted something like this after LPC 2023. This was the last
suggestion discussed on the LPC talk, and it sounds like around 14:40
that this is an acceptable change.

I looked at adding some Kunit tests for this to clk_test.c. I planned to
export clk_ignore_unused_setup() for Kunit testing, however that will
require putting "=0" instead of just "0" in the tests. This won't match
the behavior on the kernel command line. See comment in the code about
the equals.
---
 Documentation/admin-guide/kernel-parameters.txt |  9 +++++++++
 Documentation/driver-api/clk.rst                |  7 +++++++
 drivers/clk/Kconfig                             | 16 ++++++++++++++++
 drivers/clk/clk.c                               | 17 ++++++++++++++---
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fa6171b5fdd5ff55b3203272568509bb45c69856..d559c387ca32425c0a3776bec899f48a21ed3026 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -830,6 +830,15 @@ Kernel parameters
 			platform with proper driver support.  For more
 			information, see Documentation/driver-api/clk.rst.
 
+	clk_ignore_unused=0
+			[CLK]
+			Force the clock framework to automatically gate unused
+			clocks at late init, even if CONFIG_COMMON_CLK_DISABLE_UNUSED
+			is enabled. This overrides the compile-time configuration
+			to re-enable power saving by disabling unused clocks.
+
+			For more information, see Documentation/driver-api/clk.rst.
+
 	clock=		[BUGS=X86-32, HW] gettimeofday clocksource override.
 			[Deprecated]
 			Forces specified clocksource (if available) to be used
diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 93bab5336dfda06069eea700d2830089bf3bce03..31ce4e3889f09a4f9c3b63cad7ded214125702f7 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -266,6 +266,13 @@ parameters::
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.
 
+Alternatively, you can enable CONFIG_COMMON_CLK_DISABLE_UNUSED at compile time
+to prevent the automatic disabling of unused clocks by default. When this
+option is enabled, unused clocks will remain enabled unless you explicitly
+force their disabling by passing "clk_ignore_unused=0" on the kernel command
+line. This can be useful for platforms that require certain clocks to remain
+enabled for proper operation, or for debugging purposes.
+
 Locking
 =======
 
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 8cc300b90b5fd9fb38ce94fcb1098810c3f52c36..d7503517f6ec1ed773b2dcb9e3a7a0b5bcdea353 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -33,6 +33,22 @@ menuconfig COMMON_CLK
 
 if COMMON_CLK
 
+config COMMON_CLK_DISABLE_UNUSED
+	bool "Do not automatically disable unused clocks"
+	help
+	  Say Y here if you want to prevent the clock framework from
+	  automatically disabling unused clocks at late initialization time.
+	  This keeps clocks running even if no driver is using them, which
+	  may be necessary for certain hardware configurations or debugging.
+
+	  By default (N), the kernel will automatically disable unused clocks
+	  to save power.
+
+	  This behavior can be overridden at boot time on the kernel command
+	  line with the parameter clk_ignore_unused.
+
+	  If unsure, say N.
+
 config COMMON_CLK_WM831X
 	tristate "Clock driver for WM831x/2x PMICs"
 	depends on MFD_WM831X
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..4afbf011de6f1727a2bf330465c95407e51d04ad 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1508,10 +1508,21 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
-static int __init clk_ignore_unused_setup(char *__unused)
+static bool clk_ignore_unused __initdata = IS_ENABLED(CONFIG_COMMON_CLK_DISABLE_UNUSED);
+static int __init clk_ignore_unused_setup(char *str)
 {
-	clk_ignore_unused = true;
+	if (!str) {
+		clk_ignore_unused = true;
+	} else {
+		/*
+		 * Typically the equals is added to the __setup below, however we
+		 * need to be able to support clk_ignore_unused without an equals
+		 * since tons of systems just pass clk_ignore_unused. So look for
+		 * the equals here.
+		 */
+		clk_ignore_unused = strcmp(str, "=0") != 0;
+	}
+
 	return 1;
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260316-clk-ignore-unused-kconfig-7e77eb5b8306

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

