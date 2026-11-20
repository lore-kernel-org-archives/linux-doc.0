Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795183978;
	b=Lz3n5MsIfJISiEKwoFI3kHCtN/uxpJAPN9bP01QLv6xsjbOM6xPGTCSh+KyZqu4vPUbo
	 0BScLlnFDOk9OTb06HOlkBtW12LxXU7Bb0FMU8KEB5Pivozg1SaPIgbcRyOj4yV1OFPLX
	 8/j29ejnYT5TFmeT4P+uJR7UdNiYbQIIEhdVIUqEBiwnuRGigl7AxRYKXY3mOCt2SBouh
	 +1xx1Z0ujkYb9mLCKR69WX/fxrzRYBRq2c2quM6NAgeEwe42XBBq6X7bM5IFN4KAYI589
	 ar1bHx1NZSzR8TmHMxPDmA3clO27Q6PDdO5JtW3EK5ty1BiVOSoGr7AGEq1q58+XDxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OcPIQ0d5qXJOh07IzuyFSR1AEkkv6LDZJPL7nbKJNWQ=;
	b=t3VyH/0id3nVQazeldJ33B4kDjxYUPfo8DL5bcYScWF3j8lkHQ6B3UTuvSj+57Zs0hpi
	 kDcFq/3lU1KUX4jcSkhcPTBXs96a/pJoDmNCHVmw9TTLlDOEHdaa4Qx/Dm7L9hdncT/ha
	 Oz9WPENO11vE/M49mTidwss6QSe7dv+J8jTDl+M83pRgRgLnjq6iEyw4TFUcZXiPLYmu0
	 gbdZQUzfs1ijmUPMwMyLA/eolKd4A34U4lLeuBDgBuGxqCWfRPxp+Ku62lloHs2DePiBK
	 6BrGJDaYnTGbLvssW/bCj8d01qKbaJZ8G7FLs1Kgsr2r4U4EI8TqdNolhbUhhVsuzgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aAjDCr53;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56F60A2600
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 14:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B56F60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=aAjDCr53
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38587f3de36so1060866eec.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795183978; x=1795788778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcPIQ0d5qXJOh07IzuyFSR1AEkkv6LDZJPL7nbKJNWQ=;
        b=aAjDCr53WlA6loYdEJok2twSX2/qFQ+YcmYkEMHbemSwlaj8Q13JRdq/SklCIima0g
         d2dhb+ugahafFf4YEbMCVUJHlo+GgVaecRLxPu37gRceG9F7T/DNKD3nNqJz4HyJl7To
         chyWOOzxCpvP0XBuKSUxmb9ryW1zQsKs2qJw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183978; x=1795788778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcPIQ0d5qXJOh07IzuyFSR1AEkkv6LDZJPL7nbKJNWQ=;
        b=tIuZpBtXkfnAen6eUKaes/tZLyIJsRkkdscUxhVPu6F962aadinNAd6f5i2GHRIOQ7
         IxsMTBMhGQSIUoKGCfUbtoUsA+gOg0pdvIGzESKjd/Tc9IzAM5jnaQG/j8CHjRuuHdLp
         bEhGiX0BMsuVyrzs2AG8p+afxNyi9i4EterhP8u+TFr0uEpDjigMCpDja1DhK5Z8aTAg
         dc5YhNR8hrljOaM1bSxhUmRBiUqX1VZngkBcBUe65zxLfITRC2+k9Zkehatjen+eYW9j
         UkvD79OtdYe51ZrnkUWaaWTjZqkSktMTHpSXFac7rgJsy+L0vJo0jybwi988i5CRog/+
         Iz3A==
X-Forwarded-Encrypted: i=1; AL+hErEFcrGBKqfihLVrBHoHLFTozmPEOiTQbcWGma4cXXRjvORUfJzQ9AUl6gdqGaF6SdUxXpItLxTd6+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pHAfWkqeuaH0XWoaSsXzqaxJcnIE6bKnUjx8OD5Ox5UiQT/aA
	DwC7RiNpf6YLs24AYG/BHPn/KXk4+eLjE3/8nORdqE+h0XDtjKsxRaaXkmEzuAay5sg=
X-Gm-Gg: AZFdTZeE159Nn2V2xwCONL+ENqts5GmsnatwqxLaj0WECfFJTLLVsnOJu2LP1wDgGix
	luH3WBCzclGBYqmkGnkBjCK/i/JUINXy88fWHSlbuLfQVF0EnIC0oeg67EMiS8kuUmDOVLMWqPh
	cK9YkvVzo5TBFIhLp+RJwA0iUEh5UumHg9bV54nSsjxFnjqO4Q8WBaAhSyTCjlqNGA1EsTPbSop
	nLiLN0NHkb7ltY5PzH1VRwxe7HJigUwSrt537DLf3xRc4NNIf3kV3fbPa7hqvZVMyLXNIbBh36/
	C+wM5e871SUTIhAnKJNsjx6k3tiI0yjEcb3Y3aCUX0Upl3muA+MRmR6xv6HTOTmQd5cTvpaHGBs
	EeuX0qXFx0krkwDZ2Uvti6/xHe1ndjFTe3tzziApXY8U5+em1ZOdkLai/j+XP2tQBb8FkxwTRBZ
	jsNsD8r2siTb+Z4PS2XTuMllAlYG1ztnIQIQ4TjZz8Auq2U+rkmJ8iGkZ6r9WlFgUpDs9Njkte0
	THQZnkRsT1U3O/juP1ODuvcbhttmFkkmEcTR0BPXER7abnBZBAqz9PG9lS76/xBG2mgY6silQdE
	cL9ib6wkXjA4YdOM70EJVLH/iH1JHR8ETNU8hBSLn9kAG3K19XRxlTu8zXpyR5oEDKJlil35h1V
	h5t0I63QABN+E
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2968011eec.36.1795183977458;
        Fri, 20 Nov 2026 06:12:57 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm11244434eec.5.2026.11.20.06.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:12:57 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 2/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 20 Nov 2026 23:12:25 +0900
Message-ID: <20261120141225.789350-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120141225.789350-1-sidong.yang@furiosa.ai>
References: <20261120141225.789350-1-sidong.yang@furiosa.ai>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no way to tell how much of the NPU a client uses. Implement the
DRM usage stats: report the runtime of the client's scheduler entity as
drm-engine-npu, along with drm_show_memory_stats() for the BOs.

The cores are identical, so they are reported as a single engine with
drm-engine-capacity-npu set to rdev->num_cores, the number of cores
bound to the driver.

Document the keys in the rocket driver documentation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 Documentation/accel/rocket/index.rst  | 29 +++++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst |  1 +
 drivers/accel/rocket/rocket_drv.c     | 25 ++++++++++++++++++++++-
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
index 70f97bccf100..d633502c8f15 100644
--- a/Documentation/accel/rocket/index.rst
+++ b/Documentation/accel/rocket/index.rst
@@ -17,3 +17,32 @@ project.
 Hardware currently supported:
 
 * RK3588
+
+.. _rocket-usage-stats:
+
+Rocket DRM client usage stats implementation
+============================================
+
+The accel/rocket driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+The NPU cores are reported as a single engine, npu, with a capacity equal to the
+number of cores bound to the driver. The time is summed over all cores and is
+accounted by the DRM GPU scheduler, from when a job is handed to a core until
+its fence signals.
+
+Example of the output showing the implemented key value pairs:
+
+::
+
+        pos:	0
+        flags:	02400002
+        mnt_id:	33
+        ino:	755
+        drm-driver:	rocket
+        drm-client-id:	263
+        drm-engine-npu:	2384122043 ns
+        drm-engine-capacity-npu:	3
+        drm-total-memory:	24216 KiB
+        drm-shared-memory:	0
+        drm-active-memory:	3000 KiB
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 70b7cfcc194f..288764730d23 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -218,3 +218,4 @@ Driver specific implementations
 * :ref:`panthor-usage-stats`
 * :ref:`xe-usage-stats`
 * :ref:`amdxdna-usage-stats`
+* :ref:`rocket-usage-stats`
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 5d7805c41dc3..b5fd800f500f 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -3,8 +3,10 @@
 
 #include <drm/drm_accel.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -139,7 +141,27 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
-DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+	unsigned int num_cores = rdev->num_cores;
+
+	drm_printf(p, "drm-engine-npu:\t%llu ns\n",
+		   drm_sched_entity_get_runtime_ns(&rocket_priv->sched_entity));
+
+	/* A capacity of zero is not allowed, skip it once all cores are gone. */
+	if (num_cores)
+		drm_printf(p, "drm-engine-capacity-npu:\t%u\n", num_cores);
+
+	drm_show_memory_stats(p, file);
+}
+
+static const struct file_operations rocket_accel_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_ACCEL_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /*
  * Rocket driver version:
@@ -150,6 +172,7 @@ static const struct drm_driver rocket_drm_driver = {
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
 	.gem_create_object	= rocket_gem_create_object,
+	.show_fdinfo		= rocket_show_fdinfo,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
-- 
2.53.0

