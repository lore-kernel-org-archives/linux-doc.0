Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5C287257
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 03:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771902729; cv=none; b=AY3SJJlqUIqRT8wpffHoZHXRCp+Ej/irF4PZIAe7JBnu05h0tVS6Dz9+gy0PUGhPjHKNVSdgdPq7Mh0vbNsl6o7107nWm0cSMiAJKna+kUcZvxpxx5KMLfQ6wz+s0k69SmwfQcbdAi1khJ56+Kn0Ieppo/qLfPrEnwY2loJjIUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771902729; c=relaxed/simple;
	bh=tSNsnUX1a1Uhm+LPGV8/rHsBinKojLH1dm4Ng87wDfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3TF0J6frKW6lvuPtB2hCOHltzu41RXc2IoDgbP7tgWxQRScDfmfe4gXkscUYqu00fwlcHEvgrb4+xx5tOULfB4gIN5LCzJ1ekNeCChtlGY/HIxo/MpkCTXzEZScwOkWuhQ075k6r4YqiJXH4jX5277vqMcgtxnN3jV4skES/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OASkliOw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OASkliOw"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3562212b427so2037117a91.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 19:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771902728; x=1772507528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bbUO8plBlOTM+tal0dykX3Fp7JMzF6AhL449PX2pvPw=;
        b=OASkliOwkpdydSqHWDgZZr77+q7rBCj9G9oVSG6yWPyfztgnTuCD9REJG226a4MQkq
         L7qBlxGWr4mvfgdnQqNReqyY6e3Ruf5k9b7sFUJgQ6WnRyr/VzHaJ7l001HrxGDBKlUi
         dMKNxFsQwF2gBHbADlm0nsfjMRtgM59VqBLB4sTccCCcBcEG/iaE4zkzWhkqk0omdkFj
         RxxixEQ8/xn+OfPs287ltD9bTn1pz0aSd8DJjfJw+2cWcWlZWmpYtNn/mP9K28mYsGLQ
         gBEUhfCEi5KOJsiZtO9RKOuqarM+rFW94Lbc/9RorNVtLWcjOn9oyOiEUu/qNOTXroz9
         hW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771902728; x=1772507528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbUO8plBlOTM+tal0dykX3Fp7JMzF6AhL449PX2pvPw=;
        b=b9SZj/5a3TwKEjb70V1ohYZwQrE+uqRL1RcYmnyv/wozJ4N9oPKREYrpC2/r0JXq+G
         u8MOwYTrXQzWxh7Aa13msdmJPoFOEWnPMVjgaMhTVvwh7LN5uBDBbnyYsxj0LSaqSwX8
         E+WupIn3WeuGYV6HRpRAucFf9JMlbjjwaOcT4EABHoU3w2C7+BFbQ0tggoppHmgzit55
         Sjpsy0KhyDuL8v7fzQOdxufLFTzOXyiuAqlkt1+0W7h5JBytJHFyr8TocU/0uC4EaGD/
         f1LeAWkX/Kf0UgV2of4wg4jftaMz0bngvR7djnyYkoubKQpsRdBvzGk6wFCKqhFCcZdK
         198w==
X-Forwarded-Encrypted: i=1; AJvYcCWIPPUBHUm/K33I+cZcA66WiDn5jrgYv5bjrnbF/CU4+21va+VSV25At+KQiAh8TPymqb2VBfnePzo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88yFRXYo242pv0nyPPhg+XgK5FiuV3bq99QXrKD5eonPvE0UQ
	sshD0o8wP/ZGQ7o/iilSAX67B1PfPI3ObdXjYKg8e2+fWHfOEDgIXbg/RtSi0DQD
X-Gm-Gg: ATEYQzz7Sam/C6XvtF0Sp3ntcxEpB9QMfYMNylrlarTMaC/9h2EZAgQiBcNU1uguspk
	ZK7eOfOUdN8dGIfk691D+KvIADkYGSQLRyaaXgv88/JjMWbA3++WGjiSMALHrio6YtxuBytLW/F
	pbtHWZCd3zo+nLXzIAEbxCxylBQbrmuOC3vh07eZU4YBgSAOcxV2Cyvc67DXiC8mBn8SrqJmWks
	YCWUk22WK1J435LBU4S0nyQa0IapJN/pMlvDuft9EQrrYjawCf4bx/IwbwyEbsJo69Qh6uX4ObZ
	pmjCZ/kU8rm+DiR0T1lHVh6r6H4kveASCoVELKWNbkrlvZXzSQN2kl6tBFKKvbDX3X+f4o2bfnA
	B8M+O58mkbn7mUFuVdcQ2+APpffAWdz98/zLaaCAZ3ah4nq009TvR6oOnIrGZDVz0J9PlLPvRKq
	xVOXv7C1pTwNr43IPV/qfAouBkGOIdmvM=
X-Received: by 2002:a17:90b:17c3:b0:354:e86a:3066 with SMTP id 98e67ed59e1d1-358ae6b4f77mr7601576a91.0.1771902727928;
        Mon, 23 Feb 2026 19:12:07 -0800 (PST)
Received: from localhost ([103.251.247.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d80cc18sm12442325a91.3.2026.02.23.19.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 19:12:07 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] docs: reflect equal support for gcc and clang
Date: Tue, 24 Feb 2026 09:09:06 +0600
Message-ID: <20260224031132.14478-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the programming language documentation to reflect that both
gcc and clang are fully supported compilers.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/programming-language.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index c18e307ccb56..491138ae17cb 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -4,10 +4,11 @@ Programming Language
 ====================
 
 The Linux kernel is written in the C programming language [c-language]_.
-More precisely, it is typically compiled with ``gcc`` [gcc]_
-under ``-std=gnu11`` [gcc-c-dialect-options]_: the GNU dialect of ISO C11.
-``clang`` [clang]_ is also supported; see documentation on
-:ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
+More precisely, it is compiled with either ``gcc`` [gcc]_ or
+``clang`` [clang]_, both of which are fully supported, using
+``-std=gnu11`` [gcc-c-dialect-options]_:
+the GNU dialect of ISO C11. See
+:ref:`Building Linux with Clang/LLVM <kbuild_llvm>` for additional details.
 
 This dialect contains many extensions to the language [gnu-extensions]_,
 and many of them are used within the kernel as a matter of course.
-- 
2.43.0

