Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B676140E5F
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236085; cv=none; b=Oj/vT4ZmAMUG0EEWazrQ7r+q28woOMLO6sOgB/wTrfH//XseBWm2VQiVPGyjp/Imr+irUIj/glnAa6DJf6lHVJM+iCcIKh9lCA6SQDEAXfqxALxVKcQo1leLpdCySWk0JYr7mVM39kJw7zMTnGc4eAAIriRNRd2362vmuoxl7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236085; c=relaxed/simple;
	bh=cN7DgQyDDMKwlwoQV9Zy6CXTV747HEJD4SXWT7rDzt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hl8ySCsYykNPwa92/M6HXyIwfS8yb6qH5XaCNOkUsE+SJgFjNiFoMKRPisGLPPrrarnfbvIhQM6xIF2EcnizRdmL/Z40eEa+N1jSrLo04Nkg7FoFL4O7A3bvMv4nX9iiVRa04s+wta/eNziVPBpBo0YWtxEduF6xVqVyxyhPXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTtVJ4N+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FsJKvvsE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTtVJ4N+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FsJKvvsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780236083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xablB6kB2yR2eWXgiEzwV/mfa3PUIVxolmDXg2loEdE=;
	b=VTtVJ4N+RQBd6R+Zjgeos0t8T6UTFv2IHFMDlecR2wU+qXniDe1HHi7/a4g7yDUzMKWhJA
	I/TrlAED5gOKruUREp+91gDITBlwu02IQBcaMO7hMPOiJfg2OprBeZ7m7MjQRySanKaAi9
	ZiIqsL0xmHs5WT9QAmwwyg+EOVv68Ps=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-J1FOty3yPdywmpHitSzm3A-1; Sun, 31 May 2026 10:01:21 -0400
X-MC-Unique: J1FOty3yPdywmpHitSzm3A-1
X-Mimecast-MFC-AGG-ID: J1FOty3yPdywmpHitSzm3A_1780236080
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4909ea0ffbeso16537825e9.1
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780236080; x=1780840880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xablB6kB2yR2eWXgiEzwV/mfa3PUIVxolmDXg2loEdE=;
        b=FsJKvvsE20hE9jNzWKYg5yPw9d2vGcDgvFi9M382q1WkKBuHt1YNX87AIMPngZEm4Q
         oJw6oREDq0uv4L5Wv94zrh1SehUA1D1b1EWoh5Vlsxp9nH881Pi9dOzbH+DqadAB5l4l
         BTH6hpcOMjnoYV3wfOQvcZHUP3u8lFfuu6bsdhGu/3zRiQEHwQ3asnfB+hzlw9VRmFQF
         BiWDMFmhiTpN6F32KqZ96e5pUV8qzi16Zk/zSiOfnA1Vd/c4GsNC82coqJW0JDME2wRz
         Oy/4HETbjZzwTkeNeO3GqcKr6VifNxjIq9Npzj1xq9HKmV/gIylTl+oee+zK1U3yaquZ
         ty8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236080; x=1780840880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xablB6kB2yR2eWXgiEzwV/mfa3PUIVxolmDXg2loEdE=;
        b=gJ2v6MGWsZpvP8HMcIQgUgsfKtqlNjzJtRkTQe9eLu3N246zMFn07L0nfpd+JVYfX0
         lJQSDg/DBCykpIAST6uuOAU9vt0oFKSjaiu90NpoXOODOsZViSkdeFCVXBGvM0CHG0xi
         3Uz6A2980YmvgranZHIjfBcSb31J4xTZCXY0yFxRsTCas3Xob0682uc3ft0CbpzSmX0E
         ZToChbFQ5rVyve5i2wO/ADkh0jqq/dEQJYMHbfM3zc1WZva6aBrTPPyHoHrkhfEjspnX
         6WNlveKnSTVLAqWdau/IIk5NIYi/OjtXHkQV4SYkXzWkhnVo+BhUX8pt26bfBlEf+0ej
         92yg==
X-Forwarded-Encrypted: i=1; AFNElJ/112IsGHBV5V9pJCxe5e7aauCqzLX/FPSy2O3AfJyk84XQUOQoNrZrqgnxklApIzqj0Fd7fG5SPbo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7d22YN+NxnAVXUCqVMvpdhjti7TMb2voyZUDnl/hUG3g8Xkj/
	BnAR/DplEdsrzdItUmQA0GdC36XijyV202aiI+zuGnLX+eWF2Z9LQvsLJRVh8zELlzcg77wtTD0
	KVtctRfyxWoIPNPNv93h/yZFBq93+PsW6bIzlxF/tydjiNxRvMfJYNUAJvR58Mg==
X-Gm-Gg: Acq92OFwEZNN6DUETCUf0twqp0ArGElwJXBaO4EGWW391PWAE0YefFhWZe+IoViubO+
	KbDG9FoTgRDfjlQBaOqn9olDsRRxgOor4SMcecfE3O1BfI0mfN7MuPOde+dNibWy99Rgjyk48eh
	+kw8ykOnPXWWGZ3mSnZD75W5QxhDeaDD4yW07K4a5FuticSxtMD6hD4uyQCLK9wLvXmLd490Pnx
	uEYWCyltOhUJ30S+3xLq6GTvJgrK+GcI9K/hOot/FlN1jtTIIL4ZL4D7KSkcygubRFbwN2cWB9z
	bLdkS/VAo6u8Qy4q/VZ2XsNTr9RPEss2UJHo6llBU7ZAkxklyWVnNPW2NTg64eZs/ZJhkSm0hgh
	AQ7FkAwQRfVT+clPT/u3zv3Ux4GNc/0oF5MO0tNLmkEEIwg==
X-Received: by 2002:a05:600c:c098:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490a2923cbbmr108126125e9.15.1780236080334;
        Sun, 31 May 2026 07:01:20 -0700 (PDT)
X-Received: by 2002:a05:600c:c098:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490a2923cbbmr108125565e9.15.1780236079839;
        Sun, 31 May 2026 07:01:19 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c12b2dbsm75194055e9.6.2026.05.31.07.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:01:19 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: cgroup: Fix stale source file paths
Date: Sun, 31 May 2026 17:00:45 +0300
Message-ID: <20260531140045.4114289-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update two references to files that were moved:
- kernel/cgroup.c -> kernel/cgroup/cgroup.c
- tools/cgroup/cgroup_event_listener.c ->
  samples/cgroup/cgroup_event_listener.c

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/cgroup-v1/cgroups.rst    | 2 +-
 Documentation/admin-guide/cgroup-v1/memcg_test.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v1/cgroups.rst b/Documentation/admin-guide/cgroup-v1/cgroups.rst
index 463f98453323..e501f45ea93f 100644
--- a/Documentation/admin-guide/cgroup-v1/cgroups.rst
+++ b/Documentation/admin-guide/cgroup-v1/cgroups.rst
@@ -525,7 +525,7 @@ cgroup. It may also be taken to prevent cgroups from being
 modified, but more specific locks may be more appropriate in that
 situation.
 
-See kernel/cgroup.c for more details.
+See kernel/cgroup/cgroup.c for more details.
 
 Subsystems can take/release the cgroup_mutex via the functions
 cgroup_lock()/cgroup_unlock().
diff --git a/Documentation/admin-guide/cgroup-v1/memcg_test.rst b/Documentation/admin-guide/cgroup-v1/memcg_test.rst
index 7c7cd457cf69..ebedbc3c3f9c 100644
--- a/Documentation/admin-guide/cgroup-v1/memcg_test.rst
+++ b/Documentation/admin-guide/cgroup-v1/memcg_test.rst
@@ -321,7 +321,7 @@ Under below explanation, we assume CONFIG_SWAP=y.
 ----------------------
 
 	Memory controller implements memory thresholds using cgroups notification
-	API. You can use tools/cgroup/cgroup_event_listener.c to test it.
+	API. You can use samples/cgroup/cgroup_event_listener.c to test it.
 
 	(Shell-A) Create cgroup and run event listener::
 
-- 
2.53.0

