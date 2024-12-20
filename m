Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B622ACE7
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715663; cv=none; b=hrKDvljl59U3bB8c9hjF9QxIKeg2QX21ElaNTkOslxgC/qUOj1iMf1gT/cgQUnVZkzAmvrk8GF4nhA0mUfU1Qq6JpJiEBQxRbskXp038dQjWZHMFR2miify3zUrxzeWgdO2I/kiGr6nGvInqX1N1yRBsZJzcR6iuR44Me/PzlHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715663; c=relaxed/simple;
	bh=f39usLALOQXGXkbRjF7qz5/fa3n0OkytJo5IeHtjbZ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O6/31lzq6pAS3fF6+Fz4Wj4dstGZD6tEcCw2TaAmTpIOvm/ct54D94QOo8t/pbzIjfr6t1y9VPvCNdgpmDmRVDmlf8lt3grcA13kobOlJNF/mCpQpmEk17jvU9Z3zBHSLMgChIAGiVr/bIvUse8lApLAIxJo5wT3avp6dCHG4Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=soZ9ZYfY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="soZ9ZYfY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so171602f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 09:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715659; x=1735320459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBdx38idi2x6WMKim+iQ0Y5D5QPXHwm1JSvl9+02rc4=;
        b=soZ9ZYfYPJJsrHdsmWxLrVAbn3PIcf1ZPRYD1oGH3M6NqvseZk7Uy+lHUM+hXdg3XY
         vAmLStXR6iB7pbLuCiXiBA9vWxlSMCd1zPsf21hmN0ZPbweVSq8OUOPgj5y7v028Rc2e
         FbJPjYWX/+vQzvlPY12altp2qyS1n1k8ht/30Dh2BhHHjcNCy8CuMt2j5aOyF8eSN2T3
         SnqRZ7DzquPeUAvSkACKmSgx1yqX3vLbTGYtPC01SprRcdjsCOy9cFYram1hBV7Iq9pw
         32GzzE1T449DQ9p2qy1h9IxM5zkAZpQk8Hi/IZu6nDPaFAdTiCt/OUoG9pH1E3wmh8eQ
         oHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715659; x=1735320459;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBdx38idi2x6WMKim+iQ0Y5D5QPXHwm1JSvl9+02rc4=;
        b=A+Wh7lZpN38srAsh39KssIDS33Mchd7NgbSvtimgYC/Cm2I4CtnTWfsSdsLUjo+zuI
         scE/7vkZVQghP/bfzs/Gf8SXfdbZP7T9F1F6MG7JJ1rFZmI1toM35F6ZikkbQuXDa9Ij
         pHPQ50NZwse0g4R3d/6wJsHKA1sFlJOezTlIO2CrfpDZCvMbJkpXHjtr9sD63ZhZiR00
         qPxvHsWblNEYNivQrXginnZigQ2JC3RZcgFQbyAYTTZsb2DI2mm382nXYx1CMWgGH6nQ
         sTgzNJ678b65gBtSx83tvYDgVWNiCrKRLBd7wMqpZXnLi1APNpbd9DcTSSYWLfqTIwt7
         bjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv5xDyMMbLsm0qzqeSCp3q89u+vhMgk+hjPJiHH6eacdunAden97yEJqlSIwFyGEqFusA/juXQ8zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7BF6bieimUwqA8jQ6xF5Pn/L0vxkGO+93aUJwzpQM8zclHPd
	4FKZ8ms/bx7RnWdYg5sXxQKiMHyHo+gkZcAnobqSoL5DfLtbTthZz/zXM/m2MMzysgAnvzZJfhA
	x
X-Gm-Gg: ASbGncse9IFIgaVaWceffRInWZRs5yqiOs3jQ47XIrk9Upmtn4PIIKFpoMyPfiCbeUm
	nvaj5skOyMnhry17CB6l43bslgrlWzOK4nQr8dS/9nP9gSJnJ2vEfLRb27AKb5TC1PKoQyEIq4r
	Aj94gTBWg5HCNd5Ixrja0UCii4uA4/aFoxMIwoYWrKDMtoKXERMoMY8HKSksWrWmxVZSzVlr/NB
	OE9g0RyvDGMUTp96lGtGqRc4w8zY/SQUlySfsMLjpStdkvJeuuEfKcAtaqdjr0B1xme2lICWZ0=
X-Google-Smtp-Source: AGHT+IFuejYCOH/GgWsbBBv9sSNzN2QZBnIDmhk7NiyBkMf1oumql2iFSB3VSEQs/j7SbgqF5zzsTw==
X-Received: by 2002:a5d:64ad:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38a2220088bmr3486679f8f.32.1734715659106;
        Fri, 20 Dec 2024 09:27:39 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e357sm4642915f8f.72.2024.12.20.09.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:27:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: corbet@lwn.net, anish kumar <yesanishhere@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20241104045907.76298-1-yesanishhere@gmail.com>
References: <20241104045907.76298-1-yesanishhere@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add slimbus documentation
Message-Id: <173471565835.227782.6594510444365392984.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 17:27:38 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Sun, 03 Nov 2024 20:59:07 -0800, anish kumar wrote:
> In the commit 202318d37613d264e30d71cc32ef442492d6d279
> slimbus documentation was added but it missed
> the update in this file. Currently get_maintainer script
> is missing the main maintainer.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: add slimbus documentation
      commit: 3250c9d6a6081d33ca01910db69f1fc1df46478d

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

