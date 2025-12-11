Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D8311979
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457213; cv=none; b=rqWbM/soEH2DYVXDBBcihDbGS8DbPixV5Uurjw9bCMrJLYTddnvDVUyQ1TZLiHlXQRfO8XGOiz4yWd+9KSaNvMIuuWZScS12HHGLDnBIfHdwnljcoYZnJU2J5bPeNTSGzXJ7is4MqTIvVtk8YKNupHE7aQdR83mTCs3Ajgn8QOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457213; c=relaxed/simple;
	bh=V4Bvd9VY65MocuCApZ0Pr2bmECNZD3Q72vd97oHmSWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCVV3pGvIeyLlybqQzaPdD3RVtPzGibTCY/9COD5dQus7DadB9V9wr55OGtq344z4L4ojeGm+dipcAfgL4/K9d3znrfVw6Bn8/crTzafEW+u+5Yqw1VQtTUErToeJQwRKmrXmVR4WAsggkigdmOBBFBJsIfYZ9SSawUHKlcRYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=M8ZF0Htw; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="M8ZF0Htw"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 343D33FB57
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 12:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1765457198;
	bh=jrSDM+QC2oL05uTUTk5zoPRDP1WyTidIGQybjJRxrbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M8ZF0Htwdhx2XWmonwylKzqGLpybWagkAWmucq2lNH18HVoKBWC0bv+IzhnLD0MDr
	 jxyEFsvNOAV4v38N5sDdj/UIhonGb1GHy+iB0/ywq/xDJyJchpUJTPgW4D0ba+6vNg
	 wAK760E+mIGivAYFoN3I8MuU5a21UPdt7F2d9WGU1I7wAVbEV0pVtchpYdCOu+5+67
	 bR7hqPIz8U8u/CUGW+e/4vBMGIhgwK/XBYX4mW6/Tsoddjm28xC3LTa6lvtkaMYvV5
	 DbmobHNc0GYWR4en2kx4xjIaLuP36/QCYZKFiMNbHdAi986pB8rc0pYM5jbkCJ4t/b
	 K0C6A6SqKfnchlmBdotC27cj8+KfRgMPh6FEkcoR0gl7/S5Jm613jB569ePbWKOlsT
	 mfftpHCY79kPZe8KfKvXgJdpMUgeetpEpzM7Wf2j6f5jDI9NaPNhmhnSr/ZglYaum9
	 Zf+cYiRrXJsYEOZTYCBjXKbluFlBF/PCHjJJI6k8ToMP5uYPgZlrLeuHFCgJeLDXHu
	 yjz7/nGjNjdWjtECugi0gWEmO87O2WrCGhk85HtZUWHgH8KXGqCDngQX7ZQ5DlPz1f
	 KkkPnzEGtIqQMffoz/qTyt4cTU6XdXAyS7T4fFJanm1kTppi+DIaC5n1+eyD+HsSEI
	 F+RCZuTLupoWJFx7Tl1a1vpM=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47910af0c8bso246095e9.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 04:46:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457190; x=1766061990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jrSDM+QC2oL05uTUTk5zoPRDP1WyTidIGQybjJRxrbw=;
        b=xRH3Ue0eR7vOkc7dah9wZl25dOr+6qweRkDaJdwLeqcPS6vClrN2qh+FpT7egy5aoZ
         mYbkI6fXjj3J4mwd86oD8lmlKZ5Ad9VqIm66pXwyDWqtdpnu0HPL7LrVfiZ6dm8647yG
         lCgdxpXSihh2FV0+MfiF7XV54BvcjGtTmRIZogwvFdduSDo6j/E/jiGtfWOv/RXr1XzX
         zKXuuTfc8byeQCXG+cZ6F9FmlUyiIuojhJA6fsGmQrJOD2cQCppOy0WoSqzX51s1Wm4B
         epdypirrwDZPKmCXFb392/cemwu8UjvIydtelVws/+zvf2MQk2QKfsa2BGoLfzfoxxYe
         s+Mw==
X-Gm-Message-State: AOJu0YycZ4/ZXwX2xm0u5H51xQuUMYR+con0GbezuwKhXSBswdpVU9gq
	ZAelvINiBzAmYdWKT5exra2Src4t3s7kPa/7ZJ0c+EjUZEeYO9COTW24WHQBZ2Jut3EU17tcTbh
	WioN75xzcbTVGVUo3a6RO+X1YNZuM8qDgFELQIoV7SFKtG8ec6zOVxFuyLUsviojtopdTIYwy4N
	sfng==
X-Gm-Gg: AY/fxX5NCC1PXyIrl3m0UVggfQ+cXBhYqKPOyG8Htl2nhcn1tovXqfqQu2sMm9brYjY
	+YBjkh0MgrDBAkVvZe0OaTQ0XHR0ep3+Eob84aKWinfjBQm2yy8mBPphxT8CHn8Kjkbgevf+fZV
	zIf8b3NGrDasBnNNGC4Vb9WSB/6XEh8/7B9fox8nlNHeHoElG2hkOA3sCNiq1tTNtOxf5BcpuKc
	5zVfjOZXbsDeEPlVnPnBzWwrpfk5HNJf3mXcICLrVNNkWeecj2lkuN+Yngi6Z4fpYw3a9+ZMeNW
	RfLjslnELwL6FF/l3AV3kOb2y9AsijPgk9Iqowqz2yxnKGY3dw+ajfQ2poOtOii1WBfildQieG1
	jpe8++WmJZkPIqQjcPPhuL2gydhEHM6T8vzNHSgcwXsXVRTLLcaJNnAy195uS6m0KLaxUCRcDq6
	dMSPQ1pXahKr0bKho/8ZwejYQ=
X-Received: by 2002:a05:600c:3f0f:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47a8384de10mr49558005e9.32.1765457189033;
        Thu, 11 Dec 2025 04:46:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5tojaC42237Yf2xjU2FYDClwe9vVFbh0RoQL/geLu4bY+08t5sSeeLETO2bhZqgmmEjho1g==
X-Received: by 2002:a05:600c:3f0f:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47a8384de10mr49557805e9.32.1765457188637;
        Thu, 11 Dec 2025 04:46:28 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf57022000e6219d5798620e30.dip0.t-ipconnect.de. [2003:cf:5702:2000:e621:9d57:9862:e30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f0d6f2sm32075905e9.13.2025.12.11.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 04:46:28 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>,
	Tycho Andersen <tycho@kernel.org>,
	Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Subject: [PATCH v3 1/7] seccomp: remove unused argument from seccomp_do_user_notification
Date: Thu, 11 Dec 2025 13:46:05 +0100
Message-ID: <20251211124614.161900-2-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unused this_syscall argument from seccomp_do_user_notification()
and add kdoc for it.

No functional change intended.

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>
Reviewed-by: Tycho Andersen (AMD) <tycho@kernel.org>
Signed-off-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
---
 kernel/seccomp.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 25f62867a16d..08476fc0c65b 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1160,8 +1160,18 @@ static bool should_sleep_killable(struct seccomp_filter *match,
 	return match->wait_killable_recv && n->state >= SECCOMP_NOTIFY_SENT;
 }
 
-static int seccomp_do_user_notification(int this_syscall,
-					struct seccomp_filter *match,
+/**
+ * seccomp_do_user_notification - sends seccomp notification to the userspace
+ * listener and waits for a reply.
+ * @match: seccomp filter we are notifying
+ * @sd: seccomp data (syscall_nr, args, etc) to be passed to the userspace listener
+ *
+ * Returns
+ *   - -1 on success if userspace provided a reply for the syscall,
+ *   - -1 on interrupted wait,
+ *   - 0  on success if userspace requested to continue the syscall
+ */
+static int seccomp_do_user_notification(struct seccomp_filter *match,
 					const struct seccomp_data *sd)
 {
 	int err;
@@ -1335,7 +1345,7 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 		return 0;
 
 	case SECCOMP_RET_USER_NOTIF:
-		if (seccomp_do_user_notification(this_syscall, match, &sd))
+		if (seccomp_do_user_notification(match, &sd))
 			goto skip;
 
 		return 0;
-- 
2.43.0

