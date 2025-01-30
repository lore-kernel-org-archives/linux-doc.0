Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F8E186294
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738222096; cv=none; b=rXUsYpJPFx/UDJQRLzC8HhYphVeU86uQ8d8xWvES+4yGzCPhyOZ8GWvyKxCQWIAFCITybseHnML9xabHWypJ9yR0o3S5g0/J1oufnIE/zswXqzeRUed0iLFP017fE1VMJn/Or3NY5WZkjylIbkJ98P0bM1cGcUiqkERefjX7bAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738222096; c=relaxed/simple;
	bh=FFZeu67Z622QDkOF6huQ5ds9Jtnm+v+wgBN3iRA47O0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Grnvh6r2hPT/KZznCGiemQl+qdKeKMPvByvmma/uELXLIePcKQE7/zZ1vtRIAR4D+wztevsKNz0MXep48YEOArkNAi1ogSUE5ZDFpZKWEFENlIcKzxsQYRIRREYXIIv6gYYDQx2idjVS83N/NifCOOvjR2Ye6nuOYCmACqK23HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PP5Ufbpm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PP5Ufbpm"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso596776a91.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 23:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738222094; x=1738826894; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUzOwhTMjyNeBzh15YUowOVo8uH/sOBHHCtVqtvYzHc=;
        b=PP5UfbpmsmtZ6D4ROlwn/eLAFfAsLeOZjFp2Uc9A9u8cQeinETrhS4Fm4XBDJSHvrU
         55UvZgaiFp7q/RnPvRpZqLwQEw5o02QHmwYrU4gv0WlU0+gpMURJdhGtyEUE15skm5FM
         Rk/2QoPkZQrQDSkJmoZyBP3TW/Vy+bby8TP/Q9ikdOGEEcBfE6bAKsz3hqtl+wVlLSG5
         E6wm+gwGTkqOv8AWoqqFNiKKcKRUnFKPHS6GU4+xT0iy3uf9BDZsSHc4rXvCOJg1JD9+
         DYJHjXExCkwbrmHAsoWkyu/NS/8Xgq59HSVGVmqOTTCmDil/un50yJ1P0z+xh7U9v0xC
         7/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738222094; x=1738826894;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUzOwhTMjyNeBzh15YUowOVo8uH/sOBHHCtVqtvYzHc=;
        b=tnx2xcmNKVAVNC/ud9CnGNuj5Jz0rziZHYgzK7Hi1N865hfB1A56qdtWXjrE5nHxra
         8FnPi4vpIMbm06Dwzw27mM0+FM/BMP9BwwDzFDLpp+Hrk1pZOCkpUu/YP2pymQG5lGzQ
         dgzNMwCY1UlrQVqiLhDp8W87XFAd+SkY8MAWcLuXdWr/uvPrgcJzyM+HKGGFws1X3pP5
         GiAKOyOJnKa3Y6pxNzI46xyNPi+0XhntZRwaPGORwG6uOLxv9R0r4AtjGcA8L303BLq6
         FxJCGECCyyTQq8csVi7IA5PhX4C6W0Gk+cGx+djlIVqGY/9MwKn324P4LxUYYKS4nPv0
         tohA==
X-Forwarded-Encrypted: i=1; AJvYcCWHURdkkXstl9EwQF6HVG4hVDWzzcxhrSQ25SuQuxwb0SjtF7g8V6BtcKXjYBTa/pWsEyFbRL+BdAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpYUpZ22U/bzrMrCCpI5Afh3kbwVaV75zkTmc+9rIg2coHZIi
	1vpq6N2JbYHGk1Hs/rHpgNLLnWFo8EIQH0stKIviJayhk6CRYZKD
X-Gm-Gg: ASbGnctRJfiD3Hm1aIyJxhUNnQLm7MJpO54kSPXjlwiw68UGFhOqxsaUrG5KffDgoow
	dC/zE70q0Ydv4lLZeZ7CUdi3LB7VUbZMJCICm/FJ5/urjaK7VdbFSG50AnZokqTrFmhYHOhL1JL
	BwoT8u2xxFIm+8PNnnUpRf7EQNRahh8XBs2e2VFbobpXFdoQ/teCDnYtSs8pn3etk18TZR6ZNcM
	akxntq5NT7l42I5wHZ1loh0qU1/HxnMsreE+bkyuaeDczHUSEQG+sPNvw8NxuF2cXU36XYrta6B
	EgWc3mzEjycTMs5qmF/p8zpdyOzKaOoagVsxaUfjOUNtyMVOrORzCCSMesQUog==
X-Google-Smtp-Source: AGHT+IFTHB0FwfDS6SiL/fp+bvY4AWl7uh/Uvd28pjjZyfdSlUO8dMhI5yo7JmQnzdZacuthUzQO6Q==
X-Received: by 2002:a17:90b:3a08:b0:2f5:63a:44f8 with SMTP id 98e67ed59e1d1-2f84635e05emr3783774a91.8.1738222093757;
        Wed, 29 Jan 2025 23:28:13 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848a99a91sm839535a91.36.2025.01.29.23.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 23:28:13 -0800 (PST)
Message-ID: <05c0b99c-c2e9-4702-90fd-8a4127586424@gmail.com>
Date: Thu, 30 Jan 2025 16:28:09 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH v2] docs: submit-checklist: Expand on build tests against
 different word sizes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Existing sentence on cross-compilation that mentions ppc64 does not
make much sense in today's perspective.

Expand it for the benefits of testing against architectures of
different word sizes and endianness.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: Split out change in the English doc from v1 [1].
    Keep Randy's Rb tag (as it was meant for the change in English doc).

[1] https://lore.kernel.org/20250128102805.112691-2-akiyks@gmail.com/
--
 Documentation/process/submit-checklist.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index e531dd504b6c..88b6358258d7 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -91,9 +91,12 @@ Build your code
      fix any issues.
 
 2) Builds on multiple CPU architectures by using local cross-compile tools
-   or some other build farm. Note that ppc64 is a good architecture for
-   cross-compilation checking because it tends to use ``unsigned long`` for
-   64-bit quantities.
+   or some other build farm.
+   Note that testing against architectures of different word sizes
+   (32- and 64-bit) and different endianness (big- and little-) is effective
+   in catching various portability issues due to false assumptions on
+   representable quantity range, data alignment, or endianness, among
+   others.
 
 3) Newly-added code has been compiled with ``gcc -W`` (use
    ``make KCFLAGS=-W``).  This will generate lots of noise, but is good

base-commit: 35ddd9f3c132a36856f58088bab06e873c1af871
-- 
2.34.1

