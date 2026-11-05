Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879123;
	b=rEheLUCFAaHe2ATDus/A18hjrWIvRqDvFPFLfLXdRKIan9nwp4YSM2DEhmbV4AVbnjr4
	 fWm5+dt/10+njW5g1gbbgdEm/NNsIVO+jBR98ePfZy8s1CEgYyaGDMsv9COHSBIqRLXnm
	 h5lkCJbhAy6QZFqEbeVNRU1fwUkAuKzPYfVpnKflKK8IY+Nki3DcOlwovgWxWB5VFYKxn
	 ImITe+r4XFTOOrKDW1hFAEC1RdT6bUMNxkMWT26pJGXI5mJC6QNW2Yxbl/E52Let8N/xE
	 fWvnJfguN+fzngiT2oh8qkxGcVNAYbWinJeggxo5lmZpIjSRM6aF6xBSAAZB6MgtKww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
	b=WT+XRgV1GazBljgx3AT8R2metrthipRA7js8zC2MKAg6OBJ951fnk32IcmE7GMobvipm
	 yDvLnpUrmQ175m3Tb0HbuEvJXX5gIugNtJA967bITJmQXV69k1P+OKQigZZj3Sd42t9Vc
	 DGl8vWSc6X504vSwExUF9MKA23w9hkw9cu5Vtk3PesNQhxgALflEejguRCMVdvI/UeaJq
	 CjkuW9NvGsl6zVxW0T57t49a2wiSv0NsNmlMCxYTeaLdWTo0kVCGvzkCrc4EthPe+gZfu
	 1ULzVrFCReyZX0m+qcoTFrARp65xMICTcChPIhR5n9xbSaK56OTULyxJGB12WRnQBTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=joVS0CAM;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430DB6082BF9
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430DB6082BF9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=joVS0CAM
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so12483845e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879120; x=1794483920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=joVS0CAMa0SKohZWjb9chbHV4kMNIV8ItfYW8FBNXclEU06PwtyBYzEIFPP6LXw9TW
         5lD22uhuUR8Tm8yrTgdDLz052e1bF/TML0Fqs0NoQGA8hL7FA4fTqPBn3ypN8woraL0/
         FZ+Y4kFRz8Dkosn9ZQvPC6HQ5yaoCE6i/vfes+kZ+/qBLHrgPf0R9Og5YrjbzkrlOuGY
         meYvqAhLR/Wg7mEeMbVhJS7O3GpPrg5b++HuouvCVr3ai2QYTCovQXTZ1DWMTR6Hi2l1
         hbq1so9suDy7G4zHXu/uhRd0b1U8JPXXcdkPGmOysQyhusmBU7VfmHqENQemHUTWyzk0
         rguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879120; x=1794483920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gLOJ+oRdJvB9ReiowSqgza8wK9JZkQFSd1XMDzuKt4=;
        b=00wKskwIB/Rc7BBkIHxkWQv/8dhUHVtCiVQv5Ujxk9/MG2Cx9y7BEK9KVfUdQb45Nb
         I/pQbLHUs70UFiRuvCwD3yQAAOwHGXUwdxVgGjIRbwTuCuetAbEZ9Lw6Oadyacul3lkp
         wIpbnZMu9WxjMzlCVJEHLjpSFc7X7s7F3rnVQP2JxDXQJ4eQhznlkqMGw2RELN/5roTs
         oDN9NN9DwhEWqoVmJUaQ2q7YPrQ79Z4L03UNPlvVvFm3ABG5dBJGxM0c8V83XjOwtgvB
         YzRbjhpWa9hgFM4MM+7hr7ewv9gRgOfTM1KRWJ9CDStbuJP9i1gQERBuzUM1VMaXEYi9
         vbfg==
X-Forwarded-Encrypted: i=1; AKwUvBw10J0/lziVd5Rg3D/f5DZmxUHXdapxrBKgbnKo7gLDvnvBRI1pVl/muJOZl0Y/CCLR3PpngQKdXfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wqa/BMW6dLXjVfNN6Ks8LGgl3UMbpCHPy6R4QLnOpgOtUauCD
	1cx+P1iFQn3TD/3TrGR08pnvUz1JUQMlndLzZydnQc8Fc9yvZ3bus6Jk5h+/XUyqXxs=
X-Gm-Gg: AYBFou11Sha9IzmIyXwwqZ0UW1NzHtY21ji7rti22ARi/IqHAq2e1tBf6jLSX3tus+Z
	X5YF3WATYBOWPqglIGt+3p+vMCY8KX38tOSK0LsChFm3IB/WNCCmUaku9IfgRnrbLHMArVaSE7y
	ixzLnNig4B7wdt9W+YckYCrVRXy53COD62Cst8YIqJURFU0djS2QdrL9fz+dVIVe9ap9lgSndEe
	MRMF1HXZ0d3Xn8M29sWEExkNasNWbxX/REp/TlK74kTY+O5B0SCYUFVSVVUfYCEImchQD1b8wfv
	91ZCFM+j4aYH3a/f9Lp6VW11pa9IrEmlzc7isn5E1DwN2eoBxrsOATc3b3BqsWF2ZDa/oXrkLOw
	6hCcgWrNhoGX/vjxAGw2Euo25fQcYCR6BOBIuOUQ5VGd94LDFbjfWqBn1hpF4vBUmaoi7Nq6I7h
	nQkq2tNWhbKZR2gB+zVX3Ta0bTNrVMBqw57fXKSyVVhDukr3BQcinV5ShXMzQK6fo24nxR/jOWa
	vVr4kLkaDzDU8h/cKUxhn684aRZwPghsY4uclPveYtTT2pSr+TaWvCypKQbxH5gekUvk2VYYIAt
	Z3g7JgiXPPli678Z795wbuOqMP0eEvqA
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr412219575e9.17.1793879120601;
        Thu, 05 Nov 2026 03:45:20 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:49 +0000
Subject: [PATCH v4 01/19] perf cs-etm: Fix nVHE per-thread decoding
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-1-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf. The exception is when pid_fmt shows that the host is
running at EL2 (VHE). Then EL1 is always a guest, so keep using the guest
machine rather than decoding guest trace with the host kernel maps.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3e01b401ca6f..5abdd726c6d2 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1102,6 +1102,20 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host, unless the host is known to be running at EL2 (VHE).
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode). With VHE, EL1 is
+	 * always a guest so keep using the guest machine to avoid decoding guest
+	 * trace with the host kernel maps.
+	 */
+	if (!perf_guest && pid_fmt != CS_ETM_PIDFMT_CTXTID2)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0

