Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1EA24DD17
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850245; cv=none; b=gFeJg4jkfQWcQOZAxcily2tErGRu57uT4YxOFGxEZtTpg3PGLpDAhS0ux6EfbqI2ig+SXgZ7oOeLnZd/8c+Od8aXd3exqcaE8L/e0K67B2d3abBk4imqmmY8HIWe6WrKR1P2rtCg6/Mf9CYhfgUTlak/+AQvpApCu+n1EuEbqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850245; c=relaxed/simple;
	bh=yqW0eNnuY6iaIAb81qp9+q3ixuk1RWq84gZvp3pOj+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MavMHovyjP0tO0LB4vq6MI27SeBxsP95zP3YNILG8VJjmn3+snpK63clvhhW29SCscFjsLyCtCfZFftoZGJvjOO2qnjHyav/zF249sA3dvpFC+5/qD4EpyaTjUX0PknGYgRL8Mg7RT3izgR4ktb5IHvssj4ynUGw0amxZyTMiGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ahw62As7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ahw62As7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-78a76afeff6so32529857b3.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850242; x=1764455042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5KiW0twGUwiDqt6nePE1kGiL7dytg0Q0KVXgthRcks=;
        b=ahw62As7z5Pp8+KVpJHLR9K98pdIlj4hIScu5BSMiqHYogLBwdt0Z3cU0D8d6e4cQt
         KEdBqtYBy+hQMXiTLQf73825DkW9KUJlGFg5wrca2+TTLZI1Ur4KXZqPrj5A1aLjpM3v
         w3L1ODvFkjxH01tstd9dWyuBICRTf96ckT7HYnN7rCREQ5ruCucOR91nlwm7W0CGPePH
         yoQmUtOBjgdVuBMaCbFfF4thHh/bOOVJImlmIY2YqT0YGOqj2UzZ2AZpVIixd38MOMNp
         UVM5X1Dlvuxe3qHPkEuvpKUCjkPTOehJIUCBlwzitQsR1h2Q4l7ayDq+dCI99jJVKS0t
         +7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850242; x=1764455042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5KiW0twGUwiDqt6nePE1kGiL7dytg0Q0KVXgthRcks=;
        b=PP/OhPQgNAtRlDPR3bvKGyefLinulfQ1YoUrfiwS+xQMCj7AJ3Ubw9fB/fzfTiZxmN
         O4ocKRVyC0wQ+KZWJiZ5fdpVwm6rcWHbJSyXhOtfvV/UQYKcQ4kjr6VDUaf7wOPbOI7O
         oEMmd5OQCUE88PaDl7xjAwZJ688OOSLX6gTCIfTqdNQGpdl/gkaAgEWHYkNIOgOJXojB
         Fsrcny4FOnXDD2JfjPsjbimWQLyZ3uLQ4NsaPO/ZmR66dv/PVR0qgghzRtIaD6AuWOuk
         xqidQrrykXN20Sz3jSbre0ffut1wePxRwAFL/8JS7GS7DSvW9gx2u1t4KMNch7abHnfb
         E3Jw==
X-Forwarded-Encrypted: i=1; AJvYcCX60wYDRxuUVhKxiXgetEJI9CsACZP/sLOhr5cWRhwEY0COp74L9NKxb6ANow7UBOyOmkMMxIWJWb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuRGQqGFiXudK5FQnp0VryskyP8+U7vSHJOg43iw5kx3SyaBJ
	/1B1drAcufbwsEMAw+UmuynVvmX++OaarjfxH6VCb5doZ4TpOtHa4Xi3Ly5rubCbR20=
X-Gm-Gg: ASbGnctW5z5UfbLbGrKalGRa88BUebhb98At3KafzmjKp+Gfh9xpesdORl+yCpyU7yx
	pJga65zwf5XorumMmJ9G2RVgOlEg8esuEAHRcj7O2KUDB+bvvJz+0xlFh4QB5LRV9KAlZuG1w/o
	7UwwSQ7jS1itnzry0CWPqFI57LlK5URKtE0O5lEc4F27hEBs1tf3p68bRwgRmHyXxSmhhsDG1dO
	cqTKnzcBwSBqWnPdttpbAy/09ElRVO0W5t64OSzdKB/5DYvSGXb0f+ubxvVWji0TBwh12134Bvu
	G5ZzgQ84XVKRGmuUt3Xf7YLdpfBkDIG+YPR4+Xv7BGpR7tL5iugpQy6w/KX0WfG6A0r3LgLPnGv
	lsxaujczYtMwhUVzSSFEDtTw2uzrkHqh5O7W3fdfhr0F+ODHq1lDI8D31e+IeEKhpwom5+a3ibH
	/ohyQqcI8BGnr0FySZodjQ08u+NFfj+g/6LUIoGi8ITODsykbUBdteD4BhlZT1k6K89lwelAqvy
	AuTO4s=
X-Google-Smtp-Source: AGHT+IHuoY23QTvRNhRkhmDmGHRrDBpwbesFLAGgRZdemrA8LoJ/P/EIeiLQ/hTmePkctRQeLMtVhA==
X-Received: by 2002:a05:690e:130d:b0:63f:abf6:1c9 with SMTP id 956f58d0204a3-64302a4b3fdmr5160190d50.25.1763850242430;
        Sat, 22 Nov 2025 14:24:02 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:02 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v7 03/22] kexec: call liveupdate_reboot() before kexec
Date: Sat, 22 Nov 2025 17:23:30 -0500
Message-ID: <20251122222351.1059049-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the kernel_kexec() to call liveupdate_reboot().

This ensures that the Live Update Orchestrator is notified just
before the kernel executes the kexec jump. The liveupdate_reboot()
function triggers the final freeze event, allowing participating
FDs perform last-minute check or state saving within the blackout
window.

If liveupdate_reboot() returns an error (indicating a failure during
LUO finalization), the kexec operation is aborted to prevent proceeding
with an inconsistent state. An error is returned to user.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
---
 kernel/kexec_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index a8890dd03a1d..3122235c225b 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -15,6 +15,7 @@
 #include <linux/kexec.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
+#include <linux/liveupdate.h>
 #include <linux/highmem.h>
 #include <linux/syscalls.h>
 #include <linux/reboot.h>
@@ -1145,6 +1146,10 @@ int kernel_kexec(void)
 		goto Unlock;
 	}
 
+	error = liveupdate_reboot();
+	if (error)
+		goto Unlock;
+
 #ifdef CONFIG_KEXEC_JUMP
 	if (kexec_image->preserve_context) {
 		/*
-- 
2.52.0.rc2.455.g230fcf2819-goog

