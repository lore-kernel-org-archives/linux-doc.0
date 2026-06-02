Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F87423A9D
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410461; cv=none; b=AmwU8lKBiH05xAy62yItWyKDiH82LW80OidUNIOnBFDAD94PGaf2nfZP5U4GxHJQFAfS6eedNUChkrUOG+MUbcxKFSdYByWWfhGhb3Ro2wSBSUabAhWguIznXOAFyV/t80t5Dg/jZRYVspTYHxiZeb3SUoByu1HL35v2yYgBf3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410461; c=relaxed/simple;
	bh=kiF2OTFMHPFSfKgoJlJ6LUHEtfynLX2Gc37z45ui+yM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dD+FA+F2CcszxBSejsHVfQKszq7BFdhiretnRFjemwOi2N0CDgoMSEuXlX27LvAnT+enk211QDV7dAOJwTUrIGhe9NyZ7e+9LFf0Srp3biC0ZY+VJpdjQ61SgIs74GfUpmMoD1nDYQa3kUDmAqoGzeNFq89g6w9sPfdlKh9UdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jv7gnym1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jv7gnym1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so2640730f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410457; x=1781015257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlDlLwXjKsadrJWN67gG6GxzbQU2KCIjPSaxtLGJjnQ=;
        b=Jv7gnym1U4iKfN6BE4yjZ1BtzxIQux3BD2TmtuxpQvnPCGc5RKaqLE6KenwzNiJbLw
         2U+cAMnO8UMHbxDwC4kllfMoqFLk8kAj65La/lpSqUQEXl/wnZRmmm7dIdZXHQzrqNiZ
         tXw9BfaA7tbOghNLkxBJwdB3jc8gSP4C/CwfTOntI5wS1Xww3DZnrpIT7kpC9Vj4iyp5
         vhLVUe+ceFWEuFUk4r9eXBYcnyD2hDqcVxz2m0u8RTAakFiU2M7xxGTUm50koPWo9g7x
         rgRjZJG71DirmxCv7NKDpuo4UnZ+paTUbgBA2uVGBNqrohS1OMincuTdKwgy+JQ9YsYi
         cL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410457; x=1781015257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlDlLwXjKsadrJWN67gG6GxzbQU2KCIjPSaxtLGJjnQ=;
        b=s/Cl01xWRp+FaaU1GUEBiQ9OAVD6O4XV3aiGK5cqquCdyuqn38C1jahOlm24aeeudz
         GzIdsBIIRMWASjgYCNF2CNWMAGD5UI+8Bp9qDMbYwap1Aok2mkDHkudynLuey0t4gDQ9
         lSw9wdCII4QBrqyOy2osF5CgREfwQvQm6pyfFcj7KD/mTObdw4qv8kIdpSZFRLFADdnQ
         vZEmapB7YMvELTKbWerWwMBZ6TlMKi+5/S/BtaNMXyjBwrubKkYWS/UFtfQGm8yZg8m+
         FORt/lZiUx7FRlAkad9e2aqPBo4ufDJh5cO/2DFu47b+ff4CMQpEz49I++OD/O/zLcp1
         EvOg==
X-Forwarded-Encrypted: i=1; AFNElJ+BQ5j2OfUBUdn1q2B8xcZ9HawOdjegAxYNZOiW3P+15DyeN3YBMUrfNu6ga0gaCm4XBKtMJ4z6Dzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaAqnDzcYHGF0HrTeQE91CkTjiQI4ttUCE09gW3/jNEJx9YG7r
	wRNENsq76iVwrWYBLNJ501cFNqUJBHEM8esedtqxsTkw9LLjIE9BvoqTv5MfObjc5G4=
X-Gm-Gg: Acq92OHW7ocytT3QiI5Ufuk7hgzO80aVldUe0GAwrAXX17oCiLkYfQfbzxVrYlgJXFh
	a7yGwzXX9FZID/vlVjKRsjmvKHrCHGKJs0FKJjk/s2znBEKs5KekRi6jGsANLXDvf0Uwwiy6deJ
	c/fc0onDsQjcCAxZRiJa0LB0W2w/lQxlS3bs3telVVfP5EnmhMtcG801xFckaaxCpUA/JbPjvC+
	2PxZHTSzwkdcMhqMdigmFQsYiF8eqwukHY0eL99qEs/dauXrozHF/mxGPtYj+tPAnRJPdsY69vD
	YA4VMK/afNFtoE+E1EdQJBF8mOWIy5/RmG56qe85jJNdAV/PdYeTwTfSMN6wqYzDOSmKYtBXxfb
	HYVzg4M7uJVfAeBWy32/CvZY2OSsIxH3+wj4q+sX9Ths4xxp8Vb0sygOV4JdOw6nEohtu0N6/tp
	j0a7CpqdRKI6tEzkSj3r30VZ6ciGrIi5YZgF10uKDDaQ8=
X-Received: by 2002:a05:600c:c11c:b0:490:4663:691b with SMTP id 5b1f17b1804b1-490a2923a3bmr241787255e9.7.1780410457017;
        Tue, 02 Jun 2026 07:27:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:58 +0100
Subject: [PATCH v2 16/18] perf test cs-etm: Add all branch instructions to
 test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-16-85b5ce6f55c6@linaro.org>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

If we reduce the number of samples searched to speed up the test, then
there will be less chance of hitting one of these branches. Extend the
regex to cover all branches so the test will always pass.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 8b5c60a09012..5ee87eb7973e 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -38,8 +38,7 @@ cleanup_files()
 trap cleanup_files EXIT TERM INT
 
 # Ranges start and end on branches, so check for some likely branch instructions
-sep="\s\|\s"
-branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
+branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al))?|br|blr|ret|cbz|cbnz|tbz|tbnz|svc|eret)([[:space:]]|$)'
 
 ## Test kernel ##
 if [ -e /proc/kcore ]; then
@@ -47,7 +46,7 @@ if [ -e /proc/kcore ]; then
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
 		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
-	grep -q -e ${branch_search} ${file}
+	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
 	# kcore is required for correct kernel decode due to runtime code patching
@@ -59,7 +58,7 @@ echo "Testing userspace disassembly"
 perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
 	-d --stop-sample=30 2> /dev/null > ${file}
-grep -q -e ${branch_search} ${file}
+grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 
 glb_err=0

-- 
2.34.1

