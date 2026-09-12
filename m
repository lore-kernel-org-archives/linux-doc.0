Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742033F1ADC
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197533; cv=none; b=fobMtogqWDBBp/3AxH1RgFSWnEKdVU2b06vZEvOzHyMDQpr3pfvC0PQftfj/RICzOZBD63DTIU0UDZ5yuHOLFe03IZnvcUKIIYRANbVQMPST/Zb5gpEICUppDCMybzdzXumhQ9SG+C/9XdeYQ4TUfag64nO0WZETtsBy/1Ylqew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197533; c=relaxed/simple;
	bh=RNy0Oc1b5YVJpZS5AO65ioCXwPG1K+v8mTvUlX+rTyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjNx7bzBA2Gk//V3ThxhDE61MtFtzvwD/f4LYsbnXg0hRwF14rKtAo6tAhahblm6Omhkhci0kuUnUeBm7KyBRvfGqvTsO/Fsb+0GW28INvfF7s62bhDHRXP8lHubCx0+y6zacfixiBOfy+I+kMZ8h9j3FOocrzma5jF6N9USXhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+tBeMaL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+tBeMaL"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a49a40209dso14520731fa.0
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 00:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197529; x=1789802329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=i+tBeMaLpJsVRd5NtZFvwfpAYPw2IkUNxdL7HRV+1mzv4sR+y8lf2sh9y9YarFY9re
         bzopurCtaZLwNiIZXYHIEHb2byDa2my79AB/wPdW7I4hg1NDO/IrE6g+6OxgobWoNn6B
         Winja3vcyuDrdaXJIv7unmnS6624r0lVIs7PZIgrw01NHA2Uic6fNYiPwHUpiDRpFpl6
         GvTRAKx44XjGES0M3D/vKuiE6sZyuGActsqMdpA6S3hRRnMYrj1iKlBu0lwQ74LTm1PN
         tlVN/kMqCwn9oVy9ugz/Vs4RKU8BSYmRODMHd9IoIuc1OzEs6jCgUnbtwIwC0qHXhJZq
         JIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197529; x=1789802329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=OKwk7XH6rlPdWucEGjsfP4qFD9uprvVWOBOOKB3drsnjszbCDGH3u63rBfeQCQppDh
         Z7XHkpkLEWmIL4sXVcwkn/jPF1ZwQc4dlvjHU/iMr/dC9L29mo7zFzQHP8KPmk4z0AwP
         7nuz7AN7fIYkiAvKipbHgy8kD1P/wOg/7trfykXEH4FzwlXAvnCWibvncHNmiiUhsGeZ
         be1zCNr+TEYNqXBAf1vTgInRAAgdM7QG6h6r4mO/pkps1vK2b5PrKn7jR8FuaHq2goAP
         N4W5jWmSK7/8qjWyXXL363WNxjPktDdBiJzOaeUT6kSCFr8PndQg/mUXIP0UNCWyTpV/
         feMg==
X-Forwarded-Encrypted: i=1; AKwUvBz1xq8+cUDZaP3wLux1bYVQfYuhIm8M39hq4WJfyMlsNJdx7rpXntNue/2QZKhQbE79YYFdffG4ssY=@vger.kernel.org
X-Gm-Message-State: AFuF++mdNhdD/KS/Zpj/d8GAz7uIiXrZ3VG5eLO8k/f+CEu2xwXw9lmO
	tRaON7uDna24tGib7+S5RU2jeDpHMo+WplVzso5keCeC3RrTqeyVRF6o
X-Gm-Gg: AYBFou3ahjMOhA4U3DlZ22Xc3vVpGC/dDV/m1xXeH+N5iJUSG7Rg1zVqjGGppkI13IM
	aUf0ly5GapAkMEVIKo+t7yYD6w+1eiYeIVBJxJWEd0kw+bivs+yFfaFrrTOofPrdoHISZgseBi9
	4W6TFeevghD4A/mZm1CaKIrb6UZML3wQlGFjSRE1j8fCT0goHL38WdlaBQAdbM61i28DaDMDDiX
	05zeDf9ok5C1YmQ2o0tpFe09YcUgA33DjDMzuuMDXkX6gkc9SOWv3gv3W0OxtVOVDJwR1KsY47S
	SYa+TN04W4PcFkoUEBRwXWnUdhLZq88wNjzFbGFzQxneEuC/LpCQ74YH0Bb28GtjnOQHigp6Jl2
	uqdi+R9B3X2d+Ytzshk+tH8r/TQ6KCF+c8fnVUTmMuSTvmC/f0YAilERWmg1iTbtgUAK2nw5clB
	+DtY8bCqexPQfOTCb/8ffnmg76gRDXf78unC7f+8jZKZX/BJCBTwTQH5SsfJjcM4/TZKI2+Ro11
	vIxLg==
X-Received: by 2002:a2e:a596:0:b0:3a4:68f1:8bee with SMTP id 38308e7fff4ca-3a59108ac42mr14680391fa.6.1789197529066;
        Sat, 12 Sep 2026 00:18:49 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:48 -0700 (PDT)
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
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v3 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 12 Sep 2026 14:18:42 +0700
Message-ID: <20260912071842.622696-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..cae0578d32f1 100644
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
2.55.0

