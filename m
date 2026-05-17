Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAE3C2788
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 17:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037288; cv=none; b=Api7ThYUUG4LiWrwJOx6s12YjLXDZ8iegGymQ+Ri5Yk7f+7PasoyODRfmEVf29LouAz+oOqj/yd3n342kAiNRVN64SHO/DOIg7q8AM3SUHzj9WD+BjUI1Mlo5AS4dPPduzb6st2FP8kEAF6uYziXc5YzTmqg/aRT1dTLnWffVxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037288; c=relaxed/simple;
	bh=QpDJWtwhRx2DgAxOzaZv0LmkHcMquKEcvuDpOL43cYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYbFX6qY/qnPKmFAvOR9na6Uv2gkDwO1tp16Vkewvev/p1N4MmDmNyGRMzGA0qslJgQjILt2FZmjTI/IzoElfu0Yd12V9L1ccVAQxY3BpsNCkkbkqNu6IeWmhi6WM6nnVWXaxHSVkpKXZU7eiaQNpuaAyvymwbq6Kn1do0LFy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Whs9/7C7; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Whs9/7C7"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7df05fc49e5so1680790a34.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779037283; x=1779642083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yipHWAGn3k6dstQXzJlgc9fTRy+Q2C3y6WOEJwPv3hc=;
        b=Whs9/7C784qwD5Vb/7yfbOOCOZjN4dDu4m0xgLi+LP9hOQGxErGD+kR38lXop/VM5r
         cV2iwSik39WiqjgHsDuSQv+QORRPFpRe6bljy4QSQYU7Wx+LK24QZHXCQ/W7mvKicA+E
         xkFRT7nEGMEgJLB/4FENp8JE/yoLm+kig5l/UQaKlF33tuAEJtRGNpOGnAA189dRohZa
         Gv3A/VYvjE9jKR53suAdWg0y7rM36ij/n04FNCweIDPr7fAUpvJi1pmhbZyFXVi38UYq
         JJTe6JcbUvY0/pF5F51YGUkKx8lskXwlmDcMu4xMR8mblm3x7HJJGj2wiNF1CLGYqAw1
         /n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037283; x=1779642083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yipHWAGn3k6dstQXzJlgc9fTRy+Q2C3y6WOEJwPv3hc=;
        b=Fk9tGd2JU1giXZPjAKyaWu7IDsOjl/rEOclpz671MuW9ORErsmP3p5vGpzxTd6ZXuo
         /82K3z+db39AarekvYrE2L6DQqOwFDA8I7Q99XAosxg5I4ltRkDuYlvam4YYKMU3nbP4
         +GSkKOTKiXqlI3vGt40wjm866TMtRGBKeSeVCGqAsvG3pHhiTh/mK5smxzalXsBpnXVL
         MYz6pSW/PdQCaId2++DmZbonq7SJf+ZhxvWdEbvMVcRqDmByqVJQ/dH/HSnXBb0k03w7
         LceEbAQyC9x40xUnpbVPQn4kSjwjcQVh+B2Vw9XRvRYvAxJsZgIaOZPQwLm63dj2MoaU
         QEgA==
X-Gm-Message-State: AOJu0YwekM0R/wvuEClmW1xN1GYAuelNZeTGi7mQKOiS/ef22p7ckOZS
	7TDgM+XM21DJLzF/YMhGTZY8223mALG/AdCNcroZuzaWYkYAnLMhnT3Tw/3WrW0/XcU=
X-Gm-Gg: Acq92OHrvMbCQvxXW7PFfeFl5jO9HfBH2rLVfUhwyOJArwFPGkSUB7FwL+Tve9yoifh
	tJSY7NCbb2x3lfV6saz5N0PqbN1CPfgJuM3+r88MdmFQbgl8QFxfY/zD2ufhfssNmCf/zPpHPkE
	DULshyDYdTJ3AgyhixSTJYqZX28/U9Pvkw6x0PVKdpRiEh8pcR3uZXr6zmkLywW0aF9EliTctgm
	zoy7NHH2y3kAlAIZv2t6G1Q8toI47/YCbLHZrdu7WtPS35HSVyB/GkBPYKFctxDFj7hCUS8IvxT
	VEMfuOfzXaFMjLp9wHgW0TneFE+iW1fDO5ExBbH8y0J14s+YRVnCXBk8aiL4PpC6vlLgJi/SlkP
	fS45AHqbq1ko9XkTU5S+2GAP+5NB59aMzutTYLETjIGfjjYUCUdRYNu5le0DJL2ow8oXl6AITW7
	tW7SO4u54oTGlRTqIAUEK997rT2nA=
X-Received: by 2002:a05:6830:6616:b0:7de:51f3:e7ed with SMTP id 46e09a7af769-7e4fa0cc2d0mr8672950a34.26.1779037282858;
        Sun, 17 May 2026 10:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7c68d6sm5890859a34.3.2026.05.17.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:01:22 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 17 May 2026 12:00:58 -0500
Subject: [PATCH 1/2] MAINTAINERS: add match for IIO API docs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-iio-doc-triggered-buffer-update-helpers-v1-1-7f00d4188f6f@baylibre.com>
References: <20260517-iio-doc-triggered-buffer-update-helpers-v1-0-7f00d4188f6f@baylibre.com>
In-Reply-To: <20260517-iio-doc-triggered-buffer-update-helpers-v1-0-7f00d4188f6f@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=QpDJWtwhRx2DgAxOzaZv0LmkHcMquKEcvuDpOL43cYg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCfRThXlweZQwoMnIe5R6VLjY8Bp4ic9gssvbe
 8D/KRE+ApOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagn0UwAKCRDCzCAB/wGP
 wKyxB/wIM6zib71iX3w2Jr6wlJnb83EdxHPdxpPW9sgPEKVGP+4Tnl1T//BmSGSvJygrVUgsoMm
 EdCFXg+23uG4iI+IS6BjmJmkFQ2mdS3KT1vCkxQAPNQ9gabbUW+/JixtIa9/2tyCIWJm5GwiI0k
 /5Saht3JW5QtcH2jBYPJHF7GtTvBOkSoKdWpvypqbi3yvVeJRTL1Dc59qHYmbNt4VRD+ng9S6Kw
 2jh2B3R82Q2kFRXqW8ELvpS/8jCw7MnJFbaXSE+MMB0lug7cJxap9+O830gdf1ppReIyXJ5lex+
 RTLuLm4n3q0Ej7aSObwjw8Oxj6WaeBJ24fopDaXgiZM0le0Q
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a match for Documentation/driver-api/iio/ to the IIO subsystem in
MAINTAINERS. Any changes to the IIO API documentation should be reviewed
IIO folks.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0de74503df08..d14854677649 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12512,6 +12512,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
 F:	Documentation/ABI/testing/configfs-iio*
 F:	Documentation/ABI/testing/sysfs-bus-iio*
 F:	Documentation/devicetree/bindings/iio/
+F:	Documentation/driver-api/iio/
 F:	Documentation/iio/
 F:	drivers/iio/
 F:	drivers/staging/iio/

-- 
2.43.0

