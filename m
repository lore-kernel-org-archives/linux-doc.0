Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB432D24BF
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990487; cv=none; b=dTaOLWBoLF2KtzJHOtQb0EvMJbqLlyfpFG98ViutwbsIF9/Ok1fP/pWxiAvBqq0HzCAP87wUIvgxGyCn9WjDJJqSC/AMiT60Lcq66E5J/45W8oLqPHZ8qxcI6DkIG0HPtCUQ6ZxmIIPCkKcTxw9y51DJ/mVZ/pOc2J1bXaSZRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990487; c=relaxed/simple;
	bh=VFD6GtIua5YG7zFmjDzL7GA/HqAr0MELlfN71DmH60w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPRQxmSFXTtT7ah4cO62RaIYG/hUgwgGscCNkZUGIP80vMLic6+HxrNpas0JX/RwvOgWbMdzsEuUcOD8n7yOPmE6hA6e6ZSYsAZmCfroAkUQYLeYG31vkFtatn0ZA1ZlH0Z9/dakE4F1HXOqPZqT5dyDVH+duaEncwmrhmwzzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABdQt3g0; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABdQt3g0"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34029cee97fso3181403a91.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761990485; x=1762595285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i163pqyR8qyoX26TG357PYVJu78JzhXd/RDPq6ZRj24=;
        b=ABdQt3g0TTlpYbMo/ARof8OQvjUtMB9l/em7aVs0+wNr3lVgeNbcOcvF5Lqm9n7VVD
         vTvFntx52tMokyCjK4vCOvaS1p8vHy4YVC3qyFa6MhkZqbWaLBELOxsvMsMcYbaRwF6h
         rB07DSBxfK59rWuOm7a+bvr2SXGSUBJmBid9R3kM8DFZ24y4UaJB31OZPtNiM8mWxCMS
         sSK0sTPawyD0exRkqKY0XMwyOeodnBaSUbzdF2AnSjBtUgOPGX1n/+6YXAe7dwZtrvAG
         pYrsqIhEPD+/L+eCaQkdEagedk+UqnuEtZqxFzTfvACRNtzB5mz8CbAOJE6LVC6LKuJO
         23Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761990485; x=1762595285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i163pqyR8qyoX26TG357PYVJu78JzhXd/RDPq6ZRj24=;
        b=h+nm6b4qA68XG7ZMCqyqFC7hhPfo0XFBc/UF/FzYjy+WCLmpLxBG2gqSgb4SsRblAV
         ll/jJzasegUeQjaV53popBSep1xuow2MHHIRpWFfbD/KEgkoL6cMOmmSIVmxj6tYDl4E
         zRVW9VNZd/8LOC1g6r/rz71PNXXYE7N5MhyPuSVsA4RfxxRbJULwrgv3FESTtA4peXZ4
         fAp3/zaTBOHkZss1M9Uhgz6zlyTINWT5tWlYjOmViNxsOACQdsOVddnQ8aOwlyqMT+t/
         UP9r7Unkv9eQn9enJ+dOe/4/9j0de/voppRLd82UtRl9Z35H9rAlOshlkDbVgisYQEX9
         LZOw==
X-Forwarded-Encrypted: i=1; AJvYcCUIKlwZ88Ia9d/Tyefp90zOh1HR347x0Hfr1p0uLLWa5k0zKeRUtDNo/bIfrT3TB9/kd6Pn1hxBQ7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ZalPSaKcQ+IqVE7AdcGlPwPX4GMfEbTNxyn4vnid6uQC8FIC
	UcY9Cl58ZNU7LXCdAU7OP641hBMAJ2bjVt4EgeNKXIy1EFOlUzWYDuv0kZqFNPXDlqA=
X-Gm-Gg: ASbGncsMDDhwNi5Co2heoqBLZk3tg01aFxsLVk2lc604bXR2ltwSe8b0i9iipNRRrhz
	5rXeX4nCHb92B/qzQajUeEBzneFePP4Rm3qZjdYasRXVjG1r5LZwm4dTPJ2dywHJ4Zd1aAdRieM
	2OfMaQWg/Pk3GwuSO9YOgpH6bN9wxflX0GSQNcrG9Pwwc4djYVTafdOdXEEknka7jXmqmYPHxB0
	zR9hT5NVvxNRmYnPjJvMpm8TtnU+HmKT3dlPLKMCRnRu2upENCQb8Fx/q0uNj5LfHPjGVjXR6kH
	3MaE94UpPW9duVLAkPl5VJs5bsULM6B4BXDeLGo9G00XRCRdbJFQAznC3xpLOOISIYIrzX1CtUy
	nh1qO8gd3R8+jGuZs4GoEWHf/PXIVPPLvbA0UGzjfYSkJcY8tMv138rQbaZvdVhbmQakOFkOuxG
	7l
X-Google-Smtp-Source: AGHT+IGGaTpxpgNC8ciQSQqiqJUywpj2+O3W4oFH7FhMd41eXjxSmQvEhN4sZcxR4XzrFlG6iXv0kA==
X-Received: by 2002:a17:90b:1c07:b0:340:d511:e163 with SMTP id 98e67ed59e1d1-340d511e58amr540915a91.8.1761990485008;
        Sat, 01 Nov 2025 02:48:05 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8982117sm4722357b3a.15.2025.11.01.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:48:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DB82841FA3A8; Sat, 01 Nov 2025 16:47:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v2 6/8] Documentation: xfrm_sync: Number the fifth section
Date: Sat,  1 Nov 2025 16:47:42 +0700
Message-ID: <20251101094744.46932-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251101094744.46932-1-bagasdotme@gmail.com>
References: <20251101094744.46932-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=bagasdotme@gmail.com; h=from:subject; bh=VFD6GtIua5YG7zFmjDzL7GA/HqAr0MELlfN71DmH60w=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms1/J61eMXh5r+5VtpuJ9Vae2HZ5pck3/9ZC9+wrTmo CDvkzsLO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARUUNGhp2cd7vve3/YPVXf p5gnfWOM2NMCjeUTV6z6s+aziv7rI38Y/tl3/V3BVPIkw0ZqYnR3IM8kj2mXPBdYrq8qvHHN4sh LWy4A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Number the fifth section ("Exception to threshold settings") to be
consistent with the rest of sections.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_sync.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/xfrm_sync.rst b/Documentation/networking/xfrm_sync.rst
index de4da4707037ea..112f7c102ad043 100644
--- a/Documentation/networking/xfrm_sync.rst
+++ b/Documentation/networking/xfrm_sync.rst
@@ -179,8 +179,8 @@ happened) is set to inform the user what happened.
 Note the two flags are mutually exclusive.
 The message will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
 
-Exceptions to threshold settings
---------------------------------
+5) Exceptions to threshold settings
+-----------------------------------
 
 If you have an SA that is getting hit by traffic in bursts such that
 there is a period where the timer threshold expires with no packets
-- 
An old man doll... just what I always wanted! - Clara

