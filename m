Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5235274FDF
	for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101868; cv=none; b=GxEf4blRy9cUHDc/XbrrxLyOYV1/QzdINLtuiiCpdditu20M03Sb6YpCn+81DIMooQ0OdsusKL5WJJa+Ip7tAm3WRFBOk9ybbaRyjK+zhvyIQJyOGLeZ2o0q3m09q33HhbZ+KbMbHqz3gqNi4T2cuKVRkv/hsTRXBEnpEuYfdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101868; c=relaxed/simple;
	bh=X2wrRlpybCuUP8E+y1h2rRCIdCvYOdFx9nmrsco4N0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T407z2GOUSlvGprAfTqhkSBomamugOUr8xyaYZtmRmRU7nTWW7UkjKR7DvURaKN08wJhK0sWGw6chLeFdaJwaGoyZFLgzn5gCTBCf9rGH7B6h/AUoByH32FdefcPGsiowParpdlh8J4fPQrFHiD+00BpfS1Wfw+WZHNbCS5xDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U51rixEI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U51rixEI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35a1230c60eso706460a91.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774101867; x=1774706667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biVFhg7XTNPeyEwAFIBOlzdhtE8Gp6Bm8EvDUDEBSKE=;
        b=U51rixEIM2Qv6LFWkWm2yDKm146UpklRdZ+E0QoZj1KGMWCHgseTvV8H4NOq2mrgIa
         T53H733CBF1ejWSYbtXE820QUoPr61BoPZD6sAaMiroTpY5enWcQD6SURqIMShOoSPOm
         mP0n1RMYNQM5UmqCCTTcl/RJNNAxItq4oG9HiOzsjr/FTMKT5z4WtOeZYIAaAWylEQpr
         3+dRP5kp7n6JCiaM78kJ3b+MkhKXwBwW4xcyRP4taoL5dzAG0Yr+drEKqmYVN9RRNBao
         WR4Gt54iQDqhz7R9GBPq8Z9KUNmmJ76a4AX4bQtb6/0zYjA8S6CEZLwkqwqULc8Nsx25
         ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101867; x=1774706667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biVFhg7XTNPeyEwAFIBOlzdhtE8Gp6Bm8EvDUDEBSKE=;
        b=SDPisZRYRO3ItXuPRugrinJvbTbO16odltRugpsE7hEB6Cf6cDpXHcCjjisMMhRgvF
         Znb/IRDE7CjqsrjM/mtfbRcvhca6FjN2N+Bt7UX9yD4IwujStUvd0NQ8YOm2E+50CaAO
         fWpibfS7eGP8xN17o3QbtfW0uaJ+wV9vudga6BuV6HkBu6idJ81ygX3L45vlM3kE5KKt
         1CXY4wBqYN8Phc4q1WftQerwDsWEAOKbhYmm+XOqaZaA9bzYw7kQ3uoIPDGnQsJgxSv9
         gYeAYv7gdbOvzIlMUDGPmxpGpFbfWtFH57YJRU5GqZ8LLovwtVar0UBv5Gg6t4gth5oP
         6VXg==
X-Forwarded-Encrypted: i=1; AJvYcCWM0RHVP/3U7CXnbn5T6Xc4BrVLT4zjjij3cbQsTLi8GmP4e8vhPyyPs+dYdAT9rwbyFv8FUY7vAFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCVwFKSlte4dqkdb5Cbo1SeO/pTJg8bV9X6TGl2MDErUk0T0Jq
	JGJkdawZyNIbnoVim7Sv8jLhxN47JX71NJR6JdRJv2+9NlaFBV1ezub8
X-Gm-Gg: ATEYQzzy2CMp4JAgtnxdOWmBVUMYDs0sTQ+2+/vwKox3+q/wo1ONF+cBa6FAZv/xwp4
	Jt6i6vRRZp0lgivjiZUHtA5FN5K7oGiST72WXyyvNHE2UZ4wM/upSwITXzLj1V0HFo+ChNAeZoZ
	tPsAMQLT9dtyoAqevl3FS3C1SdpSceret9cuh2dkR+H470H+s3O9Jzwlrq1v00qom1u5HxlBEw3
	iRl6N+vdj3nBFiLxJMMUAY+ymn/If7bBh0C1vttpAG90Uhxx0yAlWWJLosrrrPHzGFq4UoKJfZ/
	1RfakqSrjQhbeCgmrNBMImSZgkfU7hZVxQDRiCGFtI2ve69Yquxw4uL/vrgZ8FYDqvFfpWN7n1X
	JFHLefH2GjuovLTdfSYVjTCTYrzibpldTVDBf2PjTSa+BStQ4K70o48hqTc7/ie/mDv5Pez+XqP
	KO1mgBsJMb1n5K9ymfyZuLea9z3LOv2syepphRSXYE1ah6gyPtAFWo3Kevgj+NixjNc4HtfoGtp
	eXj7ACoZvjt5igVqbmp6w==
X-Received: by 2002:a17:90b:35c3:b0:35b:8d89:719a with SMTP id 98e67ed59e1d1-35bd2bf6ce7mr5293468a91.15.1774101866960;
        Sat, 21 Mar 2026 07:04:26 -0700 (PDT)
Received: from ninad.. ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd412b73bsm4465403a91.15.2026.03.21.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:04:26 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rhys@tumelty.co.uk,
	rdunlap@infradead.org
Cc: Ninad Naik <ninadnaik07@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com
Subject: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
Date: Sat, 21 Mar 2026 19:32:11 +0530
Message-Id: <20260321140212.5026-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing link redirects to a generic page. Update the link to the
specification document.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/sound/hd-audio/notes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 6993bfa159b4..c16f83875b80 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -42,7 +42,7 @@ If you are interested in the deep debugging of HD-audio, read the
 HD-audio specification at first.  The specification is found on
 Intel's web page, for example:
 
-* https://www.intel.com/content/www/us/en/standards/high-definition-audio-specification.html
+* https://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/high-definition-audio-specification.pdf
 
 
 HD-Audio Controller
-- 
2.34.1

