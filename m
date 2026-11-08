Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115011;
	b=LLvFLhdwkf013xQp9CVIhqnqd7W0DluwPi3/8XqK/rA0WrpbxWhzwt2OgfSuSsqePMc1
	 idUXuCMStLk5PQFltG7yVapdcKWrNOiaB6XAaQAgqYKtPF7QKq88FWYHO8BDUN4UQe4bt
	 1X8E2IpQpG4sYNPcCiNDa6vSuMo9aNUc+jtJ5NwMCjtExPYJFrB6JM6o63dFxdY8jr4eF
	 HWb5zPeEWZ0UjiRVNZGNvWHoFOp0L1yl9vcTpm5dSpwItkDe8zJObWacmKP7lghsQEf21
	 /5ThwRYVUXr1/3du8wye4V+jRQVrgjMqHfplE6U6JlJ35Qwp5umfqhsAWDKfKRW/MGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
	b=zfhSWmsYSVaEcCHracGj02c3hFrdkGUWIMCZ/BvSTGlQdfmGNoLLeCJPM1qcO+TQ0I7t
	 MflLyy5pb9sGKGn2iPOHxVDHpuBQ5C69MG44XrZLCMDyjyP3sXl6iC2nAtAc0K6sKLk8g
	 UgztxLH3PWdf4O/9qnmP53bRAmMxxQmXyXowkq1dUiFrJDdyOl3nK8LamdhEq5hWzRRyk
	 OBpcQ1VY7jVjcZ6Yt2eM5e1vSw80QZyAhW88yZavZJGv4wMSw5miVCA80FAEHoB5DmO3T
	 HBE/ssiQzZX79Ldnz6DZEWiPgPOVBxroiXsU8h444FS8Gfk1qkJD1nGCH9/CjH1D1iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb85s2L9;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCB606A320
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 05:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95DCB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb85s2L9
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso52613c88.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 21:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115011; x=1794719811; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
        b=Wb85s2L93lXNh8yM+ewTjCs+5KD+kjdIsQep4yHiJE44bjAu+VWCX5noykz3Apyaya
         3RSjS1+bqBrMBqIUlRebJPSjwewEDhVPg/UxPMpJITGCGxxPsbyvnVmJSP7dWF//9Ugk
         1JGrMUeQaXo86W6FQGScSX1Fiy8wVaRaWRv1bH9+Gk0fqF63xUbkB2POcHshGOeM6cQc
         bxTM3GSoId408F7BX6Zfy4jbp55QRNnos5ZBOManQZ5xCcLMmqr240asiV5SJMlMFNXq
         iCRwWft3YhFr/TkCHzxaw47xvX7LBl26pOC83x6SZAhDpvF/07msbGVtaEfZxXeBLryz
         1GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115011; x=1794719811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NRKj6bOqQvpAl7mRq0D5pUwiApxRT0gl15oz7QQ4eDc=;
        b=E2v5gAGoHiOEE/GyNEPoNkyxNyiwBlP0MwGcNIBRBYukz6eUt6neXhKbPN8JLV1WOl
         +mpZlBkTuDWhKfJzfemDGFtP+lDJ4gUGt14RHh+NliazMrmBqqhzKMw/qlAWWyTUAz39
         oncjA7PFhPgDG8sFZh9sYw81llhEmL3vY+zIbE/vp4YWqOneWnIxFcBjKrs1GcO55AWm
         AEUiS6ZI3nT04UwSnnYF1jLQPXeTZ5v0U2qlzErI02vw/AeFWMkDEL9Y84EPKDHBcsc/
         9a8yIvvIJvzbRTme/+W93RvxU1Fv9Z7+pTQS6fGLrkgp7+D3gY0r766xGb126m2HXJ59
         L9uw==
X-Forwarded-Encrypted: i=1; AKwUvByZDd+kFJtnx6uJ1ucH7Wabm/VuFiIylMOWlF4wu9UDnnuxrKUX9cn3C3IIOE0JhZJJ7KBxLhnoqkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uwnQOyLJGvVLS/PxvneW+0rAz8ZJWyfOZxQYjB725WduPHaBB
	P27DdaHfxcMPZTfhrEGW8wA1/jTeVHlPYeFugadBTXFAWo4aLcXjCQPI
X-Gm-Gg: AYBFou1qobGBgxg3Kq4bap07+kz94YTzzj65yDm0htRNUocxwGbD+WsD9A5918HMOR9
	0E8n8xVwydekRtgog+4YY67bMR9EwGQry2Hq2KpEDLxPi5nqF12wztjnVPEHpsn/D11apZrajPb
	dXfiKBjSsbSIEGxfYW/c4cuu4+0g/iGjf44jhT2umFIuCxwG7eL5TWohIIGF4gbjIVbaasKrPJF
	lsHh+4xUyYURfRlptqprMCf8tFfp0ZqsIjTSeVHJf4WosPMGBQN5o/J/Z4da4+L6+YV5Z6OSLnR
	s+AO40gA8lBhsRKPyU4fSBsRxrEWLV/uKxcmZkB03pvf0tmze4ifx5hNG6Kb9BIR0egd4e+l+Gi
	/q3c7gusbg0XI5r8gFqwQ5pXAOyk/41QQeMd7ujTZOaRhM3T6z6Tf5tPiATiExJfi2vSLvxhTIM
	DpgMsOM8QqMDMrKLfv0iWE2uCs8ugX+ZzFVJ7mHv9Ma65P38Hrw1PBkr20ANcaoNhJNx/YxSsQl
	++XlVbisYA+QgjeJZu5AKw6ExfhbmpWT1Qu62y6hd1E1Ms2UKB/5Okbo/V6Xvz5ukFnADLONjku
	qvtGMpaUaGDgM5pP+lVF3H+sLw==
X-Received: by 2002:a05:701a:c919:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b39fe93a6cmr866284c88.16.1794115010609;
        Sat, 07 Nov 2026 21:16:50 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:50 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:24 +0900
Subject: [PATCH v2 2/6] drm/imagination: Stop locking reservations around
 map and unmap
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-pvr-vm-bind-v2-2-730103d2cc9a@gmail.com>
References: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
In-Reply-To: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

The GPUVA lists are now protected by gpuva.lock instead of the
reservations, so map and unmap no longer need to lock the reservations.
Nothing else on that path relies on them.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 44 ------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index d551d9a4ab4..12ebf0daf88 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -10,7 +10,6 @@
 #include "pvr_rogue_fwif.h"
 #include "pvr_rogue_heap_config.h"
 
-#include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_print.h>
@@ -684,16 +683,6 @@ void pvr_destroy_vm_contexts_for_file(struct pvr_file *pvr_file)
 	}
 }
 
-static int
-pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
-{
-	struct pvr_vm_bind_op *bind_op = vm_exec->extra.priv;
-	struct pvr_gem_object *pvr_obj = bind_op->pvr_obj;
-
-	/* Acquire lock on the GEM object being mapped/unmapped. */
-	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
-}
-
 /**
  * pvr_vm_map() - Map a section of physical memory into a section of
  * device-virtual memory.
@@ -721,15 +710,6 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	   u64 pvr_obj_offset, u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_map_init(&bind_op, vm_ctx, pvr_obj,
 					  pvr_obj_offset, device_addr,
@@ -741,15 +721,7 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	pvr_gem_object_get(pvr_obj);
 
 	mutex_lock(&vm_ctx->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
-
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
 
 	pvr_vm_bind_op_fini(&bind_op);
@@ -782,15 +754,6 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 			u64 device_addr, u64 size)
 {
 	struct pvr_vm_bind_op bind_op = {0};
-	struct drm_gpuvm_exec vm_exec = {
-		.vm = &vm_ctx->gpuvm_mgr,
-		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT |
-			 DRM_EXEC_IGNORE_DUPLICATES,
-		.extra = {
-			.fn = pvr_vm_lock_extra,
-			.priv = &bind_op,
-		},
-	};
 
 	int err = pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
 					    device_addr, size);
@@ -799,15 +762,8 @@ pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
 
 	pvr_gem_object_get(pvr_obj);
 
-	err = drm_gpuvm_exec_lock(&vm_exec);
-	if (err)
-		goto err_cleanup;
-
 	err = pvr_vm_bind_op_exec(&bind_op);
 
-	drm_gpuvm_exec_unlock(&vm_exec);
-
-err_cleanup:
 	pvr_vm_bind_op_fini(&bind_op);
 
 	return err;

-- 
2.43.0

