Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B874322B8F
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599416; cv=none; b=NxGojThwRvxX0IJJo23ucXn2JUU/7DahOiWeVKqwDrMY6JB0R8teDAURBDlVRst6jSKLGuT1tS7CqF3zj5+EFTUNk0zCZl5u3oorjivJHWgLEfGN7MT7u93Z4ldtQQxqdFhupU3A7alY9jSnxUJ9Jhl0yJMeCYyKEeDfHVhF7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599416; c=relaxed/simple;
	bh=mY/PHVc8gNPQTEZmwItYyoVwVn/6yyqbTUvlCkwozjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Stx8yBP2quJ2pR3DUcOvg4zFOHwJvuB0EGg20KEnM+hwzPZeme9QcF6lpxCyu2cLlJJokui1G+3fvhUr+Zb3hbW9xzfdBf+Knbjxa+h6FiTgNEgxza3K00DTS4GMSrhvgvjItCscroD5EWLZ3HmLCRQwHcs/8PrJ09rKfaNgrcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rih9HZxH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rih9HZxH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4957eefd361so13988025e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599413; x=1789204213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKDGbOd01tKKN9OyKvpXZgoSU3lxVYKrsE0hqg9G808=;
        b=Rih9HZxH1x/Zgkvel5UNHU60Rv4bciJZyfkr9r7D7h30G+Q4nY6h0Y+qV/os8aUhII
         hc5iqrrFbhUrqxowi0EN7rM8nQRpBNlSeYdIZnlYHUJUnLP6cZbHchZMWHIKrHagx3aZ
         3UdUAv/qFGj3tN72utmSLNUVsf/DRpdpdP3FBYoHX2K77iKmyDxx3S1vH/rs9gemFCAV
         KUrc++aYZKPYgBvZCbMZgDAhYeLQW8dbOY1dYVHBHzut73F2DJ03S50l/ow4R410LaHD
         cvpRDcS99K9/c01fpbK/YX0EeRiQ44bqCW7I7nuID5smOtovLz6ZPxKZ5j35ngikc7et
         RHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599413; x=1789204213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKDGbOd01tKKN9OyKvpXZgoSU3lxVYKrsE0hqg9G808=;
        b=cFVURN6XC5zI3f1R3Ie0Vr1qYFeSpx4QDsxgpjLNKKU/hEN95pPFEUKk7RqHSsmPoW
         NEbIa/6vPwSz1aI0i8+7eZd3aJzl0F0pVA2bFtM2FcydOseLqkWvkvEArxgp1Pv5MBRG
         ziJrwXugoHRZJUKKy2dZAvd/1i1l/YYx83rpNZhv7WU4ZQwb+Hmd/hY5ouJbkrih8EzW
         dapJlRR9eEKuglCBEvFApwFecTmrQVCr19E6g13TVxo3NJSgZbulL6MskFzV+M5UwGjN
         xSomyX6SCOYm92GRePpwM/aPy2vF6wWpSwaEOwTb8gsmRp3vE4fX0OyLTNJzp258s6ix
         KcGw==
X-Forwarded-Encrypted: i=1; AKwUvBwKGwIQlHXYzIkAyoUcnqsEx9FkhZWLSn7riV93fj8MiitTf1vFtciTuYFIRmJQ142F/mjtXm6Ra4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lC3o2HPBMJ6RXq2w6pub60y4Nj1OyulXUCgY6tM8HsqVRBFb2u
	8dGSsRKOWg24lZlNj28D1ggXs6s4ffpHzU0uHKFwrMstJHdyMxaWuZk9
X-Gm-Gg: AYBFou2DrwJ5hTQVzELsmhceP3JP7oAxImFH3KH1AqA8pGpwj2LU02pblwMEyV8Ssog
	g0AWUN1aYoJD2unl3LfPQv+I23rQoJJPr2KxziMouC84jhwliHQD/Pb1KcZFyWjvt+NFH+94XcS
	UVAUM9sFQI0gEKucF6QwEAmTMCa3lugh633X8gb+A41Wt3KN4mc6TEqZ1Gi8AynRRF+fztZaB/K
	2alIY+jU76FciE3WQqCCzt0Kt2wxFBgSLEn1YcSznO5JTD28SwfUWVRKflQ46ijkVCk3OaC2GJg
	xg3nAK3AmNvyaoNX7zrKbHYJkGTl8IDEW/aQEfeVOVeGV/pC9iwOPIuowSF8SJ62lYM8FmBzBlb
	58DcdZ0LFUazn67uTn2P7V3h89CG2COS7ww4OOhX7PAcDW87RrONvYKKuuyBg9VSy3pTQ3pukDL
	7RxOnqi0B7DP03GMVq0NNiNiArbNEy7mH+X15ApUQOCF7R/JzX+bysPR5NkWuWlYwagaGsHjUT0
	wjf61hx+NvpxWiMbl/lyAsB/2fBY7pqUC4bj8ggEKQwqoMaXHdv2lmsp3sL+qAzxZNRR30jZ/W3
	w+ZXz6xtYfyzfSg0MNaLQW2S2Rq/G+ozS1CS4J+u73HklARdVrOBV/ftbob+pVKwTew=
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr86958245e9.24.1788599413100;
        Sat, 05 Sep 2026 02:10:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm217201465e9.8.2026.09.05.02.10.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:10:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: KVM: x86: Use struct kvm_clock_pairing in hypercalls.rst
Date: Sat,  5 Sep 2026 11:10:08 +0200
Message-Id: <20260905091008.40802-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct kvm_clock_offset does not exist; the name is struct
kvm_clock_pairing.

Use struct kvm_clock_pairing.

Fixes: 55dd00a73a51 ("KVM: x86: add KVM_HC_CLOCK_PAIRING hypercall")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/kvm/x86/hypercalls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/x86/hypercalls.rst b/Documentation/virt/kvm/x86/hypercalls.rst
index 521ecf9a8a36..e0b6c11f19ce 100644
--- a/Documentation/virt/kvm/x86/hypercalls.rst
+++ b/Documentation/virt/kvm/x86/hypercalls.rst
@@ -109,7 +109,7 @@ The template for each hypercall is:
 Usage:
 
 a0: guest physical address where host copies
-"struct kvm_clock_offset" structure.
+"struct kvm_clock_pairing" structure.
 
 a1: clock_type, ATM only KVM_CLOCK_PAIRING_WALLCLOCK (0)
 is supported (corresponding to the host's CLOCK_REALTIME clock).
-- 
2.53.0

