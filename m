Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8728844C63
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321535; cv=none; b=JkvSETU/gZkWwBAyOz6Rgv6D3uo3jmTS5EZH066RseX5ktXaSXOTdlHuW/J1bbd5Yqvz/YAibmZN2q/+K6qR0kWWD3hBjfnZR18azGr9sX/r63vOS30WkHoXx9bvaw1DwjoQqdeXm6MhbEav1EKJYTeOt94MyFXBZdfdDb1MuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321535; c=relaxed/simple;
	bh=77SsVYWuM/VKw745eTt7XZiY8OVqpjtPtbXZoluNZCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtWvqq3RwDjAI1x5hzrY/lLpwHZG2AkLMWhH2zNaREUfAUA0vFlOXSsfgOIuiPh6hTUgjVDlO382Yzd034mVksu8LKfYZLPaoPclwu+LNiM1+Z2ryM7OP7c0M3UkV/y2ToRb0RHSROwzJ8XIA0Yiw52aQIY8CLPvBG8G/zVi/lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ChoNHSAN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChoNHSAN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3375092f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321531; x=1745926331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=ChoNHSANGbbOdrD0qv4fFnCCatR00mkWLDvRVz61Btj/D6dFWmsHPAoPGJZCJSRINy
         MnFebIkRnX1Yx00Ea6ZbguWpkgkNiAYGrTdfx8O1K2OC7L4P4P6z5UeFGuLGDjH/5uDr
         W9QTtWPECajqrxZB02T4ISgJWBaHDhgPqOKSk/Tssh1S6CWmIrWJEcMAh0R1PxLzLcfF
         Pz9wgNT/Sg/78BMbNB5KbiBfYoEkChUKY5zVFyqTkqCTCK35Qas1M2MwT4JTpBgRMMtg
         aBioSp0LuuoXA9ZRcjrDUSjXtldc95HJ73FEkTJxDg7oE4ocHNLziuC95U4oGkcmKnA1
         qzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321531; x=1745926331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qz8AL0iQ82MjjwyNSE/OrISLUcyy+9C9mt1QGnHDFhA=;
        b=KsJqte0wGd6Ycr90mKXJQc01fvP5mvzAAQBirY/4oGrvmtLlfGFF1oVbsYCPOYaXvi
         R72OQ2t80Sr0ZPmV5d4ADJCi8OkUzDAmHZ1Va8OPTUnYHEkVXXMXeLLdO9gGlMVcbDA/
         rbcZdazJyY2RsW10TjUq4cXtvcTStq0RWxErWoh6UNMnPbyvJv/GtfCzbYZJnQlXQWEd
         AVCxihFVHAYg1IS8JTcDnPgTSUmcOevbIroEiQBbSJ854Y3EsT3V6tD78KBMcFmelH4I
         oAuXcG0cx6j/kmBuU2XdYpi2/xCcIBFCaVyIGJkUy+CzHs95MI9rhvijrB8Inr/Ee8dZ
         /DYA==
X-Gm-Message-State: AOJu0YwOrWCgwow4cA9nrA/eRC1lo8foEGhiuedv6UaKW9QVVLzXULij
	5OXL/NqiOMxOSw9Y2ELG8WB8V5fAUJLxnHhHLqDXs2kppA0A1KOWtVxoicV23X0=
X-Gm-Gg: ASbGnctnqnB++Yv1nnKe9LGtmciABQZ0g7g+hlZdL52nuI7vIKBqGnrA0aRy0Ibxi9b
	c+2bPak5nXdNxgkQtqnxMogBFFnlXqKsIC/GtIGIDBTXbv6zQC688flSJ3QYfiIHT5ys8uzH94N
	LaauvLlRrwqJvu5lN0wzart9mKbVg8ihz5Qv0JXHnLVhg2mGq2tZj2WEamcIfIkRZhcHAFHe5ct
	Vz8nGL9LMJJyFfGYGSRiCikCdBfqRsSs98jhtwxEUE84E/irPPTEzclnpzF5I0oiblHN/3keCJw
	sKX9pl3LuLBJzaAQlNL+bdnap1AyObtrJTsdv03imMui+RfwuWGk
X-Google-Smtp-Source: AGHT+IEfV3YGUN5j4yhdrrLJhy7BVF6BU0L6gVQPX9+sNcrdsbtuBIIBqNRd2hGHUQsMP3+8iBWGbA==
X-Received: by 2002:a05:6000:2403:b0:39c:1f04:a646 with SMTP id ffacd0b85a97d-39efba45f64mr11816104f8f.13.1745321530764;
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 01/14] Documentation: add kmemdump
Date: Tue, 22 Apr 2025 14:31:43 +0300
Message-ID: <20250422113156.575971-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/debug/index.rst    | 17 +++++++
 Documentation/debug/kmemdump.rst | 77 ++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst

diff --git a/Documentation/debug/index.rst b/Documentation/debug/index.rst
new file mode 100644
index 000000000000..9a9365c62f02
--- /dev/null
+++ b/Documentation/debug/index.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===
+kmemdump
+===
+
+.. toctree::
+   :maxdepth: 1
+
+   kmemdump
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/debug/kmemdump.rst b/Documentation/debug/kmemdump.rst
new file mode 100644
index 000000000000..dfee755a1be1
--- /dev/null
+++ b/Documentation/debug/kmemdump.rst
@@ -0,0 +1,77 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+kmemdump
+==========================
+
+This document provides information about the kmemdump feature.
+
+Overview
+========
+
+kmemdump is a mechanism that allows any driver or producer to register a
+chunk of memory into kmemdump, to be used at a later time for a specific
+purpose like debugging or memory dumping.
+
+kmemdump allows a backend to be connected, this backend interfaces a
+specific hardware that can debug or dump the memory registered into
+kmemdump.
+
+kmemdump Internals
+=============
+
+API
+----
+
+A memory region is being registered with a call to `kmemdump_register` which
+takes as parameters the name of the region, a pointer to the virtual memory
+start address and the size. If successful, this call returns an unique ID for
+the allocated zone.
+
+The region would be registered with a call to `kmemdump_unregister` which
+takes the id as a parameter.
+
+Backend
+-------
+
+Backend is represented by a `struct kmemdump_backend` which has to be filled
+in by the backend driver. Further, this struct is being passed to kmemdump
+with a `backend_register` call. `backend_unregister` will remove the backend
+from kmemdump.
+
+Once a backend is being registered, all previously registered regions are
+being sent to the backend for registration.
+
+When the backend is being removed, all regions are being first deregistered
+from the backend.
+
+kmemdump will request the backend to register a region with `register_region`
+call, and deregister a region with `unregister_region` call. These two
+functions are mandatory to be provided by a backend at registration time.
+
+Data structures
+---------------
+
+`struct kmemdump_backend` represents the kmemdump backend and it has two
+function pointers, one called `register_region` and the other
+`unregister_region`.
+
+Each region is being stored into a cyclic array of unique ids called
+`kmemdump_idr`.
+
+kmemdump Initialization
+------------------
+
+After system boots, kmemdump will be ready to accept region registration
+from producer drivers. However, the backend may not be registered yet.
+These regions are being added to the internal list and pending backend
+initialization. Once the backend is up and running, all the regions are
+registered into the backend. If, for example, the backend becomes unavailable
+and is removed, all the regions are unregistered and kmemdump waits for
+another backend to become available.
+
+backend functionality
+-----------------
+
+kmemdump backend can keep it's own list of regions and use the specific
+hardware available to dump the memory regions or use them for debugging.
-- 
2.43.0

