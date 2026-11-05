Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879150;
	b=zR9NAmhaS3aQlAsp0VuqBlNJQx47fb6hUsnxF51PNcIflTH0BLz8Y57hpIUvypHOTJrd
	 bPWZuLQ6kYNghIlVwn+IH09Fnv7R9aHx6YZ1utT61FaosBa7xPJBdkEGmGOgZEUiBoPDE
	 Q5xEqPMMxcgH8Ds6VRtuNxJCGAdx9IFGZH6AKWn6zc/+uBxid7ze1M9mgJ1xQVW2sg8vU
	 LT3N+ZeXf0JnLOpZRdJDxU2RTB1hF6zv+upmHmqqyrM67jTqrDotneiiWLk9LErxIWxc2
	 oAOtbdY4KPgnskSUsYXGnOjo3mcTwSUuw0WR1vroInfnpLCLswTqcnJPhaFIvChJU6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
	b=EKm1jzDAOQpSx0Y+corMXABWN1YBJ9pCIVGVL/Hm5viDJuUIJXuFZvLyI29g/2S3WSBg
	 R/XMVZmStVThdmS8MtlcOOazbPIKMWJhQDzf6tjtd7oiRTnXqonCAwa3B7aEObRXZPo5I
	 PMYK27sya3T342Pr++lgzkRx5w5jMBwLqn7W8U+D+jeDKyMKF46IPkvXlr6z8aBs4hnYZ
	 J/s5RpWhpChNiTxEoyfcq3bBY0SgpVaquwUCad/YViHccaLv/zuNHlPGvetVXeckgYllE
	 BM8cXWWl7Wp2DpjC3NsmYPFcQtZ6czMfoQ3PkjyL+oNhWvbB9YM3v/sVaNpJPP5SNmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ex9MeRvg;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5061606A915
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5061606A915
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ex9MeRvg
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5936105e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879148; x=1794483948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=ex9MeRvgxf8OthR+ykcSraFjQf2M1WOA86U2Fyr8z/S/bLhwMNSebNL2K8bhaHn9Go
         BjkkSM0e5+zsm2UFf+xBByJOR9siue/+yqCJH9aelxgYEznoKWP3rg8CflugEMzk5h96
         8i2GSpmycaB1kcqQXKQMAfD2XYU2eStmfOp7L+Jgr2fhiG0vioIcGaUH9ZP6rePGZB9U
         OgEaUR2KuIuTq4Fl8Q0AgcdeE5DXUVGmadz8eGW/ndq6JY9iViPlXbDI+Igyd0KugMXO
         YogmN7vDE4ufq2kBuv1aFznTMoLBD/g4bIPKm20fNOZWS58AMkDLrnPIUIiV+WPshWtA
         +4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879148; x=1794483948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6SaFtQqKwsgNERxw2YHc13oEMre1Ry8xi3YCZpxsYU=;
        b=kmodGud4iIfvE04/fxIJNfk00JrGWEJZtYKzlIgXxrUdUDV9qoj3CBQG/wluTtcgVD
         jYZvKIsBGwz2vfPElPakks/0q7cjJIEFqlJ8/0QPE8+0w9OKhTqxOSwLuhFbRKIIXXMm
         T2olDt2+FNxvsu9VK5kZHhousAeD6DIvOur7hxJPF+rjpPfnA+jlo5cugjhAE+2Raodd
         6uA7z/kKRoJOokWi8hBIXCWIMMpp6+7Pw+FJok6UCc7+bNm6BJK35xLMBl3Eu7KFZ+i+
         LwE9JciltfOIoCxJi3598m70gfaatCwa1zuSMBCuwYGDG6RdcVLEZK2J9xGqgLBtnrHs
         ndpw==
X-Forwarded-Encrypted: i=1; AKwUvBxcXHd8HAVjJO3LDqFk9pt4Ru7GDReoxr+Xu+xGiI4XQmKKuIFen0W527REP0CXOONtE2XYKkadO28=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WzrwRoexfLXuFhDuogAtdzZNpV5tszghqOwfgciJm6KAu3zsv
	tnZKvqcT4qDk/pghaPdnAGzTff3mUr46vnzuDD9qUIQiJammdKUSHdD3DxivC/BWXHU=
X-Gm-Gg: AYBFou1HO0ZVYO6hm5eNOuT5GYNo0P3RZTqbauZOeT0Yd4ZWWtdzji/Pv/hP5ciarvd
	AYj3NYBkSdAitd+nj3PzM53YgZNS+HInxiohZbiMx9nXbVzp9ZjoLa6qbzvYgzTZOYG1AHFDowD
	+z9rGbqBGZevcUEF7IJglHIu1nI+ZpvH1GqhXORbRiSJ8fPBKNVB6JEmi4lqnxL8jYw6PZKKJPQ
	BaPsiykvqeQYKoxSx0g42rEVBOaWvLIMxCI/s+GeDgs7A0cEB82EWgrK4HA/W9sjmDyKuoi7jTv
	oBqASStbzVp/JqXePWB/1tbJPfWHjNYs2moy7ClMH6VSiBOtrRviogA7l1/FQJMf/k0E4VCfA1t
	e//fJjwhcy94FWIx+Wi+9ZHS01V9LQaKnnU5gET/3hPZ8DSiFZb7p+Qg3OWCf+L+d204+F14GcZ
	9Wynplu+KDZFso/tcWLDshA5LS3cNGcAoAvz3dTmLcr8PF7Jznbw9RFVbkPr2Dad5+JLWroUs43
	yUi2gHwKeeTk23bpemp2hvCl4otYJqj4sTa4AfNBMPh9L9kwCc2WL8cqMBWTyTg8vHFJDmN1eEU
	06SXtGfDBDcGanOgsneS+GzjKfzWglUM
X-Received: by 2002:a05:600c:e556:20b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4b55e07fb14mr25741525e9.17.1793879148405;
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:07 +0000
Subject: [PATCH v4 19/19] perf test: cs-etm: Increase snapshot size
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-19-7759e0ce2449@linaro.org>
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

AUX maps require at least two pages, so for machines with 64K pages,
128K is the minimum.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
index 236c4160e480..404317c2b96f 100755
--- a/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/coresight/test_arm_coresight_disasm.sh
@@ -48,7 +48,7 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,128K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} arm-cs-trace-disasm -- \
 		-d --stop-sample=6 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
@@ -60,7 +60,7 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,128K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} arm-cs-trace-disasm -- \
 	-d --stop-sample=6 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}

-- 
2.43.0

