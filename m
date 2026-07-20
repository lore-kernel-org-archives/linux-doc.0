Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B94779B3
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784570068; cv=none; b=AbgR+ybQXabQhpK5/LIFBTu2HGvGv9g9JDz1HRY4YFuSh7t1v2A3XWhgnEdM8XA6Lf1L6oIuxkyC4tvqXCrudCVeJSXYtaYCOplPuzRvZKkOJ5wXFnlT4z4DmXt7RmMD1eamONh6W+Es4sjyVYciRFrvEPbktDiCyH3mUpbHyAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784570068; c=relaxed/simple;
	bh=8PnWAwaPwirmO4GgL7LEGlIqHi6SyKLQQ7uw3JXA7yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4/3khwte8p+N+iOgbLBMpfvRaJb86A1PPAvFw4yYz5G/CI50PmQK2hBoAU7Te5Oxcet0op48/FoSRGJC4LEfhgsA81NbSSyFKjBRnFCL4aNFg65JLMRGz5+wshmgebLQFtZChOTk0kR054eKWPoDWyFMoZKzpkihGcwI9vLJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyIqqgSr; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyIqqgSr"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6500844a91.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 10:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784570059; x=1785174859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzAJq7vlEZOu57+6zY6rNgf3B6FzEOANzSndOpxDhqo=;
        b=HyIqqgSrmaPkAM/HeyiCHpeJsgqnMgCvDzj/c26lbx8Bf4EF2ADU1pa7Brv2lHItTN
         TvOjdPH/UMtVIv2J5N+WpUztdToTAxAtb0amKdMbL4mP4rnWYBLbhSFxlyNMC1eOmYnU
         RwUqYRWg1x3/yDdX+mLGdpAqag+ZIOwwBXiP/YBaJyordQfUaKXgwGn5+RIacZVT1t9k
         u1gIG6NP0dz597//asX4gYY6kyYp672ifYPasSL5Tq/r0jiOKH4fjStVM31atIcHGPKN
         Ug40fU4GzuZ73s8S2fwOjThelElhstrfb8T9611EO2yP12rxUP3QUbge5l7c9rBNNaAy
         Fo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784570059; x=1785174859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzAJq7vlEZOu57+6zY6rNgf3B6FzEOANzSndOpxDhqo=;
        b=QC1sozgreXLcthbQ+0p2il5ka0ddSzyQXKa5O7yhmzoNPkLwBCTvmCvM6tBxuqRm5+
         eM00WwuEo+SsshNwNR6KDNd351/JVWAvvSvvZAo4fHKEI1K+AfmI5KOPc+WqWkf/WfId
         GYSgNoKT40lz1xQpTrVeFHOwn7+Lkx7W2jrjFZ4Pe3uwCYYxGFYDNOEBRbRk0/QPvePd
         V0f2oiL4xMShG+jLLNwmhVQCsP6lg6p7eT2RAyrurY8phFpJ8kjG/4NrUZXSynLKk7xW
         Ynh6IhuH/JhAFofnrnIz0nP1CSpkB4wAmM9J/oOdMIxH76D1etuDEZ2JTtGILvlVFmNx
         UZQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7B0XpqRrFHveNNb6pIkvTiaUQZM8sayxSWYAzGzP1KUqzdLamauNG7aDvZMT06PzDz/7yWfXoY7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3/bdeotjytlzC/b50/IjEeBXyWn7bU06bnHWmM6MmhVOFrCvX
	B+uy4lu7G4y0jzPVs3gh2V7kL0dlzjHvZU0XJsDEbQntnfXXCqj2OAi9PV8+n89GYBIwQw==
X-Gm-Gg: AR+sD11GUPZRP5tWTPBpBrT18u/1XwlcXYWOaT+G+cgVUIh9EimxSjpvwtnfFIy+uW/
	E0XC5U2E/s5d1gSHhEg7ngxvwS34fY+YZcQv6OWURAsE42EkQLCzI168BTJsZxFUj7z2lQLzY4V
	ZuqZIpl6a8l1jP3jKaXGdRp/qpoKM6m+ktMfDMaUF1Vvuj++F1JwGdd02zK+Oc4j790lAOC3t+v
	SeMWOTzzsAGUTf1b73kUiUhykwcgpDOWVMEoVFMloiMjsSbhMJPn5q/ISFWnhAHgZVjVAXWlIBo
	z/sStUlY32oMMegAJECphAZtqa4zCf11I/y2H0CBeuW9m90d6mD14b74k5KxYjrqDT9IDF/iK7q
	izKDm7fsGU7Ll3QvFQSYylyBkD3yG+byjXevs4es49iaBR9Y0xhZ91+kRtrxmxvyyrhYhmkE0
X-Received: by 2002:a17:90b:5588:b0:38d:a150:ee04 with SMTP id 98e67ed59e1d1-38e4b55aabfmr15311812a91.30.1784570058844;
        Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm33370583c88.15.2026.07.20.10.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:54:18 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 1/2] docs: ntsync: align ioctl names and struct layouts with uapi
Date: Mon, 20 Jul 2026 14:54:01 -0300
Message-ID: <20260720175402.44338-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720175402.44338-1-ivanrwcm25@gmail.com>
References: <20260720175402.44338-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The uAPI documentation used outdated or conceptual ioctl macro names
and listed ntsync_event_args / ntsync_wait_args fields in the wrong
order. Match include/uapi/linux/ntsync.h and note that absolute
MONOTONIC timeouts are interpreted in the caller's time namespace.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/ntsync.rst | 33 +++++++++++++-------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/Documentation/userspace-api/ntsync.rst b/Documentation/userspace-api/ntsync.rst
index 25e7c4aef968..a778016feb87 100644
--- a/Documentation/userspace-api/ntsync.rst
+++ b/Documentation/userspace-api/ntsync.rst
@@ -83,18 +83,18 @@ structures used in ioctl calls::
    };
 
    struct ntsync_event_args {
-   	__u32 signaled;
    	__u32 manual;
+   	__u32 signaled;
    };
 
    struct ntsync_wait_args {
    	__u64 timeout;
    	__u64 objs;
    	__u32 count;
-   	__u32 owner;
    	__u32 index;
-   	__u32 alert;
    	__u32 flags;
+   	__u32 owner;
+   	__u32 alert;
    	__u32 pad;
    };
 
@@ -152,7 +152,7 @@ The ioctls on the device file are as follows:
 
 The ioctls on the individual objects are as follows:
 
-.. c:macro:: NTSYNC_IOC_SEM_POST
+.. c:macro:: NTSYNC_IOC_SEM_RELEASE
 
   Post to a semaphore object. Takes a pointer to a 32-bit integer,
   which on input holds the count to be added to the semaphore, and on
@@ -186,7 +186,7 @@ The ioctls on the individual objects are as follows:
   unowned and signaled, and eligible threads waiting on it will be
   woken as appropriate.
 
-.. c:macro:: NTSYNC_IOC_SET_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_SET
 
   Signal an event object. Takes a pointer to a 32-bit integer, which on
   output contains the previous state of the event.
@@ -194,12 +194,12 @@ The ioctls on the individual objects are as follows:
   Eligible threads will be woken, and auto-reset events will be
   designaled appropriately.
 
-.. c:macro:: NTSYNC_IOC_RESET_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_RESET
 
   Designal an event object. Takes a pointer to a 32-bit integer, which
   on output contains the previous state of the event.
 
-.. c:macro:: NTSYNC_IOC_PULSE_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_PULSE
 
   Wake threads waiting on an event object while leaving it in an
   unsignaled state. Takes a pointer to a 32-bit integer, which on
@@ -213,7 +213,7 @@ The ioctls on the individual objects are as follows:
   afterwards, and a simultaneous read operation will always report the
   event as unsignaled.
 
-.. c:macro:: NTSYNC_IOC_READ_SEM
+.. c:macro:: NTSYNC_IOC_SEM_READ
 
   Read the current state of a semaphore object. Takes a pointer to
   struct :c:type:`ntsync_sem_args`, which is used as follows:
@@ -225,7 +225,7 @@ The ioctls on the individual objects are as follows:
      * - ``max``
        - On output, contains the maximum count of the semaphore.
 
-.. c:macro:: NTSYNC_IOC_READ_MUTEX
+.. c:macro:: NTSYNC_IOC_MUTEX_READ
 
   Read the current state of a mutex object. Takes a pointer to struct
   :c:type:`ntsync_mutex_args`, which is used as follows:
@@ -242,7 +242,7 @@ The ioctls on the individual objects are as follows:
   ``EOWNERDEAD``. In this case, ``count`` and ``owner`` are set to
   zero.
 
-.. c:macro:: NTSYNC_IOC_READ_EVENT
+.. c:macro:: NTSYNC_IOC_EVENT_READ
 
   Read the current state of an event object. Takes a pointer to struct
   :c:type:`ntsync_event_args`, which is used as follows:
@@ -255,7 +255,7 @@ The ioctls on the individual objects are as follows:
        - On output, contains 1 if the event is a manual-reset event,
          and 0 otherwise.
 
-.. c:macro:: NTSYNC_IOC_KILL_OWNER
+.. c:macro:: NTSYNC_IOC_MUTEX_KILL
 
   Mark a mutex as unowned and abandoned if it is owned by the given
   owner. Takes an input-only pointer to a 32-bit integer denoting the
@@ -276,11 +276,12 @@ The ioctls on the individual objects are as follows:
      * - ``timeout``
        - Absolute timeout in nanoseconds. If ``NTSYNC_WAIT_REALTIME``
          is set, the timeout is measured against the REALTIME clock;
-         otherwise it is measured against the MONOTONIC clock. If the
-         timeout is equal to or earlier than the current time, the
-         function returns immediately without sleeping. If ``timeout``
-         is U64_MAX, the function will sleep until an object is
-         signaled, and will not fail with ``ETIMEDOUT``.
+         otherwise it is measured against the MONOTONIC clock in the
+         caller's time namespace. If the timeout is equal to or earlier
+         than the current time, the function returns immediately
+         without sleeping. If ``timeout`` is U64_MAX, the function will
+         sleep until an object is signaled, and will not fail with
+         ``ETIMEDOUT``.
      * - ``objs``
        - Pointer to an array of ``count`` file descriptors
          (specified as an integer so that the structure has the same
-- 
2.43.0

