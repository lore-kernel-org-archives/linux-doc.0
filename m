Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2865D296BC2
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763206972; cv=none; b=f2WljpeUSs/u/scjY9VXQAaGsrEuTWC8yfYlQk1QlRWE6k6PvMvOcyq9exp2abQcuffzhRBJKVXU480ldgBzb4a3skiyMmQEHBxuPoS0nRHmizWvMTkZ/fHK69MokwjuXZkD3VuJS1a78uP8SUIIIXTBRaNiyaTDjvinsgSd5ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763206972; c=relaxed/simple;
	bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWQkIrzB0sBCWQCFoenaSi7vkDgIehj6AvVAFtIL06MCBtPKBwI89+RQFJpMSLF1ZQ26A72JuA8iUwWIzAntp7xAFT2siHMYqPhK56M4/rw84+8bGxgT5y6pl7mERNltn1fP/TBXVt9HSTHynVm69ku6rcSxrLI/l+55oDauxv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q37oaH8M; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q37oaH8M"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so3268049b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763206970; x=1763811770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
        b=Q37oaH8MhnxabfHlWHdad4awYfOV7KRWBA3djkdSYx9BPDMG7t5IXe0mk143IBYqas
         frjgGPIBEC8dAymC3aR1ZXH4LgHcF95HIBZzTgkG23iA0tYLfxYp1l0+gjbH5ez4vHxk
         b6QCImleJtxeYctEZN9RE50gDS2XxbV2ZHahS4rvuOuhj+gJNU3zoQLhnYIYQnDErsFd
         0MVgVVRO94cds5DYP3KB6oYAgUPc4FTQ7LKHT5O7xtXCWuQNJnEFC52qrEe8UApqqynE
         VKhz0t3eKbUvpjfs359xshgSNigxTCVrjWLde/dO8vKdDYtFEQ9tw19BQai1Ym/vPfFW
         3yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763206970; x=1763811770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
        b=UcD2w7xiiBSPAejvMILwQrQoyPbhiZysYYZIGFtMu/Uaa2jxrV/cHH1BEVpGTas6KU
         4ZWWcUK/kyftFhO476BMvScQ4IySwxFzXZDv8uNBwXx0NOUBsoSg8ipkQMQgHGRitkOC
         er3q2rjtSgvt9i7tLMvAnb512ly60RP7P8bdW3N/ILcTQcd+a+a9fLkk/YiiblF/OeVi
         wptev5cFSTIXSx5iSTYnkidr1utS3StdQvLMGP6zaTRZa5ettVO6/hitqb8HfWXdukmT
         7PEzsm3x2BVCSgJmSNNHBbHtqJQqd8lKr9q6XpYjF9gw3YcR7fOzYO4V5VG3Qx136h/3
         RcXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyovgOKqgM8f0aYSbYPZaV+nZHWkRGf1CQgbWnWw9synAY2bYH5m3JZ3snmJidUtka2pkPFYtLUQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVersNt/Ca6ITQY2xJ5LnpKw/lZefQa/o2LpHbT8IxUo/TiF3
	xWW35iZFNvnZC8HjTSz/wUip6u8JP+DecmOk8o7WXPDWV5/BjbJykG2w
X-Gm-Gg: ASbGncswquYhmWPQDIE/Rfz7jjesvQOr3iQ7sDcVsn3Q9rxNepU7YzQhg7/QNjB7uHS
	GTbehzd/OsMO3PCmrUJIxniZZN+B/kl1cIWqGKrSZHlvFk0Pyfn4qYHtgyQL6lLYU7D95hvmWiV
	hV6fmLRrhl5iJU1Xw0sW8qo2dK8fz2UTWV6y3K6/5IzA95UzpdnXr0tmW2etWoAYnHCJoKM34MW
	PHYiprBfdF0J4ff942TjKjwlXCfvat7/yXRv4mdVsBoODMnE6RGQtzX0A/1FFpQnbU1S/OiWwZ3
	Qk7+ZQqhNCjD2CBa90CSeGQN5v6ltd8H/tOZSSyDgOvSIZmHuCUpflowTQKE9tUneZV/JfJ2fal
	nvnhZ2T5JKNBNesLiqMIW3QN9VP1pZaK26BU34zW8ZhYlhpS91NgpEaqEQjdLanPn7thJU9XAaZ
	GWjqBsZPSKdWYJnKkdeAX3Pt/Otv2cQab3aKVRk/ru
X-Google-Smtp-Source: AGHT+IEAG2AbkEWEgsSkZu+MuSB+v5gfeMLkTTWEBMu2OjiTHCx/hYVcdA04MxhoZG6sPEBcfl+3xg==
X-Received: by 2002:a62:e715:0:b0:7aa:9723:3217 with SMTP id d2e1a72fcca58-7ba3bb8ed77mr5901432b3a.25.1763206970351;
        Sat, 15 Nov 2025 03:42:50 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm7982772b3a.0.2025.11.15.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 03:42:49 -0800 (PST)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] docs: parse-headers.rst: Fix a typo
Date: Sat, 15 Nov 2025 17:12:33 +0530
Message-ID: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "vantage" with "advantage" in the description of userspace API
cross-references.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
 Documentation/doc-guide/parse-headers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index bd34a6d00ca9..a7bb01ff04eb 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -5,7 +5,7 @@ Including uAPI header files
 Sometimes, it is useful to include header files and C example codes in
 order to describe the userspace API and to generate cross-references
 between the code and the documentation. Adding cross-references for
-userspace API files has an additional vantage: Sphinx will generate warnings
+userspace API files has an additional advantage: Sphinx will generate warnings
 if a symbol is not found at the documentation. That helps to keep the
 uAPI documentation in sync with the Kernel changes.
 The :ref:`parse_headers.py <parse_headers>` provides a way to generate such
--
2.51.1

