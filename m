Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456173158C
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 19:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHyKxEDn"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D29410A
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 11:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699384172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3J40+zQ/6dP9tvNGgIODUTJ9R+5seR+mVk01q9f45Uc=;
	b=WHyKxEDnr8lHHG5NAKtnaCEzXlnCbgndyFBc3A1tytfKykuys8IIbmacXutMY0gLUlkY/X
	MzHk/N3aInfQYrs29no5X0Dbd18C7R9RxIECJsE7G5zEuoMd2fwZQ+ajDOQy6sMUCDxBpB
	y0xkYxZIL/W/2QC61O+UEJuCivOPaYw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-_fBNRVnJN6SJkcSyQLINHg-1; Tue, 07 Nov 2023 14:09:31 -0500
X-MC-Unique: _fBNRVnJN6SJkcSyQLINHg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4083fec2c30so40293935e9.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 11:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699384169; x=1699988969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J40+zQ/6dP9tvNGgIODUTJ9R+5seR+mVk01q9f45Uc=;
        b=uSinMFEr9ivwfi+/VYJmONlfKw8kAmd2dPJ5TdbW8VugXEx5v1avF7LLxKdePIpdLf
         Ftec+gxPyWtVAu6ka1HDikX49yoNpehDekEsg3l0Rv2vQlYrPcbQuseiVLXhQZ0+r+1E
         dBteulGbcXAbclRMdM7nKTnl3CZ+sW/WL7S0KM87xPI0/5JeYWXFODyYdltSvbs1mA71
         IkOL/GdIc1AAdLOLGgMaGzJ/2S6UCk98JcQba2XQFO4UkGmm3bHFT1ZxLh9WoqEpvuXN
         9uPxNuggUckFT3dSN09H3V9NnJUV1GlZ2MWfILWPEetvfyHx2ay4cRjOznD7D5CbsxF9
         FK6A==
X-Gm-Message-State: AOJu0Yxk89Peog8Ewbnsjn51972HcoQfZbyLkHH4h9kiaFIbLtfw65RW
	pOoijnuqGo4uOeSpHdO0k6I5DWbZqwsHv+/HvVsnHci5Jk+PL85i8PHvkUJCPjDwM5YXN+QKGaT
	+MtHp8TkofQdpUoLa6qyC
X-Received: by 2002:a05:600c:4448:b0:409:79cb:1df6 with SMTP id v8-20020a05600c444800b0040979cb1df6mr3032967wmn.14.1699384169559;
        Tue, 07 Nov 2023 11:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9xvdcop2cag0mJbvlGopE/xTO4Pcr5jJIkWEGHZ4CMIoXRHQH7Dm3WT+HPFFscnl+vjA+sg==
X-Received: by 2002:a05:600c:4448:b0:409:79cb:1df6 with SMTP id v8-20020a05600c444800b0040979cb1df6mr3032941wmn.14.1699384169220;
        Tue, 07 Nov 2023 11:09:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c43d400b003fbe4cecc3bsm16089746wmn.16.2023.11.07.11.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 11:09:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Tejun Heo <tj@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] regulator: core: Add option to prevent disabling unused regulators
Date: Tue,  7 Nov 2023 20:09:18 +0100
Message-ID: <20231107190926.1185326-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This may be useful for debugging and develompent purposes, when there are
drivers that depend on regulators to be enabled but do not request them.

It is inspired from the clk_ignore_unused and pd_ignore_unused parameters,
that are used to keep firmware-enabled clocks and power domains on even if
these are not used by drivers.

The parameter is not expected to be used in normal cases and should not be
needed on a platform with proper driver support.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:
- Grammar changes suggested by Randy Dunlap.
- Add collected tags from v1.

 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/regulator/core.c                        | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0a1731a0f0ef..d7c83c8ae80d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5461,6 +5461,13 @@
 			print every Nth verbose statement, where N is the value
 			specified.
 
+	regulator_ignore_unused
+			[REGULATOR]
+			Prevents regulator framework from disabling regulators
+			that are unused, due no driver claiming them. This may
+			be useful for debug and development, but should not be
+			needed on a platform with proper driver support.
+
 	relax_domain_level=
 			[KNL, SMP] Set scheduler's default relax_domain_level.
 			See Documentation/admin-guide/cgroup-v1/cpusets.rst.
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3137e40fcd3e..79777495cc3a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6234,6 +6234,14 @@ static int regulator_late_cleanup(struct device *dev, void *data)
 	return 0;
 }
 
+static bool regulator_ignore_unused;
+static int __init regulator_ignore_unused_setup(char *__unused)
+{
+	regulator_ignore_unused = true;
+	return 1;
+}
+__setup("regulator_ignore_unused", regulator_ignore_unused_setup);
+
 static void regulator_init_complete_work_function(struct work_struct *work)
 {
 	/*
@@ -6246,6 +6254,15 @@ static void regulator_init_complete_work_function(struct work_struct *work)
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
 
+	/*
+	 * For debugging purposes, it may be useful to prevent unused
+	 * regulators from being disabled.
+	 */
+	if (regulator_ignore_unused) {
+		pr_warn("regulator: Not disabling unused regulators\n");
+		return;
+	}
+
 	/* If we have a full configuration then disable any regulators
 	 * we have permission to change the status for and which are
 	 * not in use or always_on.  This is effectively the default
-- 
2.41.0

