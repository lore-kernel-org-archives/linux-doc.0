Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF1E3B71BD
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305778; cv=none; b=nXUigediE2qMk+xYsZif510gIUg5g+xXMca+3doCuyc/+Ss7bYJZUgZff16mUAodr040vsS4NZN+fSUPCM41bjP8kPYPHdoDAy23DWSBqDVZOAnEviN4YRvnh1EvMo9/mk29wS/7QCLImumGGdz4hE2jvC2dm9GnqJxBN2ryKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305778; c=relaxed/simple;
	bh=Zl8zJhePqsl4XxqWo/nMyVaX7NU6Mei8MsQZ1ECwbYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRC7YL8ppOeldcVdrjanONUWKJrS2TpvSQNJUG+u37ns8QSCiYztsu7m0qi0H/fA0gnmCTajP1gAcN3cVLikeoDmBw364LU9JHfRHuXaDX2TcNAz2jZdCwo2BidYhxmfJVq5Iejv25kTXiEqYdMk+eMnbld6YktfongUmPc5kWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tty1qgR3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tty1qgR3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f84023916so659172f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305766; x=1787910566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=Tty1qgR35pkmgsE8YoRqwfUBbbp3yjlXpd8IcF5RJWQ+zGOlG/dsOCBTPCCqG2ClPr
         RxQ1SzYDALOs0KadEnvJM320jcnlkK2wbHI/dEm6SsFQTmn5hjmhPOxNjrFoTiY+DnsY
         HHC/ZZdt3NnNTxXL69mseUzfOV4/ndWNAdjJ1i5Q5n9G07ASbCzx0bLADwU5viMf1XFL
         nRMefWvjDjiQlMWTzkVeJKmE5gtoUSGMzr7MJcc7xqfkR3Jwdvhx7EPOEMP4bU2vLxWu
         Fc9U4AUt4FbNoohRnQ9Zy2UFjbh1wyZ/unO2LjVQvEhh+2314ZIys2sJkxJMDITQvYU1
         x8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305766; x=1787910566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=QZ1dv/0horGFUfPEutI49TD6OF1pbn6zW5ppN5nt30Dq6TXYAM0CVE0Geqhx+jjWM7
         GfdMed/MFvCCQlt0UJWqDH1Oyy7aR8HFyts6lTK/AT0wyMQMsllmiWP7PxgbiDS+JALR
         8EfCTSATaHZ/oBPGcdNuR86rutHNex0lWNiPB+JYrFuLQI98aN2UEsi3Vnvr6q569Js4
         iqRJ5Zt+VGajdh62y4+FM88s+EqmOmzi5MrpZDYDKqkAa66sw21LzwRtRzBGvg/0gXUe
         XQ52hUXAziYomNE82uOeH2nbKExHhJouIa5OCMHcIxSgvNtAObfs1SEEIK7IyefkY0Se
         qxtw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6EH12O3W+BrmybcE56MbA/vp6giaTsgC/KZHhTYTHR/6egLXgiBnCL+087b1wVkB9CqE4WlIXp3k=@vger.kernel.org
X-Gm-Message-State: AFuF++k0YkTdhBW0tOFuQ0Li6PPys9p1icG26BSbT23uNGm5BFn/bioC
	yivOEne/X2gf68GCR8WlROOode0icp3jCP3pe5xkTWEVASMsRmNs/VQHVZbygKGnPOM=
X-Gm-Gg: AR+sD128bjNDe1vy1dyGmDWHQvFrEYpZvo/GKPkDFLbZTYMJ2nOS7ekzfwg2qxK9zkg
	UAbK0KqF05JE8pbwTWOIA3ieKMJALiQKPCBq0vbRRLYVf7OOsAuouGY10JwMZKaamtJC+JBSwTk
	gj11rOdtBkXCVi2m70YqgZS1bl355BQObesvKTrD0RiLRoVlpe3YA22hS9byrZ1hy+MA9CJS/0Y
	DxJ+OMctNRpEtUiVlzIijwO+M12O6Vj81P6Nnkf3jU0+y+Z2UoGpgLUO3bZkEmgCk4KlpCRpGV7
	sGwEBftqGc9rd4SkJcW0v+ICg71s7fYqcxUbBetdf5N6fVutTqEKQ503dUJHNJVhxL36FeCE/89
	C+LC34D3q6Wqdaiyy6oGPcQu0eq6t2NOwDPhrKvZsvsKQkC05nubClT/CMhuko/GL9yBHeSPF0/
	jKZVGeys2fSF70bLHEn5gVzAlzs9hNeKbWz5sxyqWFOXMhtxWQdSwOQsLNG/WPeqMJBHXHEVnDQ
	d14
X-Received: by 2002:a05:6000:26c6:b0:482:a36c:a5e1 with SMTP id ffacd0b85a97d-482c0b44b1fmr7088817f8f.1.1787305766006;
        Fri, 21 Aug 2026 02:49:26 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:25 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:48:59 +0100
Subject: [PATCH v2 01/14] perf cs-etm: Fix nVHE per-thread decoding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-1-00c4fd0701b4@linaro.org>
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

pid_fmt is unset in per-thread mode because we don't need PIDs, so we
can't use it as a hint to determine which EL the host is running at.
That results in falling though to the next part where EL1 is treated as
guest, which is wrong for nVHE.

Fix it by only returning a guest machine when run from perf kvm where a
guest image would be provided, which matches existing behavior in other
parts of Perf.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 114b3cd2da49..d423f1cb408f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1071,6 +1071,18 @@ static struct machine *cs_etm__get_machine(struct cs_etm_queue *etmq,
 	if (pid_fmt == CS_ETM_PIDFMT_CTXTID)
 		return &etmq->etm->session->machines.host;
 
+	/*
+	 * If guest processing hasn't been enabled, also assume everything is
+	 * the host.
+	 *
+	 * This matches Perf's guest handling in machines__find_for_cpumode()
+	 * etc where guest machines are only created and used when perf_guest is
+	 * set. This also guards against accidentally using guest machines when
+	 * pid_fmt can't be used as a hint (per-thread mode).
+	 */
+	if (!perf_guest)
+		return &etmq->etm->session->machines.host;
+
 	/*
 	 * Not perfect, but otherwise assume anything in EL1 is the default
 	 * guest, and everything else is the host. Distinguishing between guest

-- 
2.43.0

