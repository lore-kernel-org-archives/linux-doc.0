Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84D537C901
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597347; cv=none; b=csZHPOdmrNDs2AnPm/5PlQaNr47oY64aGrNCg84XifdFzstoJIze10hdJmHIiEH/vytiLXil9P4Ve9Phi5dfvqZTFQ9FT0U1izPsMlnlFGHkl0+tf7RJkU8kdLX12ad+ZgrUtH2difsmRfgzhOuLSaWK7cC1hxApjaWzwS6CjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597347; c=relaxed/simple;
	bh=TPoZ6+NuiQpAFtZR41q/UFp19otaIgDqIXSLP4wvIPc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DexFK3mg4Q0lNNbViys7W7zb0wgtN3IbKkKFX98DPyJrJJk56A7pDw0A0/Rxdl/MiJAC3fHDTPeJQ315gJq/f2DCFZ24tBlLAcCdulNIbI/ilgi0goYQlbEylqyAqfpeRURBeiaLyuaNBwV3OoIPCNhL2QBmxQSku/kCPbCuKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9FFvAgS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9FFvAgS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e0c167fdcso15819441fa.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 14:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775597344; x=1776202144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDzKqm8/QmRt6x3j4mVQBu/1EzCW8tbOIRWcSL4bOMU=;
        b=r9FFvAgS/L8MwRwqjnWNFabbEW3eAh+O66PFqXRvYn13C+AO9yF2m6G0Hh5MDf5lf/
         RphEZhZLL7IcGqB8CSy91/n0b8o0bpFjelErUOz6qXzKczr/VbjApEMC2udDxVUEpFH4
         K1DICu9mLvRQcW8er0yd18S3DnJ+2OsgdscYX8YqKPUV1JudttCRB62u42j15HN6I7TJ
         vLHeg0h/DN5MtCrsKntvPBhdNHXSXNOWHxU/XsI8vFZ1T+sHgFfuN/AzMbPxXkE8XMb6
         odgtuuCgbPoIkytVlldd/Vk6iExTyJzk99JhgdUbjhJUC0/fSbB9VQIGj/26YU6khSvX
         g2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775597344; x=1776202144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDzKqm8/QmRt6x3j4mVQBu/1EzCW8tbOIRWcSL4bOMU=;
        b=EUvKl1haXiImOovAbWlTd8jPZ8lvKGDDXVujkt00mx/lLRMswR0qGohVgR+bYMHlDS
         oUvM+gWxUFw4iYWyTtzxIDZbXI0hIsK0vbk1ShVC36CwuCFqueNO3y3frurfMlfl39L3
         Mjw9lJvtQBKojepRjpOOU0c2mEaJMk7rAxje4DoRssEwChcV74cqM4K1iKlfS5PhxPl8
         VIuyblkduq/m/IfTIMByfq5gYgpA/cnBTdQstDCdewtyQvJryx33ry0eYIUg3v4eZd+w
         DEnl9BPn10TMxDgB2vQezW6U0DiZ2Mrzjmr5d7w7EqNA0zo2OEvRvsmO7NeXPRmE3Q21
         3WeA==
X-Gm-Message-State: AOJu0Yx5BuHMlZMv9Rp26xAj+UCS2L86IcJciE1TAeZirU4vwtRZOGEv
	2vZEv7w7u0oXa7tFHPHd4hqVx3BwxiaTD8xR42W+nOF73Q+AoKHEGkT8G1d6q0XE65kU6A==
X-Gm-Gg: AeBDieshRzxk+BuxPoWTs6xs59nwdEKeHDsKHyNvNKJysEAI5pBmEiRW0Caieh4bXgj
	XTSGTdSDMdGn3c6CNslvjpFywPWw8UjmOZt9N93Q6+/eII01vB7TNNh1qMZa31P+UXPvP+q1pIh
	lsFtD/PI58NegwvigBuPaPZyo/PQYp9At7qwe/dxoC9OZYeVS9A6PNdd/iCGOf7kUbUqD6lRNko
	v6piRNkvgFQ9BgAQSevmAs13fCeE0MvazX2I01cqvMxhCpONnW8fGFR51sN+XdFj4hPfH8vE7uJ
	MJUrBqKjCwb66IJZtR0COstp0496Jh41Oj4gffteicyUy2UaymAj2dVGH9FGnaUYSDWTOHupRKp
	4iZu2Cdle4GF6XopRtPVB7YPC1Eg5TvcNetqCuN0aw4p3EW7EF5Pbf9Yekx9ZRpDgLhIL6BDedJ
	5cAKFDVXZHJnKeer+aPCipHZOrYOLNf4YlUiBYAilHWpHZVLO6k/IQyi/nCxCn+QVk33X/Nnk/Q
	A==
X-Received: by 2002:a05:6512:114f:b0:5a1:3d7f:8fab with SMTP id 2adb3069b0e04-5a33755054dmr5413293e87.6.1775597343779;
        Tue, 07 Apr 2026 14:29:03 -0700 (PDT)
Received: from localhost.localdomain (95-24-197-185.broadband.corbina.ru. [95.24.197.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9cb95sm4228600e87.23.2026.04.07.14.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 14:29:03 -0700 (PDT)
From: Gleb Golovko <gaben123001@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Gleb Golovko <gaben123001@gmail.com>
Subject: [PATCH] docs: fix typo in zoran driver documentation
Date: Wed,  8 Apr 2026 00:28:18 +0300
Message-Id: <20260407212818.925-1-gaben123001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "an a few" with "and a few" in
Documentation/driver-api/media/drivers/zoran.rst.

Signed-off-by: Gleb Golovko <gaben123001@gmail.com>
---
 Documentation/driver-api/media/drivers/zoran.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index 3e05b7f0442a..2538473c3233 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -222,7 +222,7 @@ The CCIR - I uses the PAL colorsystem, and is used in Great Britain, Hong Kong,
 Ireland, Nigeria, South Africa.
 
 The CCIR - N uses the PAL colorsystem and PAL frame size but the NTSC framerate,
-and is used in Argentina, Uruguay, an a few others
+and is used in Argentina, Uruguay, and a few others
 
 We do not talk about how the audio is broadcast !
 
-- 
2.42.0.windows.2

