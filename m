Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927937C10A
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671884; cv=none; b=meeT3zI7zyoKbVnlxKBRBxYjtrUdJ1vGRMVd1F3zITWwgCiDrMUnUh/RCbVVt9H/F7SgFhQXu8ecyvZAUPoxTcHnzTuZqbzCJQKnfk8jesGrsylb6DSf2zSBYUhmgSWgQXP+dhKQ1YVeqGni4A6N84+pdBP3AL8eGyKhCSkrzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671884; c=relaxed/simple;
	bh=ZBKwFw/eHYoONtVKVezRTboDnUoeSjSt8KmXn5wFi9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAqWKqGwMjIrP4Qvtcm0FAq5V0wmJsepaSvlCDCvjbEzGpnYutxIjMCza4791u5iR+7F9sj3HYzBajE7SxoEU4DRfcMkRjFkM12IzTZpxboXvBvh71OwkI8D41QfF+3X4AwLm3OFl3qCZateTOg7KQ666/AMhUVT4AbiTUGBeoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgFe9k6b; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgFe9k6b"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4042f55de3aso476954fac.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671881; x=1770276681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=RgFe9k6bhFrgIYA7oeTCrewfeaVtdnGuxRBqZoIfYuqGKXjG39ppb1xujMsH/PS0ki
         O9yOQgLZzzr8X63nvtMLVe2K1cnF7vNvKU2Ozi+DMe1kHfdG1COPXJi+neUwdtlVnX4U
         kcdANNqBu7JLf0Zl14hFzD8JoHwgbCTk2R2Kws36zoNPOli7lHwTtyBsnl19oNVHjOkc
         JNXPXRzgTuGDUAGt+ED4kUsOzahW1Lx2r2iyYpgW2HTpi3acwqflR5Sr/Chg2xvaOtSu
         g8JDWNEUcDjWi+weovWdy1Y0lLMFXvYqxxFfIspXH4ZXd4VcF6/aT7L2w2oVwjwsMlf0
         RDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671881; x=1770276681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=ZQ/o3zLSVtyqar4XCLGFgpuoxixz5LFBhR1Il4ENxxQDq2AnpzTd0MTu31zcsm5PsP
         C7tXBasjaByRZVJCpTIzcmcEd9/K3J1B30fUCMNVro+46CXLf2KvXEKpvO0f2ggCzy0c
         mqXtRx243sXFOZSO5JdDkrf96TwlUmBMpw4X+S6kfyC9SHTP6+Ts/6FUnF/DafdgS3l7
         r2KzNHVso6LkDi22sAJH8GxFmt26hHzgOKYkI0QbomwGNqSS0bjA8/75wgYlG8t8iiUx
         vs5ZKAw2zozkfrD0Z8bk8TvyPnGqnZGDm3cgUe5gihmblmJIRegtPMUd70PPNdSqceja
         d+tA==
X-Forwarded-Encrypted: i=1; AJvYcCWeBgNGQEpkrQ3NZAoP1au1Big5eMELR78Dj3ZyvDHnmGa0n63eiF2RT4+HACW/GVJlNoXtvoPCigE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwobWhBCGC+dg6gRwWWt1KOHbWHQCtP8VEA2ZWmgG00dv5AMsrA
	v3OKJgiBr24uT027/EPPmhIDCEkCfWIB/IWp0z15+DOSUGmZFCZG7Oan
X-Gm-Gg: AZuq6aL76uNhjD/BYl7rJ8TEISAicBNnadNWk6NB63yWGCFo6jo6IV70B9ACyDa3JfY
	3baNN2+8nwyhH3TaYxze1gL53TQdeS3QLczbufw/j+SvG0EHGrhmH7WokW7mohLHG5lt5xJ5o1d
	AXIwm+tZ1Isem8HcoSGJZRZ6x2KHAFbTbLEZTK5t333Kugjgo9UBSlioBWXZQMih4zzaEe86ZeN
	W1oehWy+9fqiWiRdliC5piS7u6jG+6nuTtWeWdTL2ZIxEnkHuQFQ4+67HM49gKSR6sjLbeW8FoI
	9DGyRXjNehQ+bBHaQ/RsdOIJafP4Izfq5xUAxUUssGQXHbJJQlv/yXc8W2tPQjzNjdFd74LYT6l
	5YNuMuHc6mLXMlPcE3JTHWxEJmmbAfDZFZCpuqWjD4OuzN/l2GR0D3YlScOjOZcIVtFt0s34WGG
	/7ZHxBeGFV2BkRyZkUePuVzxprWp8CRQXIhJhGR3S9
X-Received: by 2002:a05:6870:6489:b0:3e8:97ab:d06e with SMTP id 586e51a60fabf-4097fbae87amr1172996fac.9.1769671879913;
        Wed, 28 Jan 2026 23:31:19 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4095749f332sm3240441fac.11.2026.01.28.23.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 25/32] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Thu, 29 Jan 2026 00:29:11 -0700
Message-ID: <20260129072932.2190803-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.52.0

