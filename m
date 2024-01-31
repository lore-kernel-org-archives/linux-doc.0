Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1029C54BC5
	for <linux-doc@vger.kernel.org>; Wed, 31 Jan 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706705638; cv=none; b=TE+jh/mvovXWikIZhYGXoIsBXGQYU05UrseSFpwa5glpuSMYQVkWvydbILvu8t2soniY+Tu+7UdpzHuCwC7OFr1ERpL/Zz4pCFGep5Pgno5oGhTWqn91QF2ZSM35V/QzVqVrs+oieO3XAcsrx8rU9QgFldTU4RfwtQBsje0OJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706705638; c=relaxed/simple;
	bh=JfeMfeEnN893lB7oRpDj4HzmZahwCizVq6qzLQuZnx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=V+iC4FNxDOKAQnsdjsqQN7OvCJo+hRS5Ml5MWWrDggg4VClksstw5oV29enucOaJGdHER9PBu5pDzr4oCm2liDaPBwW2I/n2fXgD1l6pauUjwYEMzMTykE597ojUFi4CuztQvrFnkrJHiE1UlUrOnu6PaNzPBcHkbh2wEWnlaU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uXiJcRJk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uXiJcRJk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a354fc17f24so478831966b.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Jan 2024 04:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706705635; x=1707310435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7DD5+v6R7La9ObGy1udtBj61vuNh6NTN+5s93nqhEA=;
        b=uXiJcRJkZ2x7RhCMDwTtwLwZLI54unGjkiIa1ihMa7YrEeFKVrrd6BMH3EuCnjTje4
         gvOH2wq2Jddv8xik/G0D7srR2e4Spm7hvn/jxL9Gz5tl0a0wsUSytjTTdtcTsipmO4T4
         5Y8QbDTw7MeDs3m+d1fkFVRkfNVFMYPz2awRuT4/qDYlA39ydlqOPVcI4fbceE8yzVLy
         MAoNY+m50KT7ExXeekfLpNSEUpmn3mBlDm3AG3y5UmlFBtXVKgXThx3MY7ei0j6l0HdX
         zyZC0gZHBi0i5Aitew5tHqORh9WxmRJCEQZ6j8DSJIpotcMlO1TGlJwywL3QzUvQTLD3
         AJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705635; x=1707310435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7DD5+v6R7La9ObGy1udtBj61vuNh6NTN+5s93nqhEA=;
        b=tgbaMayv8KzC5+cYn7OgqlMdSKqmFWSg5X2chmYDIIWUSbhx/KexPZif/PKxU2cyM+
         eGYnBRcgJprYKsFBZWgZqkh2sBlIB1mCGbqm8OncgBOlrFu/grfJSQA4Fu3dqrGN9SvC
         YPJXqQ5g8YUCoy8iVAXiMbVRWSXHR594lW/UGvaYZ9rCGcIqJ3PF7CkvtdsuwmODuNRu
         MXp6Rkaho4PpXRwReDRS8Z+EzlZQ/1cUnN1HkbX5TX3o1nRPRqfgErGIxz21jSkoZ2qO
         1GbpGh8V7LWzEXrOLoUnoQJ70YWApnFRVXt22CExYm40xHfOgNeOlcdn+a/Le+ezkWdj
         xgrw==
X-Gm-Message-State: AOJu0YxuDe0BQEPc3fPBPfOgQGcItQkAsmQqnKypZ/NJ6qjKahiVgkKo
	LlkiwI8LJB98/JDMun49f6a83Tr428rZ8tjRHWyMJC3c+A6vwT1Vw++Auknd3c4=
X-Google-Smtp-Source: AGHT+IHh+5E7WDhAyzWWQLM2E33J1ndluJSuDHtMHUT4y5vtHkbpPBVpifO1tfGUIHIFqW68HNw1AQ==
X-Received: by 2002:a17:906:28cd:b0:a29:852c:dd21 with SMTP id p13-20020a17090628cd00b00a29852cdd21mr1040061ejd.10.1706705635294;
        Wed, 31 Jan 2024 04:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUAX5xN8J5gbaX9xvceyb8x4Cb+lAf5LMeiNd8+WxkOWeM7R5zIwvApPFGNdY6hzr+VW8AEQUKOxWA7BObDWUEQEv2Nu40EVAVXZT2zN2IoJ7Jn07tHg1aamojk1vdxaMU2GOMtMqknb4AyfDg3qyTYRs/rlqlcMxYaewIKdKEE3mzo
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id vs6-20020a170907a58600b00a310c9d0cb9sm6092652ejc.121.2024.01.31.04.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:53:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] docs: maintainer: add existing SoC and netdev profiles
Date: Wed, 31 Jan 2024 13:53:51 +0100
Message-Id: <20240131125351.123509-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the list of maintainer profiles with SoC and netdev.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/maintainer/maintainer-entry-profile.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 18cee1edaecb..b49fb6dc4d0c 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -102,7 +102,10 @@ to do something different in the near future.
    ../doc-guide/maintainer-profile
    ../nvdimm/maintainer-entry-profile
    ../arch/riscv/patch-acceptance
+   ../process/maintainer-soc
+   ../process/maintainer-soc-clean-dts
    ../driver-api/media/maintainer-entry-profile
+   ../process/maintainer-netdev
    ../driver-api/vfio-pci-device-specific-driver-acceptance
    ../nvme/feature-and-quirk-policy
    ../filesystems/xfs/xfs-maintainer-entry-profile
-- 
2.34.1

