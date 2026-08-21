Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864BC44D685
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305779; cv=none; b=sT23vW7JuRflcJNwKQr6vH3HesyIDqwqW26kSrKhCzUR7aGrieA09PjYNl+TMAplznLH+A9YEJAx59AasPk2oNWhMahAvaWk8bvDKVFAyGNSQsqnKXy/CPdqBXlpeTADB+LgGnx9v63NyPusKerTlaFy9OyQg86fZ5t5/t5U+AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305779; c=relaxed/simple;
	bh=h2Q0M74fb6yudEF8zDu1K70Lt8wJfWd+FJHyFrYnfK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8kTrrGpVXEEI6UBfHR5gwool7IL9dGavPecsxeYIyUmqcuFr23SNIxVWd4b2DfbQf4yfNwNZ5tSaaq6n0sjRjX9WNjNW9hoTcooYBQDG7/bMyUHD/lIwDtP39BglZX/1JYxcOiOUraEUqkZ8NCBNVGcsOcXV8YMAgwPWg05j/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRHObLfo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRHObLfo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de008b020so413537f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305767; x=1787910567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=yRHObLfoToUFaETJVNEIsodYXUXhy4bnofOQMJGo5rGXvEpWgolomWuigdAIj/NDN+
         zAB6Jz3OnxeEvCSAnJCPACSg2Ref5w2ulMHAbIkrKuq6Ga/3Uz6ss08VeW4QsDdxM59d
         /yGGSs7qx/ok2/CvTxXBSM3wGNxvtSKwxbYcIUIMMrhxhW99K60jvgfynp8LLFP409mm
         5V89sjCr79CEQPWDnweYQupJx0z5IRW0VPSef20U81T8joKK6soWgbetUK1MdqeqkyUR
         PWsdMXOrZ6ua6HLGp8XQveK2qTMyHV4t1T5mGrpOO5jzDtpdi11TORBGJKoph53WPhoU
         wRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305767; x=1787910567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=qDJtuyUv6hduEJSqgYTALNil+Ddme2YXSIS+gq9KoAad6IelvGPRXKVxPWyxo+uhrc
         qfO1X9rbTIFUMyjbvRCnWh4IGbGVndTrclSQA9esrJYoRTkUIXM18VWXTuClVRMxLUBT
         a9DgOhKnPjW9GmAbJmEwQWT4ynwUQoTtzQA6hqjybno8V/pO2tQvClazMav7qPka2H2D
         G4untf3L6R28yERkWJpC9HE62ocrHp1axOyfds7u+nNe0lureUjXeeHUAFtrWOSsh809
         OZQFSUmkLJMNGkQKvayU6Do8Lc/Hr5p09ROr3YxEVitUkSAANKZiOAF8YxGsP/j+cUVf
         6y8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1VXK0hbzriAXPViHnLaNTRzJSVfDw9cPTPy2JraWMtioO/tfsaq1fuF/cLQhSgI6Yu9LZft5Q2u8=@vger.kernel.org
X-Gm-Message-State: AFuF++lRGZLuyyuFZGJa2xFIrnNKLdNx21zS2ts9TLe685KRGRo4RESu
	lMozc/0Kj781AEna/C07cv2p54A80MOei8F18aBO2U2o6j6qXVKbG/BsxjVeGdN1H2Q=
X-Gm-Gg: AR+sD11GpCOItSG5a6sePI9P4UbjyYTulyTedAi2BjkOs/X9z5OdcEO+hipaBFyfCV5
	1iv6Bs3iHsEvq94BifhjTOb884Xk+jaVbUiN8o/oA0XQel3loqizKsngeY5DuvLZmMkbU9R/gk7
	0oiXkPVhUYvBS3npqr20IOqKmM9YfsrpEDlYwB5G4HzmUFzS/QB2QyKQgNiFR662HdoGiTn4iXD
	rQ9foOwT/KwYxEXTB+OrH5CBYHPBQCz5in0Bdc5U5nCBN/eNK26K7tDD56cdNd0jHgogzT+LMXj
	1SbW/3xPh+g6Ib5F/ZDhVCUPYbZJJSOkkUy72wTK+aHBdId3aF6PZ+9dAbl/+pyalVld4WkWxdk
	9WOJ+rYzzU7OAGSx9eAjjhTiL6XNM3T7M93f5gN0mxKgr6qT2iAnK+b+mYCj8N1gsVW7RsQVSzY
	D3OPe6geuK78Z0HFcyEiaQPiRMDFo2iXch93TgUhsANjxACNFHyPdxTsvNy58ewuQBL/Esxxm6v
	l8=
X-Received: by 2002:a05:6000:985:b0:47f:e746:dcab with SMTP id ffacd0b85a97d-482c1184819mr5551648f8f.10.1787305767292;
        Fri, 21 Aug 2026 02:49:27 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:00 +0100
Subject: [PATCH v2 02/14] perf cs-etm: Warn for invalid timestamp option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-2-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Instead of silently returning an error, print a useful warning.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0

