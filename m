Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846D40DFA5
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410456; cv=none; b=WBJReTCHexF5BdBL8YLzEGWdjEzCODXCBvNWXZjnXWXhH7/y7hJ16ebe+xEXbUlxjPc7NO+Ysz5w4UMwhr4JmxojutacP7Q5Np3TYj5lKix3BteEx6uP1choxNjVAucGM3jiuZHIFRvjXZjgdAnZYb5w6ofnB42IO50iEC2HmEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410456; c=relaxed/simple;
	bh=bBCpsHP6pxxOKGXqUqpPdX+SmhYJI6iRxQWCSYCtC/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3nOWSCio17QiiBxfrySPPNLyYdFo76+6NACE3nwrj2aW0CzoIma5lQFufL/nwhQZYHdCRG2lCYTAgowLyMzxrgLBipGj2nInjRzYSC/DgiAag//Sv0JZgTzX+ZOTrpwxgiD/WNepgS2mvnRhyOeswgV/aJpJuTmzT82BUZOX3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=me+0wouK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="me+0wouK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49050bfe053so84436245e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410453; x=1781015253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/tFhBvkW5lHa9f/mqQAj4otAbWa3BZTThp9kdngA0w=;
        b=me+0wouKFJA/aGBgjuNpqYvngSjqAVFsYzuG345fMbJ9tCH9vmiGkb/VnrFI8rTF1P
         aDDHWozLqPYTXNLtj9tAAHWEd1lYz6Jod6l3T+RNq48vAduxJ0Kg5Y4l6hvqwy1qsNbw
         mOe6BvR5YXE41fOYH10B4csT7M+9/exP0ys4G7V88sT9UDyDFU0ARxaPbD1y8OwoCn0r
         nUMvfxtd6KtWRQm8Ps6+NbtRLkeUqkbMu2MqcL8LtYMVUAK0XEobbm7fJ4/GWencmwbA
         zVYIBJL9JZzelT4u8P5B9rOxxMtaPcz+R1wxqZghOpoICiyP2dbQ/VABYTfJmO5l6glj
         UTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410453; x=1781015253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/tFhBvkW5lHa9f/mqQAj4otAbWa3BZTThp9kdngA0w=;
        b=V2JXGsV7fbr4+4mqtJG5uw6nkeBiYc+7vSYgRvoH/HxoV+Egf3Z4xhhYqtr2LLLtvg
         Tsg7CLJiE2F7sQqqvumqkfniEMjGDYF5VBdai681mu5uHu/QOkt1Cn1MWgap9EX43eCm
         rtJ+tN/tZvbBF/9B3B+MG1pL8GR2w2E56CDINMoGxa9HjYKKWpAmfT7PJ9NDWV6j9Sfi
         11Td6Ji+u4kcFAux/DCJXRDMeO67QmwjhM3ScZkWK5NY6NaewJjgPm6C44w82wrySHMt
         lxuIMLpExGxYgsskEDch3jP0tO64QfM7ZBu899UknsCt/wGeinUQEnULziiuJfBeKAsX
         ofcw==
X-Forwarded-Encrypted: i=1; AFNElJ/DyseIDtHF2e2QFfnwxEgaZbs9D3uGnhAMl7fJkS2xcYENq763BiF1rocMej1cEuMb5SCIDb6rUtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvcAmk7ZJxL2EcaJpWNtUwWE6TBndVEbE27zS/P+I8bf+851uc
	AYDHn4Oq+Ieeyx3o2OVcO4462NWL1FXR6zxc6OQYQQfqidXDnHZpW/++vKSoTb77IyY=
X-Gm-Gg: Acq92OG1aZqRyPw3IewPMVnwCHBs52e7D9qOE9qBUIHRCcLTzq+9EdHXTkejUUSeBte
	bqUGq9KVhSjgMAin2pYX7RLk4+wDCXjBYErYJnEEdqemP8SI4GO0uVNZRMclKzskoyPULmsxI8O
	IDXG/c9wJTlZ16b/CejPoH4RHZB0YHD5RBnQDbHgns46yhvcqu3X/cifW3akxTA/qYy0MdVhP1E
	/CbwN5V7lq+v5n2+9lXNJjhXRx4L9Zrze3S4N1WUeGqUC9VRr8fTm9Mgo45juVwDdBYjL5YL/ZG
	6Ty8sXa0uMJsh4TokWIrBEFEIZhGpZl3ZtzSYOs71NqQqc5UR7O5RYRWydl7T2uOBVfarxzRyDN
	VwkN06gyczU/rt0a311ima29SEEF1SVMsZzq6bTU6x/gf5tz1YFpbHc4rOYpl67E1TfvCICPxA3
	1CLhHXCE66zlOUZNo5Ie/TQc3VBCBbOv8GlRg5IZNTDYQ=
X-Received: by 2002:a05:600c:628f:b0:490:b026:971f with SMTP id 5b1f17b1804b1-490b078a6admr85262375e9.16.1780410453092;
        Tue, 02 Jun 2026 07:27:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:32 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:54 +0100
Subject: [PATCH v2 12/18] perf test cs-etm: Reduce snapshot size
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-12-85b5ce6f55c6@linaro.org>
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

