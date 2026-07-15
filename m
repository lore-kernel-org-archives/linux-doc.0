Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403A748B360
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129948; cv=none; b=SiGJfABrQLiJr11m1CcncieHnsaJ/esSYzF6xfSIFAgdBGFJkqgWsXUeZ1I/Ed1BbQ/heWHJ6odjZAVtTxhyalVuC5yg6GAN/0yKajVPkV85X/j8Wd9G9N0qYLyYo8sc+Totbh4xv98Qky6hlLX0v92MgGcUj2JKpavL5SwS+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129948; c=relaxed/simple;
	bh=31/AeBHU89rF4Rg5kK/ny14p2jcNSzDGk5CcnTNT90A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jYdoX/F1pyDDXh+zDu7PslqTUgsFAUlU9e5qn4vM1vGSXRZOy42BdPMGtfwbSBzI9SlUQw3AV7meBRHIOtHBSmCkJSbeLokB2hE344QrqxPTB9mBLdmmrYO/67wSUnpP5Lby4r8cIzumOZEdw8j92uReeivJ8kWrKdtZ3kqh6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLR0wRar; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLR0wRar"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so38700625e9.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 08:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784129945; x=1784734745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q6FyomukVh8AHc9oMUtQCH7mRWDRSNjzWrBvxz0cBQQ=;
        b=mLR0wRaroOzHHmOVfNYRRG7Ph4ThmXVVPahPDjZQOh0Uc9agrcUE7aDQCFPMG7sIkc
         gl8tfK8bHQnwT821iw94TUaQ/+4llKWZ9khE6XOYaeXdRW2abaEUcIdESgliR/H3tDMf
         1DIlmwXnsiI9naRHc864JdSkkG5Rcn4OEIXxpngVfEECHdC/tj70eGhjm6LAYnUnnyqj
         tZJ4RBvkJwd2jlSZw195OIDMdU8TXgejsAyJL/NE0SAodmIkOxbBS07VbXKZoNUPbqRb
         M64glZkQXRv+58W/fM+IyPnRXywvL4zqga8o0sCeF7PxTi1EsJ9XanzDTsricvIjTUzE
         fKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129945; x=1784734745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q6FyomukVh8AHc9oMUtQCH7mRWDRSNjzWrBvxz0cBQQ=;
        b=EaU3jF1nDVQcc26NeXnFiRGMRejnG3kWBhO49Sh+TJQD6cD26Q8vecJh3X85UDP40b
         9O5iTzlj7JC3pg522mz+Bp3Bo6LkuvkBctGKR+8gJg1BDcFzbu56dkxepWLGq7DebiHJ
         +dn4WS2ymUo8UTKqrdqkQl5ZQE9JnE0IyHhS9AeQ9FFdbWQ1y5ssejYPuh/CnJub/qi9
         p+tPhULLXvR4S96DV4JTKhk84HqLdnx98c3Ax8QEtws4sVmRhd56EdhxR3QmD/q+RVbb
         wLjaCOs1l/krsBlaWegw1Vr8Q+pIPh4ra3hd+bpyaKQw9Lj4H2vThcHlsXmuhC8jry6N
         IqJQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro5wMdmH5gKebyMR114YXpR7kr1aw//vCvROczYja+o2DbnZFNavj38UB1mipHaH1c79HAVJ5EygXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/yTlhJXZwInC3vbtzZBUIxTHnttHVbe0di7VgOxKfEOjROYoD
	RGI1zvHOAXaIkU7dTtynj9iGPpiws6joMpkWvSHryIAwFXFRYph/1Us=
X-Gm-Gg: AfdE7cmxbeY/VCXcKNuhBB9JW9uIHJ8QTqouwyfHB3kwbw4bw92MGNT+tDgHhL/hP+v
	S6K+wy0Eksjl4tWStrZ7v6ZmfYq/0gzO0TYphYSutltAeauE82cacp1lc1t9vBvS5TTueRvgrwX
	4hYfwpPMYd7zRu7/2Ruc36Zjs8NPGd3rhuxPz8Yr3OKMmq4rRfyYxRqclsKxY4KCUrRDLcK2BOl
	3idM5CeJENXqNWM/XzGi6n5LfUsp4GJ+zd0OxUt/5IFeROVi5CPVxBJ9ckIGejMzbN9YZauuN9Y
	viuTkcCcDtSXV0oFYnyMokHggRoV4kimR0YUi2ff7eQ4FCAGZhQURL4UG+2IkyaKjId7qKaqgDE
	vUCIIORGCH2yuwO6m5x/MCqhZnWgb+qWB2zBDOdWl2/jdS2epxoadmh7ByFanqQLhIx95SswPw/
	WJ
X-Received: by 2002:a05:600c:46c7:b0:495:4044:11ff with SMTP id 5b1f17b1804b1-49540441383mr9026905e9.33.1784129945352;
        Wed, 15 Jul 2026 08:39:05 -0700 (PDT)
Received: from p183 ([178.172.147.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495087384casm160850245e9.8.2026.07.15.08.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:39:04 -0700 (PDT)
From: Alexey Dobriyan <adobriyan@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: adobriyan@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] CodingStyle: clarify variable naming rules
Date: Wed, 15 Jul 2026 18:42:20 +0300
Message-ID: <20260715154220.234028-1-adobriyan@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* sysctl stuff better have "sysctl" in its name to remind developers
  to use READ_ONCE() and that their values can change at any time,

* variable holding physical time should append unit of time to the name,
  to make life easier for developers and static checkers.

  Jiffies aren't included because I'd be crucified for "_ji".

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Documentation/process/coding-style.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index a8336582f60b..d97ed5be4eab 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -356,6 +356,11 @@ specification that mandates those terms. For new specifications
 translate specification usage of the terminology to the kernel coding
 standard where possible.
 
+Variable holding sysctl value should have ``sysctl`` in its name.
+
+Variable measuring time should be suffixed with the unit of time it is measured in:
+``_s`` for seconds, ``_ms`` for milliseconds, ``_us`` for microseconds, ``_ns`` for nanoseconds.
+
 5) Typedefs
 -----------
 
-- 
2.54.0

