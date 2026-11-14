Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675728;
	b=SB72yT8rgGk3gxecfN0fdxF5veQRJvD+PZoEzFsVunofeAekL3CVEpd3KzB73gG5TDHT
	 am5twi9ACOAAI7AAdbsMYeUSGOTqK5nrOFlpMvbCu2su8pBqdYw/FDgs2Ap1BqiSyzET6
	 29+p00/CVOxtgOZCKpDDEwmixMq5CMYCsv7WuFS7P8XvAhFupt7yRV7ZOrublQdDDl09F
	 MGEWWmgDwng3pL1kEyFImQrmpq/64xiUhiCJrc5uEoMKmej7r1kraVcbvsVmhtl2DN4Zi
	 uHZVQCmWlAwQ9kl64tz5GjThsYql+fC4WqsZcWHhzhN/JUuiD84crB5ly4btvl2wo6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7lteccHgNdb7iF/PneQaqv3cHOSbhu4Ba6wZTOqh8l4=;
	b=xbRy9nomHNR6hw859L3fkuDaHllnP1jNFuBX1bJ25U2FEusiOy5MoggnyjyqLi89QEi4
	 VFWG2bj4ABFJ9MIa+I464dGcYWHwRLF3s1vxu0m0hiIZ67SivwTinYzrKQ72FCpZG47It
	 wgxYZ8B5/k0+1HLeKICIauS8XJq/kJKhzVcl1eq+yT6o6ZreceF2oNxMM3H255KdBq1bH
	 l++AnUykfmZ0rg67o4pAVDm0SVa17hzlNgFafgmFGlizNoiBPr7b+Ngb6PinQqc8n9DwB
	 hjoHWFG8PsrmL4/Ogb6PhpYX7+a5rA4KpiRpl86qBirakpwQ5xtDjTnNXao+S1c2cRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a731FAUO;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9F606A327
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E9F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a731FAUO
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3704d30b84fso2611800eec.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675728; x=1795280528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lteccHgNdb7iF/PneQaqv3cHOSbhu4Ba6wZTOqh8l4=;
        b=a731FAUOVbF8xcz+oaxXiOx9THsHRJJh5il0thnoiSbXATfuGLRXsJWTZS6HI85n/k
         xiVfPqt3X0LSaxglxL5LayYrWdJqjv7QGPDg3tzUDtqVAZ/+9hMtyKnvXg0hDcmc5l5x
         /UrgMs6MEE0aEFMH4/NJsrgk41JSYhHkDoO3OyJ7y/CKgWqrDRFYacGT8WgaQCa3t46I
         hgCmCX8YtVk5gJjWfsxTyxSoLNIribcZA4rM9iUgT4Q6tXd9hLQW6KOqdDxGP46O2fE5
         sjQnT8w5dOnEPbth7SgRvYfwF0iJUC7J2rRwxiUM7hUYtP0Gd678g9JZd0FAqNP5RZ4l
         xmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675728; x=1795280528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lteccHgNdb7iF/PneQaqv3cHOSbhu4Ba6wZTOqh8l4=;
        b=rW6+1lcZ79CKRulNP7VdLt5xU9RYbmSdFslc7nbEAuPu96jIvkxHwvNgivAf9+ltYl
         aagE3F5BEqJdRYJqMSm8UHC1Pxd2/yKG+WwjUljUBOO8KLSnrQvVtZWZVbiBC0/+1cq4
         25PCJSNM8t+YBRCtBgV5zoNQGFNW82iA39pRuE+lLgRBoPEGknqnx6vJlsvSfAoCwq5w
         J3PK/x+k24jvnrBt/WZ7JcMMZHXDitgrEc9xdzw8yxUCvdRgWyzBoRIv5aed3lg/z/2a
         nvpsgWDIQduRaIgqumRsLimwLqMWKJ2hUIPZzBBfPKcadKoEE1HTh2vlUMYbT0oXbQ2C
         OYFw==
X-Forwarded-Encrypted: i=1; AL+hErG0y9a1uG5BSnMzbAJcJFCP7ktcroKLmWPc5QPJydVu5VwF5jm5GKKux5D9QZUogh6C74Ru8PPFi84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lBBYCFJOD3p9ozLOoPmTMMDqtqZSTJP+3bk/u8Nf10thaEUVv
	Qpl693tBPSYKeDDz2fdaH77LcqpQJ3/wGStGK//4gsn0a6bM1uRWzyqs
X-Gm-Gg: AYBFou2lBQuvmVgRK4F2wZx1PZ0eKwgt7kDfZh62eZxlwLEa9si5XHNag3MBpCQLn0M
	gbD9dhT+EyEODE3IK1jYXlrgPykI1PEHJK4DwkUoloU7eLLOxRHjElEV/pNHZKm9mKDCpWSritB
	qHrMMHdqPWWy9GRbwZswEcCLqhMGe1VBrOl3IjpJNLS8MWgml5r7H7wokgR65UWAD4SqsaKhdNr
	yzLYyiMm3MplUHuQgvn36CAyGFKaPWW3OSeWgcL65KP1c759rN0HiFiLuv5LT6eFCmofzsT/8Ms
	GpYrq9GKuMIAkpjX0c3MY9TARPSy5KQkYMBZO2JpChnRDWu+WuAZ9fFvFjHBiU6FhBOP1miR4iT
	5Kl7NHp9YeFNtmOb0CKH6WhbRBSb7J3XM1vzxcs00GX5qOCqK0wgkPvHL6tKUz4KBm1SN64y2Bk
	8if3vSUXopCjcts5rHE+tmypPNwgP/8zMqdXkal3nM2uKcHuFC2hA1ocFlBgWvNwDWL2Rw9ORy+
	BIBcnkxC2ONVcXI/m/nxkOPeGyHqXhp/aq+N0X2R9CzDh4FVd+WMkm43OvTnYsi1Xw4Jmg7mk6g
	V6wNefh3yXijwJMHkZO4x7MDcit/O1m6MTsLK66mRek=
X-Received: by 2002:a05:7301:f87:b0:36e:c108:90e9 with SMTP id 5a478bee46e88-37968d8add2mr4900495eec.39.1794675727682;
        Sat, 14 Nov 2026 09:02:07 -0800 (PST)
Received: from LAPTOP-G6J9COQB.lan ([182.253.124.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm31586761eec.21.2026.11.14.09.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:02:07 -0800 (PST)
From: Ahmad Wicaksono <supersonix03@gmail.com>
To: bpf@vger.kernel.org
Cc: rhkrqnwk98@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	john.fastabend@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Ahmad Wicaksono <supersonix03@gmail.com>
Subject: [PATCH bpf-next 2/2] Documentation/bpf: Fix stale selftests file references
Date: Sun, 15 Nov 2026 00:01:17 +0700
Message-ID: <20261114170117.196552-3-supersonix03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114170117.196552-1-supersonix03@gmail.com>
References: <20261114170117.196552-1-supersonix03@gmail.com>
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

Two selftests paths in the BPF docs no longer exist:

map_lpm_trie.rst points at tools/testing/selftests/bpf/test_lpm_map.c,
which was moved by commit 3e18f5f1e5a1 ("selftests/bpf: Move
test_lpm_map.c to map_tests") and now lives at
tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c.

btf.rst points at tools/testing/selftests/bpf/test_xdp_noinline.c, which
is now tools/testing/selftests/bpf/progs/test_xdp_noinline.c.

Update both so readers can find the code.

Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
---
 Documentation/bpf/btf.rst          | 2 +-
 Documentation/bpf/map_lpm_trie.rst | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
index b618812390e..94a81a9e99b 100644
--- a/Documentation/bpf/btf.rst
+++ b/Documentation/bpf/btf.rst
@@ -1148,7 +1148,7 @@ information.::
 The following is an example of how line_info can help debugging verification
 failure.::
 
-       /* The code at tools/testing/selftests/bpf/test_xdp_noinline.c
+       /* The code at tools/testing/selftests/bpf/progs/test_xdp_noinline.c
         * is modified as below.
         */
        data = (void *)(long)xdp->data;
diff --git a/Documentation/bpf/map_lpm_trie.rst b/Documentation/bpf/map_lpm_trie.rst
index f9cd579496c..37ef39d0b39 100644
--- a/Documentation/bpf/map_lpm_trie.rst
+++ b/Documentation/bpf/map_lpm_trie.rst
@@ -108,9 +108,9 @@ specific keys before less specific ones.
 Examples
 ========
 
-Please see ``tools/testing/selftests/bpf/test_lpm_map.c`` for examples
-of LPM trie usage from userspace. The code snippets below demonstrate
-API usage.
+Please see ``tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c``
+for examples of LPM trie usage from userspace. The code snippets below
+demonstrate API usage.
 
 Kernel BPF
 ----------
-- 
2.43.0

