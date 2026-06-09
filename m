Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD453E3D9D
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015498; cv=none; b=olUliSdvsVirNxX/8JbyMB215DFv6JkYcr/dnND2N00pNZkJqWd1McnwMGwk96QnM+O1N6eH4kHQwZme+QrDHvzm5TtBshacuOm+XUdNnhN1qCspZmlCxv8RS/myzRf7NQZPRNvews1TSJ11+BKHirlTQX1jyfiVW0ln5z5FDIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015498; c=relaxed/simple;
	bh=mQidedvPEcBiOBRv8PmX5mxZNEPoVdc1Pz6VHmtCWcY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cl+gGr5Bjm30tig2T+y23XUa3j5NkD7KAmBYpw0VvDA0nBcSEp0mjjRm8gxqshP8wKkWAhzoNF/10FwjlrzA66WK8OqUp04fEX2NOJikblXdxc+vqTxS3XQweBsOCZ39VeOVebl/SM5a4QX54eflVplHcBOIZDSXoq/lPXXRlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqOOb5mX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqOOb5mX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4601949975dso1030482f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015495; x=1781620295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0r3qOldyDbGy8/U7IZ1oQnEHZB4wfLaYDHPrqBV1zp0=;
        b=HqOOb5mXvb55MnWDFH3eBsosr4GA62aDSDFVhSm4CwsUtBzJZkc2T/6ZjjOVxYtXKO
         ux+mCnvQMf4X+T+NjuV/8irLUWNqyM8me/HdtMzEkP/mY1YpRcSSwJCy3ZyGQBRrs8Lq
         PxOCEtJsLqsKdZzig6ZaCQv6Bxv/9yfJsCsLoN4YLypAP35tYB9vOVQp2SFNCHZMo7fq
         ivcQEtn2NtfTach1y9HsrakQtv8DHOOCtepRP7qRSzLm05QEqnXZ5DaXIzg4uPI+tKO2
         /NH3jW8AhkoLXZppwRiZ7PwChKgWK40Fi8ZWfsGvmmQQeOZYxXBhO3yfMjks2fVp1b5p
         ZDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015495; x=1781620295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0r3qOldyDbGy8/U7IZ1oQnEHZB4wfLaYDHPrqBV1zp0=;
        b=ZPz3LSEn7otCdONPDhrQWdk40H45BaUjthlMTf62cU3K4zq46UHSQkgTK4fDyfuB8x
         kSCOWPSGTuHt6Q7jQsIY3joWeOTDyviXJI3Cd+YEOBZLOWllLI/zI97WzCu7HXGoUCbe
         exX7jE9ZJpY7V4jhmEIXy9XD9kRpEMJ7292kVCYHkobeKvDf7AQEHmjIK1fpf7/VPkfQ
         qpFJz68PhU3nzAjLAkufQCd8ZtFra5RbeotKmbaORcWqEfn1TGhT8liDy2e2Mpoet1CH
         gJEeNSyLlWS2nzesELPmIAHDfH6udkUDVhUC5J0B8AtKKzBszOxkKBw/zyfkBY0hd5RN
         U/ew==
X-Forwarded-Encrypted: i=1; AFNElJ9cAwYNAw3YSkefK6L4uNKIL+okzHX96hMt471LoAhiyQoA/m8RaNSPwo4O+1VXrW/rcTvy+MTGiNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKzNnrmKgoIHGV98NH++YrOekXBE2GLjYLzm5nbOECzpQ19/p
	7dDOKnoXkPTo1NH+3jvVKFIQSqVcorlsDzMdddqayKGvoBHjzfbxZ8Q/uYctMWCnRBA85VCbkrc
	/1FpyfD0=
X-Gm-Gg: Acq92OECoypYYHWrcD2ZgdVUd+sBB00TZ+viVWjKeF/Fy4waT3lWTuHpLIt/WN+zvvO
	UjTFuTIarTbHu843fTM8odJE0npPjRRlml2Dwi5llV0AtHZSCBHQNw6gHS9cKdv6LUbkdkEeUQU
	jYRE1vySuN/JsGl7UE2kp/b6h63Y7Rm25Tm0jljhHvUK3miKCZULWeAAbMJ74tm+AmnszhQzZFd
	syh5xy9eznEoCTIb5cf3sx0XzhHQ1vmgUZ2Ue2ENQvyEgWgrZ/vwwxT7jkdIt4WckLchmtkGBNQ
	N1iJEqBU/QuDgRsvTmE+IfP+5/03jin/uwOhSgDbdbvrk1c5AGP0jJNzaci8z1WPZ2PGoqChSwC
	aWQuKtlzAjUNSu71YVI6XC3NqnV9rm42pJnFZiUytupZcP/dwkDHzhaksDagMyfy4bO+tXwyDhu
	GMnHuD3ZrcpMxODvmBwNNlu6HL/28FVLDPFUV609HH9PU=
X-Received: by 2002:a05:6000:1284:b0:460:2d45:fe8c with SMTP id ffacd0b85a97d-4603063e7c4mr23189554f8f.38.1781015494464;
        Tue, 09 Jun 2026 07:31:34 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:31:05 +0100
Subject: [PATCH v4 12/19] perf test cs-etm: Skip if not root
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-12-44f9fb9e5c42@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
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

Use the common idiom for skipping tests if not running as root, which is
required for these tests.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh        | 6 ++++++
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 39553702c1f3..8ed2c934c87d 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -20,6 +20,12 @@ skip_if_no_cs_etm_event() {
 
 skip_if_no_cs_etm_event || exit 2
 
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for -C and system wide tests
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
 perfdata=$(mktemp /tmp/__perf_test.perf.data.XXXXX)
 file=$(mktemp /tmp/temporary_file.XXXXX)
 
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 0dfb4fadf531..339ae4831868 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -42,7 +42,7 @@ sep="\s\|\s"
 branch_search="\sbl${sep}b${sep}b.ne${sep}b.eq${sep}cbz\s"
 
 ## Test kernel ##
-if [ -e /proc/kcore ]; then
+if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
@@ -50,8 +50,8 @@ if [ -e /proc/kcore ]; then
 	grep -q -e ${branch_search} ${file}
 	echo "Found kernel branches"
 else
-	# kcore is required for correct kernel decode due to runtime code patching
-	echo "No kcore, skipping kernel test"
+	# Root and kcore are required for correct kernel decode due to runtime code patching
+	echo "No root or kcore, skipping kernel test"
 fi
 
 ## Test user ##

-- 
2.34.1

