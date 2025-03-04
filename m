Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C632040A4
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089629; cv=none; b=OzJLgZRyDyGiem2zpyFBBmR9Oh8TNmMq+fR6m3utf07EuNfu6pBARa6sD+5wC1HPpm1MZrFBlXkR9eydrS6tdgLpWrsqUfH2GUqrrQzhgCo0cF68gvx0vsIF7erUuOxMVvH5YsZEqtqdcBspQVZyZArnN66+IC8m1XhVRDiVayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089629; c=relaxed/simple;
	bh=HCTDVZLc27RfB3QlgUMKi3V9KsZa8/51pTH+CsMD1z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTJVKglsXkSrjS+FlZNch1arTPXWYRLhsrAik3TfLP2oBZ7MpIgNOvhQT8YEiwfETWtMfb4yYBi3pqWYiXJtr2LojBns2DIDvE0aNMzKmm+boBTu10NZ1Lde9h8ZMqt/riHx7eXDcdDkoL0Oo1Sv8mYvSTDEtn1WeCzLTjxqgmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fK8j81U/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fK8j81U/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390dc0a7605so2992441f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089626; x=1741694426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=fK8j81U/AqVoW3rzpXJB/UpVv5DYoj/KLcdLyK1ygu0/UQabkISqT/9m6i7qyqPJz3
         7oUabz5RzjkikGUz2zvGe+VqdFYdOgmbnp2yOZxVqDs1XcXiBhb3m0mqZfq8EwJCb7V6
         URwRkcMuarzaMtv1lbSIbb0WYjl51uh3NRE1p7ThUoRnaRG72Mg7tsXX3gdRQCX0ZT1D
         f0doM6A4mFj2m22xK8QoVD2Rdqwj5mc4GWAwl6OBLCWJ3zlW0PT0gkdh6jsdY7/SfZMm
         9dknLXRWEdcLBd2WSitSgp49uojifozEhMZ3Sr2JDaZfk4lQ6C2Xecgktq0Gv1q57cVV
         79MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089626; x=1741694426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvHP2BboCGauKM0TvBqQfBu7j1TlN9OaRIMMc+Vl6gA=;
        b=UHQeyIEaD/v+YndVrVQIcU+bFC1bCNuD0l9K+NKp1X61fRK4VjKqiGi0UY0bFltWhG
         yq7nB/Wh77JUTU7LDOXBwba8ij/WMINVmJfn1m4A0DQsRB9aH3eDEUw08aPO1Bw9G86G
         nzok9vgrzAq7YGWlYbDMaz/OZsa2+bYhLAFCO+A5JSK3ExsYqu54lgAn4ZB1fsGFOY65
         hYmsDCl0vhQ3NOWRFYGCfhXG+IM9kiPwi/j/VCmcYJvZ8x84NXWEtfkMFa6aa3ouElK6
         r1rxxtg9EhZaTG1psPBhMheaGIBySigr+2pdHok38nZhrLiJckay35eEq7GUEEROZCga
         1sZw==
X-Forwarded-Encrypted: i=1; AJvYcCXkJ91hW34Wb7t3VFAQboB+rWO9I6POBbgm+STviRErTP6LiaRFAUtm/2+JJsy+cHhMRqy1vJxDRY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOUYfCb3oGKAIWh3pk5psD0rm1B79uTsdQrPzjL7yqbHJ/u8q
	d/lYxgyfhLtXVTmqSrJxWICYRaGx01awfemVLQYKwBodskEvhpnrnjx6EYAN/EA=
X-Gm-Gg: ASbGncuKWkISJqpRvyON3LOC0vH3Jae9RkjEOnEfYl71zFVA5GYORdSz9hjw33pBbY0
	q6zVD6hMqOUyzbwK3seTdVcTPjx6vAf5YdHHubLilP37qageIb9ZwjQrtrLxtxW6RVyKU+LVXMN
	h8iP7noc+xjWCWzI5MohjAxOaRk4ESQzL03sV+L4upl+RU8CsfI39FyVXCIHx/Tl3Ct+3g+1O24
	8KgoL/h1aipbc9RzmDmAvua2jmfVFMO+I3nTJZRU9yepe4yQL7flAouiHe5T/Lr/lsI8g5ZcJmw
	GF8BH2wC9S9E5PbJ5788niuTPw3H6bTR
X-Google-Smtp-Source: AGHT+IELzkVFh9RITGThHEwxgYy+2Ld8GAacL3JsxhdPQ1ZeOzGuZugE0nk+z2RxPZrajYXuj5Csrw==
X-Received: by 2002:a05:6000:2101:b0:390:f750:40df with SMTP id ffacd0b85a97d-390f750412amr7616475f8f.34.1741089625766;
        Tue, 04 Mar 2025 04:00:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm17247748f8f.5.2025.03.04.04.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:25 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 8/8] Documentation/kernel-parameters: Add riscv unaligned speed parameters
Date: Tue,  4 Mar 2025 13:00:23 +0100
Message-ID: <20250304120014.143628-18-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document riscv parameters used to select scalar and vector unaligned
access speeds.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..9e3c5fecfa52 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7477,6 +7477,22 @@
 			Note that genuine overcurrent events won't be
 			reported either.
 
+	unaligned_scalar_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping scalar unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same scalar unaligned access speed.
+
+	unaligned_vector_speed=
+			[RISCV]
+			Format: {slow | fast | unsupported}
+			Allow skipping vector unaligned access speed tests. This
+			is useful for testing alternative code paths and to skip
+			the tests in environments where they run too slowly. All
+			CPUs must have the same vector unaligned access speed.
+
 	unknown_nmi_panic
 			[X86] Cause panic on unknown NMI.
 
-- 
2.48.1

