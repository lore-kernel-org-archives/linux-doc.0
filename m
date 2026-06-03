Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B373A6B6D
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481859; cv=none; b=RVfUPXbz1nQ38UV/QMuAfo96cPlyix1ji+iVoCFvuqJB3zFndkWMZClQBL02TvcAdGVQxgL0UU/2qTZ1Y/+0vlYBFORo9UlS6yJrza1nZ9TLe/v5jHU3sn3/x7niPDz3RUcETIYa8wjLnTGMqs82XQGCnAc98FaLExMsLQz1Ii8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481859; c=relaxed/simple;
	bh=T/G2GHn/7fUMe7/PnmdOHhquh1KwWwdOujJXllzzUEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHkIG36DOnoNaoKmCisnv3vjJdGvbPeQ1kaRRiM5XrBBHmThkOh3Nc5c+JoNozlbbAXZxKEon1sZghdUSRcETJypSogp+o1rQcOdksCjaZ0MyGwAAg8RELhrSus42IGXp2VKAcs7mkHhp7fU8OnpK9LkHhojnOOGbqauuql0v3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcZLfZdW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcZLfZdW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a76757e5so27429655e9.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481855; x=1781086655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWgAW+orRpeoFszPA6ybNAPpRullqPhLMJ72GoaGas4=;
        b=OcZLfZdW3Dkmb4vic1r5a18+QzSWtcl9J9p8eSinsktFZivX2elXBDwUyatrz+eQxD
         mBwalMpNowGsOTK6jHNDDVkrre42fK4vXHFhoWouuTY5vsl68jbP1J5N3fWm/dKE+YJm
         aEs7Z3zCbgZayxVCM2TlNNw69qAvJe/ywLqq4f7+z8bj9qxINFQnbIVzUEjMlr2yDk0X
         GfyeU6aXXENjpatNF+R+CagHCM8DZIqSm2K+UlQg5+C5iCBmkxTokrDXOf1Bvba3vTCF
         O1YLEt5+RvqkR+srxyOSHGb8LNpBDaVDXJc9HMPCkgN4roeDWV9PEas+GIV8yDQt56XC
         DuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481855; x=1781086655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWgAW+orRpeoFszPA6ybNAPpRullqPhLMJ72GoaGas4=;
        b=LmcPaYYBF22yXgEK3hBlxe7K2tBIHOQ849hPVZqVAuGdVVCGteFY/BRiPukuI0pJRz
         58wSMuPr0vuJCsx4iF+wBWGbMcu34BaJO1AbMbHAHhqvMy+dwk3HO6MyiQ4w/x6PjYkS
         ZzLDww0SJ0uoS/hJZEcwNWb6ffZT9sqaJdEXJESm0aBzMC87/wtr8VJGjnB9TUYMmigE
         gxS9puZM7x+pI+2QNkVhUB0Dvr43tG8wJtabB7v96vH9fzxQYXBs/T1nLyAhfsh3+g9V
         X8T2ffNkunjig+j4PWiBC+SIIheIjy8bIlbbzG1pNi0v61IJRSf5bRoD9OYig2Sshmt+
         q5DA==
X-Forwarded-Encrypted: i=1; AFNElJ81dgJi3MDduK8RJzdn/8mpP1Ctz5vTiaT8JLkg4KWObcxw6e4aqddTctPdCqOCttc2gNtF3IKpusQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMCoEHo5W4imSNbA5VsRc2HG4+Fex9XHlv4VviBBtvFW5RbSy
	EXKECFCyWHAp95FIhuF5VHca8tgeuLwx4/34/NoWfE1V90WNgafgjOoL3Lp1jSc5XtQ=
X-Gm-Gg: Acq92OGCWV+o9Uo3bKUKW6EF81A9i/V59PGz3GsIcLIQcSA4wH3Uofc3AMVAh8BzLUq
	S84x++eIGb63HYvcpCXk5ZpIWyzCVn/8ynozYlPL9FN6pIvy9XNodjFO2xqi6Fg+HDYD4lpOKuz
	lKbL1IFI/cjIpw6LOcURbWZAJZe4RgTKZX9Sy8a9ZKQG0vheugSj6fB8IQ8EsX3hWZSpovDDxDK
	WroozEB6OTgiZ91WHeoLHIT7utvPTe4AnnwYKQtfU9vdMj8wgCpXiaxHlbPNG9wDju+Ng3JXO1Q
	cpSQVvoAqQ1LB+jbnBzliDYfbF4qrIeKH0JXhhib2gJyJjl6XI3kyeyILmeon07HmeygDd3lrZd
	C7e33dYGbC7ZvXTsafd55P6dZnCa1EqxFXqhtOx25nwjFL3PhMhupFykAM18ceSpQtdD2l4jsFs
	X6KuwuFxC5SU+dgMm3Puwgf3JNwvRb8FxsDmn0fHrr4Nw=
X-Received: by 2002:a05:600c:1551:b0:490:5466:8576 with SMTP id 5b1f17b1804b1-490b5e9fca9mr46134395e9.1.1780481855020;
        Wed, 03 Jun 2026 03:17:35 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:16 +0100
Subject: [PATCH v3 12/19] perf test cs-etm: Skip if not root
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-12-c392945d9ed5@linaro.org>
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

Use the common idiom for skipping tests if not running as root, which is
required for this test.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 6 ++++++
 1 file changed, 6 insertions(+)

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
 

-- 
2.34.1

