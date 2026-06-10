Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3885E1898FB
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133523; cv=none; b=dZbScfvMLv368OhmK1ZZaLx7jyfR/X98O6Tqd0zi3sfO/piwZWZ6R5bcufZk58f+AIJTrjnh3Jp1yCV0N9GeRtWUz0SiQsiDZQ7JdKp4qJGRcD7OiX0kZS/3Nr1aOOP88YfPmSV7bKoJIjVyJvge1QD/HUctN/r5cn48hMWH4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133523; c=relaxed/simple;
	bh=rkjjO5pxzFctyrTr+CwayyXW2YpprIbiGXAM+INBvUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M4a26z5SSvbJ8TyYxicffAr3Ct1yLYFmwJriDRyDzHvggIf68eUKdUE0oXwTC0llr8pO7c1ezMtaDhR4725F+8yfDim629ntsC2QcaIfdrSGGNX6kjN//K505PrCw4n/3lTIA6+9x6UO+nZY/OdhpvHcg3fOE4aPRaH7D18V2zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezkTgP2A; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezkTgP2A"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-304c520fe9aso3210106eec.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781133521; x=1781738321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ANGtK4BeWqYmldrfLHPeqZJXCU59HxlJn1gO/V6BzGA=;
        b=ezkTgP2ApWZp3OH5NtwTjT/1nDUi5cousXzmNJWpoYO/C1X2XMyEanSOT+Tun+FzG7
         aO2Pzy5J6a789tjonO6AF8qt5uRkDNImGl2xuEJhnp1jeeGTQFHhohsEzfjBr27TD9l8
         lwweVKd77U27dX4ykdkBmTod8D3Am7LYL4pMMMcuYnLs097ug1hDihAtV6BfN8N6dAKa
         Eh6n+uxuA9MMYM+CWEgxDBHkPmpVHpv4yDq9cUSlve4AFNNJ1gRoFn/0OLANMoEspvE8
         ipV4kZWGt+m8kg7GLHpvCuxozEq5PiTKVz1E8v3OzxrP9N7POYPGiHRJayn+MXX4bvYH
         Jn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781133521; x=1781738321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANGtK4BeWqYmldrfLHPeqZJXCU59HxlJn1gO/V6BzGA=;
        b=hHcpjwG4wc5Z4WaClwSyPhi5zfzyKMNy8r5WfTUP2TBBTr2PmR5rDn4FPW4zEFOohk
         dkYbcIYZrewyLbaVgqG8PhBcZu4FrEfui73WTeTWK7blzWOGQS8Q3+1XRlaC6dQCWnAb
         PKvrnrWkYulL/Ug5oIYZrXC8WPHqMfqFw2EbbCc0yKZmfuBKouieaqeS/8zUmpFM0cGr
         I+Feq3DYRVCCp+G8kzlLXKbCVFqaCyCk6f1TRAzAkNFxigr2vfW6I1kS2pajYVLCnY9s
         WNa8TFH7Utb3xGm+NOi1d4MX5g8zWutSjWBhtj4TjUJH/oBy61MipaZNvsa6epmCt4r8
         ixrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YAzGY5n4HvW/s7+J6xW63+RZeKhmjpmtdUhWfz8xJ2Xp2thxBzsEhDUKYT8r/Pex8dbr+aAJ6lF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYiA7hr6o8QvKxZbt2Yw5VlNySROoZ/1W2WoxjjBpz8t/MFy6
	D0B/ZwVESXVfBZ4ByskD4ZTyuQGa0HUH2M8zYt1f6RDcYQJFc04Vybqp
X-Gm-Gg: Acq92OEkZfyB/mrhdb9K4GmY0rZmf6HTTwQgiHppLPCi4lgvZ3QKol8ngGIjXaJdB9U
	fNfst0uz14a8EEzgBrL/J7jmheZEFGemGfTn5MfvlPwCwiGThQXvO9U1T+YpxxuiUnVlIr5MrvK
	A3T0WV38YR0/svgHW5Z83C7KHTVyiXvThbELmnoSdisR0q6X4dxohbAaKfdoYCSPNgUT1KGrx1E
	iOaHnTZ3zII0bAZmKjoeBVtXmar3SYaTnXnJG2/7k7rWn8F2AkoJP5uqD1XZARlyoDv39UztLRo
	CP/alZ+SDmR5sZecLR7RuJt4ZuhpFoeUv0t+SR8WGElvdUd/HqRRBxHzgr0t6KLRm11cTHqUOp7
	PkDD57YVl4ju1dPa1IpkNdnTtmnkVAUIXEpzJW3Khr6QgqPf4dWtG/kvZrdJOYcXWgvTh+flCIV
	2YSnPVcXNVsOHI5GgxfpsCq1fjaqdLskXIyFDo/8yf2OkfamGL/Dq7VK2N/pRUFVYiZc2BrrwJR
	V9cHwE/SwGu3w4RAZMPcYdEwbrhoD5g1HCKAerMplyN+FXBu8TmE91/eCTo6Limx9KL5Ev0ISdt
	LmlbxOWY4PJwONzUHFc9HTt761pW
X-Received: by 2002:a05:693c:3111:b0:304:8364:e95f with SMTP id 5a478bee46e88-30804a5e564mr255723eec.27.1781133521166;
        Wed, 10 Jun 2026 16:18:41 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm33754933eec.3.2026.06.10.16.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 16:18:40 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
Date: Wed, 10 Jun 2026 16:18:29 -0700
Message-ID: <20260610231836.186610-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Simplified Chinese translation of security/self-protection.rst
contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.

I don't speak Chinese, but I verified that CONFIG_COMPAT was what was
intended via Google Translate.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
index 93de9cee5c1a..ad96bb4a4995 100644
--- a/Documentation/translations/zh_CN/security/self-protection.rst
+++ b/Documentation/translations/zh_CN/security/self-protection.rst
@@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
 --------------------
 
 对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
-CONFIG_CONPAT。然而，这种情况通常不可行。
+CONFIG_COMPAT。然而，这种情况通常不可行。
 
 “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
 运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码
-- 
2.43.0

