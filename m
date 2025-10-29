Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABCF32570B
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751428; cv=none; b=rpj8th/hYKLeXu6LnKl8xQmtt/xId1HcDH5TnoGcYtlX5d030jSv2x3u4K5iSyYHd7wFBGIcFzGkU4Cf8fj1yxyTK8DdkJGbh/EKIqZYJSlVX1ANn5JnZ58V7JB5pbk8y2iUEee8stbqZyiNVOPWyyjVGZP2hxPfJK68eClSkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751428; c=relaxed/simple;
	bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DyiN7bNaLjNADsPotBWIlPUQunJOLPeMuyhgN2rtIK0lz+WK8+ye45o8oyxkYdhu/nL56QaWYsAg/+dXrdl3+H0kBUpFQou5hbQhQUHxhlV4saKf0UVw1cF9sxFimxCaTVf5KIQji0U+A58Ux9Qmq3yXGPd1qHIMHFYQ1I/mpZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQHMBVSM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQHMBVSM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47109187c32so40960885e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761751425; x=1762356225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=;
        b=oQHMBVSMJ2M4QjAW8A7GtSAF9S6FkVCh2HHuqy3FhR5UzylxgotmNVkpR7YLWV6rfn
         VOutUscxHLqWLt0JqDHs8hixfx95W7FB52sKo9QYv9p3+f3eHN4QkMSW472X1K7TxxCP
         XjVWEtQPwThUR7pLHWxItQKrTQVRSrSCo6nZG4InGUYT/O4omm9oVxUNPc8D0u4R3k8k
         1wsrNT11QK2lBzx0qOtZd5gixGG1gG1sgc+CtA6+FrX7IJCFbF2O2e8OU+OzG2daQijI
         Q9hGbMmkbOzLxVKFQVFPYzqW3iMZvAgwtakzd+5/Fn/g1j3HHF3D76Yocm6VJZN+iWjN
         8a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751425; x=1762356225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=;
        b=US8kTuE60l9DeI5UxYQ8wnXvZqgd43kKATPR7bVCjJsbVFQwMxVgeG3DmNMfiGdd9Z
         jTNC/3ueWJI8O2Ugnlx/H3FSa9X3XbCOjSCfzeW/6U00ong9MuCmqIfg0Gz8XFo/WKn1
         yXVlR9lFfbiZa+0Cm0oBIQmb435UO1z4FXR1WXm0vMgFTyn98PHkBOAkew0x7STS1KpY
         OWV1UsJbGCHkbHCrdstsrPKb4hsT31qMLdSpuULhafAjqswu9t3AlBGkT71tDAwJZuMr
         u7wGTyc+ZnA+g31T6Wase31SIkbKMJo4r6ToLEDLL4MNVANHnWg11R/vzM/+3GByiq2m
         aD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVPjNFZ2CJMKgagO4MHdXGZFbsuso3pTwDMYq1PNMfwNszxw1E0j8vSkzh9HDbYfm89TyFxXoV4Xfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/hM9gxsiK3H35uEeyuz55aqENBPIgt9Grg0DZ6x+g27QgWVw
	g0NRHEZMy4umGkA3uCYH+axaN6GBP+X1PyWcI/QmoZhmLLnYTjiWWIHEYizCh5XnpnM=
X-Gm-Gg: ASbGncv3LXq0tW1DUT8hFkom3ifkWPvJAjUt57cotLnFRFj5LIxhD+6aaAriRjNmOKP
	EoT6ONpdJA/OroyrIVDnV+DV55n1AGKGurLIkv0OLKJB1iz7VPhde4hhPdb9y3ZL0+9NomjLCZJ
	w3zfej+mQ3rL+SjxBtdVNqekzRLHmS3510vfIZGu5m0UkFiCqgfm8YxmnGg577zaIiLzWrAvaCa
	WS+YcqL9XUfez8rSxVSpBFb6ZL37CBqzOsWVrH7D0bmDNplWFXccZEer1ivBf3iJTdy0cyKWloA
	UauCkvGZZMFkzd/RHvIfCPtZ5MQusKA1HJfQPCSqPPqALOoOlo2DJSWpKOSdn9YQYlBTJi/BRcm
	p5DbxIQAnPRwf0HZWmpYmVFroSAL+bZV6JxMil2rg+XjHMzNbW8n0w1iQABW3hYmCCHPMpcYjk/
	aJD6vSVSHGJdcK4RI=
X-Google-Smtp-Source: AGHT+IF3kypRXz+lbNGUUJZxGE/9fLgsZ6x2lXzXuM2CaCBPkYTwY5pskZrBjx2J28zmiWA3+gROqw==
X-Received: by 2002:a05:6000:2308:b0:426:d54d:224d with SMTP id ffacd0b85a97d-429aef8b88bmr2958293f8f.27.1761751425212;
        Wed, 29 Oct 2025 08:23:45 -0700 (PDT)
Received: from e125016.powerhub ([2a0a:ef40:e8d:4a01:29a9:3ab3:ba86:f8fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm26823811f8f.47.2025.10.29.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:23:44 -0700 (PDT)
From: David Spickett <david.spickett@linaro.org>
To: broonie@kernel.org
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	david.spickett@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luis.machado.foss@gmail.com,
	mark.rutland@arm.com,
	oleg@redhat.com,
	shuah@kernel.org,
	thiago.bauermann@linaro.org,
	will@kernel.org,
	David Spickett <david.spickett@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64/sme: Support disabling streaming mode via ptrace on SME only systems
Date: Wed, 29 Oct 2025 15:23:30 +0000
Message-Id: <20251029152330.155394-1-david.spickett@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-1-33c7b2f27cbf@kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-1-33c7b2f27cbf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have put the LLDB changes for this into review.
We are tracking SME only support in this issue:
https://github.com/llvm/llvm-project/issues/138717

The PRs that relate to these kernel changes are
listed in this comment:
https://github.com/llvm/llvm-project/issues/138717#issuecomment-3456979166

LLDB's use case for this new ptrace feature is to restore
process state after expression evaluation takes a process
from non-streaming to streaming mode. We have a specific
code path to handle that restoration, and it was not a
problem to integrate this new ptrace feature.

I have proven with testcases that LLDB can restore
any streaming mode/ZA/streaming vector length
combination, starting from any other combination.

The LLDB changes will remain in review until if/when
these kernel changes are accepted. I expect LLDB
reviewers will be ok approving changes on the condition
that I wait for the kernel side before merging.

I expect LLDB review to take some time, likely a month,
due to the availability of reviewers at this time.

Reviewed-by: David Spickett <david.spickett@linaro.org>
