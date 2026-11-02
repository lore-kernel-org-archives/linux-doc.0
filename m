Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621761;
	b=KzcTTNMsCMBU7v9D/HswRH8WnvDJ4DTTCKzfDwWzDaYwnGR0uwh85q6go+Q1jafgfJnj
	 8qEM1jB8xuPwsOPE3lmZuUdg4WJMvlqwgIyar+7u7D/MOnFpS/NMfo5Zc+mW+/6QsvbZa
	 xpHgngKaqiqFMUUz/kDSCw+4geSkudd5KRUK3pfolTwunbQ3AAWsHaujOYNHkhpzRHTHH
	 D1PBarFenFAFyn8HFWJUfoNjMNG8aiaSAMDXP1OHDVvOwyv1LMJXwaqKvi+CGv3brDQvD
	 Jonwvw1h5WbQUXGhIUZyIfecVlomFXd6itNTds0iz4yBTAtgNUhcFIUxnqjTkaX+TcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
	b=jkSW2eEv2j1nh2tbdAFe37eO7mDh5T8ToZhiE/CK0yYFwUkI1jM6y6DqSZVGVKYAK0vg
	 M3ir2SyuTwvI1pLe4gwVZ9qb/1F/LsaHtyRbKEi2oON/DEtBGCCVL9tP9EYAv3FFIRLmH
	 ZI87I4iG95yCovOCyMrAGW7hsoYHvFyUVKx6wceABA5uo0WyAkV7CUrzyAYlZF3hisld0
	 4oVLu7umKmNU+lEVW7qW5hoL2g+OT5KSFQmki2OG3Hc+0vZCvjF0XlbsFZZOvivT6WC/6
	 Op/xEj4loNaaTNKwffome/QCfPJp6DqzzR5CRNyF6S2yox3uQJzC6exKmt6q1TKVHew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v+k6p67j;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7660A6F73
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E7660A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v+k6p67j
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so31220995e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621759; x=1794226559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=v+k6p67jlSCCtAFLTJHEr/fOP9jUFtDJoZqJvF4UwB4P7qpSBHVS3eUZvY9DppleiP
         ncB/xEDSRl37A0F6ns4DDzlZP6inyg5KWPo8e6ykcJk30dPKR5DnnEUgn0WrLZc/xAnd
         N0QvD6LwpBeF+HSJiazvoTsSciBmIy/nKEFxLq+4ijHyKjQoW3xxnAyo8OtnpRiwzQa1
         oRTg0fI69BbAXuYXlQdTgcLOBvUbjpBfw7v2UmLtEse94ConR3apsuQwBAcl+6TeEJYZ
         jH0MHdU4hFz/923Fuha1P6EBUsNwFW8Y6YklDiL3BPlWBon+mOjM5oOm6WDpzRPsucsD
         mESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621759; x=1794226559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S4s5XiFFed+m0dwtvV2BD0K5lP+U3CdMGGYPhjLKYQ8=;
        b=2tQb/6Nbk80ev88Ul+/BFvga+eORMsayNOaQ4Q6CWac9ZfD5E4gm89L2i5op8lgicp
         o5UtQBfYe8e7nf3nb8VQ1gs3/Mp5TojSFukQ88GXvuA8we2OH5YnLcH0DHJRXgS0ClQV
         4ByfpLd6nl/KQmwuV1zJ0ExA5bFjKrF2tnXza8ETaCg1UdZrQImI4e/NL4/C51vSZA8L
         Vsr6TdrgD3Z+2uxGebgf9tflCpQV8D3K5AhKi+4FACOrTm+kYkFmyCUmUZX2cNZHeFDv
         7EjsExWnOEqK3JA1vKP1lL6NIl20H5HBrVDnuI6gwSTWxyLNAhs9N5tXH/QcDv1H3J91
         uz2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwt1ixXaHXC/aA3FzhTIrzLj3fvIOWuLIgkLHWajTjYhLKvKPSDkzMQ2LRC0TcEge/Yy8t1dxmUdMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeI+RZ2puZ6YKG/bPsrdmsl5TcHbrKJfocPCnc2BEaih6UdXhm
	7aOGDocmBzN67kG1xQDsE6PwKs8qI178xsUFkjb+80ofzfShuEt+UjxZC6rho+UvJ+4=
X-Gm-Gg: AYBFou2zofNSWGcObNXJXHGd+JZMHgpnjsUcJmASm5TPC6rxaHP9ZXnnDQyHxHFU9G3
	q7C/md7GUw5K93fMTO7P2DjaHQoWU4sdUUEAzmSJE4HH9zr5qGfDYUMZ+Vxshdku4xBNCeFwM+e
	pA4l0vculdCvGADKGiyCCb5RdN4WXwa6ciZlMqMNNCuC+ZRFn5Lj4e8zbiCZHK2S1SiM/fF9dv0
	scpcPIiKhxQ1p6Tllr1YYi7bmhoFML8euXu4E2fCAPN0Gd1779A4+RZcGry87zYJkNn6u9n/k/5
	gXQ371My7/j2K12c4Mu8IEELTa2U4DCA57ELW8BnTIOFF9Xpd554GmsePnpFeTqrCnp+5o1bE5d
	nZ/+ESn/s6iFaLH5irr3+Z+FzzbFRuWXboQrHBz2dU7ygIyjsk21j2e0ecP4teGIIx9cUfi/+TI
	iawhJry1D4J+15Yx9Lxsx/z3vj9ToHxRGxR4hTlkB/i/oEVZatC84vFCJIEcP39AS1AiK/KOumw
	Zq95wcE5mTD7riWdGysFWlen82fU4tguCCIA/Ao8W5k6aI3GjagIIR/xTmg1dYs5DnsbUGPSVt4
	yiumrTaY4j7MXVmPWKAcMCpjr3BHG09K
X-Received: by 2002:a05:600c:83c5:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4ac19329ea4mr197102405e9.33.1793621759044;
        Mon, 02 Nov 2026 04:15:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:26 +0000
Subject: [PATCH v3 12/18] perf auxtrace: intel-pt: Use common snapshot
 pointer fixup
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-12-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Intel PT has its own wrap search but the same pointer fixup logic as the
generic auxtrace_record__default_find_snapshot(). Replace the duplicate
code with auxtrace_record__snapshot_fixup().

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/x86/util/intel-pt.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/util/intel-pt.c
index a533114c0048..ce854209213d 100644
--- a/tools/perf/arch/x86/util/intel-pt.c
+++ b/tools/perf/arch/x86/util/intel-pt.c
@@ -1150,26 +1150,7 @@ static int intel_pt_find_snapshot(struct auxtrace_record *itr, int idx,
 		}
 	}
 
-	/*
-	 * In full trace mode 'head' continually increases.  However in snapshot
-	 * mode 'head' is an offset within the buffer.  Here 'old' and 'head'
-	 * are adjusted to match the full trace case which expects that 'old' is
-	 * always less than 'head'.
-	 */
-	if (wrapped) {
-		*old = *head;
-		*head += mm->len;
-	} else {
-		if (mm->mask)
-			*old &= mm->mask;
-		else
-			*old %= mm->len;
-		if (*old > *head)
-			*head += mm->len;
-	}
-
-	pr_debug3("%s: wrap-around %sdetected, adjusted old head %zu adjusted new head %zu\n",
-		  __func__, wrapped ? "" : "not ", (size_t)*old, (size_t)*head);
+	auxtrace_record__snapshot_fixup(mm, wrapped, head, old);
 
 	return 0;
 

-- 
2.43.0

