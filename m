Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B125D32E72F
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780237119; cv=none; b=ci0e7Aq8uFS8bMhcFyA3tN1C0lfLzqvMQHn/NuU1DU5LtvSqsW+Oc+OMlwuDflSPw+J3J6rJrccTtoDqmN9rK4UwasM6d0vHZxEJJ4C0KT7+2XmVKicZRBc/91+KuI1ZzqhDKnKIbmXuz6Scp5CTQPccYaLDzqc5Z08m1sDNsHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780237119; c=relaxed/simple;
	bh=zjwsiyM9YIeiHH2wJ8jXDD9l5W0r7o7szymJ9KdY8Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h87pqJtqXxLvhvrVi+hMLLsz/ZbXO/LPgcfiynu7NXV8kcLHghWu7lsWueT7Cpycz2VOe+Q3cBkN5Srx6ca6MKcqFMwjvjvR4LPQJVLmaakLi6vHgajDWgg2gj5aD2ANeGVkpQO2umOG7sNv5aUC9Zu6eFC+BnYmi4r103vjfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M53XeGOr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/z3KxvN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M53XeGOr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/z3KxvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780237117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QtO8FxV0FZvT6jbNOVRIHEka2WnDuWsEO9oX113DzcY=;
	b=M53XeGOrRaLzlCFjF6g/Bit6g/7TSQHW8C+k5GQO1OZ0goD/TJDFgFAz+DxCPsr9h3sD/9
	zoMDvDqfxt0h7cOaFVgwqXkQH4u6b/7bdsgYTh52CCiUD0heghVBiDRa0y/7YfL/N+HlHg
	hgtOMN7D8T+ufWjEPwe02YR+zwkRBBI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-qlimbJqGOeG3fR3cwcfjrg-1; Sun, 31 May 2026 10:18:36 -0400
X-MC-Unique: qlimbJqGOeG3fR3cwcfjrg-1
X-Mimecast-MFC-AGG-ID: qlimbJqGOeG3fR3cwcfjrg_1780237115
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49050c44bcdso93845165e9.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780237115; x=1780841915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtO8FxV0FZvT6jbNOVRIHEka2WnDuWsEO9oX113DzcY=;
        b=K/z3KxvNYTmovlaAIE+r3fHrh/S2EZeTh3qx59yJwRiBQNlw3hWBavm4dCfUwX32TV
         H3jmLCv3llg3YRusRD3MDQRBpQJPsFa7/vqyC2NACiK9NUSeVzYmYte4aQz0zQ9y2G4p
         e1EA/irZZX+5a2Gc8mZg4e6c8T554ePxBtPQqwqLu6wkeqAVISZdeQtrRuyUWliDui4R
         kFim6wI0H9q5LfDcxyI0kK8RDdrYR1ibKvE94OAb1hMyl9aFC3WtYmnJZB2anBVBfIbg
         N6/H8byEWHwrex32vvtkX6MLyZEFf9oleUYzRRPP1NKmM+qx/tyNY9586k6sLKDu+/YB
         zU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780237115; x=1780841915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtO8FxV0FZvT6jbNOVRIHEka2WnDuWsEO9oX113DzcY=;
        b=SzHJpGhBby/PwNQ4nC8u1K+XcvxMvaNWwHU4kiuQAUVRGizmeTIxHE4w4uSK0UUMgG
         Wglw5aaFKDdHUinoCXLywmNpuGbaozJeuc29g2vB40Yy31tDUAof/n3juTV+jJJBboDI
         zCpBloNjxJ0zwms6i6x2+2WjXjqFKsSXHpKTcD89NYSm0u0MYl81iHnP1r+UIKI43xAt
         WjWhGYWGmZF3V58XUqDdP38ZoZbla73NZsMRf4GneNFlX/G4xkqDubyNmWSj1gYbPupp
         qs/xSDMr/3hriMmvBiPU6UsLjbDd26i9c5HYodEYKMVH7+w9NV8suw+p9PShpQ7Hjy68
         GhXw==
X-Forwarded-Encrypted: i=1; AFNElJ/mbfxXmKfvTqs4nBr4LfLru/dPgO9peF7WjZSLkdqUga8+edlpPD3QTaXEAUJQuk2JgRugbEQvxhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+aHNZfI+u0YtvPNvs0Dx3sqUhwxb7A3g2U0iHWF6iMuf+Oti
	KNft+joO1WHLhzF5zTgxwbT7RHP7QjBhIWjQXdVYW2HuPotIl+x2oaVeXni1fjWM12UI5j3/BWD
	cozmwBX8uFHmgkJ2MwhT+7dDodKWb88V0xBt0yDWlqaqpDEEIWHIsvxEXmnC4VX8yaDDdPTti
X-Gm-Gg: Acq92OFOLSJkbl5fcVQX3efqPbW7BrOdsICCKkHmw9wU/cFlE8CZRQRTDyW9YyBJgoX
	f0uh0ShlnepsZLZ6noLNAabvcEYHnLUuN0TSFXL9yQKvSNfYit8AiLlaiyWxAonwICwpggf0QrZ
	QEFExo0XcFOo7JMPjcH3iluq/SBiwBPFsqkyzkrd3aCJN5Zal9t5n9Pq/a9cXgx2kaBg2U8BZEL
	VXZg8b1zlY+2MZwLprS99wmIel332fS9K0CwUfyh7xz2T00We1g4Z5D5FdsSckpcZOwvCJ2p7r8
	tEjIghjSmZc8muo/fGcB2t+sxnhrLK+9vyVwYDrMheEEO9EsfQE+IclMBpBXkWr9LU7J6aqOLh2
	DZaIZFafizCKhA9ZfyXTwjWUkTtEVhAE2fo9i25JNt7DWHw==
X-Received: by 2002:a05:600c:46d1:b0:490:a7ab:bbe3 with SMTP id 5b1f17b1804b1-490a7abbd7fmr61900455e9.0.1780237114843;
        Sun, 31 May 2026 07:18:34 -0700 (PDT)
X-Received: by 2002:a05:600c:46d1:b0:490:a7ab:bbe3 with SMTP id 5b1f17b1804b1-490a7abbd7fmr61899935e9.0.1780237114475;
        Sun, 31 May 2026 07:18:34 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0498e0sm76968165e9.0.2026.05.31.07.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:18:34 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: real-time: Fix duplicated sched(7) text
Date: Sun, 31 May 2026 17:18:22 +0300
Message-ID: <20260531141823.4118954-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The man page reference appeared twice - once as plain text and
once as a hyperlink. Remove the plain text duplicate.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/core-api/real-time/theory.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/real-time/theory.rst b/Documentation/core-api/real-time/theory.rst
index 43d0120737f8..92de5654163d 100644
--- a/Documentation/core-api/real-time/theory.rst
+++ b/Documentation/core-api/real-time/theory.rst
@@ -25,7 +25,7 @@ Scheduling
 ==========
 
 The core principles of Linux scheduling and the associated user-space API are
-documented in the man page sched(7)
+documented in the man page
 `sched(7) <https://man7.org/linux/man-pages/man7/sched.7.html>`_.
 By default, the Linux kernel uses the SCHED_OTHER scheduling policy. Under
 this policy, a task is preempted when the scheduler determines that it has
-- 
2.53.0

