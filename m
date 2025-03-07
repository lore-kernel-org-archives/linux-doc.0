Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411319CC02
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 07:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332899; cv=none; b=ZY6Im+sQr7r5bjbfzsXA/clOe46qG3VgNsFVbkzocnr9sN3qEa9csi0WJB06O3euInwoKCKzqnG9xRjXAynhvdvcH52whFlnVRGDJAUoD1FqpSbL6VAaGgTe5HpOPFlVVQNbkSiMrysV7wc36G/Fv+aEolkH/19CMG/GNXS7mH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332899; c=relaxed/simple;
	bh=ctPVAtWaXaKCuE5LuTAIwOQM11ywFK6RGE21gBeVs4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lgxcEXge2Jy1pbaDnLcWq3qpIqxGRivw0OgsRZFfH+mrGSfsU0U9P48HiOCAVdiBJLtIlfaxaqT/EmK0Ta37PVy5LkmSInpm1a0SsGMxR0ufgQIlilMGyootq0vA/wS7iF+lWDzbpyxChTHAkvq6J7uEfIPb1qrCoXiHxGkVVaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLN3tCrX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLN3tCrX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso2804541a91.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 23:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332897; x=1741937697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sjt9C8VUJdpZK8WtjI+8HyAWHpGHvW/BGncHWkhwnb4=;
        b=SLN3tCrX+JSr1ChAm2tuvZPUzcO0iOExvt0Hmt29/L1cmSuRJgjtIuqMrbqrGDD5tV
         CI9LFd2PkOnql8R+T+6u0IiUCn6cd0DHDskdk0q0HHQlaYIpU9yrZYLOOpilJfx+mEJs
         f1B+h0i8gfCqvy3IXqZxA2BMZ20w5DZW3WZwB91YQozzS9ElSjEwDv8nLhoBTdvGQ2Oo
         bGp7iJnkHE7EqJ5l1yRxLA9kg71gJgYeph4joNlwhWB+2C86XO2DaXUeizOIbmmL/SJO
         ExSi7PWqT8OhaqMRzDHT6T34OfExtmUO1I7PFksjLzEyY16BAeGD4hvFbBQHysYcvGiW
         xBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332897; x=1741937697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sjt9C8VUJdpZK8WtjI+8HyAWHpGHvW/BGncHWkhwnb4=;
        b=iyCp37GgAqmNH70q7eJSsuTm7vrg8noLuPrdnLd6/RyH7/zNTPNda2K0OWCCL23Kvm
         aiw94BF53Wf84wf0hg+qEBVGyVk4GwzrWgHP3PGrk0xYkKTFi7rrARvdhNl1ucjPsPGA
         KunC5HPAXMQyZXi/qW7hA6r6Gnbbw2TWh1gC0fmzwg9PRbOqZtV1WQxJAuetftnvbV9b
         vjU/BTaBo3zXQ/FbWdaTMZzJPAaJJNwlRCl+OdniUovalsiwQxxDC6Qk34n7ab5H35Gs
         MKxO7G6ohmjH7nPwGX42vRsY7MDcUUjHiC+bFL9OVYpuOIPjCsIn6l6zo5JntQPrgNd6
         tobg==
X-Forwarded-Encrypted: i=1; AJvYcCW0NBkNS3JhfGEnCtquj/0AQ+XoRAZbDhMK1zFGV8K/V3VF7NC5+eGq/xpehT+oXz/L+1/vk6PnJck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIsJ4Q97gWBI5PQ8IcQVQfdE/PRRXJRV51YR/mTe5l3EKKoJjC
	K0qR+MT/AK9CR1rPm+9qM6fAfBEPj93Jpld4c6X85yg9BnEnBneHadGMKK8DFoM=
X-Gm-Gg: ASbGncta2oB+oLdcjgbNQC8QwEtCsiPyWQICnZIdr5VzQfWxKO/f56082ketwD5z7Yu
	bbXebZ30F8Cd1HsJkIUZyp7rhUnC7rWf9Pwf6n/FD8BRR9l1mXLb/eeWUAEqlOet+WSAahhDU8l
	YNamGF97kSEQdD+U0DiXuyDqNMku93Z5LCefsSqBIMYUES8KmUY3ICek09/Xiki97oS3w4Q30SN
	gVFarL0Y24CXk1/rjLdtWrPdddJM9RcrtTmFl3/pp2FPXc5L8c9WxUcLeYseD2eAbg+/MCBTftQ
	d6qLoXEIRzypAB+EHMZ/l0A2GZ8P/MNwZ89xRFtkPWgE+g==
X-Google-Smtp-Source: AGHT+IHPPYSmazDZOD2fKozTzdVGJsqxTd/WpRg3ZyN7X/9jbeje9ZktEhzBuMmRrqA89MatMiIFrQ==
X-Received: by 2002:a05:6a21:104:b0:1f3:42c3:89ae with SMTP id adf61e73a8af0-1f544c7ff60mr4958963637.42.1741332897220;
        Thu, 06 Mar 2025 23:34:57 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369824593csm2568640b3a.71.2025.03.06.23.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:34:56 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/2] docs: core-api: Update kernel-api.rst to include cpumask.h
Date: Fri,  7 Mar 2025 13:04:50 +0530
Message-Id: <cover.1741332579.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This includes cpumask.h in kernel-api.rst and fixes some kernel-doc formatting
warnings/errors.

V2:
- Don't escape *, use @ instead before argument name.
- Don't escape %, use space before "[".
- Use "::" instead of fancy code-blocks.

Viresh Kumar (2):
  cpumask: Fix kernel-doc formatting errors in cpumask.h
  docs: core-api: Update kernel-api.rst to include cpumask.h

 Documentation/core-api/kernel-api.rst |  6 +++
 include/linux/cpumask.h               | 65 ++++++++++++++-------------
 2 files changed, 40 insertions(+), 31 deletions(-)

-- 
2.31.1.272.g89b43f80a514

