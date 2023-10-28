Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485FD291D
	for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPh3KBX/"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9A9107
	for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 03:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698488689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/MCG0fKq7dkA5vfmyvu/Vw865nGk2FxWSZE8uUZKj/c=;
	b=WPh3KBX/6SpxAVBfSugaFe+JKAZr3rgO4g6LtL/aX971ik7RlVL955sC2lyIyUeHK5Jg1T
	rQxhKwDsqYF1QlH+T0CTA0fWr1tPqOj2VPHOr7x7KqN3e3rElDsHw8MlzMEcqbKtX8c2zS
	uvGGa8pcy7ydMz3DKEbEkj5xRZ0pzog=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-Q9j3oHbjOf-3hPjuSMrBbQ-1; Sat, 28 Oct 2023 06:24:47 -0400
X-MC-Unique: Q9j3oHbjOf-3hPjuSMrBbQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32da215295fso1556017f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 28 Oct 2023 03:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698488686; x=1699093486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MCG0fKq7dkA5vfmyvu/Vw865nGk2FxWSZE8uUZKj/c=;
        b=gIkORwicMSGgtDkkTYF3xnBuYkr5AcxkRXBELiDmmxUWo+Wp7EeE/JYLssYN7ZcGKz
         xjVNjATSkjkhigfDG7K5o9/YVFDLPcEqwrti5Ts0KWtGuzJlRfFPnR76+UjNJ9w1goIA
         rPZ6S5iru1x/4kD8KPZd6IFwxVAtixI5SHA8yFVtuo57APdxQwMz09POoIX0AL+YA9fC
         NanQQAzCSfSgOKXwG7Y+2A1KDSuhasCvGHh0t0ZmQtkgMYIN/YshRcTiCPnGCHULTzSQ
         dVkzGqaY4mByoCsK0akVXcTMZBIaMAjtsMuZh3Xx7OGI+ikEcNzmfTEhIwnD5vuV33eM
         mKyg==
X-Gm-Message-State: AOJu0Yz11GZTmiN0LQE591bKgr1EIiN1FKzEYZRZY3v8DLtiVi4Zw/Uv
	PLMTTOV5TprC+g7epYc510rR8iC60wqAEDqRKYzEvTvwR+5T6AFeg9T1Q3JZ4paxA1EKAYIP/uF
	SGB6LM3MHb1jUvkxRgPvQ
X-Received: by 2002:a05:6000:156f:b0:32f:62d5:79fd with SMTP id 15-20020a056000156f00b0032f62d579fdmr5354099wrz.23.1698488686425;
        Sat, 28 Oct 2023 03:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxEi/dA8WtnLFBPkzL53od+apnFqRBy6Qk5B3lHlCfa6pklRkOawp3tUVmzPuyiyXpqZ299Q==
X-Received: by 2002:a05:6000:156f:b0:32f:62d5:79fd with SMTP id 15-20020a056000156f00b0032f62d579fdmr5354082wrz.23.1698488686028;
        Sat, 28 Oct 2023 03:24:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b00326f0ca3566sm3552032wro.50.2023.10.28.03.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 03:24:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Tejun Heo <tj@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] regulator: core: Add option to prevent disabling unused regulators
Date: Sat, 28 Oct 2023 12:24:03 +0200
Message-ID: <20231028102423.179400-1-javierm@redhat.com>
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
---

 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 drivers/regulator/core.c                        | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0a1731a0f0ef..91b58d767c2c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5461,6 +5461,13 @@
 			print every Nth verbose statement, where N is the value
 			specified.
 
+	regulator_ignore_unused
+			[REGULATOR]
+			Prevents the regulator framework to disable regulators
+			that are unused due not driver claiming them. This may
+			be useful for debug and development, but should not be
+			needed on a platform with proper driver support.
+
 	relax_domain_level=
 			[KNL, SMP] Set scheduler's default relax_domain_level.
 			See Documentation/admin-guide/cgroup-v1/cpusets.rst.
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 3137e40fcd3e..220034ff0273 100644
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
+	 * regulators to be disabled.
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

