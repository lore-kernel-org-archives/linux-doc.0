Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503543;
	b=uh6TnRmfEEPfM/3L+WgQCidmMLVSo2xw6voGtON81yx6VFyN/aOtGSyhSo5jnoNx+8zw
	 ThdMSXyrNE5CNoaFyFBChTZM4NK02Fnxo3qRzwWF61W41ZIjyILlQTlKlex80JAJSV0wk
	 j1fzTYThDb3R9R5qtYA2gNQQ0yuGpPVpbYvvrPZS69+8+1wmJX1qvGCgIz5ihS7u1VkU4
	 iBw25dexz/eKpGAh606pLCcVmvH64/VvUqEGJGx1x8mopRvo6cHcjmonDstBxEwOiA1z3
	 fpwamcTOmEWXiFSXxus/W4wCODZtVLmZ2GbYNLwgaJyIs8H1gAa/fxf4JXkQuODPPdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
	b=shGf0VW3obJ3Va/8+zGhvzE3NMCJBHLu/QTEFm9akbEkztYF2TToATA0CLoym4KhBD7W
	 vT26+7YRcMWyMy4Bx9IQhmYT2aILPZdJfvCUiQgQAdv0jg6Rj4I0oVCOzHFSXnq9w1tZi
	 GabOSYM12iSmvd0nyjMDrOTjD+n58Y892vpTQbLs0HdMavdfTjaBo7nP7dtthQnBc4Rn5
	 YOI9q88b8Hi+60LDDGhrsaSF+UdZFaQi9WQ6Z90qNp/RB+ZZQ/aNsT9+muAFsj6AmmAah
	 ypDdvB4WTj4P6Zr/TjGgGxhIUAc5XXH6CDOyZYbEwOxncMKj1uuawL/akudd5Tiej7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=gnV7VT+V;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F4606A899
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 17:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE8F4606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=gnV7VT+V
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3249789a91.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503542; x=1795108342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
        b=gnV7VT+VVXt6AJyodyjy+I8CYfyUgmlvE4YxFvtWM3hSwXpwO/Bcg6yACfOT41bLsD
         pxDhRY+vh246IaV3eRfnA/VxL+/xDX3bOkwYQXdTOYWIB7T36NKup0Hf6TrVwrmaMCP6
         uR/7OpzA2w+I9UT2VxqMGODWVCTGyLFnNmTK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503542; x=1795108342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
        b=tHRHDlOtW/NR7QMxGQzX9w7X56P0ARHFUxvxdVICn6hnunNHA9pGyjXKm2RULd2VVI
         PRTGdgb/0r4+8CtS5a3eRP8TZVarK5NAcbAdwrN5DLH4gcgT4UM2jdanKxOZ1aWajhht
         kwFagW8EFgRbhSi7dGDvisMRHpu62/EW8WgkcqKH4StX2NxgJfwCHQB0Y4xCzlckoGdD
         ESM8OUi0T1sRiuitTdF4jGDi42ua/HacZwFOnPfTHNbaIm3m1214o00h7ckd/nNQQapq
         0x/Zji4ZE3jYYQuaQdeoyyXxp676krgjZdJh0jNb/7RZIk6ulwMp57C4gkUb+oH+/Vk8
         HJMw==
X-Forwarded-Encrypted: i=1; AL+hErE7EtmXLNemuDTxlJ+zI0OyvfGL1RyRFhPTAyCRjwZKe3FkrofC8i+eKi0bbyql6LOW28crccGtDXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sZ38d8t1oDaDeTtekj3YunzqYGwhVc7kSA6Ihk7XsOG1BTePf
	qrZJ2eycy30r49Ho0O0/NMHTO/SPjFmb50wimRP8a96yLG2/MCkt6MYvfAkcAo/AVvM=
X-Gm-Gg: AYBFou1nSJ1y7S8Sa3seETEOLiRZOP4b2NhIJrw12tvFEyVMYAH4/HVLXfJ5x/F+Dwf
	0y2xgRIRUIrC2LNAoN7mW0H1A8SvaJEgSMLVZO1BaTvMQlkG1iikBOblbLg5CBSTfbo7HiPuhx9
	ysr4CMLvEzQjQZg/HOVYvSp8aSj93ahWTHYkp5SV5l6ugRSi3FoQE6I6B1oqRaVggZTsm//WScc
	hrF2SORBv4LAm5Y4kkJkLU+DakDOMfquyvoVuSMWxB4njj9IysWXyVSrPr/CyBY5xs6txtHMB2B
	fV6Vx3S1PtNKz/Tdd/18GNwQ/eXrdGB+Vh3xfTXbQfIVcLCbGy6jvYVS/ZuGUnPaAw4qfmpfx9X
	nlajs1RZKAenQjCDGDrE9arEkeNVV5T6oqDuSquq8cg4/nUmCbnBCNeEmbMV0Xa5qp9OKXaf6GA
	7ggjLVFakqzPIxzD6xbcza/o8h+BdoLpTr2fSxOG1Cb6gau9dhSjnSnzyv8cQHxvquWCrCel+mi
	g/Uy60gGISNMFfIzUil1rSQEFOP/eLS+I7wT8uZQWuZ975rwshDM7hYZHmqsB+59UOcGPljK/Lq
	u5k3dYvKtBdC0S2hUzWtmW7j3FDgD+1HFaFk4pxQcj0Z9DcIarAhdwwpl8+uEZnXQQldVOslsq8
	JOf+rBrzqrIao
X-Received: by 2002:a17:90b:3e8e:b0:3ac:9d83:885e with SMTP id 98e67ed59e1d1-3b182f3e594mr7100466a91.52.1794503541921;
        Thu, 12 Nov 2026 09:12:21 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:21 -0800 (PST)
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
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 2/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 13 Nov 2026 02:11:44 +0900
Message-ID: <20261112171144.3151554-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
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
drm-engine-capacity-npu set to rdev->max_cores, the number of core
slots.

Document the keys in the rocket driver documentation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 Documentation/accel/rocket/index.rst  | 28 +++++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst |  1 +
 drivers/accel/rocket/rocket_drv.c     | 21 +++++++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
index 70f97bccf100..8ae785b65a53 100644
--- a/Documentation/accel/rocket/index.rst
+++ b/Documentation/accel/rocket/index.rst
@@ -17,3 +17,31 @@ project.
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
+number of cores. The time is summed over all cores and is accounted by the DRM
+GPU scheduler, from when a job is handed to a core until its fence signals.
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
index 5d7805c41dc3..351be60b1228 100644
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
@@ -139,7 +141,23 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
-DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	drm_printf(p, "drm-engine-npu:\t%llu ns\n",
+		   drm_sched_entity_get_runtime(&rocket_priv->sched_entity));
+	drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
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
@@ -150,6 +168,7 @@ static const struct drm_driver rocket_drm_driver = {
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
 	.gem_create_object	= rocket_gem_create_object,
+	.show_fdinfo		= rocket_show_fdinfo,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
-- 
2.53.0

