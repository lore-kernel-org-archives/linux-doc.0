Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644C6281368
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321555; cv=none; b=u2yurblFV8K+GH8onXKWCNUIq2OKzeu6k6D8fUzspZctc6yVuWW5gRKP1ErwSv4V/xwEUkPbDdzsoSlmmXs92/TBzjKDz4OUnJ/Syh4ko9RHu5iNindHALeoYn0X3DTsJcNuYStFDAUnTFzKltUOOub8bkSyZj7Msdsz/OC8g9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321555; c=relaxed/simple;
	bh=gQDPkvVC9lqTB+MV6UQ/E8pyhNViS1oHACaHEDpFvWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smW96iKRvUkTFBiBaYDCNozayGihd/pUoQFDnPUycU4pGGTrUh6dFRYww0IFdm8xTI1ckkQgYuCPLcu5XpdgiA2vwtHvfUh1ktvLd1O05LjG1G5GewQrSIc8HWE0MMos3bpKxFuEZfWAb5/Idp3hIWVXEfnrJzw6RqDgRCGeIdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=npo8pfQ/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npo8pfQ/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so24402575e9.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321552; x=1745926352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=npo8pfQ/zHqEXqoElK8IzGujkMjXdAmaiWGEv/J7NlandjQOd7d5ToEPPENGkVjh6z
         R1NC9RREg2iHvJ6BlYuQQLTULaGvldmtura/n+IFky0hGqbrjlrIMUo/96iGsHenMYNO
         16vM45CRoxVHlM57mT3u+ILTxtoQRIWYAs6vlFzRMDe/cR4ny3haR1HL5XSSsNEcqGI4
         zdp43GlzNqmDtijqQ6/nwIm6f+aNjcsrpUJ5lWS9c6nBqqcaV33JDySqUJ3bQQPXCGWN
         TtIZHW69Q3ZNVSbn5we0Z9rFLQXgk7ETbmXADQ9MkqYfcQXvFmr1MUs9MZSuqXCvkLfd
         C8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321552; x=1745926352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23OVpoYPLggoCGZU9vcl/htrC1VpcPls14v+en9CHkc=;
        b=sKNUWa4lzewOgnjsxEuEBSv5UvxDkzgIDAdgahJhtmprHi6WeJ8m356AmDV1NE7plZ
         QOqWDRUqD0eSwcOTCALPKz5N508wF9H1BqDao2tOpoQUy5/I/0dL7Dmboj6XjXxhGpXt
         iTP3huZR8D/dojKDx6LIwP1e/u0yg1yI0AuchJ39ACrLEaM+7CjnSCxM8Z2RIcWMcHc1
         9RNcQBttc3i+OEprmgCjnTZOXywUky3Q+NM7tc57p+VxWt+Quw/pT+3ozPXKNEy9ny28
         KsyqaXFb0FgHWEibThZ20Uz3+5yf5akUBskg2nspPZzXpqzelcEVbRAn+vaLmnycoY71
         DYAQ==
X-Gm-Message-State: AOJu0YyV5NYNacDB1oLOy455UiOIcfATnJnnxJjZKSjoOt6SDlcDhEDL
	J6kmFAgZoPkzyW3n2874ZNeEDY56kdHaFfHM0EtQchE9lc8YysjEQOIEubZ48w4=
X-Gm-Gg: ASbGnctf1+WORyAovzuPxmCxp7tZL7b8w1ibTg4TqTzJVYkBbOkfu3qy1RHzyrAeM1l
	Q5Z1baTE+JHLgmp2a7C2vbS6r8DyAC/riMwIavKGhQEWoXC+fapmWYiR9nYbTg8hRB7ORsndIaJ
	JDPx6JLiW+FD518G6HfyMOSG8cVb6eI5gTtcrXyUZCL/IIYdaCBb9yarsqnYeBlegYQpLIh8mZg
	uXZ57BTyTBZXtdvFWsB+1F2PG1Ia+nIeQkmMAgp+ZkU9qfLMJ2xTG4ogtnfTjcVlMZRoUyQbtCz
	VDOBZv+ToIoqNPBg9HSTXdbAHiTF+usH2JZRDKTNeNhOYpXagwq6
X-Google-Smtp-Source: AGHT+IEtVC5/hLkXP7uFg7Zmm5Mq0Mlz2uLSiQFUOQWsm32IsnbnTjBX5PadrzYjNG2TCCeAvltguQ==
X-Received: by 2002:a05:600c:1ca8:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4406abf94afmr91474835e9.22.1745321551609;
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 14/14] kmemdump: coreimage: add sched registration
Date: Tue, 22 Apr 2025 14:31:56 +0300
Message-ID: <20250422113156.575971-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register sched info into kmemdump coreimage

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 7f3b089b5739..2be396ca0495 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -78,6 +78,7 @@ void register_coreinfo(void)
 	kmsg_kmemdump_register();
 	irq_kmemdump_register();
 	panic_kmemdump_register();
+	sched_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

