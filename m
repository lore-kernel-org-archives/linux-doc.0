Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187399;
	b=gnbVr7GYftloCVLXAAJTNIlwVs1QQ36XDGt1oNv9U2Oj/Hw+I6dyIEwTV/3mqHR6J88N
	 7ptoDhBFYx2itx2qLDqzfc9h6mZS/FcyBKrkLVKApiFIxWFQANSzmiz0Gu8kTR9Nosh/8
	 mPlWZS3ot6jRTizWHM5OfBmthECkTMo2ShN1vs+qW3/ppfiZvp5ZMTrWNnW9S5oEmkAht
	 ACgJfkSHJpaKiIvcAkeJF0/h6ROyEU1CB1G/A34Jqno9kx9Y0WytpROtFs6TuW3CS99WY
	 gFYZqclmVO6AUARLUmq04rV/Z5uOZ+tg6OH9C2gucwerrScWZTXzFMvqYO1awY8U+3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
	b=HarW1QxXusuU2qv42w2ttHLepC7LlFylWBJHkbyYfkKa0Z33ZZckFKd1TP6Ysv6nd5vW
	 aUiUiVJiRMluBABboo5Ogeevn7Og3Jka8wT70OPgGnpp8Y2hMM2jhOdT1Y5ETYRxGBMir
	 uUjAvYZNGNgyTRrBFrzZ8see4pHx3W0KR2d9Ayv2+oVzGNjMXe5bh3rxMkaOZ1xAek4yZ
	 rBa4IQDrYGAbCJjhzW+/FpArcz8VzCquRmhiB6+1FQ+iixPdRfEKbQYIXhVAxlQOPKo8I
	 eYiZOlZdQc2B9feTuWM4TY0WBI1jSFnTl0ssXlka8QAzzEuqNPbMUEplKWUHvpcR01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211D606FE98
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9211D606FE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ASbsXd5v
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b2513decc3so352104c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 17:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187399; x=1794792199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=ASbsXd5vptVY7r1J5dOkvhmj5G97jhirKhnpXabNrRRYcaXrSmAafoj5HisfZWS1Qk
         9CBegw8w6Bv/GC81m0zRAiAx58/8qxgWWg80BsCzENG+jKRPzli7Vz+0IleO3uIqUKV8
         qb+fNKm3Y2hzaEoiSBSkyDS62VSQ30HTc5Ak79aUKS12YM2NZFU7lFEsKfAQNF/adHR/
         e0ECf64jMpI5tJ1Kp6NLHg3e6YuEXw7kf4aiCIHC94DvHuyt+M8oQ+d/cJF1MWZjaocU
         AtqF8Zwi/vdhw8VC0OWJEHvRjM6QUcaZ2i5q7RFo57tCFaHCvWaSWUyPj/91jr3s0aja
         bJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187399; x=1794792199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjbxQ6n0Zk6Jx+X1WZAh0zL0QQQS32bSK2pYlfdDiyw=;
        b=RnOiLdRamtI9UqQfdVdhOkeIuFJfiAr1OgNTtUdCLTX51urA+LUdTBRXfPtmmYv73H
         n7zNPxScLLqxlGq2LWICGFtp0sm2XodQE5Qp10WP2vs72xCZ3V+AwemlQ+btEj0gtaft
         RlS14Wh/EbWWxEStvbP4SEYPVrZ2HvQ9Jv4V2Rs1QJhpNVzhHkdyoIvsmQWg8+0lPm0t
         qQYJgn2f7qtI3pVReUIuD3g1k9Jg7Powj0SYO+DcwtkAkk+0amRXZqie9OKUg2M3i10t
         pohZcGPVLb0WtlIHGZhT/wa1Qt0M1aCzPXMAV5KRw9V2549vB2CiNVN9NARZdMT2pAqo
         qkng==
X-Forwarded-Encrypted: i=1; AL+hErGFDPDEySeEi8qYpHzLPVQG7Jx+pJeCHYF0n8PLGZmeF1RaoY8AHfc6y8LdWyGtWmDnMJWFvolZL4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tPxugkDv/smp4Y5FAGpT2+EE/vXdBtIIXGDNEDyPGJz9DeHpq
	nd0BT0MY47D2ELuqpLsswWidTAcJygcHxHn9JlHbdFF3T6X+IGlskcQs
X-Gm-Gg: AYBFou1o1RK7Wd8T4h1M8zAAZ8KcYspA+Hv+oz2nyMB0k2nDdNu5sQNjLSwhnRWGaPT
	uWHFYJV2hdHFcc8/VJm9e0EiE7mrWocG7UAVs/DPtB7HmZgV6Scl/aSi9TnMWVtpwwBi6+U1JV2
	XJ8Hfc/L0giOWj/2L+pz4sBuZHtWF49DFQKzV7P4OeMPFAFrpg1L9goMk5B9vRFn7DapjgR5fhi
	QnC8JNW4ZIul4HRgFuTUHL6WfYgCmHI5Z31F3pUxenpXehBLOGuDo9bVXQeKT8NdzjMIGyNjqfw
	iCVd14d5Ym2wV8ZrfEgHZfeqQxPYVuC4s3dvz7UuqeLQk9sAmGo/TdAM/t9jeOr53+ICw3DBzH1
	evxiCtMS615S8wcrjtij+1GYtHCZ1fLFZTAnWl0B1XN0ViMyqTO2K9C4hgoAALonoV4f/TiHSnD
	QsaxaCU0+UqVzaxpsA+KuAxFlhD8v8C8hMAE6hX9nKJO4fMsmN7nBDjXihUtsjY47geEGq2unxO
	+CSkKlU6rmHWZGMtb55yG1WLWyTUHxGcDS7NBw5Q6nVJ6cpbK70+MNYwvpIVmCJBZRARJpXd5da
	EtvQFnIv45+zU1VQxLtaOqWwMS3DbFWzl/dPTJBpvClUPw==
X-Received: by 2002:a05:7022:1701:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b39fec8a94mr3868482c88.14.1794187398555;
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:23:18 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 08 Nov 2026 20:22:53 -0500
Subject: [PATCH v4 4/5] selftests/mm: move waiting for KSM full scans into
 a helper
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-4-86be8fe77e7a@gmail.com>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_start() enables ksmd and then polls full_scans until two more full
scans have completed, so that any merging that can happen has happened.

There is no helper to wait for a number of full scans while ksmd is
already running, so a test that needs one has to copy that loop.

Move the loop into ksm_wait_full_scans() and make ksm_start() call it
after enabling ksmd. The count is now read after ksmd starts rather than
before, which can only make ksm_start() wait longer.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
Tested-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index caea045fa7d46..8184691211acc 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -992,35 +992,40 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -EIO;
 }
 
+int ksm_wait_full_scans(long nr)
+{
+	long start_scans, end_scans;
+
+	start_scans = ksm_get_full_scans();
+	if (start_scans < 0)
+		return start_scans;
+	do {
+		end_scans = ksm_get_full_scans();
+		if (end_scans < 0)
+			return end_scans;
+	} while (end_scans < start_scans + nr);
+
+	return 0;
+}
+
 int ksm_start(void)
 {
 	int ksm_fd;
 	ssize_t ret;
-	long start_scans, end_scans;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
 		return -errno;
 
-	/* Wait for two full scans such that any possible merging happened. */
-	start_scans = ksm_get_full_scans();
-	if (start_scans < 0) {
-		close(ksm_fd);
-		return start_scans;
-	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
 	if (ret < 0)
 		return -errno;
 	if (ret != 1)
 		return -EIO;
-	do {
-		end_scans = ksm_get_full_scans();
-		if (end_scans < 0)
-			return end_scans;
-	} while (end_scans < start_scans + 2);
 
-	return 0;
+	/* Wait for two full scans such that any possible merging happened. */
+	return ksm_wait_full_scans(2);
 }
 
 int ksm_stop(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..7e00030077d2f 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
 long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
+int ksm_wait_full_scans(long nr);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

