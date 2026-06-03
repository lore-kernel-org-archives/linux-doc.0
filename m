Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997737B012
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481862; cv=none; b=nD1c4Ghn1mSYuBwHedi9opMO+xeidDf83IO+jOttzkqYPvS9jKKKyw9xu5jj/wg7XdRF9i3r+adcMRaCYvgTBgpBfBzGOFatVvblf/XkNlYt/6HD/KC/J4D/Gvhg9A03kK4IMqb0QCLVWG5dbudzb4FLpM4dni2DweJ2YpNRW0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481862; c=relaxed/simple;
	bh=bBCpsHP6pxxOKGXqUqpPdX+SmhYJI6iRxQWCSYCtC/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhZZ7t4bluXPAY6qZfl5yteJsnvixN3udZH9D9k+kPsvfsb5BiLzv50hcip5OvioosPfJuir8sZmQsXiwI+U40SjpO3iygpOimGP6bvnmW9YEKpzzXxGFXf8yjPMltLZA4Y9SvuJJBJZxjViZz+zl4TEE5Zbkj7UMMifQupFjnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pij6g+/1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pij6g+/1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b12270b3so12542855e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481856; x=1781086656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/tFhBvkW5lHa9f/mqQAj4otAbWa3BZTThp9kdngA0w=;
        b=pij6g+/1MGujnNTCknim+cjuFNgO4He/hv4aeOFN5348PZmqBIvc4RojIJadRTNXz8
         n8loZ3TCZiW2mfD3E7XOJnRRx5maXZ40CnUQPxKYIXyXWQNE9/55AuG5+tnSxE0g2N8Z
         2xNxhOB0WKKL+KbEG2kluXhgUq/V7XWMbmHWhEvysnwIyFF3UBUjdGIrhD4QpIRpWJY1
         HjAh70y4+NgXeN50VZt5sGGG88pDnO3vYAQDkHn83Ka6/SKbkzMVC5BvvWZHp3gKF865
         6i7YI9iNlRgoCo8XTduGjRvvxChFoSas53Wjb+kMblRTuc4euVRPSzVcW9qsRTFKpMSC
         dIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481856; x=1781086656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/tFhBvkW5lHa9f/mqQAj4otAbWa3BZTThp9kdngA0w=;
        b=m2nZ4n/28Nm8ENawmKlRS6K+c68FO8JZDX3k7faiJ6+OEqfR9CarF3tgY37zmcrIIJ
         evN5yN9xQ4+Le30BDKfXWwP9Pv38DCQ1cM61ScFhr9PNQYN6Gt/vrssYebAVpYj7Z6Q9
         fyYpKQSo/vdS5ItSA30tR4olExa5yVDybADBHfld0ccN4kgjV/u4cId994VeEZeEYmf3
         MNivw/BJd6N5FQadb+VpHi71eZXIXvtvk9yeK0ZuTbczJGvibxrqgxR4dhr89gfVLXa3
         +vFJYzsArvxdrcAkE09V54+cNwVmGUV1C+eiKOVV69WVyBY6dkY2kivBBS0/pNTz3+ET
         ulGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZN/83BHaaIINUS3YyKBFFlQnApESDUNf106fGYvGxk4RLATIcMtZvlZ/OtbKABHjSpyhDpVsAIj0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0RAv6plwprZdw59aMLYo/3F+cu/1HG9r0otsGoPWdjOb0Ojk
	PH/Y8fZGWFXwE4rDGJ7A21YdFp3cPhoIoX0E39I6b08rOMu7NR6ppJpyhx/1MlJBw4c=
X-Gm-Gg: Acq92OFnTCYz1F7kRFN+04hsE2j5s3m9CWEbBp5NRgnB7PcUqxE91yVgC61RFCpzkHz
	+mGSmOBWQzvnOxzobHgbhfmgVcGG/DSpHXBZVoT4qASF0kGw3NrbWNA+TnxBrdkIHzC+ruM4H2t
	5uAGmqK6IOTnmvEqTKYMXqXviXSEkQS9TFaP54aAlkFivtdIKP82nohJlGijbYqh1lSoojIizPk
	GDMGLJ4B36VIRH19oV/oxKiVioDE/WObuwo5yqDkudm9uk+gqoayVfFHTAHxKBKR7xwxJO1WOAG
	fPpjfJ9nhcP1meYCIPBfUxvz/pn/Rcu2WWsGHnLL0yYEJMeAZ875JV1uKijgdRkifR6Jggl/FzD
	4mRupga/tNGACjNnLjw1RaNP+BbWi996ZO9MqaSNziWwGi5nPEArvh6mZpWW2ch1hAj2TdkjiX0
	2vnUS6kZnqGJzQX2UXmuYlENZIRKBhGeAAdhTOPBYM49KqDtQWuYYvAw==
X-Received: by 2002:a05:600c:859b:b0:490:4b89:535d with SMTP id 5b1f17b1804b1-490b5e96157mr35776485e9.1.1780481856126;
        Wed, 03 Jun 2026 03:17:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:17 +0100
Subject: [PATCH v3 13/19] perf test cs-etm: Reduce snapshot size
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-13-c392945d9ed5@linaro.org>
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

The default buffer size for root is 4MB which is very slow to decode. We
only need a few KB to verify that the dd process is hit so reduce the
size to 128KB.

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

