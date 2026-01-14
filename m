Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D930648C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356021; cv=none; b=be41U/BXQyQqP68dpezXxu0OAAq12o1zKOyaRyEDguFn7RQ/hd5eQZY8Mupi9JbMNqhN+ijNeupmXikdzKoO8mYFwx3J/U0h+n5MtJ4+af8JuqDKFfJjYpb2XZKQnCoGSpxXcqa7ppgQsCs865SoN+YVUFgTyJP9bt3PTnZ+E0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356021; c=relaxed/simple;
	bh=ZBKwFw/eHYoONtVKVezRTboDnUoeSjSt8KmXn5wFi9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ug5JiU1Ia2dcN54Bv7T3VmaTkBI7BgOSf5Zam6yOeataoYireOdW4vc4OpzxJPbLLRHN2BDOvcJwc/F/M/qAljLWZ+PfV5j8wktQlbQ6jai7n0fnvEsuDEoA9ioHM9e1jvS2Qh4HidaodVZLDvEx+VFBHK0hDGaMHpZ+GrXrGU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRAPh4Po; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRAPh4Po"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c75a5cb752so6116006a34.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356019; x=1768960819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=iRAPh4Pou+oGtrI/Vh34ynSK+YgwQbgzGH9FmAcWGGdbuGlpQNdCMpt2TqoU4O7A9z
         m0TZ6a96gYM/dY86C/pokSKVIl4U29pVaGo+XScYYTqgX9xPH7ag+9aRBTcVsq65rNSn
         PclwQIKbibITl52zdDRmDdwCB8JJQ1YfuZr4m63amFJ2200QjgOWHEygd3u4gZDbA6PE
         IUaGHsckD71NusaE5+PPsEj91LnL6bP95cMYggUWsx6EFdXIdkjhk2Mg/lQXwcH3Incu
         eTiIj4EG+jGmVNB4tBMDLYMjLXDU0mIFgm+44jd6Yvc7D67GXqF+GjF2an5384PeMMaa
         76oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356019; x=1768960819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
        b=nO0DHrn8uezfgyF/Ds+Fquo+iXcHYrqxnC4iW+Ov/l2r+GAyIGcYcCOlXCkJsu38J2
         4UXqkZl4bsLiOv88Pt4P6IXAQjeWfOTesA/kmmmVE1tgv2AzxfswT8YPdSS9zqGmSUtC
         NGqUG/Y6ow7JW2oI3p4JSCV+Byxxc1UEBT58MnfRTkFEwVhMiWJn9TfLgOaNLY2Iqm1m
         SU+1pWnWqLu44HZnmWZzhI+1VS6OQKAzMRLP/k1cQKX44K3O4dScpEukHS6uAOTbu+4x
         0hkTZ7rr+PQfhotx2CuqJUbdHFFERiP/EwkjtsYdjkmEsWdGcXzKgPJzb8Fz39HI4XE4
         Ooiw==
X-Forwarded-Encrypted: i=1; AJvYcCUkVzOofWK6lh74OJRGgI5fSYxoSsNzRg+CQKC5qceeSqyoMk+BRpFXmv0Zj9rJeFVgp5FEC3GNLHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9yBX40JK/PNjr5hdCIskH31bppmTk1IrROvo9LdP9y34v6lC
	eAQ3LWvZOKSmN1FiLwomrV4FMtYQgPxDl3lhecp4jmI/4yubQOLrbXPm
X-Gm-Gg: AY/fxX68GasOQNf//yKojSPAmozAyK5/W8qbJaFqUpLKWPm2TlLJGgjPV0kpZkcWNf3
	hHw3u013L0bSWnV2FV5EwxZJ0AgdszlESz++yvso/OuIcTpMK0V1qH5PW/t0AbjiD0Ebt84RYw9
	VXTiQK/UmjuOVyAR8zpkIAFezU7/vtkq7cEFzgofDcmrMF1UH1xtGkcCamwxxVWQ7olFGVSEXvW
	YF7OcFGPkd2m+XQnNMWeuCDOjWieK0mcHRGTX5fDJIuqBqIzoO++1bHLAI4Ao20yk0ToXRGQ0aC
	FTuXAyAuYA1hJLZsQtFTJoFfnKA2V8e9eFpWQJEGuwQYHwAap5pxiYapD5LCryfrGK2f89kmALK
	Cv0WCtoKgZw88gYhQ5jR9NKS+DbM6iwiDkx1t8GcbMXem3VU2gP2r4SUNVuz8u+bLfKdVOf4KhY
	6GXP504wRFgJOtkA6P/kNIeU3Oiv48ebe/cicJ
X-Received: by 2002:a05:6830:449f:b0:7c7:2cd3:5baa with SMTP id 46e09a7af769-7cfc8bab822mr907389a34.34.1768356019220;
        Tue, 13 Jan 2026 18:00:19 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7cfc9894ae0sm731526a34.25.2026.01.13.18.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:18 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
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
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 24/31] dyndbg-test: change do_prints testpoint to accept a loopct
Date: Tue, 13 Jan 2026 18:57:40 -0700
Message-ID: <20260114015815.1565725-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

