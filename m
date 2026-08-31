Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312FC4A2050
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186715; cv=none; b=NbwxOEdTpgqIaqBcgvj56JbtpeBNqfJSRKRbYknFkZDjIEg8aJWyWvSQPhR2fSas6es2kSHkeB/6EOZObWvRBPJp95Ct6RAeWjScWCVxU/wMfsS8ciJi26tQa5NTXcp9DWM+mW61IP+7xxUTyjVuMae4WI9f74RkCSSHeLxmx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186715; c=relaxed/simple;
	bh=ptU1ZlwnH6vGoRUuvyLN3kutz8OyEqpRWrw+X4HpfRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfegO348jD2edUlySWv1nEbhiDatMaNyuT+CC2HpDB61qdkkQ9Ywhlf368DwHdaeQvrb9QlQWenCgFBGx3Cj8upDtx0PKLff3H/6gY0EcvIuaGUsQCeiQSr5cZyD6N9zjfH4M6qomPWKZaw3M2ZqEt16WWwBnYPLbTwtUPQIyAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWWzjw5z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWWzjw5z"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b9320423cso35182735e9.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186712; x=1788791512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0URnMyQaQtd5j8PK7iDRRW4R8eCuSdT+xJY+FbyXAg8=;
        b=FWWzjw5zdYa5hemg0Bz508VnkzSVUhgGO8Ud33ktqXwJ1yzmBZmVFH4pD8jqIx+Mro
         LHv8ds1c2BCOVZWQpE0z5MpR8wEKZ3NmLg9SZRGdCrKg3HJ0npHbjOSNX3GkVJz5V2o5
         yoKUMAe4Llps/svc1uOawDThQD8jiEtLesGMP0xkYOvaW27AEehLgN8S9JamztSLHjpa
         YhKll6vpaZFXjTagIidbocRnPB/u8shii+qanH73UDHdaYH9TdDYEfwwxwlbElHgbD8z
         Sd4GyjZR07kOUly9ppEu6F6RiuFw8Xj2Vxln+YrvlqJws9i4AQ4gr/BV0MSW+DSztHjI
         9eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186712; x=1788791512;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0URnMyQaQtd5j8PK7iDRRW4R8eCuSdT+xJY+FbyXAg8=;
        b=jLXWm/hnh0BJ2LBIKjk8R1ABB5OJ8TqfCO3PwYSgpUuMgbclQCp1sKAskGHdkPkt/5
         Okdt+YNCriDLjJJwV1Gak1K6rvq1ju3jRFNUv0tQh5eusPUF7hn0vvHFDvuMMWzUx4fi
         s4wgV0xhCzeLPFFFinzgAaBx7IRfNcSgWAEeGcvS+VGg+J8+DcvKQB/FIsoyh/tmr9fd
         2Dd1izlTlDo6lCfVzHvXDdLx1ANCAlQx84FCrake66Vggs8oS39+HpmV47Zg1GRzGRb7
         bjgMRb3hth924dijducXL/pDkK5wsys/+MgAf/rIJZP3vjZgg4JWxhO8ylZfDufqsMiq
         1ucA==
X-Gm-Message-State: AFuF++ngIfItwSF4T4zpfwztfJuzio/O5EGJSPvtH19ILUaSYuTGfrYj
	pkIKsaBwX9D4CIAp90pj/lqjz7SyW8YMHtawLYwPTQDxaGClpYiexM4O
X-Gm-Gg: AR+sD13QWaTdX9TAzah7H27vdDU8vgC4Ga75gpARgqAmY0zCcJQ03SvymL1j/hz58hr
	IBKvr6dZtgV0CiNwNTAEgZmbIDYasPFW1c0C8NQglbXMD6Fi7lXEeyo7E/PxMqb0+KJzW0qazwm
	ZEbIi7b2uhp+Xv8HKS2l/3hhvVpTvUwRTToXvxmuaPzRwpbJiZMGje4BbiuarnfYuEtsIRWAqpK
	FTRPYB3cm8QJhhPmWHr+cSuVT5zWQF+LewSsXpMsvefnfhnhx03Gg4SlER6U1JvUIfPUKuHXxjN
	HkjkjcMbY8T9z3BPD5LL9/nChC/qSmtJR0iQ4nMXMy6rORcBkPgQyFjeOLLXTGrObBtwgyhvukP
	Jv3MSeksmfGiK5EIExVyMixfMrdC7ZaRJmUBTXh10+apzR2koXMafx+bMW2BQdUpz8YZZw6xqwu
	KOiJzPBpVoZRiTgylAzgAC8qAtlHwsEmTYQqOEWyIqjn//h1Ed30OgnrAm26r0vrwthZnZkQqs6
	YEO090bcD2ndcK3GELRf2Bc
X-Received: by 2002:a05:600c:a4a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cdc567061mr21947265e9.13.1788186712229;
        Mon, 31 Aug 2026 07:31:52 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:50 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 1/7] docs: futex2: fix documented errno names for futex_waitv
Date: Mon, 31 Aug 2026 11:31:19 -0300
Message-ID: <20260831143125.151360-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The documentation cited -EAGAIN and -ETIMEOUT, but futex_waitv()
returns -EWOULDBLOCK on value mismatch and -ETIMEDOUT when the
timeout expires, per kernel/futex/waitwake.c.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/futex2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/futex2.rst b/Documentation/userspace-api/futex2.rst
index 9693f47a7e62..615616305c57 100644
--- a/Documentation/userspace-api/futex2.rst
+++ b/Documentation/userspace-api/futex2.rst
@@ -51,10 +51,10 @@ future extension.
 
 For each entry in ``waiters`` array, the current value at ``uaddr`` is compared
 to ``val``. If it's different, the syscall undo all the work done so far and
-return ``-EAGAIN``. If all tests and verifications succeeds, syscall waits until
+return ``-EWOULDBLOCK``. If all tests and verifications succeeds, syscall waits until
 one of the following happens:
 
-- The timeout expires, returning ``-ETIMEOUT``.
+- The timeout expires, returning ``-ETIMEDOUT``.
 - A signal was sent to the sleeping task, returning ``-ERESTARTSYS``.
 - Some futex at the list was woken, returning the index of some waked futex.
 
-- 
2.43.0

