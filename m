Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD0E3B27C6
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462250; cv=none; b=jMH+cS5VUzjKrm87qgRQ5i6W/h4O93NMyEGnNGAhHfh86KbqBv570KaQaoce80jU3eBixZgqh7gG8LEZ+pWoQrLmjgClxxtCIKB06wlXw+JipS9zKb9V1ksTahD1BDi0x6iUnOEaoRwFggakoDociMSR/mt47MHt47emjar3sks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462250; c=relaxed/simple;
	bh=Zl8zJhePqsl4XxqWo/nMyVaX7NU6Mei8MsQZ1ECwbYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8txJ8E0LWdFSJPpagvNXKsXmAL/tVKRhqPCdcFtCHe2NpRyL0071+s0oU110La2q2H7MEeHiQglRsNxUnKDzT/UPiN7iQjzM4r+ydZYVgeXX+cmymNBp7oLrMhcg4yZUg27Ft1foWJXBd9Q6N+ipFQhJIpebjZs2z4TQfcFgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcW+/+9K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcW+/+9K"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso9187795e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462247; x=1787067047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=hcW+/+9KVRKNcMfhpHWOKmiE7TxsCcKmaHfgP8fNTm9L1yx/YNDN1mMl6ndniRRT5B
         nQi0wSv4aFceeL35/R7luYQk787102MhOoqEdb7x4XVMMc84Bu+V06TY55DEfuGpVt5J
         lrSo/9URk6Onit6t3WIsap5MqibAXYy/cJq8XnaWrOHkJO2Vd58NgLgecqE5PTQrd7Nz
         ko4uUVbDvie0f4dRn9KQLgqmog6i9SI11JailHVSE9y2V1xJY8iv3d0O33V86qNNAIaV
         ztAIH78LJvxeyM54vrJwuBP4Xwh1xE8vQ9QQ1yEy2ljF+SbTvS39b0RSYfWRM+mUClA5
         AEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462247; x=1787067047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8eAS2yWgoyXdx0wzQOuU1GOQ+foCx6winuzdwJ7kHsY=;
        b=b3O35YwQss5bgEdD6UlvSQeJc/JMXeuATYTGaCx1GP+Pv4ausVq3UEICWjchHrM9Oo
         w3ov70gx3F1I1OVOYUbNq012uEnycNRWeuAHpleSHuzSIxb6EgF7+yXYwap9V1qRMoi6
         KRULf6biykmEjutyhWr1J2EYKsj/XT8kL55EN7t821BJWBKfvol6n2rcK3fpCmClRwQf
         OZoN4a8Qt+h+QemjwQSsM8dsVkDueis2LeMcySPsEOgs+XRng9kx7eNeiDY0IK/blA2T
         ThzUbLkujq4CL9EgEHogpFrYt2zy9cfeLUw49l728Mq9dj+BG0VkrdeIaKRfkTiPvGvQ
         TxRA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4zu9zkaC0PtpSq1P8HI+qPxtSQ4tTtEg5Hz9gq72z/wC3mCCswzvSMwZM/ve6hF99TxphHNZdiPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1eEQHamDZ9IxsrcWVBQgOnhvTsNL/eBmYeLj8P92tr3vFNVQ
	mRF4HmRvSwqqYCBn+r3wVgbzgEfD6IpKyEwK2Px9Ln91NpupUbf/XXuESggDNx3Nj7M=
X-Gm-Gg: AR+sD11HTREYl1iSqRXVg/UjPsXkhNg1bKeGcBdQGFYU37OqF8WqOhtlY80hql7DCoU
	xl5zOvNegT/mHJcMAbBnI1WoJmqpwOFV+Qiq26o6f6E2VvWrusfck6rZ617aTHpdpr9A1x4OzC/
	SSlPBUiRP1GmN9fltjssaM6yPbqrg6YNCVOTP0F3vSPLFYoQQfn79thpZWxS0NWVT3VUMJDO2Wh
	qXU/TxKe2LR10Xs5ZKUWcMBpNa2CIhcFjSZ+sNjIxAORYZRynksFcYONUXIH0vEQhkLmltSqaKp
	8esXqY51RJObnHvVBIFYW+QHD7sz/m/YQEh8O502OzuW7EmD25NHycc5FdCobXaswbB9JPOkf7r
	4+iUrf7vHUULEIsmwX4kYBfgI3cZOL9u5RarKz4FSCGfjZSF96UQW/CGPVB22SZVEa21sWUT4Hp
	lDBfbMTTHENF2QtJWjhnQ+H9aZteQonHV3ZG5Y54KRftYlE9t5Fbgfb/XIi+6854Ps
X-Received: by 2002:a05:600c:8b63:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4997a71648fmr13439405e9.8.1786462247498;
        Tue, 11 Aug 2026 08:30:47 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:04 +0100
Subject: [PATCH 01/14] perf cs-etm: Fix nVHE per-thread decoding
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-1-90565318f5f8@linaro.org>
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

