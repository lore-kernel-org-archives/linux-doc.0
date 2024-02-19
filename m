Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291EE8BEF
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 08:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708330940; cv=none; b=S/CkqP3GsLAA/AdtuqHvQhculhdbc6gzWQ+aIpk/cQ7eNnCizfLdbLnVglgGhb2/4MG0797M9LO7c3IVYsEqAuT/MR+OmOt1700wte+l0Pb9KDGu3kLaC2zqqpkoWbiNUWH278HNIlziYxWeZsLwdOKfQYt2yTI7B2HWkDXmIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708330940; c=relaxed/simple;
	bh=FvBbTrLHfzMAs7VtoWvq0W2MIUhWBuAqZ0NPy17yAQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u8eSGbuPrOjwKyNjbqGcINMpTIhpLku8L70AvwuC/zclwGIJ8qqWFoMwU6nrNR/oMLEgGhLmDK7vz7YU5Yie6MESJ2MsRgjudOg7sELdaIhBSijcCYsAQtzd+NpyhyHdBvCTvB5fTnRSdWrgtOVnvOdxCsZMqg8pBrFtVBCsAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqQYis2J; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqQYis2J"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d0cdbd67f0so57404301fa.3
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 00:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708330937; x=1708935737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycvOyJbv26u3Dhx0FmRMkxR9ksBoiOuJ0RI4MXT3nOI=;
        b=YqQYis2J+7HZG2tUZWiYo4PsGnEEhzPNX77ns8wPYZY1L6iI+4RdrCaYQr+xuCzCmP
         jdXV46UrhVTFtQOJHYix7T2rEx7CFpiHnzRj15M9/MAqPlNYdiat6U4b9c8fe2rNHiFM
         Zx7k8jho5Kk4W1GMPrTKVGUcY4Bq/rlnXSrFzL6x1stWcWSmaROEcvgJRE687oF0GYDC
         LjnMv8iamnVeGOW3WDomvUurtD1ml3OoPGnWipI7OviYnTZ44laN+z3LbTOUMmvyqjs1
         xcb0RMPb/r9t1PYS+aSxLtAST6av7OhWEsC5+KYsGV8YInYgwfmbKu+fm1efIgaP7jVD
         Ra9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330937; x=1708935737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycvOyJbv26u3Dhx0FmRMkxR9ksBoiOuJ0RI4MXT3nOI=;
        b=XnA2Q8KyG7TW0VDn9BQ6M1dEDubnRljLm26pPHQwWH4oCk23IIWaZArlu992HGBxw1
         vbaushDBkfObvnk8yIlmEpjM46tqIFoT51m08V6q7SMYfsW8jC3j0lmYcq33pAt62uAH
         0XELDRyjCsFHIbWgRXyISLEsJOpuQG/iIIpUjjhen1pI5t7QWr97fSHiKb+MXxH8jBZt
         hl+DzOmTFrgaA6nlIVbe/ulRv7Q4anZXNkiIBDzZhFsXwJFOH2qm+F3z3Q9r70DWv1TA
         KHk4D3EUws0nzm8FZ16qDOmHCBPpiVpqMFFgodBPspWVl04G3g1+twfMM+6Jcacck1Kc
         yvoA==
X-Forwarded-Encrypted: i=1; AJvYcCW1O8dJO5dFxsHQ3qBKaq8tqnoBsf8Ng73S41mGttaY5iZ4dgA1+btRqQOlFpVybH6onX6IF3n1M+3GFyCRpp55sivIW61v6q2r
X-Gm-Message-State: AOJu0Yw2EPtSADgLNbZacmxwvKHG6W7GVuzXMLu3LqY4XxdT+nWKGfVY
	tLL0NoTWGc4+f5snJZ/ZXLeo8J6JQmbDGBK4WSjfPiGL9zKQG2cVB6VAzn7/Eo54TUz6gT+NGLG
	h
X-Google-Smtp-Source: AGHT+IHvRfIaq2XgjkibK92o/u6nDYSEPMdw9SGBjJGEu6RzlWl8HQjQntEPLa5yOddMIpYADzYYYQ==
X-Received: by 2002:a05:6512:3bb:b0:512:b694:27be with SMTP id v27-20020a05651203bb00b00512b69427bemr570928lfp.45.1708330937308;
        Mon, 19 Feb 2024 00:22:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id bq24-20020a5d5a18000000b0033d50091f3dsm2214696wrb.8.2024.02.19.00.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:22:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: MAINTAINERS: add "Profile" keyword entry name
Date: Mon, 19 Feb 2024 09:22:12 +0100
Message-Id: <20240219082212.13676-1-krzysztof.kozlowski@linaro.org>
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
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9c3100ef587..35933bd320cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24,7 +24,7 @@ Descriptions of section entries and preferred order
 	   filing info, a direct bug tracker link, or a mailto: URI.
 	C: URI for *chat* protocol, server and channel where developers
 	   usually hang out, for example irc://server/channel.
-	P: Subsystem Profile document for more details submitting
+	P: *Profile* Subsystem Profile document for more details submitting
 	   patches to the given subsystem. This is either an in-tree file,
 	   or a URI. See Documentation/maintainer/maintainer-entry-profile.rst
 	   for details.
-- 
2.34.1

