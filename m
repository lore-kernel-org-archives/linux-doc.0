Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792957664;
	b=UQqwhNxLg5sHIkUXqpsqo21l7ZA4lJpRJ9YRw/GJtKooS+s+tDANOHa/Tv1vYjdQxfDW
	 PFcgxP5Vb6x7zEYHVZwizqz2fEjXg3CG3XPAbE2A7dhrjlhATpmEoJNyYlMyxC6KwVJZi
	 tII7UmEjUV18i5OH5KlQTnRfqgkj8gN1HWvBl4520Uq0V/f5DGRWKsmoak72dwDDZK/Oe
	 TTsEio2+W/wj1c5ByxaPRR0SAp8rMPPG33V3eLL1kN0NyE4nQCh0q8YphWIKz3VhW1fCC
	 Oh/iNoCPtjADtoo3ia9bXA55L39vSP7/IptXrSCIT2sYdiyyJNnhsmZb40KQp403mcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792957664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fvXda2ntZpOoAr8wvRdn1LTGflX+1i5bW8ufU/JyDzc=;
	b=yOsawvlkZja9NQuV5pGrq7rV3dCxAaVtYrtt6jI7WJX9nOW2teTh083bCh8B3rrlI4uM
	 HPyXhkLQu/5Haq36do730uxC/g5UAFknuz++SI9Nur6SCySU//2+Ss2zn+I3Ijl7w8Qhh
	 sDnJImIbJP6opQ6XQIEbT22NnBoVqnG3vvqPK455pSZP7sw7buaseg9vi+K+TXwzBKy3p
	 OmGPzf4mSOgw+VAqfg/OBoQjZ3wFHZbY0SSuP+RldRWkOHEWIo2upWYR7MXwFtHvGMbq2
	 r5Yq/AEv1l3Uv34hOdik+NaSiabMoR23VWwxrwSrcGr5BufvL3nxIJa1IzzSm5/hOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+dzS+BX;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89412606A31A
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 19:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89412606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+dzS+BX
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6de1ca1b05aso1611933eaf.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792957662; x=1793562462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvXda2ntZpOoAr8wvRdn1LTGflX+1i5bW8ufU/JyDzc=;
        b=m+dzS+BXVio0FpJMCW2Gy5lRz8QcppEPhC76MdrY7pWS4s4CQUq1FQPL1YFzZ5nfNP
         jG8mI951Ic6kbg8O6GbpLq8V9LA49dwnm/t5zHkrvrlMMWdwhxpxmkG32jpMhpiYEb9M
         n8UHEh36CGuAfGS+HZaLqX+P/avhLihDsR4ezbDq0tXD92r8C1UHwxzFpOniL2P0X6dl
         Ak6tUE7hHV/BeJAAzfLxVlAmR9lP96cNVED5/exzHdKYaaV2bXHwFy1ukEBOCIAVCZuP
         4I1DUoW/pvpK5byFcRdFaXsFqjLOrUYOV2XDa16YS4vN6V0++axBvhRUsMM8IUZ2Jp+y
         Ktyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792957662; x=1793562462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvXda2ntZpOoAr8wvRdn1LTGflX+1i5bW8ufU/JyDzc=;
        b=KptWLimd4xh3SeqiJ2+p59ZFFU6m3gH17Ofg+6NxJZQXWg2qcDTOD6jc+SED35TR7i
         McMNm1Jyr595Dx4Ir/KAXXd4GgpQSq+oYIfGhNyPuorjcC2k7e3oX2FgzXFVOjg8Ag1M
         IAgb7mRwAcdW5V3d3OvRcLB3JjlDPv1UtsvOjJ4n5CmRVOrwTIxCh8t1Gsj4Dp7/0gxf
         1DJk+M/IqdNk64ukHYq7eadlwzX9jg6IBq9XxhEtWSr8ucE++86GFakPmKWIIH7/uV5V
         p4K6ThmNFt3EA0UDpMYetBvKy2BRv4M0PtcGN8+0So5jDdS9QioJKeLKh9cw5HfikQKB
         8/Xg==
X-Forwarded-Encrypted: i=1; AKwUvBx3KPs0z1ZsRaRvkjDG03ZdAXUYWUG7XEog3nl20/TY0su9szsR16eBJ8qHrqwjEQszcX/AMpcgwNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeaxeBMX/n0ljiGYhvNEuzacFZKjKjZYum4HlyVmzWXc9Ar86e
	Csp3TEYgQfzn9u9hj06J5fPFBnYqWdDteZtgzFliZLF/akIspUtoFoC1
X-Gm-Gg: AYBFou1K7cJduVC5QZB7OrXe5Djn9ySiFVxiQT1LnbzPYj7MGethy6hDGP+K6/IhED+
	zaLDzSDR5Frh18e1liFqXBY3iF97i/aG3ih4b7LKeKv9M753D6Xz4vASrC8QYe0XFKogcJdWR/T
	eNPkYmB2qCk3agPZoW2fUZlMJBKSLqTsrbqKUEynSLE7DcNNorPQpyeh8h5iJd6zNts4x7UFBLh
	ivL87imW2ROEBSfY0yv56Hpl5WAimGUOfoqIi6pk886AWn6zBD+9jz9wnRqH8tmY67LxQ/0OLBF
	I88vXvX4w1g/SYsTCznDEDqB49zqsWiM42UcixMpBxNii6UlhHlJzzpYOUArAZC/1zq4vxZZMFT
	tUkHZu3Rg6/Ng1DlBXZxZ41UfwGN8+GGh2GeBUVnyRajiM2lU76mO/AwfWqAd0F+WTRR1snkEJe
	BGYKqo4uuyd81hC6kqj1+8oMI9ClqWmpwwCKUpeF/VsYRyok86PbljqZn0e1WA5qLhYf8dasbVN
	ma5LLtqUgoMQOWBxGfidjvwOnGIZqDCI57KulkwByChb7W710/vLf27LXEVbdczfCrNbgJyr52D
	qN3z2Q6fV9KwjIu61nBLfdkQs8UsMLUtyjFj
X-Received: by 2002:a05:6820:a294:20b0:6c9:80d8:a1ea with SMTP id 006d021491bc7-70ba0e10437mr1759922eaf.39.1792957662485;
        Sun, 25 Oct 2026 12:47:42 -0700 (PDT)
Received: from localhost.localdomain ([72.12.197.23])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8430d8130sm2991167fac.5.2026.10.25.12.47.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 12:47:41 -0700 (PDT)
From: atipre <tipreaditya@gmail.com>
To: louis.chauvet@bootlin.com
Cc: tipreaditya@gmail.com,
	dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com,
	simona@ffwll.ch,
	melissa.srw@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vkms: Keep composition enabled for concurrent users
Date: Sun, 25 Oct 2026 15:47:27 -0400
Message-ID: <20261025194727.89093-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.50.1
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

CRC capture and writeback share composer_enabled. Cleaning up a writeback
clears this flag even when CRC capture is still active. The composer then
stops producing CRC samples while the CRC data file remains open. Cleanup
of a prepared but uncommitted writeback can also disable composition for
another user.

Replace the shared boolean with a user count protected by the output lock.
Hold one vblank reference for the combined lifetime of all composer users,
refunding redundant references when concurrent first users race. Track
whether each writeback job acquired a composer reference so its cleanup
only releases a reference it owns. Propagate CRC acquisition errors and
signal a failed writeback's own fence before cleaning up the unqueued job.
Read the user count under the output lock in the vblank callback and remove
the resolved documentation TODO.

A local IGT kms_writeback@writeback-preserves-crc regression times out
reading CRCs on the unmodified kernel and passes with this change on ARM64
QEMU with one and two CPUs. All four existing applicable writeback subtests
also pass; two unsupported XRGB2101010 subtests skip on both kernels.

Fixes: dbd9d80c1b2e ("drm/vkms: Add support for writeback")
Signed-off-by: atipre <tipreaditya@gmail.com>
---
IGT regression:
https://gist.github.com/atipre/36a712615c0300d5e09e11a3b5b83f29

Apply the linked patch to igt-gpu-tools, rebuild, then run:
  sudo IGT_FORCE_DRIVER=vkms ./build/tests/kms_writeback \
    --run-subtest writeback-preserves-crc

 Documentation/gpu/vkms.rst            |  5 ---
 drivers/gpu/drm/vkms/vkms_composer.c  | 47 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 +--
 drivers/gpu/drm/vkms/vkms_drv.h       |  9 ++---
 drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++--
 5 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6..fe7dc8def 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -246,11 +246,6 @@ module through configfs. Use/Test-cases:
 Writeback support
 -----------------
 
-- The writeback and CRC capture operations share the use of composer_enabled
-  boolean to ensure vblanks. Probably, when these operations work together,
-  composer_enabled needs to refcounting the composer state to proper work.
-  [Good to get started]
-
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a95..5860e86e6 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -711,19 +711,44 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+int vkms_composer_get(struct vkms_output *out)
 {
-	bool old_enabled;
+	bool already_enabled;
+	int ret;
 
-	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+	spin_lock_irq(&out->lock);
+	if (out->composer_users) {
+		out->composer_users++;
+		spin_unlock_irq(&out->lock);
+		return 0;
+	}
+	spin_unlock_irq(&out->lock);
+
+	ret = drm_crtc_vblank_get(&out->crtc);
+	if (ret)
+		return ret;
 
 	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
+	already_enabled = out->composer_users != 0;
+	out->composer_users++;
 	spin_unlock_irq(&out->lock);
 
-	if (old_enabled)
+	/* Another user may have enabled composition while we got vblank. */
+	if (already_enabled)
+		drm_crtc_vblank_put(&out->crtc);
+
+	return 0;
+}
+
+void vkms_composer_put(struct vkms_output *out)
+{
+	bool last_user;
+
+	spin_lock_irq(&out->lock);
+	last_user = --out->composer_users == 0;
+	spin_unlock_irq(&out->lock);
+
+	if (last_user)
 		drm_crtc_vblank_put(&out->crtc);
 }
 
@@ -734,8 +759,12 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	int ret = 0;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
+	if (ret)
+		return ret;
 
-	vkms_set_composer(out, enabled);
+	if (enabled)
+		return vkms_composer_get(out);
 
-	return ret;
+	vkms_composer_put(out);
+	return 0;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f4930..69ec6b14a 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -17,7 +17,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 {
 	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
 	struct vkms_crtc_state *state;
-	bool ret, fence_cookie;
+	bool ret, fence_cookie, composer_enabled;
 
 	fence_cookie = dma_fence_begin_signalling();
 
@@ -27,9 +27,10 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
+	composer_enabled = output->composer_users != 0;
 	spin_unlock(&output->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && composer_enabled) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 381483aa4..4919d8036 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -89,6 +89,7 @@ struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
 	pixel_write_t pixel_write;
+	bool composer_ref;
 };
 
 /**
@@ -210,8 +211,7 @@ struct vkms_crtc_state {
  *	       vblank timestamps
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
- * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
- *		      writeback)
+ * @composer_users: Protected by @lock, number of CRC capture and writeback users
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
@@ -222,7 +222,7 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-	bool composer_enabled;
+	unsigned int composer_users;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
@@ -317,7 +317,8 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+int vkms_composer_get(struct vkms_output *out);
+void vkms_composer_put(struct vkms_output *out);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index ecf29a2c0..584a71862 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <linux/dma-fence.h>
 #include <linux/iosys-map.h>
 
 #include <drm/drm_atomic.h>
@@ -118,7 +119,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkms_set_composer(vkms_output, false);
+	/* Prepared jobs can be cleaned up without ever being committed. */
+	if (vkmsjob->composer_ref)
+		vkms_composer_put(vkms_output);
 	kfree(vkmsjob);
 }
 
@@ -137,13 +140,25 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct vkms_writeback_job *active_wb;
 	struct vkms_frame_info *wb_frame_info;
 	u32 wb_format = fb->format->format;
+	int ret;
 
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(output, true);
-
 	active_wb = conn_state->writeback_job->priv;
+	ret = vkms_composer_get(output);
+	if (ret) {
+		struct drm_writeback_job *job = conn_state->writeback_job;
+
+		conn_state->writeback_job = NULL;
+		if (job->out_fence) {
+			dma_fence_set_error(job->out_fence, ret);
+			dma_fence_signal(job->out_fence);
+		}
+		drm_writeback_cleanup_job(job);
+		return;
+	}
+	active_wb->composer_ref = true;
 	wb_frame_info = &active_wb->wb_frame_info;
 
 	spin_lock_irq(&output->composer_lock);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.50.1 (Apple Git-155)

