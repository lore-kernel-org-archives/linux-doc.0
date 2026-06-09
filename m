Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AABB421A19
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016045; cv=none; b=JhWSiR07d79DksrZq8NIwp8V41RcZ5ie9V6wBCDwq8QGzm8UIMxbApAZp+6i5jJxAQjQu2Ss/iZIMobgSNzafa33eiujtayHTWGGS9E9qe6rssD2asQ/dYLYQXW0QXj6MlaC+BmUDZlMasyzSophhCbfSOZFM358ucUtTcK4g5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016045; c=relaxed/simple;
	bh=JQDAylSrWLAHes5gxsm3uG5xwu2zN9a3IzjF5B5oWaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAFH6DHllxhNJHF9u7uNZOYHzQsuH1/wW0a25b7OQccH/cVXWK8y8ALEu+3a3QLmOM3PeFSmoUtqSOuG47tAFriENQJPGGrijmgVnkCbG01ksSnYYUqG/IgX5YRDw90rNcwfR707XHTUjequMaS20nMjyUe+h29p65g9zGgx0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHw0bl71; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHw0bl71"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so71967425e9.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781016042; x=1781620842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tCZA64ZljHdNthuUJI8G+lKrRp8mWLWbXdPVNi3pLg=;
        b=lHw0bl71HxLMVFISlFRPAPWd2uwMgfWH3mys7MWg2LM9b8ByT6OCJrAbHEcrPV44zg
         HjyBFnPNCzptN0F8YvIFXoQV6A4vjBLRBr3Uteg3v11Y4XVxWWBEEIk5ZG0gtrzctlte
         csFcQ8e7Mnwg2HGtNjqGTZPbs9T8xhauwe7lQjjRsBEOENIbLjeWcTXTkwu9vUmgpo10
         tOPgVV3mY4UFoRomDIJdYYwRUkkeCrS3ut+2vSD27lIai2wRM8OGDv+vxToqDvMFSxHB
         7T3jdvcJI5Rs2MTHGvau0PWk+OKtcHsfErGJps6PpC2j0r1mqo/XTJe+usOKx4v+h5yo
         MdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016042; x=1781620842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tCZA64ZljHdNthuUJI8G+lKrRp8mWLWbXdPVNi3pLg=;
        b=e2o2qbKU3Opq87mVYqbbYqQBjVlA1DDtSc9n1mXg9fbrqR7TjTOnGhVBAYDKclCjtZ
         1xAqHxLhcCj0eJR/5UJsUJQ7d041XgcnIpkDUHzUQKNgWe6dArPivadEaZ2Rq82wYzlq
         jdBymun9ohx8lzqHTBVhEdMWXiuj9QPXF/bXsyIopTAdNcqP1jjJXwBn1pe9ftUg0ZyD
         XiTh1JMCbj5aEw9KMdc4DwVaj1uSH/nUKhBpILCT6uqPcOyJlifdIsjXfs1rVLnD5F0r
         84lpo4KGQedmB9bKmi4XsX+hcBOUwVXCnM5/imBwlRUPcVApG4jI8YpSNjzv1PUWDUM8
         4kaw==
X-Forwarded-Encrypted: i=1; AFNElJ87yqy+dJ4bcqcMJrYvn90crddPfm6AL01fmLc0XddKAxshARo8Gj+tA3e2fVSIlQ9D6KMamTIPyXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0D90dzxQo8cBVuAWJSWzOEbjrMvSts7qXRnKNbPtyiDxzeQ5
	n0zGnlb2xTI5KH3E43iYBnnU4kMxRwVHxxgt/sSKGznqROBihC9SfNYA12kTdCKs/aE=
X-Gm-Gg: Acq92OHe9zbLodCTGJPqEaN+hIfGb6klpr/gMJPw/vpvYluk27D5G8+vEjIMX50dZoM
	1P9c2cCKYiTVBh3bEFGm5xl7mWujR81BIIBmaZxicr38qJ/LgX7nvicbXuy9lK5zlzP+GVKNcJx
	eyjhH6wyvzG7s99e0YTbhW4tnQGVFQgmgpDpY9IkSVAGpGc9EEo+jFTMeNjAlRs6Z1XtJqLcPk5
	hUhpTQN/XVmaGZSLTr47Flwx+9uOvPitVCojEarxAoLkAAvMGw8OSFgZETv2ZVn+5bKmTGWSr5x
	1AqJh9dil9ynCQF4txFZ5Bri7WSeEYQC303+ziUu7QQUw2yX79k4DpNo35Lg2nbnTqmm+ic57rB
	f8tDk3gEwJjVImncobJnUwjpiZ4I6ah9UQs1iZWmWR5FfblH7Z8Ls0BP4wgqN86/z9hzKTku7rF
	HRZZLic/PNpTn/Xxlpk60gZ+GmvJMc00iIt6tXKltBX3Y=
X-Received: by 2002:a05:600d:644a:10b0:490:c2a3:1782 with SMTP id 5b1f17b1804b1-490c2a317cemr236651375e9.35.1781016041964;
        Tue, 09 Jun 2026 07:40:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c1149sm428411935e9.4.2026.06.09.07.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:40:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:40:18 +0100
Subject: [PATCH v5 13/19] perf test cs-etm: Reduce snapshot size
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v5-13-d53a7d096a19@linaro.org>
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

The default buffer size for root is 4MB which is very slow to decode. We
only need a few KB to verify that the dd process is hit so reduce the
size to 128KB.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 8ed2c934c87d..da2f599393e2 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -156,7 +156,7 @@ arm_cs_etm_system_wide_test() {
 
 arm_cs_etm_snapshot_test() {
 	echo "Recording trace with snapshot mode"
-	perf record -o ${perfdata} -e cs_etm// -S \
+	perf record -o ${perfdata} -e cs_etm// -S -m,128K \
 		-- dd if=/dev/zero of=/dev/null > /dev/null 2>&1 &
 	PERFPID=$!
 

-- 
2.34.1

