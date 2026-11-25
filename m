Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581228;
	b=rhPLcqm3MdHVfvNFjZDHqTjhRiuJGqns7ZNrZjAVdHsnuI3u761GW7+EeZGUMRZ40/Hd
	 5d6uD1QPMGbwo6huvxwUaQZnS0AWIuJQnwZKZnwoQevZ8b5RahXMvcVA0qOq6PP3zZ7Yh
	 wCo5oRy55unF3q83fq/y2YW2kGIqmV3L5fSkW09jUSFgDGAb8uaevSn4aLMtkBVqQo0wD
	 t13h+GuEJPh4zgoVpKzinlKiGr3YOz4Hg4QA6Iq4nw37dYLWsh8TRfrUA+EJldpARBJhN
	 6lQzaUGeRM4xKyfoEd0Dnf72V9dbmEbwC8uWpJ2aSajkcyldfsr/cMHAXZKkjnzx01A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
	b=AlPt9ueKeNf9M3tP2O24IrxIwSjTlArDL6H/WX0uCrrCeQ+9Z6MPxy+WtMOam5uxt0by
	 T+PoXhZM3+TRJ3f1tYOmT3cFkv26LAX73AUEfxrlfWweFvUX+c/tlNd1JjMGNsC6xe9lj
	 hU+ZSrhnAzb3m6alDJpopb8bAHnW5j6yIcObYYhVA/szrvgehwyncm2ZITmSQC6s3K1ck
	 fyCBBf8giuKSrke5HLq4AS3J+9gwVJQEvoyd/J0HD300XNHKHxJlj8JioihnRvINKCXV/
	 3ayWpusXainHAC6dyoXQEWupEyDUIXIPD5FxK6KT3b/9OEnY8EtVRZeVGqwjHbzebug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLDbJMcu;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0D6606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B0D6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLDbJMcu
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a07078200fso2753671b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581227; x=1796186027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
        b=ZLDbJMcuI51Esp+mXXWYMFQZlBQf5eXAll80XiSCwhk0AJZ2pseBEODIYWeAcik3fI
         /XxLGyOZ5+L7kqzAd48qaI8Dh4RIgaF+KzBWm9tci9HYoQm4X6UhdGl/OkvqzcXS2Fhc
         ZAcL5q7cHT1YrhDJ2RJ8UveerGZVhopBbwwsyOqRhUXnKmJv4D17nE+nU3akL0/Ds1ti
         hgwTyUnw4puxMLn7uIdbOpJd9Wijn2Fc0L43+Ta39V4VF1BYNcIK3xkvD2a+jkAImZwy
         4USb4HC1fki5BmalkXBgn2nqd8/CHoaUdXBNa34+QesJ2DmdGVfw5zaqT+qBqKrJTCk5
         jnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581227; x=1796186027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
        b=jQnzmYnl86p9fx2t48Pnd/hPPOOfZH+8YV93UGb6AkZW8eebkfY1PjzTcetOoc9BhI
         Fbxbqydl4stJDBoW0IlZMzw0helUi+5Ggc3xKYSVi3UBHjNzW1mJqxf9mZ/0fop8vMgU
         d5YkjyZw2B/B5kG4mXwphVOxodL1D1I1Fayc8pA6frYCz6MRsNMlVbHuWYDvJsQTwy9s
         6753C9qpdNRfQjGd+6sP9Tc2UK/KrDEv6g/YKOdYcR4TxBuFgBPJRHS1K1J6/Wwn+bg1
         5orNR8FJhOqEfw7DZ5R5vyU02xISpe3lJb00N5uWwCS4DRiCfDkrYSpgxy9DT9Zee6V/
         lDfA==
X-Forwarded-Encrypted: i=1; AL+hErHCmDunlrfRafUzRHt5iQ5nh5LJxL92HeKCuqxuHOpQ8ccj3qXFMBIpUWEb6GfFTDSn3+p2t5xNMcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yumMok/i1ZL/Ar5/M++lUGXjHVyQzJmpZD4shSPIOAcIE1cOg
	ZE+7spvrsvRS9BYFIyxysxGLwJZFp71DWyV0dWrxBFpvgUpXnBiYnPUB
X-Gm-Gg: AZFdTZcZS8hUK7FbsKdCng+GLUrhGv5MRbCWn8C5nJec04KLosFkt/bHEwV0HOZiNMa
	Aelv7EyYnx8VtUgKe94kDJpvYHP14fK86qaJARJQwS+mMezDF6m0uyPRW62sa7+IC9hjuhIcrp1
	Zq2cQsrWf5t16hdcxJDsQF1fe9ujoFmiY6TFChNWYoIteQL3LsC+8VhVpXq1N4Dj4JFjoc5XV7n
	XxM4F0k4D/XTUx0AjDhZGw7YwP3mppXFOCO3HSA+8Esarp9V5UBjpWGD9c5XEz7er2zKPFkH5uv
	JMyuTxeQZesfo5VymPvWltm9eZV2sUGrXdc1aVW+vM3djVajzk7USa4b3nDfFwuegP2syZa9DBO
	G4YqorMCdWAhwf/2wEHzIl2sAyMu3w1PODRPPYI1tC2w7ZJS4+pcoS6NhHsxdquuxMhBgG4NuXt
	aqh9UqR07QAQ1/sJ7xv8DSIPticB/9T6VE57XKxB+m1sNqnvF9g8gn2s1NyX0C3eeD5vjdHQLbZ
	XYdmMz6yfXeC7pIzTYbQUZPTGqCJGu4DmQ9lV1bvUeOQtKfqAXjzwWYVobaSS4LCii6qvx8+lYy
	qVPBmMn41EZtFW6VIPLNvBvLxySt2bNoMNOBda48+dojExX1LfcunKtxAbt/723anKd1NDLUV1p
	yAu3i12C0fS8P/MVQHF+IMlGKPgaW9yLODhZfTr2mrVpU0d75blvrWUToQM1uurZ/vsrGDw==
X-Received: by 2002:a05:6a00:b80c:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8c87d90393dmr15459092b3a.59.1795581227294;
        Tue, 24 Nov 2026 20:33:47 -0800 (PST)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8528812b3a.36.2026.11.24.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:33:46 -0800 (PST)
From: Peng Yu <yupeng0921@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: Joe Thornber <ejt@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH 0/2] dm thin: complete writes only after the metadata commit
Date: Tue, 24 Nov 2026 20:33:23 -0800
Message-ID: <20261125043325.138351-1-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new option to the dm thin pool: wait_for_commit. When
wait_for_commit is enabled, a write or a discard will return after the
metadata is committed. By default, wait_for_commit is disabled, and the
thin pool behaves exactly as before.

Why we need wait_for_commit:

Assume there is a server A, and the underlying device of its thin pool
is an NVMe-oF device. Server A creates a thin device and exports the
thin device to a remote host via NVMe-oF too. When server A fails, a
control plane will rebuild the pool and thin device on a standby
server B, and server B will export the thin device to the same remote
host. When the remote host issues a FLUSH, server A fails, so the
metadata are not committed to the pool. The thin pool fails over to
server B, and then the NVMe-oF multipath resends the FLUSH to B.
B receives the command and finds nothing to flush. In this case, some
uncommitted data are lost, but the remote host can't get any error.

As the dm thin pool doc says: "the thin-provisioning target behaves like
a physical disk that has a volatile write cache". If the underlying disk
of a thin pool is a remote disk and we want to fail over the thin pool
from server A to server B, the "volatile write cache" is only on
server A, and server B doesn't know about it, so we will get a
consistency issue. The wait_for_commit option could fix this issue with
a performance penalty.

Below is a performance test on my laptop. We got the results in a VM on
loop devices.

1 MiB sequential first writes (no zero fill)
|                      | 1 job, depth 1           | 8 jobs, depth 8          |
|                      | MiB/s | mean ms | p99 ms | MiB/s | mean ms | p99 ms |
| no wait_for_commit   | 1307  | 0.65    | 1.59   | 1596  | 39.7    | 276    |
| with wait_for_commit | 131   | 7.57    | 17.7   | 776   | 78.2    | 148    |

4 KiB random writes, mostly to new blocks (allocation and zero fill)
|                      | 1 job, depth 1, 2000 writes | 8 jobs, depth 2, 10000 writes |
|                      | s       | IOPS   | p99 ms   | s       | IOPS    | p99 ms    |
| no wait_for_commit   | 1.16    | 1723   | 0.97     | 4.96    | 2066    | 15.3      |
| with wait_for_commit | 10.5    | 195    | 11.6     | 15.1    | 673     | 49.5      |

4 KiB random overwrites of mapped blocks, 4 jobs, depth 16
|                      | IOPS   | mean ms | p99 ms |
| no wait_for_commit   | 202095 | 0.31    | 1.12   |
| with wait_for_commit | 203293 | 0.31    | 1.13   |

Peng Yu (2):
  dm thin metadata: report uncommitted state and refuse commits after a
    failure
  dm thin: add wait_for_commit pool feature

 .../device-mapper/thin-provisioning.rst       |  25 +++-
 drivers/md/dm-thin-metadata.c                 |  61 +++++++--
 drivers/md/dm-thin-metadata.h                 |  14 +++
 drivers/md/dm-thin.c                          | 116 +++++++++++++++---
 4 files changed, 190 insertions(+), 26 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

