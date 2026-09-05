Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80583E958F
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601883; cv=none; b=LrLrfQn8vVoEhjRe0LSlh5tkN1E7pITLXXFm2XFeUgG0SW/lnL2vmXX34RCKV05hchV62QjpeE+aASAifXRZhIdg1Kw0MGqw/QF3mkHYPIBm5fR7ide+xYHueul/KJkLAmfqBqogv4KRULV/FRLUSoc+qHz17T38bBR3VkkrzeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601883; c=relaxed/simple;
	bh=hxoMOTps4ssfuwoiEgGPBDr3IeANcLabAFKshQddcHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pQnstier4L6wwQ6rukDQ7xDMU5ldJQYg5zVOOAJmHbLQGhJtFT+unKzW+gElfeLWNfXyvH5W9KvXIbYrgddy5NSApHDJtqETNRVie4eTztsnyHOzSwD/G+MiovK3fqTD9wdOsgoG3nJQHLrawzebEpQDzb5uPaCKiCr1F9LrL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rN05sN5L; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rN05sN5L"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4957eefd361so14103185e9.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601880; x=1789206680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/XuGnO7C0o78lZlWgcjI0jZXorVi4R+HC8SQNL+h8I=;
        b=rN05sN5LNPMTINBXpA4t78pRBM3HdQBD0LDifweDgYRw0sKmG5hnbq9+n4XWZ3wdAY
         mWeaeKHAU9dMsvBA44tTKiP2gEQRbU+LAvBnuznHG01/5bWApKb5V3QgUAT3x5qxocJ9
         Hwc8fz377okjBDKC2HRNWxpraMcKuYLKzIaTUZ+PYrlMgTbbhGMhDNHeISpndmRxRjax
         e+K3dlJUzZZ/jxGuBNn/qn7M2O7lEDKqm410DxxNTNR6cNnpmskOfF+TVTdD7C5qvaSg
         SZ896BNtp5ntid0p9yC97sh73JhpabBhpCzcRxaIJqfy8ZGy6JpKt3uRgOTbDNmJRZXx
         96OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601880; x=1789206680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/XuGnO7C0o78lZlWgcjI0jZXorVi4R+HC8SQNL+h8I=;
        b=KgkLr0T4ZM7D2tB91hwPK0HIKMWKEnjQQqkg//1HgZ9D46638YrfBXrXyQ5cYAal8D
         s/kajhwdBzYcoAmt9zPkk2yhxRltkJF3tKqOeSeopors9nhdNuQWOootvQsZdzlZaogj
         KeFPfPLGjyAbQUTJtBjXL7dBLuCT6w/YXGXPT0OX0UCJnzxcawQ+XcxtPNnQoimTIdtE
         KXbCNk4dO2MNYijl8Sv79kzSolxtVb4wRp0XZtct5/+vbe+HhYe/h+OlHpOO6SyMzCQh
         LkF/4J7+lKQz27s10gYMKCWJD1A4o/OQw+RC7Z1pSCY3BsdPMW/OE2xo/MUfXF9K/gvo
         Olkg==
X-Forwarded-Encrypted: i=1; AKwUvBwfaHoGVuEt+4SOXfa7pgs1bVT9y/3DZ3yyMC1kMh1SW84dzgqjTprV7KU58X2raakbynoZ081kXAo=@vger.kernel.org
X-Gm-Message-State: AFuF++mAX+Tc6KanzJlgAuX7AQed0gVOoDOvKXlUSfsMiHiZ5Q2jAYgS
	ixdr1jJgprfqJgWQiyXeaN7TOtrxRPu36UD6ct0JXG/qHOr7rSRobsq3
X-Gm-Gg: AYBFou1QyaAy0eUzD3EBp61IcCZ1GKCdgLZgIVhnfSjIMwnDRHuP5cjnqhOICcVyUi4
	u6o+IyeyJY8eaghyliGj2qoaXb71CpxhR7zRVz2poMAdv6fd4hf7JWsT1oi1s+1wcs767kljwki
	YklJxf4BR/JYaSPeWtgBJmN7JjyTnEsArGHlSUvKPvnudjS0dezmXhTEzAM5ItkJ4kKD0Oa40WW
	FxInVeK90wqBpCfDhzPJ46emgafbutxDUzCek8MN913yYYl42cbFeoetEcrlV1sqmv0cZeIMJCe
	KkcenPB+rmwQSQvz7qN60+UwUSx+0386lUvJqF1Uo3yb/Xxp6SWKgpDwW6LsL7ynE9097twn9na
	K8vIfMC4COdZd6YAWZNoNBboKeRC8JoS217foUSjB5NxsiW4SEf2rkPenQ3lS/Y21AB6GOsrbXy
	0n0GKVMM4AOJrgg/MLIZBtrR2uznHNEITXPOJ1vvK2ccFDUryjYHVgF4dzxFKKehR62kS7BIHiH
	p8jCkyb0xoBpwBipcgQ5CfpkTXNq3msKB1o5ZKZt9tf6RQPdP4qGm/+g9zi1u5BJJA/ZxU+AjSu
	7yRD24LCXh0xHUk/fB9oqJdOyoOODEVWIolau60WFD4pJN3kBWrTTqd2ceEaKBzBkw4=
X-Received: by 2002:a05:600c:8711:b0:49c:fc6e:a3dd with SMTP id 5b1f17b1804b1-49cfc6ea7bfmr108917295e9.28.1788601879856;
        Sat, 05 Sep 2026 02:51:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm46925335e9.13.2026.09.05.02.51.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:51:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next] docs: mctp: Fix the struct net_device name
Date: Sat,  5 Sep 2026 11:51:16 +0200
Message-Id: <20260905095116.42147-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct netdevice does not exist; the type is struct net_device.

Use it.

Fixes: 6a2d98b18900 ("mctp: Add MCTP overview document")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/networking/mctp.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/mctp.rst b/Documentation/networking/mctp.rst
index c628cb5406d2..3bff00c11702 100644
--- a/Documentation/networking/mctp.rst
+++ b/Documentation/networking/mctp.rst
@@ -19,7 +19,7 @@ networks.
 
 An interface (or "link") is an instance of an MCTP physical transport binding
 (as defined by DSP0236, section 3.2.47), likely connected to a specific hardware
-device. This is represented as a ``struct netdevice``.
+device. This is represented as a ``struct net_device``.
 
 A network defines a unique address space for MCTP endpoints by endpoint-ID
 (described by DSP0236, section 3.2.31). A network has a user-visible identifier
-- 
2.53.0

