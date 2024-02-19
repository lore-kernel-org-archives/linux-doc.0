Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37682110B
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331095; cv=none; b=Zx3hTBwLhlWfcOOUl1dHd8GpROB8da3jMqGxR7TZ/1yYOhassLLEwuHhUCLWKO92vit/yTeDIWnGmvJT8bUain5ASawHFc98AOcoGcdCAc8MuzWvpDT6sydAFHpys9UtuKV2QyxiNtwLcPyYR2jwlteUXzyGwVb3RUNhrF91aIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331095; c=relaxed/simple;
	bh=Cm14M3AOqBWIacANhQdsnkUQYFsqmJsGStrT+CQVFWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpTn9vbGi7eWLmKf2u8H6tohabfxBKNYY3Hurxfqb22Ow9ueNNxu+/3XzWHSYYEngNpYltAWFJZ10Ez7PXO9jlqBzRzs4JoNWJag7iG7bsZ/ZFZY1tQqsyJu9W8Id7abUIX7eACBUIOVXby/SnfowC8AH2C8FwE1JMJqZGNdcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4fZ/f4T; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4fZ/f4T"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so2624861fa.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331092; x=1708935892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0JpVlr3Rj/c4Qzm5arTBdHpNayVsgbTN0Vg0UGksGk=;
        b=Z4fZ/f4TJxAZuPRdfcvK/bd20ufUUsW7nAuzMxmcoNo+EHh8HOJNshGBJqcLtwFSzI
         uE/0sib3GZW+G8drTRaj6ZH04uw0WleOTQQZCkEU9uz29Daie6rOEekxxmbZ59xzKhO9
         6cFK4fL7O6I5l9B1Q1TXYaJ8RY1jGpyp3cGEeeTIyo1UfgV7ziyXPP+bfBdSa0v4iPFu
         G1/hACpnAhJ3YYLJli6i3hzpLuwCz96MFsqSuWQU+RXCu2PGCHNwm8hz7dJtH8YXiayT
         aFQSNsgQsd+werpTFjVz3HDYDuBjaACnwJDzGi/xXDYpw4W6G/tMEbrHN+Zcg7TZREWo
         R3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331092; x=1708935892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0JpVlr3Rj/c4Qzm5arTBdHpNayVsgbTN0Vg0UGksGk=;
        b=iPdz5CkhTG+A0KdwnJbTtm+Q+HeFodT8tk5GttgDh4u5MvXgn5zhRVRPNZwRSPLZ8U
         bSJtR7Nh+cMUYvKayjEjKctBFEz9/3aekiUyptbG4s9oBcXve6jVfW7q6ZeKZba74XAI
         95+GvXkV6MaT5BMRUhvjFLUDUb813ehsFfpsYr1tkupaByPlMvkOnlKSYkL4WlkEOR73
         XmoXxFRunqP7DrhxSi3amntisXmn4fW+zc1Jj6Jo1MLYQ71iXvPKfDM2nFHmn3bD/62O
         gFq8VKdgmhzxy9+IevElLKcILpE4+57Yz8QB97zfbokg00avOkZv93QCZs8YEcA9GM6m
         0BLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpGBz8QpJ/TRF9flKde10XNVhYLJJC7aja11EECzYuYDQpbVhpaExFks27CbTaScAv96YvTlErkAwnAl0wyTgygzb1DWbItJMq
X-Gm-Message-State: AOJu0YxOdICbd1PERiDPVcmV4uIp1c5HGCqYRVXTq2U9K4iMR7EkfSN/
	AB6dAOupThFk60cIGW6i6lVsHgj4UpGGbEaybxjXrFQxAX0uDudMahtPAZN1H9I=
X-Google-Smtp-Source: AGHT+IGl7NEY2uD3XDkNwXB6bSFXBxdMvVaR+g3ETTOChrm2nkM6lK7gTzKtS2cVBknaGgBzfdrNGQ==
X-Received: by 2002:a2e:9048:0:b0:2d0:de72:9d47 with SMTP id n8-20020a2e9048000000b002d0de729d47mr7790373ljg.8.1708331091929;
        Mon, 19 Feb 2024 00:24:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d420e000000b0033d282c7537sm7047857wrq.23.2024.02.19.00.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:24:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: MAINTAINERS: add "Profile" keyword entry name
Date: Mon, 19 Feb 2024 09:24:48 +0100
Message-Id: <20240219082448.14157-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HTML output of MAINTAINERS file prints "P:" for subsystem profile,
e.g.:
	Status:   Maintained
	P:        process/maintainer-soc-clean-dts

Use "Profile" as this entry name.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Drop duplicated "Profile" word.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9c3100ef587..36fac6b3499a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24,7 +24,7 @@ Descriptions of section entries and preferred order
 	   filing info, a direct bug tracker link, or a mailto: URI.
 	C: URI for *chat* protocol, server and channel where developers
 	   usually hang out, for example irc://server/channel.
-	P: Subsystem Profile document for more details submitting
+	P: Subsystem *Profile* document for more details submitting
 	   patches to the given subsystem. This is either an in-tree file,
 	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
 	   for details.
-- 
2.34.1

