Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CE02D8398
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915935; cv=none; b=iAkoE2iG/UkZ8qv1USJDZaK5kfe2kCqCSPAzprK0kpEgGkZu0KUd5SUSoOWjMHhXRgF9E3oIEW+5cuF9BffCWFKGyvdiGg78k88O9MMjZqtbarNI4D+hkFt0UcqGfjZyDk/U/Aj3EiB9gpUX9JkRCKm3toQJ8Y8pS3+ct7e8ATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915935; c=relaxed/simple;
	bh=yVT7zIEM8L0Ayto9GaQ35FMCs7tJuffENXDUPRt+cWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWbaR3IobjXv9R6wEOOOYrK2qniTJQa4O3gv12FDmpq2xjJMHyYMYbmXplOquY68z5CK+5HQIp8Chtr42JnZ1L3aL3KBWr/PuAU/+S6/vet6WZh9EmKT3UTI0mpUe9pWOEBg3O/LiMPtXf+cxCGemD6/fQwXWSMVTs+wyxSS7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g29Mp9NI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g29Mp9NI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3215b37c75eso3574299a91.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915934; x=1755520734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/o0z3DaV7VAvUAExqBKbFBwFPtOI2swPV6d6/RKxhM=;
        b=g29Mp9NIVmr6Kvo7gvLpmU6nxK2gapf481srR1vQmXDCMD0BXtDKG1aWu/plZDjcmE
         dwRRpa6WGYV7PalSO9pvst/lo1tffKkxjWTwwAa39qRIr/ADVtFQcm68efsY5uLMdRQ2
         yVa2vcfseThRJS+nNUQtpXx/xwoUyw++Ijqy10NxuwU7DWwtmYsQ+focTpSogFGtYv0k
         2oFaBixeR3uLKhCv5fixDglunlN9BWSzVeq+W6R9bEBlh7NCiLzDZLrp9ikHUdFJVcmL
         EbK95BW7ObJgEPh2Eqf7Pc0/vcJWuexRFEEgDNVrEnYYmAjrlsGbY+/W1anXz8ydPGB3
         mgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915934; x=1755520734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/o0z3DaV7VAvUAExqBKbFBwFPtOI2swPV6d6/RKxhM=;
        b=F+68eCRfrUORqyb3cJcMLt02IGXVdCiu0TkXMO5a2abqeEkk7JAuBkXIClKixsrGWi
         37370McL5nTBvUHd2nRh7gSQV+F3/9+NesPDS5LiI6UU37oNgF2BYsfl5j/QCXV3hWK0
         RC1uYAy1o9SY0quMMICPkFF7MitYnueCmOWa/cc2vAI53KWykWclKeiRNWIgDspSRFx7
         2IU9PK9VW83DWkBqzgbR5n7Z+cX/U2j1KgyZDSUTbfV1xvYfIr4bWXC8VDuwipcnJTwF
         5mf4/Sdo8dWQL6gZNplIjE39A+uR72DkV6PWFTAjfOA00GJ59S8RA6m0H1UfBtfRQBIG
         cCyg==
X-Forwarded-Encrypted: i=1; AJvYcCWlB25ep2w6N0xGar3f6o/hG5eVXk6GhQFHrIVJqC4I8Z7OxR/7T5uaCg3o9FrVxic02PHuldvG/Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfW4vfGBph5dcvmKvAZV9MvZX6cvTbj1Ext5UkkPjaPJWVwLFN
	2Qmpj9hJ/a6aLxSXdqSo2Tbr1gpOmypqjZ9VtLNN49+FBX2UZ4TCiy4=
X-Gm-Gg: ASbGncvFe4BW6nwlbylObJRld09VYDLrK4b9tFwrNw2AqZELRgI0dswSO+ivYl5A4U3
	kLGmKRqO4WYX9XMyX1HThFQiSlBxAI59aVQvcG8HnxRVeyFFkqpMxJgvwwOwlkf7n2xK2qfX5Ar
	mGpIT641nyAciHyzk2OZUFhbvw/3zziiEjTYymzzmkwbUvgaMio+WWfTcFfP7lNC7zL+HDbfeN1
	0hikxwII7wBMfeo0GCnhAYEbNz7YL8QIdtL9CUkHFPSLnIk4c4MFPzXsAyooMkN4Nrur3dP4Opv
	+oKz7pIhDll2xCOHJfuWRt/lcKThW5oYKAe2q+WhpByWJhPrBZOcAYafxbz4Qm8RGUEB398i7rD
	3cVu3396mKZfQlXScrS4C58XgDmcIi+ZK+e8/q993
X-Google-Smtp-Source: AGHT+IHf7OTgeX8W2U5Ar48gT005QTx5frqtP1Vp31xYrf3Gih3brf/ukJ5kgvVzbR5OhuRlYsgRAw==
X-Received: by 2002:a17:90b:4f4b:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-32183a04a25mr18566994a91.12.1754915933256;
        Mon, 11 Aug 2025 05:38:53 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:38:52 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH v2 0/2] docs: fix dead OLS links in timers and RCU docs
Date: Mon, 11 Aug 2025 12:38:35 +0000
Message-ID: <20250811123837.4378-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates outdated Ottawa Linux Symposium (OLS) links in the
kernel documentation. The old URLs are no longer accessible, so they are
replaced with working references to the preserved content.

Changes since v1:
 - Added missing Signed-off-by lines to both patches
 - Updated commit message prefixes to follow subsystem conventions

Nikil Paul S (2):
  docs: timers: Update dead OLS link in timekeeping docs
  docs: rcu: Update dead OLS link in RTFP.txt

 Documentation/RCU/RTFP.txt       | 2 +-
 Documentation/timers/highres.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

