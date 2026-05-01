Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494437FF4C
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 23:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777679110; cv=none; b=C7MTSTNQGpq0MPqGHoUbqPQPoEDkzGYVLHzyFGyil//00KFrLaH72+kTuWKBlxqumeU/bIdaEmBqgGZb9O00qTBvnE0N7SpkZHyuH3KlWeDL244/gf1TQnWcdfso5CUN07jcgk4kJ/5CVhUQOBd9Hheo06Pu3hsOAEOdLw9TPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777679110; c=relaxed/simple;
	bh=jEByxMe9snhkQrbdmllNh1T51Z1nkOiwKTUY+XOqkqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+pBn+0w12q+wrvmnig/MMi+qhA9RHA3PmZnbOiruaT7amem64wP2+d4jzliNuZK3eSsmwjsFVxk0/j+CtvWN2Czl5XiU20bhFWCCELU5gs0HpANIVfWklg0gtldXAs4kGDvJTLROV8an77hpSRgsxLXuoEsgxyLv1/y9oMlDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlkcMAA0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlkcMAA0"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c797d5ad36bso819322a12.2
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 16:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777679108; x=1778283908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3HMy/5x+GTu/U/2MxeUBt4BoOwWC+Ga4gJ09h6qLJI=;
        b=hlkcMAA0ezh7QSvGT1oZCBbswKyuJI+QHIjybjRW2IU3YBusmHhkT1IyaKDiOug1AB
         i43SYqrr4j4waPmXkLZwjPpZCZ0dnE95s+N3EFr2tUkC041niW+j5ayL9mops3lLnMEq
         eWs7bM0YsZO/EiF+8Jr6J8SvX99+LAw8tmJfHq2FalmvcWjK0kZR/G8cpvdZLZtCXxZ0
         zQJn7khR9LJBFK5xhsgDaPnVXfX1k08BQfOTZV95DXCh9nuCGs+TjEL0pRcR1wWKu7Iq
         XPfqjJsATRxE7whqAGuxwdZVindezOw6oHWwJjiSPy+6TURo+JD7noUdlDfgwetMnn0h
         O2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777679108; x=1778283908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x3HMy/5x+GTu/U/2MxeUBt4BoOwWC+Ga4gJ09h6qLJI=;
        b=igdunC3rGARszRdiA0N40N0RlV/RFbAd9ekYyj7C1GGy+knfCaPAjnrLhlcgOJwdVU
         ons95KRYEqvPUb24FTkIU9wmo2tjv3tBxtW+8tkjGiMv2r/i10I58214sLEyrGQVkMWN
         Byt/emBYXy70tFYem21GL00j8rMVUlbjdXwMCDheCu9T8QXJu1ylqIvnhFrH6LUl5/aC
         bnkF0LClP2CbqPtlsrQUvRNInsFAFav/qC0sDk3BMpAr0Oipk21IdO0RAUi8oJBZiDf3
         0HDiOPDTP0jPViWX571U0GDPgFFJwsHLrF5kv8kx83kUzWoLDsfbzNEMOUKN2hxBPKZx
         coUg==
X-Forwarded-Encrypted: i=1; AFNElJ8IuHat+n7fXdjMew5zCp1Xb6fC3f5KLO0WX4E11zRr5YCKD5F1Z8zP1Iu99nopPxOysJVxnOIVI3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgrNJZubbw2twOD2BK8UMiiuYRtX1yjiJ55xI9iPNhIqeMZ/T
	jybBlRnUh6JuOixqnEMV0z5Cgzb2FUnYVoKktNy3BlFkFtArrlUlP1dB
X-Gm-Gg: AeBDievYB+OWBGpqKhm71riRCb2sYROTm6575LMEmTIPd7BNwzWAbldENqmecrnYHIX
	fuvDoARko+mc+j0fjyQieT9Pym75Z3Wc6KkPGS/Cz4WfboqqCuAdDTql7k+Jjk1m3Kq/Sl2aAsL
	1RWx/8fXdFvDV6FkoMstJ0bL0C1A1w53I1hO2lhOKFYg6t5BeXwJz2Nnxs+J6SAVuDrIPtR0WnJ
	7wdBhd3Als1Pn79R/BWTH7Pva/Fg3+3qKd9MpSocwv4vmrCOLOqRoXDwz4vhJjBmwZb65qj4BBB
	sD0fKL6pt3LwC986oTwJiEZvaulsqGVpSM7B72jA/V6JVrGqFMqDVG85Mb2tdBj/+XHrqUEGTgq
	/W4FqgH/qyrzEuMKzPHItTroRiK12cppUV07zUVct04NLTqwrk3TJrpKPmjLCVYn6nEBI7oGJx+
	cIFLlJTfjLpnfWNlknXiMSIBKb3iDPRw==
X-Received: by 2002:a05:6a00:4c1c:b0:82d:5da9:adbf with SMTP id d2e1a72fcca58-8352d2833ffmr978243b3a.41.1777679107458;
        Fri, 01 May 2026 16:45:07 -0700 (PDT)
Received: from localhost ([121.237.249.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b863eesm3448460b3a.60.2026.05.01.16.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 16:45:06 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Coiby Xu <coxu@redhat.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 8/9] crash_dump: Disallow configfs/crash_dm_crypt_key/reuse if CONFIG_CRASH_HOTPLUG enabled
Date: Sat,  2 May 2026 07:43:37 +0800
Message-ID: <20260501234342.2518281-9-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501234342.2518281-1-coiby.xu@gmail.com>
References: <20260501234342.2518281-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If CONFIG_CRASH_HOTPLUG is enabled, dm-crypt keys saved to reserved
memory will be took care of automatically. Thus it doesn't make sense
to use configfs/crash_dm_crypt_key/reuse. Reserving
image->dm_crypt_keys_addr is also unnecessary. Currently x86_64 and
ppc64le have implemented CONFIG_CRASH_HOTPLUG feature.

Also update the doc accordingly. Note two doc issues are fixed as well.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  9 ++++++---
 kernel/crash_dump_dm_crypt.c              | 14 +++++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7587caadbae1..73f2e9500c60 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -577,9 +577,10 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-    mkdir /sys/kernel/config/crash_dm_crypt_keys/7d26b7b4-e342-4d2d-b660-7426b0996720
+    VOL1_UUID=7d26b7b4-e342-4d2d-b660-7426b0996720
+    mkdir /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID
     # Add key #1's description
-    echo cryptsetup:7d26b7b4-e342-4d2d-b660-7426b0996720 > /sys/kernel/config/crash_dm_crypt_keys/description
+    echo cryptsetup:$VOL1_UUID > /sys/kernel/config/crash_dm_crypt_keys/$VOL1_UUID/description
 
     # how many keys do we have now?
     cat /sys/kernel/config/crash_dm_crypt_keys/count
@@ -593,7 +594,9 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
     # To support CPU/memory hot-plugging, reuse keys already saved to reserved
     # memory
-    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
+    # Note if CONFIG_CRASH_HOTPLUG is enabled, this API is totally unnecessary
+    # thus will be disabled.
+    echo true > /sys/kernel/config/crash_dm_crypt_keys/reuse
 
 2. Load the dump-capture kernel
 
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 36e51807d94f..7a7cae17f578 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -304,6 +304,11 @@ static ssize_t config_keys_reuse_store(struct config_item *item,
 	bool val;
 	int r;
 
+	if (IS_ENABLED(CONFIG_CRASH_HOTPLUG)) {
+		pr_info("CONFIG_CRASH_HOTPLUG already enabled");
+		return -EINVAL;
+	}
+
 	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
 		pr_info("dm-crypt keys haven't be saved to crash-reserved memory\n");
 		return -EINVAL;
@@ -486,15 +491,18 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 void kexec_file_post_load_cleanup_dm_crypt(struct kimage *image)
 {
 	/*
-	 * For CPU/memory hot-plugging, the kdump image will be reloaded. Prevent
-	 * keys_header from being cleaned up during unloading when
-	 * is_dm_key_reused=true
+	 * For CPU/memory hot-plugging without CONFIG_CRASH_HOTPLUG, the whole kdump
+	 * image will be reloaded. Prevent keys_header from being cleaned up during
+	 * unloading when is_dm_key_reused=true
 	 */
 	if (!is_dm_key_reused) {
 		kfree_sensitive(keys_header);
 		keys_header = NULL;
 	}
 
+	if (IS_ENABLED(CONFIG_CRASH_HOTPLUG))
+		image->dm_crypt_keys_addr = 0;
+
 	if (mutex_is_locked(&config_keys_subsys.su_mutex))
 		mutex_unlock(&config_keys_subsys.su_mutex);
 }
-- 
2.54.0

