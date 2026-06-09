Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3343C05F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016052; cv=none; b=tPLwKRgMF7/M+2zDeb7Y5NeZqZasWfUoLpIf+udqmvs+6p0zUOGABbtvfWNuuGpWlfl4jtCHYVR1Bp0Tdx6AbGFQ6JsGjHxhYc3CBIA4oY6vvKb8tHc1sW3g7RBMIEXbNK1YvbcPZf2T4CFch4aT4oAM4DSl8M193C4SL3NCweI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016052; c=relaxed/simple;
	bh=QxiXQQoGhuE0v0FKgjfs2qmeul36mpIzc28JU+Z4ydA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avDIsQjq/0WMpELBo15YPrbnOPW65hC+AYgbmEWqV2QigTRlH2eFOJJrMAFldmjdwZHNG5/AgQmS1SzYdr2DH1ijgqwYMVYYgK4NE1v2OvbCGTi+zhxNj8Qrq/mtUXhewhph1PLr4UUc7VJNThnVXmtQGe0IRf9o8cNX8Xm8Ti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZdwpKl7e; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZdwpKl7e"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490a76757e5so36752295e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016049; x=1781620849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIDogTCAxtWe2C3a6zQaBCMJ4/zJw46qDk4EjlSKYTU=;
        b=ZdwpKl7exdNp/Csonqpi6Xg6/QjeIL+sAMapEscdsQFQl27aXBYA01ivRQQMQX3+0/
         n3KMuSajn0vqi7bQM0J0edMkNzh0wEipRHmu7OQd1dmg2UCkkpSP41IqcGFc62hXqnbP
         yAaZNXYC6DunqCXJzEHbeUPlTlCcKZ+RxLTGKUvUHwrooLYazXmmdqQpdIyq88a9UM6r
         0oSelhgLmrQAYJYRz+hfFakGWcQlgzb/PTMZk0Z1QkmqKpczAQsG4hUX1qBowh8DN0GT
         5u18eddxNw84lFs1x8ylduJwhg59wTR1I9q+l0MhLcu87mm3dT1mEfCisz/IgCZQjAJC
         TllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016049; x=1781620849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qIDogTCAxtWe2C3a6zQaBCMJ4/zJw46qDk4EjlSKYTU=;
        b=sfhlesPkP1DCqBFje8H0cEnYcc52f5TgVUFxUel//obQrsdUkjNr80tdob/1KwHSYR
         llWD/Kcn99Sz8dh2ppUCQJYBW4VZ7vnyAypHFdF+3hDI4CHzHEIuggEBlGOxasFXNRlx
         UHjZTm5Pu4LkJfe+vVRozMMvb7ccK2y17rhBP/RtJyUsXlVFC/oFmdL0M6Dg6p0qyTUt
         RFaLuK7dZepeClXwivQ2IlvZdBUksnW/OF+tjnw2FdDgN8E2mLVunvafc/Sj9a7O1Mth
         Ypqx4b958A3dwkpx0C55/KJNgsFVGf4SK2AFV0IIT1cVQYMfDC7/XBs0WzCuKdcz8CPC
         m+iQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zJbuth/EtFRgndkQ/2FepjGPMpiZSpzGy9YXRab1Y9EAMOM4kdiHYGPpE+qRVn+7IF1LewudR44w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc2Gy3fT6S6KrMuF8Zm0A8Nqexc5kJs8vli2eljmn5ZSY41rpa
	d1lzpH21zqA7FOztxwoEPeZWsHYVorQ4fa/J8cDJhQ2bY6ccVPXp0ax/5JrXd+9v+oo=
X-Gm-Gg: Acq92OFtQzUU6q8392EFxP7fxeUQOmjxs6x7KIPhqIVjyqyhLA9qA+qJafFA9nv/v+C
	ZBad2tWcKPzJ8lnpq0gR5iSrOHobHaK97anxp+VaePj83hK1kQlRaVEphJ4j3pogam0ROyLVtdu
	V4d/x4rZGtKvS32O10mMWZKKoPJKYYe37zI/OHLCrsMafrG69znFMqHuPQRIti/8tTDna2lEMHi
	WqLCPyOLc/IiV+zOKue15Eo0n93YvqKlHEGnBC+/IGDx4SnVe99NOxBwlxL/gTB/Ag2lbUGiVZX
	nGEVWS260g1v44og2L/qm4sQZmPhocfUyOy30COhwfQV9JQeDeSilwhHb7EKOyUn7IcN/CwUVrh
	K2YtuXJkpH/XRRHzXDu6DnT2+yPQcbRlGEHsKMXCWMlZx2aW+PbayBDV6iyZShZ47dCp53+ysZL
	EX5q9UPv0xMpFStfAb5Z7IuT641RnSLG/qhEcfxzkh16g=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr326755125e9.14.1781016048776;
        Tue, 09 Jun 2026 07:40:48 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:23 +0100
Subject: [PATCH v5 18/19] perf test cs-etm: Speed up disassembly test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-18-d53a7d096a19@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
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

We can use exit snapshot to limit the amount of trace to decode here
too. Also each call to objdump is quite expensive on kcore so limit it
to 2 samples instead of 30. We only want to see if there is no data at
all.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index f78dfb6bf73e..f2fb1aa92252 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -43,9 +43,9 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ "$(id -u)" == 0 ] && [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
-	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
+	perf record -o ${perfdata} -e cs_etm//k --kcore -Se -m,64K -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
-		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
+		-d --stop-sample=2 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -E ${branch_search} ${file}
 	echo "Found kernel branches"
 else
@@ -55,9 +55,9 @@ fi
 
 ## Test user ##
 echo "Testing userspace disassembly"
-perf record -o ${perfdata} -e cs_etm//u -- touch $file > /dev/null 2>&1
+perf record -o ${perfdata} -e cs_etm//u -Se -m,64K -- touch $file > /dev/null 2>&1
 perf script -i ${perfdata} -s python:${script_path} -- \
-	-d --stop-sample=30 2> /dev/null > ${file}
+	-d --stop-sample=2 2> /dev/null > ${file}
 grep -q -E ${branch_search} ${file}
 echo "Found userspace branches"
 

-- 
2.34.1

