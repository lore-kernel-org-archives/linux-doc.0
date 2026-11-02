Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621754;
	b=ibHjP5DOmcKmHDgmdIrfGamqFDvUIY2LkRbo/bQyCq8KvJrZtDjSBeql8tlRl0nv8aMq
	 PHEx8CtszK82ij+E2Iv/66YjPPlWRt2I4edMvTBUfDHMpZN1dzxDCvZX+yKSv0p7OPxjU
	 Gfu/E7I7mIKxVw1ivfsAgM/BPdr5KpVhB8bP1RcW+9v22gVuiNSIGk8o38sb+WQXLmeqa
	 ThYNXq3+Bif/FWLQViFHk0d2kkyitdvesqVX8FEAZq8NaqHJDcqB2H1W19fKkJKw6kjeN
	 vqR+4zSysao7k8o2OJrm4g4ukh612GP/e0iM77pEWr4/ZN8ur0dUiPAfaLtdJXQFqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
	b=t3MacoKnLMchazmZSBXJAD8BuFAb0a+Zcjl3oYre5H72CZLF5ER+zfpD+padGBjbockK
	 cnN5G8LRWzYEhSZHr5P+n5lYyAo7sXMrZg6u+QRv9p48VAFVb5DCWqp/F4T/vYJG/FUBi
	 SDwYi0U1vJmaW6rn+OwUR7n1FwLMFHkkxNIqhNtSTOp6yVfk3cuumhzEktxpM8HZjicmk
	 pVSHRnqyuW346/3NpJtz9cW/J8J9ksVZOQn56uwOD8tztuACoOjlwqoQHZg8RmGkjETxN
	 CXgX8l1oodC77v294yw9c8rtXrKmk8WchzS4k2NY6RLnxsZD4Xd5iNT1EWl4Cb1JdHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rs7ppWh5;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B90F60A5BCD
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B90F60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Rs7ppWh5
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2831283f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621752; x=1794226552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=Rs7ppWh5LOcpqWW3A1bBhsv/akEFHl7A6JUhib1Nh/m/6p3C0G0aMJsshRjBkCPoWj
         9S7FdMsIfap5RarP2e00IbIdsFQ7OwGCWUlWuFOfuaQ45B0OqNE5yZrm6kY3EaEVOOxE
         uKpHiSircoTdJzv+fMYCTjrZZZgttF+c1qKEJJtdGZlXSptPyBAcLrkTo3YUBQ4/Znd/
         LJ9rxMkBrlkySl7nAu6cCdvQvpJj5M08WyFCoHAw5C2FtIvJFGskunQk9mRXv4R/Kxga
         jc0KV1COTiwPesrGn4R8cHj6r3bdYueVIvEBPLAgE8UO93punXuHDqBVx3/r/fwX0crV
         kBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621752; x=1794226552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cPbn7Qf9c8iItDK/ZSc6D51DtwGlZeo5sCNSCk2nEE=;
        b=2IaXxUAE9y9sFJfn+IYymnedUIvIkyW1W/5qnj1WQw2U+JFVG4cQ0txyzibP8VWoo9
         DhjV3R2lsT+E/WuUolOsnsja34vmwniPviP05EoGlrTe1s2UvGffcXKBSptYd+apZ4rt
         J9JCCBjwf7rNf2R9QqkYM+FOpMBKA45IuCdVPXjNESVuwSiatNzXSBM/gz5S5YEFIY1E
         okkrNbUjFFCh4UZ95P3UATHDSr8YtfsgMKzKjyUG++iwUPdYfq5HFDMny/PhdhUiwIYl
         Pa07ZXs9/dQglNJPDI2ame+RPfyBZeGNHMOhkYDrBWBn1ObftpslVbsRaz/RAQXQRGt7
         EjWA==
X-Forwarded-Encrypted: i=1; AKwUvBy1KpocZG/BMBk/0uwCsSG3pt/Jkkftvm2JouhCqQE64W6n4WBGQuICMuNxxSrd4kl7OWcI6hY/zBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h7JUQOwycgmfjIdbZ4N/mDEW7X0qkTdPaXCKNTPrT0Gvnb3ch
	feShqPaW99qEI4xLIEjnnuOhuwcUParGwlYcOxFGk9x3F1W3skX/UTpDBlRp0C+t3VQ=
X-Gm-Gg: AYBFou07ewoLk7Wu6Cncv+Y3aMj07Wtk4Z6/u8a/P2t7gWmWsAwI3ZmZpVNkrR996Xz
	HWC8xqxBgSRDdNku+y/bUG4vczI9Ad65+U2+ZAqqxWI+pIL7LbfpuE7XUx/iOpGHgPLKRYxLXBn
	YelR2VltexZrrdZQ2Un87R7UKVFSFsK5HZczm0NkntII6OOTYQZXYQxXZLI+MUBwo4S43PRgb82
	d5FDmbrD/9tTXejUCz5/WIaumEW3ARR5tpgZrjW7PQbjL5l+SKB2oeXM8hSC9zcrAkraEsmsUQn
	G/MTqsKQegDDIjYd/dtu7yhBB8ZCZuiq9lWwNZ0SdRfi+DgqpBJU7tA++sCxqf/6fOai44HLmCK
	vIBG2kAjAbILF3vvCGLyGxM772+++W6tuCZQWEgZ4mkwWApE0bMEh9XLML4Li5czw2G6ecHKDus
	C2V6lILq0bh0WQBxmdm/bx8GMfVkYdGLR1qImIjV1MGikBnHoHfspJu4WU1E1ilcQcSxEtnjpVQ
	hTJn7TgstfA90GG5c9WpQ94RCN5c3UbKf/HZR85pbn/qKzyXecC9CqGG+qIBpc8sLcOxgMuNMYQ
	jU7MzchOjoNXTDArmwolfo41FYjHjRfC
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr230066925e9.27.1793621751493;
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:51 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:21 +0000
Subject: [PATCH v3 07/18] perf python: Expose sample instruction length
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-7-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/perf.pyi | 1 +
 tools/perf/util/python.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/python/perf.pyi b/tools/perf/python/perf.pyi
index 087da00728fd..525d34ed08dc 100644
--- a/tools/perf/python/perf.pyi
+++ b/tools/perf/python/perf.pyi
@@ -215,6 +215,7 @@ class sample_event(_sample_members):
     sample_data_src: int
     sample_insn_count: int
     sample_cyc_count: int
+    insn_len: int
     type: int
     raw_buf: bytes
     dso: Optional[str]
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 60dbe2dad5eb..d2aff058eb89 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -1380,6 +1380,7 @@ static PyGetSetDef pyrf_sample_event__getset[] = {
 	sample_member_def(sample_data_src, data_src, T_ULONGLONG, "event data source"),
 	sample_member_def(sample_insn_count, insn_cnt, T_ULONGLONG, "event instruction count"),
 	sample_member_def(sample_cyc_count, cyc_cnt, T_ULONGLONG, "event cycle count"),
+	sample_member_def(insn_len, insn_len, T_USHORT, "event instruction length"),
 	sample_member_def(flags, flags, T_UINT, "event flags"),
 	member_def(perf_event_header, type, T_UINT, "event type"),
 	{

-- 
2.43.0

