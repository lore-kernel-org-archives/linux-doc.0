Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16FC214A9B
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 19:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738452; cv=none; b=LOYw+/mkc2nAarJKOpv+pljFCVA3Yd0qgaOPOBfv1t/oKMZvVpEUx+6AFqeYjO5/GANeAu/UPKcbMVaLrnaRxXEUoAMPUOkziAzce7ECJH14A5Mj2CItIgYYlIzXkNf8Vae5Tc8ZoPYGlt3D+PvbaSroYsygpa+ZFO86sgJ5St0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738452; c=relaxed/simple;
	bh=B7/TxmMjScHPkIqw5Kr7OsH5O7qaOXV8L1AuQ8zhh8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X9hBjahNvzekSScIKBKyQM6vdjqsC8y+FvIvhHVkccNOAW9kFybOcUhj3wgZLy8EWr9sILMD8jlOEHxGsCCljezannH667BBcbnEVLcEILRzEcKcfHMpXg16EjxsqxT42/PDMYLLzKnYqaifQMtxDLgKGvvjXdKGD+4xrJTG9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg83EFZ1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg83EFZ1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae4988e039so34326955ad.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 11:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738451; x=1773343251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0XnQfgVuLm2R9kSptMa+BxjG4dzWmG5/8eqjWRdk8E=;
        b=Qg83EFZ1dClNw0ZcAiVlkkNqPFa/sYSkYpUI9DJrgN4pVfAAZem+1d8bL1LMflFgvv
         LDnFp3ZIEuhxVBYMGW2c/KOJsk6cUljD04RW8qP+rBcsMyy0SU+HdCIMWSfo3V2JHgbK
         3fRLIRYwoVPG+fZTfep1JQKCIXxesR5Ier3tdP9UAi+f0UEUDRGx895q0vkFuXifDpZF
         wfIpayEI81AKdHiI6mQ6I5qvQKC3GJGb5I0pqm86hjJ5uLNZzzvZPT0km6pNoYBdgFOr
         EfcyR/3d0u/If3T2s6X5Q8CckpW521JLwoMoLsRvyd9Kv2x8vMHXf7PyOa5qcKKKBMML
         GEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738451; x=1773343251;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0XnQfgVuLm2R9kSptMa+BxjG4dzWmG5/8eqjWRdk8E=;
        b=JWQwYAC9PNY9MMsudsT48Y93VZE7KD4K2a07gFQWEGwM+HMyM2CWvhAvWwtmPRHuVp
         FvrjI5g/Lle3jI1vTugxh9NsC0R2pzRTSUVsx0bCozVYaY8O0QV+hMalDdJcW0l7vvuj
         v7SQTli7WBIVYCEgVvkdv0GjDqRgajSNsaASJBDWfDho9rUhxAJ5nu7jK1vJWIKpEnOJ
         3396UfArlnMjWPhsEdnK/kKRSl+8zZp7LNd2gG50Y/4WU/PTYfteRIUFWq58CvGhET3y
         1S/IAgW6Qc7oHungt0G9ZL+kj4v3o6I1j9/GWrwtjh7s9QXUXKuEvsslB8ICWMJWHGd/
         aN8Q==
X-Gm-Message-State: AOJu0YzS2xFZwsaj+y6v8h8ypX3OQ4d0Qcl47lRhRPg2qOy8PTsKyc4b
	2FHzL9W2KmK7pW7fEEWiSE3sH2JV0+HYgueBH+wGOlvg6RFEoYZX/1mO
X-Gm-Gg: ATEYQzzxypglH1+S4jgVTsn/ctjPOT1c/gIlgDIhbh3adCE5nogU4ASy0ETlVpk0pB+
	wEX8uLOgv0/tx9X/JWXetogESkkFdB3oiztBb36czpVI5MGWPmQclDB/XWXvS6JI+WgN4wqdHXx
	CFFlfPNTX31BawEAi/4OcSIC9M4R9y/ypsZNrmGnp3KpalOx/mSKpHtcFZIzxCkbZDWLVNCo3Rs
	lb2ZHDInLDS/n3E4Po4VcDXPZu9duxXWSceUq4y8VjoNBrmMXC4fufiEZPZt9sccJN2DMUCtTHZ
	jx5mYFYSr7wftFKYP18nMMoxu2l4TSDEJ1mZbj63YJd3bhYa8ozKgLCllS+g2RRB38JF/PR6YgC
	7OsaaB00xZt8dCxH3T+2hiutB3n1jnS+d2idVFiK0ru0MWXySLT9zutXyuaZShuMGJ0z2Q4y0cv
	dijHSBsI392xf9uXqIq1BIE+2vjq34sQpnxFLjsL/X4xIbB/P417Q=
X-Received: by 2002:a17:903:3c23:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2ae75b7e02emr39719405ad.13.1772738451026;
        Thu, 05 Mar 2026 11:20:51 -0800 (PST)
Received: from russ.ust.hk (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f996sm227178345ad.50.2026.03.05.11.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:20:50 -0800 (PST)
From: TurtleRuss <tttturtleruss@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	TurtleRuss <tttturtleruss@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs/zh_CN: fix an inconsistent statement in dev-tools/testing-overview
Date: Fri,  6 Mar 2026 03:20:40 +0800
Message-ID: <20260305192048.16405-1-tttturtleruss@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: LIU Haoyang <tttturtleruss@gmail.com>

This patch fixes an inconsistent describtion in testing-overview.rst,
which should be ``kmalloc`` instead of ``kmalloc_arry``.

Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
---
 Documentation/translations/zh_CN/dev-tools/testing-overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
index 286ed6b01f65..5efa8c6db867 100644
--- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -154,7 +154,7 @@ Smatch和Coccinelle的强项
 Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
 检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
 
-例如，用Coccinelle你可以从 ``kmalloc_array(x, size, GFP_KERNEL)``
+例如，用Coccinelle你可以从 ``kmalloc(x * size, GFP_KERNEL)``
 到 ``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很
 有用。如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很
 恼火。你将不得不为每个警告争论是否真的可以溢出。
-- 
2.53.0

