Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631429;
	b=vkW2AHGZQ9CsYGJp690gMJ2uF1A2RqOL9cdouPt0NQjKLvRTpx/qL4Yy5rRTabng3KP5
	 nh2vZoSRCiH2gKl8jCqOPLyZTMFMZJfgsuUps29oJEbNs5KFGKAITmEY0s9dn5n3o5BhK
	 qBXSZs23n9+/wnFQZtaHpqOWvMX9MP2ipWmr3UdqL1Od6nyEv9dHBsXU/0uziMy/B40+B
	 54tFzAOv3OkmChoCDxa0cwczlGyts6fOcyyH1BXb4Kf7wCHij9TysnCgbxjA/2uuPFBau
	 KPPgamBHsCFMvlUnmLztDiCJr11/nBnjUiC1WE+2lBmTuAogZ2/Cxy0ChIjO0zrSwBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
	b=UovEC1YPR3e7xY5+AqlN2HcPjTELnPjI/iHOZuYk5587l3/ysukxS3gqp0ugd2J8wQ1w
	 y1oEbHDqtkGUf0J2ih7fIreYpMV87GVCeRKsRKb7SAK6SoQ/T+ctnFrUvjFs4wII9aQBO
	 834hDFKPjqn/1YJe9JTakHyJyMioyN+LL/HxY7jm5C5aOtIEvbBEJ4SgjxS8ssUpgIqkW
	 2ZxqdubXTV1YFj+gZr1EExwyxpJAsx3sIT8A/B9B4+sgLBBWjEmeMk0Kp+S3yDjcsVI2l
	 +/2XR22Ul4KzXP/ie1cUb4ZZJItKDP/cfjhDlVUFuKJOqBWOc1jnlWVcatjQF1Sx1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVQQWG51;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45331606A332
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 04:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45331606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVQQWG51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so1805445a91.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 20:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631428; x=1795236228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=mVQQWG51WxgOyi4sW25blqBdXCGTiMv7/Kx8sS+Sp84sDdOvRC2LuWWs/y5MZbLtVZ
         fkYAR6NnuuODkeM+bcK5SWsOovSxWyQrWg2uGFgcl0byI7/buKlpZ15O1aTKjrsTlHDK
         wGomNTdxRSDsSnNTDC5nl5FnjNjceytlZrIDTZxFJeJiWPn28e5Vwldns8qHhuAYmfov
         5n8JDwnQwxoioLYqMrQh5J77hjKGCChSrlU5uvB/8MaZ3yOg4vDcdqf2lgNh7Pu4B4Be
         wnuwD21MhMrIxC24vF+X54a5HR6jUN+WLWRX1NTCCWW9ZkPZqgRTW3J1VK5xTCmaNHWf
         dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631428; x=1795236228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/Osil3p9tI+TJ45W4tyUJkbTxb/QirMyt7rDHJX8Ic=;
        b=Lr8UX8zRHgjCdhJTmvvmfRMm9CCb/yt43HlSXaT4X5HsMo6ltnZOeCnu+spnx1eDt7
         QIi25dBQpbf0zgdAFmyoy0C/YILZdQee3kVKRF7/ipJ4Iox+cAkb/u9gnV27ZqPIoXD/
         R535z9Dc0K3Dlqp8qwVJCqb/QfvyhyRuDG5AYlthCfGmAvW+9nZADASrM34afnsEbivG
         Xs6E7D/5Sd/RHI328c+NU0rYJ1o43EnnkbyMiEeGqITIUTRoHaCJKJonjCtaOQjEKKYH
         1+ng2iJsAl6yrcqrlCcG2eOZnhQFuiMQTq8A+ktjjRjtCqY4rUCuxbnvPB9QjmzCobgy
         G0iQ==
X-Forwarded-Encrypted: i=1; AL+hErG4U4VDsteVITTRBMLgK2nCwmR4uhWNWLAePiC30R/l5mQI+KZv0h1XzuhdNvA3/0RsXj7NxeLNiYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TVMpEc3uj60Q60uMO9Qy9g79EAbP0Q5/5t4LJ5SrPQ7tx/v3w
	DzLxKYhtzUX5N/hOgBpe2lThM/ioskwwRJQFJiDKkjXOgC0A7fD4a+cU459pwiCRjrOioA==
X-Gm-Gg: AYBFou2u4rUjNfSsPr1flmfOduCNtmPBXPUy0i1BY2DQXR1l8creeCbNuJ01uGwZl5A
	K1iw/sy7POQPQcVSly1eeaVMWoA+oWUorMeeleyzs6uVTrQ7IrvtqnKAGkQ0ifApkJPme4gYs/H
	x446BGbqZqJ5iakcZmHFyrIzIsz56NaCuZ8mTnSqkFDJ+3zoCn+4ppCJm5DZNMFr+UldgVHyLYm
	yWlgQEX8prOMMzqnZXlppj4m076HpSy0uq3mrKt90H+QWplLaeCpzM89C/S3wyBM8o9j7gDNOgm
	EGT+/hIDCf1Fu8x18xMhwV9cHUvWWJVp/KZYNTNCD3TZOT3TOqblUSgK3J9sSF/5o2Cqjp6D0Ga
	4QbOyEUF6AeL+7LtATARV6qQjhvGN1aQAQUZKRqLhiytEk8GhXi292SMS27sQ+996ctm4OStkrg
	IKusAGEivU8UEnmpkm836PiC5rGFy1eI1sO4Aq+3jwsA+Al9gNo7HMBcEfffAcfxogcgQmrN68l
	xqIcgy42icBzdPclnPRT58qt/bzeFQPcV0X+7VJtcBwv59ZJ61Wi+HTPUWVcIsl5oOOpYCDa6Ao
	ABZk0iNHrStcQjDjwfV3z4nSFtye9hJDe10=
X-Received: by 2002:a17:90b:590d:b0:3ac:a7ee:6770 with SMTP id 98e67ed59e1d1-3b1b087b76bmr4366544a91.7.1794631428549;
        Fri, 13 Nov 2026 20:43:48 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:47 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v8 4/4] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 14 Nov 2026 11:43:04 +0700
Message-ID: <20261114044304.245684-5-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed in debugfs, and with gsp_keep_logs
they also survive a failed probe.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.56.0

