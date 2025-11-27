Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9696B230BD9
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764257676; cv=none; b=XH84SQPJCnVNC8omj314uSiv4cGpiKN3Wpu0ph3O0SbMSz/S2Uf8nwj3AxrdzPAEZqGw3RPBEGdoR4EaEHUDzlf6iiCMU0AGN1bez7bv0CN6vZXesbr1By+cJMBFhFDrmsEI547t/vQPBcfG4zdtxV8QDRsdJPJ+GbZ9YTS0eNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764257676; c=relaxed/simple;
	bh=485+aKqI718vx2FHskqt599+NOHXZtlAh7VAfOnh3ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sZqnf6m9rUgyjuT5QRyQYzSJm4zlSZ3qCwVwqCDl7Mh4cGvMijp7xxxNjiyYAF0yYv50nRFatgmt3RoMIa63IcG9JKaaT9636pIddhpPS8ozeIcDvfE/jNRLIfbVaBuDY1DCv4mPW6Zi5Nqn7E7WUvKPEG04JHexgbNHWY5q3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c704bdd57aso491387a34.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 07:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257673; x=1764862473;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUxKo1olWqUX4UWRjGD9GsA8KWHDIFGAUJE3hm+F3hg=;
        b=iDSqHcsaJc+S5i8Z9S/lixuZSceYbn2NR9XTyTwNVPY9EShQuTyBe7ttYue0pLdJsy
         yYP8sUjHCDkeoACB3Izxx4NVDgQuqi4vq+1CfqOUyOGwq9oNTciqVzqmww8TsD6RVYvY
         YdNDFHzIiuRcP3e7CbOTCftB+BosHglTuLO8gNpkwLaCIlSbdj0Efsbqpapk5dMWOV6h
         qCdlr8d5iVq6nPDEGYkfTJsoOghKlzk9klrQmjWUpBxE0dYaikmpjYGFF05My/JjPHCp
         mjy6WLs2F2mBvimRav6RtSB2BJERUloQGWUIuRS7KDjQiwYGI9QyHtocKa55EQdce/+G
         owYQ==
X-Gm-Message-State: AOJu0YwWkwJmjyQUtzT/d7ErV5TO08Ddsktj9FJLFTFnxDSQTwbfuW8B
	TAKZuKSETXU2CmoUpMUf46DaK72wrgEqRq7Mgs+hPh0B/7xI8uXUyh+v
X-Gm-Gg: ASbGnctrEmY2NTIQbXmcXLQMgatsEDI9yBEZ7A6Z/BpLMgSW4NKWYl2LDZeQY5sOFne
	702LBn6f/rMPSCA+Mwm7uy+akkoaORISH1fi2eycYhTBNJpgu/utMRfVcEO3rD7V9L+aanNtAvr
	k7lV1gCW/K+8AsxoSlaz2UHJBR8Zzo4VvHultNUB/LcfXU99P96bvQzqC3NIhVBM+dqjGqdKllU
	wVlm1IbCq6upGQRsbiBgIwXgI5T+Evc/sU94ifXji0hXwHrtvP3Fg5Q7dnenfXAXrgb+diuv66B
	7BttzPtLF51XrwtxGh8Hl86L+VHakgTH3M+uLhezLcojOCP8ztDnmza/7HUXi0dl8T3/gBVHDpm
	TGZWYBkX2dkYT6Ik9CxaLsjeT4n8bo23O7+7lcGcwW0IQXWPxuwvRBScqnMif1voGUror7/fHLU
	qU5LiiqlhlG3S5
X-Google-Smtp-Source: AGHT+IEMIi4H10xrP3EKDI9OvAj9WzdiYvNqFsB59sUhh+6vRcf6521C+XfJZ3zkhhzlvFFBMdfZPQ==
X-Received: by 2002:a05:6830:4124:b0:7c7:c71:849b with SMTP id 46e09a7af769-7c7c4332ebdmr5728568a34.14.1764257673592;
        Thu, 27 Nov 2025 07:34:33 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90f5fafc7sm638418a34.7.2025.11.27.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:34:33 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 27 Nov 2025 07:34:24 -0800
Subject: [PATCH] Documentation/driver-api: Add hw-recoverable-errors to
 toctree
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-vmcoreinfo_fix-v1-1-26f5b1c43da9@debian.org>
X-B4-Tracking: v=1; b=H4sIAH9vKGkC/x3MUQqAIBAFwKss7zshJam8SkSIrbUfaShEEN09a
 A4wDyoX4QpHDwpfUiUnONINIew+baxkhSOY1litTa+uI+TCkmJeotyq9Z5ZWxvGbkBDOAtHuf9
 wmt/3AxEjfidgAAAA
X-Change-ID: 20251127-vmcoreinfo_fix-0aaee155c948
To: akpm@linux-foundation.org, Jonathan Corbet <corbet@lwn.net>, 
 Hanjun Guo <guohanjun@huawei.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Stephen Rothwell <sfr@canb.auug.org.au>, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=leitao@debian.org;
 h=from:subject:message-id; bh=485+aKqI718vx2FHskqt599+NOHXZtlAh7VAfOnh3ZM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpKG+IOaoDzIUKkMM+xdoD0fPUAoExKc4Gk3x4y
 vB7JdZmyQaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaShviAAKCRA1o5Of/Hh3
 bSaHD/0TB9sFPFKdGNNurWxXtYB7QOmIHCcmrN0d2AvmnMqkouZSjDEILwR0QiOjx6MfulFgBlJ
 zqzQTl7GeSdWDUt7Cv96cV1qz2hmdLkMUCZR9PIPXX/u9Jf4T+4/mysO3Ph7BwpoDKuVvw/xmvf
 KXntA5za8I/TWH2tmwTgqZjCBIJSov7X7KUwlXZf848cAM9ES2zeJHlKR3u19ytQsdqca26qEEm
 CZkGtv/Qos2an1/7hePGgQsqJI4/rKx2Whj6kaacf8j7VOp3rxosAE7bIgF/dDiT2rPnLEPlxRk
 xsaWvJwgsQ07QRgYORnBQ1T+bbBjN2Q6fWMAt2t3HcI1QCvmmIHEjD2D/PvhQFqIBnRZN3iIO9O
 DSgOxniLLJ/bcJ0X1yIplTw9/UjBmfs1UquKZ/9XUR+m4lNAjyI8FCFrX9j0yOJgSstyqbDbKOB
 uMRsxq2fecz1PbKU6jrVWw8xyQVc3RVev0F1ADABqeGKRqEDTzeVFTFi0sz0crGTVl3I9kaLi1U
 xSutq6qp/wrgm4v15UCtfQ1p+O2ocjLUQuLW0fzyVgObW0owGKwbWaVc1dFYJmKOPCdAoj9UGOs
 JlsuWBloAs+J5L6V/DUdgzr3Ssd8+JIdKGLN0Xap3vCni+bxTPqh2sGbp1ZHnnrYvWLyZUuFTVF
 Kj31qOYoALXtiWA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Stephen reported that commit c03fb5253a0341e ("vmcoreinfo: track and log
recoverable hardware errors") started to warn about "document isn't
included in any toctree".

Fix it by adding the new rst in Subsystem-specific APIs section.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250729150042.77832045@canb.auug.org.au/#t
Signed-off-by: Breno Leitao <leitao@debian.org>
Fixes: c03fb5253a0341e ("vmcoreinfo: track and log recoverable hardware errors")
---
PS: This should probably go throught Andrew's tree as discussed in
https://lore.kernel.org/all/20251126084433.28bf7035fa56b11c5ee158d4@linux-foundation.org/
---
 Documentation/driver-api/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index baff96b5cf0b..1833e6a0687e 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -97,6 +97,7 @@ Subsystem-specific APIs
    gpio/index
    hsi
    hte/index
+   hw-recoverable-errors
    i2c
    iio/index
    infiniband

---
base-commit: 663d0d1af3faefe673cabf4b6b077149a87ad71f
change-id: 20251127-vmcoreinfo_fix-0aaee155c948

Best regards,
--  
Breno Leitao <leitao@debian.org>

