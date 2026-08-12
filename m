Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB6399375
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517967; cv=none; b=Ay0Ew2YBV48bX/gV2Oci2Xc4QgvitL7PIYHWcmFfoPmo4tGYyqW45kC754uJvpwTKSje39Q9eT+Q6CnWKxVMY7E2UyAZsYDPCodTfh0ss5Xw0mDCP4xHw/s09650o5yF8LpJ9L233L8omwLvbkhdCQDsBezaFscOg/7MsGNDeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517967; c=relaxed/simple;
	bh=WIAuDm5KWKeCXbUA7qblf7Ti3VLEdPQOqG/N3pB7uF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=js0cO/SEJqr1RcmcIcgTKlaUuuMTELRZO2g6pdFLVYW6RoCgtmwnkzKSsu4euIOXr0UQ+rFIM5jsJjj6grf9EtOEwVTm9UumrRp1350hEhei7KzaSs30GfQ6VgVvhh1/oGRMZI2wPjQEMx929xVt5e/nZv43Bk8hN5YVSeU9qEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWAH5P43; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWAH5P43"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so189845e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786517963; x=1787122763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYLC+//as5WkDB9Cfqs3UoupJV7njGedAREDeXd0kB8=;
        b=cWAH5P43KYkdS76Gfj/Izwf9Jr5TVV2+gxPH8SiehA2TEs4BUUa52SVYtHGjPb12lk
         GLoXEEVDizefKlq4dXuc9mmiszB/DX16CsfVK+nI04XIFG69IG48efITgahM+Y163vLX
         Cixl39Mcf1HrSThYpvsL5O5awmkbD16s42WmoKMg73ZR9zWm61VnJu/d2vRYHKP+gClP
         76yF95+7vjLSz+46EUxqmPxzjp+GrGANn3wrBJn32zcKN80ZIke62lBqfq2MzViKkvoL
         AOwlw+hpkeo9UCDvr0R0EDQsPSZgDXREw6prPRU9F3J+Gj4pZtPPatfcaWwdavLMa7x5
         B3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786517963; x=1787122763;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYLC+//as5WkDB9Cfqs3UoupJV7njGedAREDeXd0kB8=;
        b=T0ktBUvK31V/7fGY/zuWFhDgiKtHwInQm0FcZpdb7awsA7bS92lQHTHCDd+sQK2epm
         KZ3THwqSJi1Ici1OjcDDKZG/CwM4OQaXXdrn/3Q7VjufVvXZNLIh8TLbjPZvcs1aHU9B
         WQrAHQWhLCArQylXYyaXp2y7zK1PqVkPay7CbrS1Khc/n/AgFFmvuqPVXhU1UKX8riPy
         ZXA9zcXFC32Lj9kt16TWNF8/WoNQr05q+ShZhXIe5NDX2tHhOeQcGr/wHzjSEyS86nNj
         BMTTwHZPffeUWYiwCfoOuHfEGe+Zf5/0lQj0Wg9+hnnK1XmqMK8DVLoVbBqA8gLqTKiv
         hhgw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1+hPfgg2TwbZfYO9WMpICQZF/hwqN0Qc78WkYbHS/IGC+KXIvBavtvZimJQwaX/iP2J9QFJfBMQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA8Kbebz85oeT5EIBH+Uj8PhPP8IEnLJvvE3G6rZl/aRlS3/vE
	JX988Xqnm2/2Ut/RxBsmiOOlSWwQJBfGreprPFLTTGDQ4xlmebPskGp6q2jBdAhv
X-Gm-Gg: AR+sD139xURCidtJJyzupsfxyjxeaGXke+k9svC2fS/NsW/Ew80gJRfC896hM2kMyKd
	Y9FP4duvBcEfRdlotne2DaxiW2LTsEMRmi9y9gwQV3NVthRXeosKSCj70l5prIOZSKF97b29WC+
	S1gKIwEAImQMWXf23l5dIgjPhODc6ga2HeED/lJk6hA7/a52zjXTy7AiqFEsidzTSen/GA1Jqcs
	9jK00h7i7arAckRZo/oAXmYg38LfdsvJs5sYblT3GBaqjphaSFAyDriN5g5NrrEn/H+f3RafQCV
	9lSlarUj8QqpjMe8TADjpp6Q8CMekhXsx/hweEESnl/oe6YR26yuQ7EtzSvyVkCKlv2073kl4+z
	1qOL9+sXDgzC6eBbdsxPxetAwZ/K8krQDwsjXIwUtp4DjffllmyjjkDlvNC2cn5wYZs5cKMImPt
	MLyuHBWd9tw1KEkLOEVG2qQYhbHm0cPDAgC7O6SnS1uef5Nny/7YkyN7aCqa/q6b3a015eut9VX
	zKxGPtSHXDxSQsDulQmdNxQLVSk8Zq0S45WrRue3js4ivsczX/NITOKxI/vs7K3f/f92R+aAHW8
	xU7i6vzNWzxViuF1LBbbf2Jzr89SdwSmucIUSFQaG+hN4A==
X-Received: by 2002:a05:600c:1f82:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4997c15bc31mr16199015e9.3.1786517963083;
        Tue, 11 Aug 2026 23:59:23 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm73628005e9.7.2026.08.11.23.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 23:59:22 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/7] docs/zh_CN: update DAMON documentation translation
Date: Wed, 12 Aug 2026 06:59:04 +0000
Message-ID: <20260812065914.3071433-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bring the Chinese DAMON documentation translations up to date.  Update the
DAMON design and administration-guide translations, and add the DAMON_STAT
usage translation.

Changes from v6:
- Clarify the DAMOS quota goal descriptions for the optional ``nid`` and
  ``path`` parameters.
- Improve the translation of "offload" and fix the duplicated character in
  the non-access-pattern filter description.
- Consistently translate "tracepoint" as "跟踪点" throughout the series.
- Consistently use "监测上下文" and "聚集间隔" for DAMON terms.

The changes were suggested and clarified by Dongliang Mu.

Doehyun Baek (7):
  docs/zh_CN: update DAMON design translation
  docs/zh_CN: add DAMON_STAT usage translation
  docs/zh_CN: update DAMON index translation
  docs/zh_CN: update DAMON start translation
  docs/zh_CN: update DAMON usage translation
  docs/zh_CN: update DAMON reclaim translation
  docs/zh_CN: update DAMON LRU sort translation

 .../zh_CN/admin-guide/mm/damon/index.rst      |  15 +-
 .../zh_CN/admin-guide/mm/damon/lru_sort.rst   |  68 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  82 ++-
 .../zh_CN/admin-guide/mm/damon/start.rst      |  63 +-
 .../zh_CN/admin-guide/mm/damon/stat.rst       |  94 +++
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 523 +++++++++++---
 .../translations/zh_CN/mm/damon/design.rst    | 667 +++++++++++++++++-
 7 files changed, 1346 insertions(+), 166 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/stat.rst


base-commit: db6ed2a3d31068ca5577466591b2521dee0508ca
-- 
2.43.0

