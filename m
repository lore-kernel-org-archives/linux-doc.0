Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD51A3CBE6B
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921280; cv=none; b=KSnX60I1GzDTBVkwJRr6+T9a7HKkbXOuNCx02peNU9FrllMQjil1plO73jN5wib8jMLXzieka415yZx4RiO/GqR94r/I4s2cUOeXWmgl7eVSy/erdQURnJq5mIhPSQ89mEw6+zylpEE1YC4pwM2QSIvmlxWv3hSdwXvl+CADvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921280; c=relaxed/simple;
	bh=WPyPzaSRaTnzB6mhbsFnIwMaJzShqPNEdZeO5tc9sFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hcvj1C0d3W8KfRxH7KyNF2I08engtKV+d+FishZVwQ24FL/W34cO6FT9f0Cv6u/vStohXkp0wAT3xcRScAyzwA8o4wcdLdRGjhh7YcEyfV+0NxwZNtD+yYo1VtToOMjnwgy7tCe+OxGY4YU57th5Ktn51I+t3D+FRkZlPclDNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZJwTVd5; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZJwTVd5"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0c482e069so784235eec.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921276; x=1774526076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tVuLgi28xvpZfss+et5SWgyfPFU1alqvS+0V/Ho1gEA=;
        b=HZJwTVd5PytbFpoEAbzRq4D2bWlzrrQx/VtWpN56+TyTKvfsQP0qZswwAeULkuCh9b
         0GL3JxJBDfnRwIWE0C/KNLmntQKARheHu7NnOMcLQNjM9VAWEMYlAsnQHoT2vwDDVndE
         /iu9PITNCyEU5SQmGSrIcfaqJMta6WBl8fBpXGrhcjj5Jb9gO83nioZZVCqiZrsCOPLR
         QiCaxG7yY0xo3vCdHdRvtImHw1bY+rRZ7tWB2vJ29sU1RXDYnft4hDRXc5tXtNYr6Fj4
         b76F+uKThvDnBjJnevs0aZn9GoiRIOiy+NJVyI3TZADIZoD5R0zccr00HICvRpWMYtu+
         waHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921276; x=1774526076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVuLgi28xvpZfss+et5SWgyfPFU1alqvS+0V/Ho1gEA=;
        b=XnhHROYyTxBp/j+A1yBz1DclwRjPqkb1WG2GEad+JS3E6hn/F2zGQmJeHOwOblryPc
         B2iD/9FaqNfuFNyhTWgTdOZCY6T3vame4tvhX0/biK+XfTVVSGg9qDXptP2v5vDug16k
         rfVSvhhPJlPro95vImIozq8aDjFPrLicCckrJ3Q7V7ZZwTj4qjbwnwrreNQE+N9Kda2W
         bAR2IbD3yjEmGv/ht0pR3vV/qE0emXZ0l3+ad5PF97aQdtU93ak52HA/o/ktLFPPJaFv
         O4hAcimtDiOyRMHj0FZzR+b3PkCATcQTNU7sqyc+rH7oGgGqqQh6fdJng0QDYge0YSEn
         8iTw==
X-Gm-Message-State: AOJu0YygNWZNOvBMcxv6c9EXo3dH7CYHBD4JhWXQK/JETEkOuQy/8aXW
	Mn1dH9Yv6+X0RvMOFiMt9wUKL3lSucgm+8mDhzzbo9S7QtpBOyv9WGg0
X-Gm-Gg: ATEYQzwxeZDqUgiNkGe0K8oyTXuyS/kMPaNhIPwcckKPF71Mf8ij6xZ/5ZylTJe6JKE
	RsCMymSKGJKpoAXiWAxaTMf8nNIHiSF2tx+sxHucCZ+vz5PWfc08XzgKIXvxZYLPRQG5defQsar
	j8Ve62MNLQ67x7MdsdoCO/q6aRX6upw//gE+HB7kVftzu53pccRYM4u5ozRt7sOrmt6AwwlSEw9
	4r2xvGEXMgF3ZEpzidWExRqaoj9bCXzT3lhToZqdvCSYHrCmedIDfeWAIH7B3G8RzJI9CYQp3US
	/YTESvFdJr02X26vPwzaU4msvw6azeScvWgVfZj1JhrRxNaEOaQ40hy8B1Ait+LFyYigyj0U+GP
	5VUo0MUf0dHFq4S2w+bA+wR84AE3C0bOYGWD0B+qzOKK2rtdiWnngymlgLslyKRneA21qLLs9/R
	4u73FQZNuu70dgnrwFhq2Jdfg+rBbpGUnmXnmpqXoBXvLkiBEnsdprTMlMIW2ihoir8R24+wAMc
	B6VL/SyMLAKL+vY
X-Received: by 2002:a05:7301:4b0f:b0:2c1:27c:7598 with SMTP id 5a478bee46e88-2c1027c834fmr177699eec.30.1773921276235;
        Thu, 19 Mar 2026 04:54:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:29b8:512d:4c55:1868:543f:1aeb:fd26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582c31sm7937917eec.16.2026.03.19.04.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:54:35 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] docs/pt_BR: translations for SoC-related maintainer handbooks
Date: Thu, 19 Mar 2026 08:54:10 -0300
Message-ID: <20260319115416.495020-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Portuguese translations for the SoC-related maintainer
handbooks.

Changes in v2:
- Fixed a typo in maintainer-handbooks.rst: "mantainer" -> "maintainer".
- Small alignment adjustments to follow the kernel-doc style.

Daniel Pereira (2):
  docs/pt_BR: translation of maintainer-soc.rst
  docs/pt_BR: translation of maintainer-soc-clean-dts.rst
...
