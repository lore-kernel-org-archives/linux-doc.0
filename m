Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879130;
	b=eO/5rApjP9rPiBs12NDqP087jgrIo0MurT4VOOG0H0XZHBKNcyMVo8js2DWfWaChe6HR
	 toMSUA+y1C/0klCElRwXB8brsiHveiyIE24lpoDTrXQtRrb1oPbFRMJ+6dWStO1K8QvRj
	 xq9vhFgpQph+Bq0tg5k0GvXjOMNy0ayFx8C6M6Ujwymsp/gL7fqUoJv1ylESKiyeUDnia
	 v0KE9dIq85nTCUOZShBoGm9LJyyJJrvVcMt3l0NNdCoV2PWt6Lj7KkHlppl1F/zNMHVEx
	 TaDSXBtax/JeBJ19TtHwg3YW3t02nQAQvEVmV1QFiwdQLmWhxVpUALZHMdn5QJJ0CPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
	b=yc1wsgaY2koa/cwldC8cwBJNU/flT1lVpJAkJe3hOM2Va63/ngVrI0vo1V6qLujkcPsr
	 KaoJC7BCiaFujvHpmv4qsH61H/S1y0r16r5LWiudib00opafTWD+u7s3uAX8QVQxAGhjT
	 U3JVNVMhoh1gChIosbGGp3PmUjxrqwSgEwrLMlo7ts/xJ3O2I/TFqJzgljIkJUuiz+5ms
	 NA2JX1tvsSynBcGyE9ghG0Gs2z0/3VY2/tBICO82IlLAhn8DpLnj8tjRzmlKrlcvyKLCW
	 apVr+pYwsjtN+TuDwCAmwl9jqfiXHeKfGJcVq3Ebs1exVKY7mp04m/YOBiW97vEDv3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0iLDWSp;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84B60A380A
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE84B60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a0iLDWSp
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5932275e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879128; x=1794483928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=a0iLDWSpLDPHcpGFKmm8lzHC0sFutNhJXYUgiG7HVQgwCSFhJlwlsvCW08Oc2ikCUy
         ssDFylEyRiQa4+YyibCAfFvUTDb1nSeFv0gLFV2VBqSO2MQhJT6S4uJDdUu3etiYLAxi
         455GCYHxWCEbRa1jDdMeJcb4EvDX5HjVVWUub7S5JMStHjnEKeUozb2rTORjCnfBC53r
         5pR+lpU2ZkYZBPZBgDJguKY2Xkhyw07H6fJLgYL4GmOJoIaT17MLuC8PbxSPaOB1wGFM
         IT0I0a4AhrH0OtDnyGoSNxeBMN+NO6LuSNEYOS/AV58DP+id57CQYbtT7MBqFKUkDH2C
         vgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879128; x=1794483928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQ2y5T12ktAE5iaKWCwzlas8CkbZmdyxwRbpbd+A6KQ=;
        b=Yff3lZk/Np6M6mKxg1T4KBOHZbxqPqg93hI0KPLfPB4y0CaPiR0uk6kO4/cuwc5hP2
         edgUyXL1j9ywSjgJoMeHgq97fY7Z3fPCPammQSqNc7lrmuT0lZLu4WXaH+Fj4a3R2vL3
         l03NCogoen5PVTFZClKO9bdDNzXWgwt9e6VGVZxhVmInt6HPi7gjzlhDFsLLoYqlMiLx
         sbS8p25nfVZNzLz8u6AEca1ZG59tKirzuFfIX/Z2qK85QoNkff8icg76nQGVf3mbaQfR
         D4bix+kTxr4LUQKgdK+wPsIOcp7v2n+709HZpodKbTo/0Gnk8g3rfgBT9dXJzk9iPc2X
         pc3g==
X-Forwarded-Encrypted: i=1; AKwUvByRD0U65C4s68ExqPioXOqTehhOmwSgzlwqlpM4wuKiK5cOOTMwCYwDfcwY3i8MkLJAQZl4uWXW3TU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3x7kBWZPRKemy71zfSbRKLvK/V1HLKYN9ki/km6apPRphcomM
	smQEG7NO7zhgDJKNKKTPN8okfVA6M/EQXonp9iJ7b/3aQB7fYpuEgeGdGW+jXdogJUc=
X-Gm-Gg: AYBFou28hdbtr0qt+gjK1/kYkL+HgTXz+II61umjv+BvfnT+Hl5+gAhkl8+pQHOsLh/
	R8fkccnF+23XeojzQzrxG/5cI+BQNFOr8J1+tzm8ACpRxLNh03Qhzs/rFO5bX4/F9THcrHTEjoj
	Jxl7ImkgEJAOFpiUvQmtY8cRHFn54H9ex2EqH9UqoHqzLirnvEu855taS6Mq9QL2fUAAm3l/1fo
	DUfZA4NMUFZEjMfweBKUZrhWG31CbF4KpwQLarOujZREBJhHgAti7aYQ4zS6oaQjSij2RkuPXx7
	NFAVP/OWYZRG4GlT5ZHU03QLjcubCbK5nyr+Brf1xJzkyNWi1+UH6OwtzuAvV0MXE7dMQrQCQE2
	kgk78APSmYj2FlcV6qKAzB1EvfQ2Shk+DD4dl/WSj8pjMT8EZhcLiXW2OGB/gHZjQ7pQd2KZli0
	IwpSwmWrsI1jrRq+sSyyeqreZqaWe8Ie8KoBmxAklxr5GHvzvwsi7ygljW5HO7a8kiKxHwA4u4a
	sQCGbXIIgWpLTUsMcW/f9j+dFxzSXom1U+xyNGBPqUtTQ07tCWePCnX0UQjcShx/tOtbBw4y2VW
	w6vX6Sue+gtsS5yjfnQdcehINPXCXd1M
X-Received: by 2002:a05:600c:3e8c:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4b55c8743a7mr39562485e9.1.1793879128464;
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:55 +0000
Subject: [PATCH v4 07/19] perf python: Expose sample instruction length
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-7-7759e0ce2449@linaro.org>
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

Expose perf_sample::insn_len as a read-only insn_len attribute.

Trace decoders supply instruction lengths on synthesized samples to
indicate whether an instruction was executed or not during a call or
exception. Let scripts read this value directly.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
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
index 42c587cd54a5..a4f1e316e5b8 100644
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

