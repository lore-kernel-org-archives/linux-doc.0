Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F263537B012
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481865; cv=none; b=izw/C+wjOrb4I+aROIwZaxZ6rDz4U47zYDmH+wxbwNKLQFBImpJ73UyBYb8ELawDuqNXMPwrCUr5O+W2w4WH2x5UAqMWwndWWrMSiO13czCcf/0lHm5WCmKWz6nZyqHGMaREYsnDLJQEEpxve+XGpz5dH1GHNQfIlAd1rjZ4m6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481865; c=relaxed/simple;
	bh=8LSDPEyYFg9oEMScO6e3DlP1X0ZKaHJzrU3+/imMTps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqQ1ALUA8omvjNDxrkuewn2Eng7s3/OKgdp2uqDTh2oqYco2BjgJYDc1SjCL5E4qHYhBYkq8KH+d6hUPfJnkUhuGAmnrp5UCXuBbgO2ymmSJszAsjbxBSbuyMlBNIJOR5+2mrJ0QoCS2SZsjVpZWDGoiQSX/XqjpXrACUBlf4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VBpeRwd4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VBpeRwd4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b64c8311so8742595e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481861; x=1781086661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CFsmZwqnn6DMPD7vsYdcccNw39lngm7NfIBTUlMynk=;
        b=VBpeRwd45cPbckMGAt35t3w4Z4+6esStr2Fw4PW7/puLyiucuKIvGsWUWiVqz8LsKR
         sf9GBjab7BHwK7FU49oAEm/vlems9TxQ78Ho8QmgAbLZztcvD+7yOZw+1v/ZduXGKuNE
         0vOj3vkUrmZ30VnuoRXZwWIPnvacO6Qc2Z2wYFLmaY+zIXFN9QyxC29ypuzu30y7V163
         AE/2G9z0jhXxbI09DULYfJ/VDOhZJIK6cDUtFY7PGi3yRVvs01yjPftj7mFH70+xVE5W
         Varb3UUnQs0zzJezaCg+6f3bV7yFE79Ngzg2vDOW0pyA0yy2h2PIUvbsNcOaeRKy3/eE
         mA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481861; x=1781086661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3CFsmZwqnn6DMPD7vsYdcccNw39lngm7NfIBTUlMynk=;
        b=Jique91juLDIktndaKdScH6T8dmDQWFuw0O7a/2sa7KDsEGu16cXTFOPkFDc8+eIY3
         pgY83jXE05FYsx+JMeWk6I3nqncxhheHUz9I9Kll5Scct9cQeYT7iPyqlKKo75MMAiCo
         6w20Rx81Mqas0P8yajYZNuusw6x9RltUCay2Kwk5bCWq4QWxGAXeLm2IJqjLWcgit2dF
         j4CL4VQC0FhlH1wHr2cxs+GIP4hT2sMuzcKQ/9v/mvQEMeT9m0BuOCpoUk5UHhvG8GBg
         4H2rWUEQfRjW66vRLEcN6JXpWOtuNE+G/D0dxBISJguRCOoioWfKCVk+ZFS9wvaSlJID
         SIPA==
X-Forwarded-Encrypted: i=1; AFNElJ8RM+yJkYVbewk02ABMyJdrcMkZrDE2NkSz1nIbtJxIC1h6Di1iNMUML02XhLk0nh9gx30VnVNAK6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK71aMcwfp3MWOr+5zgo0nMLN+vpfsn0eOfxXCXtyZO5+ERDh4
	UGmSQz9FADw/RWO4SsNqNQtLKrhzEbPgiv7acjmgnpJ1i0awn0RnKrhcbuZQp+OkGmY=
X-Gm-Gg: Acq92OEOUiDXQkRmMCF/QFh9KLeUZo5JRibK+LTv5kMgr2U9FtFJauqt2y2SrKA7rL2
	Fw3t8Q+3Y8LwKfrPlO98jzqnY/9IoPsMDyCe9FpZg0lEQOJXnLvGU7VThKXBu//YPGWXJ4Isc0a
	OZiLwcyVTBaOautW2gKKjgreyGspYtEEpjf6mlqaUG5kAEEnvXyxqvNEsfyoKCHgFJ+r0hOglj2
	oqNYTeet2KCzE+7JloPWsRbwwi1ieYU04XUTKI9aGuqMSMPZtW3d17Spb2SmerdPF9y9UX8F5X6
	3rGIk9xJWN+k1eS40hFxTWVAchqxoYfdroIsEloqmwPz5+mIIQEMRF8v3fHl39j0q8QlXcrpLth
	yNDOE/ohGJ0EwT/aHf7VWOYu5QRVkvdnUMJbYSBLgIYeKYwv21ICmpuh6FvVX4fardN5SCHHkOs
	KT0056bKD9SV/ExbpxW3sGNmNbL17nnjZoQV8CFK7YKsM=
X-Received: by 2002:a05:600c:a311:b0:490:b724:dbe3 with SMTP id 5b1f17b1804b1-490b724ddb5mr31187235e9.8.1780481861383;
        Wed, 03 Jun 2026 03:17:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:22 +0100
Subject: [PATCH v3 18/19] perf test cs-etm: Speed up disassembly test
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-18-c392945d9ed5@linaro.org>
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight_disasm.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 5ee87eb7973e..2a400fd38a36 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -43,9 +43,9 @@ branch_search='[[:space:]](bl|b(\.(eq|ne|cs|cc|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)
 ## Test kernel ##
 if [ -e /proc/kcore ]; then
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

