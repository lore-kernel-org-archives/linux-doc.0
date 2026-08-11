Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B733B42D9
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462252; cv=none; b=g/vtIDk5LFLgdEUVAjQh4V1sMeduIizlSE3fAE3j/GcMzw+seMGODpeiBIi3Rs0AqNy4Npjgw346yJ7cmM47PsomrveF2JjAyVIzwGLMvN4UwIC1hnmMteSorgYBabWhnGXWfavLgMz/yqOmvvmdW4X7olwjW4FDCwTc9M2yXBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462252; c=relaxed/simple;
	bh=h2Q0M74fb6yudEF8zDu1K70Lt8wJfWd+FJHyFrYnfK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mc/2iAIQEVSE0++50FcI3mJFYqAqLhOl+ZP4sEYgFZ3jdc/hofr9FkR+c02djjBanAro2MpGi6EjoiwnPgPrVRMQHup/Idbu+qXkjWMibzesS0uXgMFkXxcrKF5VEu8HBenkKqh8ydlP/eHVLn6Pgmn0Jqa2Fb4uIAjuhXHtW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QJXDIZ6t; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QJXDIZ6t"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f6609c657so1666144f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462249; x=1787067049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=QJXDIZ6t38strAA327eSP6Z3PLF7JSiXgA4QSw772UKuiXGsqa5gOM+a+ecxUWo33U
         8KlP/0QGdogiLtwxCkvY2kW6d/ujTEkCuxBn/zIAmvIXzrg1J6Px79rMAyHCfRyYNjvx
         gleuqwC2H55UN/JmdxPq90LBebBYDhyqGymS4doBkMdjNjyTBiBQ5SJqKfaJL6FiGGLV
         PC4KUS5zzqhHGrKh5y9DPRY74lq6o8Go68feppvTdVenCYrXj1bW6nt+japP/PUUIBQH
         Gb2Sm8T48bo2usH9nlQQ4TE7gMWNr6g/HAUCOsSUY4Qiu0vKH+GLV++468p6s4A5+VFm
         sZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462249; x=1787067049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjkcq8l0GSb9YOwXmla3++8CiBcoyxIkWo/FH5SvfOY=;
        b=KfRXshW6sRrRFfCDTsXItaqx3wuPDbYMsMDdrv7Hy6XIHEbC6wHdc6fx+FHK7tfUdQ
         EqztqTHk5LGQ6rmvfDOSISfzofsIV3vFG0TrKKnLnV0kLSSom9WWgJi+pn0c9Ap3Tuf8
         nMhvrP6PibTo/gVVeNmbBESP/64FUVe2TuTkKay89lDbsxtgm4b5jMRWI1JjiRKrY51p
         uQYWPsceY0WDeziFrMytXV2JUKcUBavlUoD0cDOjq0jpXHFNU1Ek8gwXZtXHyF6Nz7Wr
         moVy6hJkjb0tcOp4goRBgekkmLltVwu0+AXLCxyP5SRrhBPkmszU/k7c5tKG35Oa8VPQ
         RYPA==
X-Forwarded-Encrypted: i=1; AHgh+Rrx7iH5WIuTbMc4L+1oqVkVhhgFZeYHfIGSch/t+CMgbWUxXb8CTL4H68VSCkRQXLGupMbFy5esJS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNJaK++GlQlXZsLMutT/2ZFB7gkt9DuqqSeeUrMa11Syvvx6/
	750zVLz2Rv8ILACspndlxJyvh3uDX/n3I0kpvjHHBewqgb1nr9WrUewQcn3zWmMxOzY=
X-Gm-Gg: AR+sD12OmXT07d8t1R8pG82QQ01gGsMdZLDFE0N24cDyKiSZ8ZvuFOFnXxDPxC/w81J
	IsWfyVblcOH9RHmNbHiTY7UAPtHKl/tUaCAt5w90zVH/V9Ogf0OHN2At+m4fEmo2EiWELS+AV0F
	k1CS2Y6aePuexwJTxX6c3SFR6/s2tLWQGld8apJSIkDzBOR0RYCeC/mAHD+eXlCS+BXn031kSKY
	6vpfwhS+8PDZEqFOpbTzPLBlPIdccRkuIO3k1rJEy8e26qQpFmJGZAktkOujZIKpElnpL1UKNMu
	rrYMq9b9+QJwz/dIFob3y7eTOUi6dAa05oMOYy/4/NUmhvK4Eygyx7uQtoLg0asRJxgOdP0dNP7
	vn8obOIpKrJqJvn+JNF0KmMJGT8/x7JTy/1oMXXSAlrq9iFgSnGo9GwA8gUGDuBd0KzUNDj4yH6
	3vfH791jYiBHcmfEb5bmaFrSdOEbKQNBxpees1IgctQ8P6kFJK1Kp6KqjG/gUJ4T7T
X-Received: by 2002:a05:600c:4513:b0:495:3e08:ad19 with SMTP id 5b1f17b1804b1-49978468c2bmr59898875e9.9.1786462248915;
        Tue, 11 Aug 2026 08:30:48 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:48 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:05 +0100
Subject: [PATCH 02/14] perf cs-etm: Warn for invalid timestamp option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-2-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
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
 Suyash Mahar <smahar@meta.com>
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

