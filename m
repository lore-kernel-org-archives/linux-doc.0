Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75854F4756
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 17:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455223; cv=none; b=tnMBQmneJLKybRh2hUXMPbqF+ILYTT/pPg+GtgqXZujTTOElQKOHs/SPZmNyyteUNPP4AeFVjhz8bBhJYTvCimT1wjGodugf5Neu7ADdTMOtqSK39T1fBctxETJ3wOtz+U+KxqyPDJylL0n4DmMgmfHg0o2i/KnnXWpC4qnoigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455223; c=relaxed/simple;
	bh=mwjS1qJDm5Rrnz3Is+AgPi54s75JfFcvKNHxNEqcXXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NU6hZ8yxKlHpqkpI7CXDYnysHZOoUEDJQHC/7EpHM0jfYqmQcl5ybhQUVShYXPk94Zn9jFHxv4SlpUn6GrnqmrxtXurMvdGezaFRLdDHMfb4HNV5wySCyDRdrc+7qzSsn58sOq3vB4/1p3SPm+qH6yVUQDI33wPmWORwLsraidA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4eojBLh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4eojBLh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39927410578so22866a91.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Sep 2026 10:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455221; x=1789060021; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDFcBw+OAGvI9CgN/45/xQaVNM9WgzSnrhfaFNWW050=;
        b=k4eojBLhh+pbneNtBGsvjINgJp/GGm+GRtPPj6E5JXAqLRTjsajzF16jLY/3n5oMlH
         9f+GmCAyp5cHVdHNwL4+oDqb1BIvjQQUqqmMlEAoijTZ2z7Kq9usrkS3Q31TxgJ8INbX
         2rjBt/e6v/0Rr3H+iaernpGme761x2ORJ3zmPaaRvSty72me0HF9QjBrKkj5EyF6MM35
         TNCE+b5FaxBpTFnEcqXcoIm3J2xbqeANKfzAZu6nqhGAOTX/2ia58GULRGugsTlRqDJq
         dgc9/EXhByAcN8UuzFElV83wb2n+kPT0CSb7cH/iHQIEbjEyO4dIFDQyLopuhrqR8JEe
         Z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455221; x=1789060021;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FDFcBw+OAGvI9CgN/45/xQaVNM9WgzSnrhfaFNWW050=;
        b=rebnbK+FEzcfu0E+LARlqktafJqMegGZ3s4HGr0tAzpKlDCrXrxx6g26ttUdoNvAZ0
         yzSQgANw4tLSowApQv07WlR8yYVxI9/KWZEDQNlJ9Wy1rIM0QO6vZ6uRqxnPZgvC0lYR
         yG8NjzkMVPbiiGVeBeZpL+fY2j2nujP8mvRCUeaYICmnRl/2d6A+oeMV13lHuEAz1k2K
         fR5E/CkcuzXc7WwW9YcySt5P4f64rkbM3trOmW6J1rbnH8IHdpi79BxMbx3fz0u2MwaM
         VSuFj7C/d1tQKOAxJ9zLpyBzhRQv2+lmb/6WHJsztJD0WfWpoAsrJZznN9iOz0PvgLk7
         3Efg==
X-Forwarded-Encrypted: i=1; AKwUvBzJzF38bOzg85pANGLsyAo2/AzQuhUlK/8gUc5HlVvl3QQS/J22RfgNlU8TzMpl19FnY/6PjAQ1Wsk=@vger.kernel.org
X-Gm-Message-State: AFuF++lydd1X416Nls3cE0VuhvEoV7DQakzGI/6A/yg1tnD3A1NPJoIr
	hCcZbhDvBe1o0SC4Rt8Ru1csBhPRLeV0K1fE+rqsB8DKvUtd5YaO1lcnTpj25Q==
X-Gm-Gg: AYBFou36l34/CF71eI6Hg9Dd/xGXXbuypugCuuBhzm7EuX3bUWexclOolhbmqLdE/lO
	RbGbLhsfPhSJ70p4LpcSdK+86PMrBFeOy+dkTjUGQgmNzebxvhP+c+cqZMIJ7n76dHBKoWu//un
	v3F5tem/bLKx0cCZ2H/DbGpDJUEt0jjPGqfdHud4ulAEbK1+aKF+lpiPhf9fM5De1pEgQUmH7rv
	EILLGXjo2fhUB/r9czMCcdgaLtlgdcBv/wAcgL3CBPwh6mSJHcHtqlyNgW5vOAn7MK12L5XmUnl
	BlhEN/a6KefMvqOUOZ965ZzNKoI3qeEo8DUjHw9mBbE+bSqPup68uNB9kkbxRRJgOB8pmk7it0s
	X9OtNZ9zv8R3pEgQIb7og54EvBBfUA5tWnYsPHvUZEmTdz6kGXoQcmHyZINEiCPTZ7kzCY/6Eoy
	kd146uweZ5N2ZVHfTs8dncyLwm2CzIio1jJfqXBWk6uuJzLkTexuRZ78XWKC7ZsbOZ+A==
X-Received: by 2002:a17:90b:4407:b0:398:9bd4:d13 with SMTP id 98e67ed59e1d1-39aee219427mr20003360a91.18.1788455221096;
        Thu, 03 Sep 2026 10:07:01 -0700 (PDT)
Received: from [100.87.176.22] ([112.133.220.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm891560c88.5.2026.09.03.10.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:07:00 -0700 (PDT)
From: Hardik Kumar <hardikxk@gmail.com>
Date: Thu, 03 Sep 2026 22:34:38 +0530
Subject: [PATCH] Documentation/gpu: Fix spelling mistakes in todo gpu doc
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-docs-gpu-todo-v1-1-be712c8f67a0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNj3ZT85GLd9IJS3ZL8lHxdY0NDQ7NkMxNTC3MTJaCegqLUtMwKsHn
 RsbW1AK0AuWhfAAAA
X-Change-ID: 20260903-docs-gpu-todo-31116c645874
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hardik Kumar <hardikxk@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788455216; l=2678;
 i=hardikxk@gmail.com; s=20260827; h=from:subject:message-id;
 bh=mwjS1qJDm5Rrnz3Is+AgPi54s75JfFcvKNHxNEqcXXI=;
 b=5IWOsWt9xiohCr8FqZ9h6JG87i/4Ds/tmjR+ndAiXtH1mAt27ALWop+qT8AA+3ER/f4AdBiOL
 nkusp+c/CarBjOJZhGw4YlrhF9zBSwGWupOkbvtDzFtfSi9Mt8D2CmW
X-Developer-Key: i=hardikxk@gmail.com; a=ed25519;
 pk=56yFuFlLHAdRemUZghoGHVCijEX767atrut3dPD0thQ=

Fix some obvious typos in the todo.rst doc.

Correct spellings of incorrect words.
Fix an article usage.

Signed-off-by: Hardik Kumar <hardikxk@gmail.com>
---
 Documentation/gpu/todo.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590..187932554 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -277,8 +277,8 @@ Various hold-ups:
 - Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
   valid formats for atomic drivers.
 
-- Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+- Many drivers subclass drm_framebuffer, we'd need an embedding compatible
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -303,7 +303,7 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
   require a struct page.  uff. These should all work on plain ptes, they don't
   actually require a struct page.
@@ -465,7 +465,7 @@ be turned into a WARN_ON() or somehow made louder.
 At the moment, we expect that we may still encounter the warnings in the
 drm_panel core when using panel-simple and panel-edp. Since those panel
 drivers are used with a lot of different DRM modeset drivers they still
-make an extra effort to disable/unprepare the panel themsevles at shutdown
+make an extra effort to disable/unprepare the panel themselves at shutdown
 time. Specifically we could still encounter those warnings if the panel
 driver gets shutdown() _before_ the DRM modeset driver and the DRM modeset
 driver properly calls drm_atomic_helper_shutdown() in its own shutdown()
@@ -891,7 +891,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.

---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260903-docs-gpu-todo-31116c645874

Best regards,
-- 
Hardik Kumar <hardikxk@gmail.com>

