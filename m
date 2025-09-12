Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BEA301031
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689816; cv=none; b=DKcOi8sfgai8YHazWDIG8Wf+2fGSunbX73QM3AtT4ngNHUyIdRsWIm0XtttypqzZI0X252l8wXOTprpNG5KdN+k6gkJBZaUG3IXms8KOEzyH2W7G9/ZpibutBW71AUWs3VCqE/PgHLKn5cpZstFt/FdTx5zqms71D8p9+uwbyP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689816; c=relaxed/simple;
	bh=GVNCGH9tQf5YYe+DYh6Siqxk4Q3JqHAijX/d/+i2q6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIkxpC60j6QC5ZQ+3xXfZR1dtCmky3TltAFxi/ixQD8PfOkIRpFbceVecplclC/k8ZZd+xVHYh9TyCtsnwCaJQgekz/vsz4pIKrXvjqIn1zLAsm00Xlt4y3XkI9M/awmu4p9xWMFP0Qv1Ic0/Hu0ZTKlhMm3/iapXLLfP2nJVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRvJd4NC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRvJd4NC"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-724b9ba77d5so20256127b3.3
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 08:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689814; x=1758294614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYpcsE3JJVoPh3yiGg+2u2fE9IOmYvM0Rb6jQc+GT84=;
        b=VRvJd4NC+YHhBbcWu/+E+2UN/RPZLIywCS7nFWk4cNrh7/aNzQOyqE0XVbnOT7m6oz
         4p1lgLalhIWQ8Ysj5/pKJKxsK8js/C8JQmUDxU6ZC7jRp09BAI6OisRvZxPiEfBOa8II
         DbOz2+CJFrIZQKYrHYByVmF4eKfvnR8sPz3nkwfV6Fppvh7xObmTh2/oZzrt7LqimY7N
         RLMUmJ6BRL8fiBRxXTAxIsIgN4c91NAY0K8Ah9P9wdHs3j6Uy2n1CAzJvfV+7fIiSUEM
         RwRc/0FluPslIgBW27+O2M1w3JQwtTtm/jBsvU5ELMqIeFFLreoIakdXDnNuObQCATvb
         u7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689814; x=1758294614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYpcsE3JJVoPh3yiGg+2u2fE9IOmYvM0Rb6jQc+GT84=;
        b=iZVY1lBG6XjAA5+aDZBOhbiNlqa80rg80ql9KGCSkpgGMi4n16UI4n19dImxKsiftE
         MEjdwqJ9KyCxfJP/FKFZP6ay22BVl2EEmds4dpVN+H1L7sCEFuJneRoMTyd3Jwkm6l6N
         bKu1bJdjWlBRGuX0FNBZqrX6fZhHu5tCZskrI1hcZwBxdwx/0AstaW9L0T9A/+BW4EFD
         EkFgAfO+9QQIByJLC09LeKLXm/bYxJ6qICltznJctq8ZPIszSibRGc1N271DmdW1sNS1
         rC9lcuZUlkS9GuY7hcKNz6npSORzQqZfjbTW1qoz7JB0R0eESY5G6T7np9n1XYtByeG3
         xaRw==
X-Forwarded-Encrypted: i=1; AJvYcCW9tP0mhamH5DABTSCn7QymC+S1QuKrhUtmvyFY0VMlobinHU00ZtSgnFvwXYV9pFbKey8Ggq2TYLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs0fR9MI61n8LSIAHw7k/IWQndUCfNcuCIurPJGCrWY5/nZXa1
	6igw/yXl3vExENQ72VMmfS54a/GKTf4r2FBXJ4FOz9J4Y7rIaye2XvZAFyM5+cpMsjY=
X-Gm-Gg: ASbGncuT6elcon+t5sqKeiXBR/+pidNOz8JufOh4BKqE2N0Alo921gPdoSzTKuJfwr2
	SyoM5Au+2L2SISeLrgGwXUP++9UtEjyoCYrBbiVsHn0u03qFJAr87sh9y5HeMCqGNXryMOuV7mK
	uQyekDn2wHxWF9Jw+OFrRArrANmip07/XOUbryZIYUwG2lyBLl6rDSZYt4EjShv/Yvsj0SN8tHr
	83TAQ7gOkX/O5ILvF3aSSKCqIC1/XohPCAeIhPSyUhbU9ESaFsKcar7jJCpueWXdto7J54egKfV
	jEefapvPxXVDVC1wLbiuPYll4p9WHMbz8/RMQ3vJGBQu5meMuBX8JmVJ7Gml5uefUZtzlrktEm1
	XWPzxn3rHwJJswnubUmGmcxW4xHyPiARiOhUZaXd3nsVG
X-Google-Smtp-Source: AGHT+IE2B/J5wRLXOu5lnuN+Axv8riYyigPru1eeeYCbQIMixSd8q/6Ui1Mo233PH+t3U62U0f7UQg==
X-Received: by 2002:a05:690c:10c:b0:71f:c7ae:fb73 with SMTP id 00721157ae682-730659befadmr31464037b3.42.1757689810056;
        Fri, 12 Sep 2025 08:10:10 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:10:09 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 04/16] Documentation: kmemdump: Add section for coreimage ELF
Date: Fri, 12 Sep 2025 18:08:43 +0300
Message-ID: <20250912150855.2901211-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add section describing the utility of coreimage ELF generation for
kmemdump.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 Documentation/dev-tools/kmemdump.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kmemdump.rst b/Documentation/dev-tools/kmemdump.rst
index 504321de951a..5616843e0407 100644
--- a/Documentation/dev-tools/kmemdump.rst
+++ b/Documentation/dev-tools/kmemdump.rst
@@ -27,6 +27,14 @@ are limited.
 Although the kernel has multiple debugging mechanisms, kmemdump fits
 a particular model which is not covered by the others.
 
+kmemdump can also prepare specific regions of the kernel that can be
+put together to form a minimal core image file. To achieve this, the first
+region is an ELF header with program headers for each region, and another
+region contains specific ELF NOTE section with vmcoreinfo.
+There are also multiple regions registered with basic kernel information
+that will allow debugging tools like 'crash' to load the image.
+To enable this feature, use CONFIG_KMEMDUMP_COREIMAGE.
+
 kmemdump Internals
 ==================
 
-- 
2.43.0

