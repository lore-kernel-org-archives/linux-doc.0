Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811561;
	b=ewqooe8lS70vWvCMsz0GQHmKbl47a9aKR0dDMcaB3fMmB3r+TjuuEANGfCknvYjwinBU
	 KJN12oKQhTP3ZCqMsU9TAt7Gr1g2wl5M3StYkwjAURhw5rk/HN+uARsAmy/MEUsHg/b6P
	 0IDc5KVn/318+ajYgZQxGVpVm8M5OtzwaxLlQ/gE1RO9U+EsHOAttlKU7xooA7fd8wBPY
	 p2LZ3hmDzGJpeBv690aeOPa8ZIFL1g7DKGDVlw9+Je7U0uAn8r0bpyxZMvJ8euMHy3+RI
	 v1TkOFSxCdMVcaPekYAI1T8BQZU7A/CF1Z8HrkDRWx8fiIroHigIQeXPjBK9Qu6ONCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
	b=nDHTTZKtKcwJDaR/aO4bYamcwJ4p3E2oX0vUbjTyzWd2HUDaEh5oFPUCCvFtI6NSnXZY
	 +PAtU/l06cTH5CBPgcjg80+I4uLRUEOiKNlf+FY/HU0KYDTP+Y9zaMSkPUfZO/bsi+StS
	 KQVbJrW+D7ayaK/rqnL3TwrF9ogns6P6VWY9g4UX9Pfp2pmN5QLWRxTof+8xmbTv8TGnp
	 YauM06zFkgG21GR/lAHRaIG1Qq2/lE4vYJs1tD/XLUBw/3Aj2PUf7+fCNbiGaLeufe6Wg
	 yiPW/PUEgl1EZwrQYNBDIC0sUhq9ZdSYUaumPpcL73zejbYEdnjgHBiNt9Qv3c/0DCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB8606EE87
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98CB8606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=srwPcV0C
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so1750780eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811560; x=1794416360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=srwPcV0CMrFf09RumsTb6kBXvwJSmyv7F6Ok6cQb4RLoNTiP6mDJJ41AONoG3IBegg
         379AGoSfjaRazt2ZxU+Y67WdxSbYjW8t6oX0gLgWERE6FMNjvMjXxcOd6Ktdnc/OnQhg
         7CkFVW/HO4lzzZI6IXqVLY7dzdszcT4WWgR0uw+rX31a1/YYlmIrQ8cwUbAIuGACbM6w
         vKAA4UG+0TPX7jAJmab/BP2MApuRxmhM4c5Sb5Z5knQDN6HhMTR9IWNkB1xVYiZxbAIe
         H2FBfin851fcltS4cy0iogqxcy8G6CzVVIxlrmHwDWg2Y/Rj6tiru7Gg2HoezRX+hjYr
         SwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811560; x=1794416360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ccVf83RTacEiSDDfp2h5xNH+o9FDf22bxraZEScVifs=;
        b=Z62pAp4pX8uRuOpnHlaJTuZjvq8L12ljMRwZrdXjP4bxYbbTS94In/ZEi+fTirc+bd
         A6Xtu/cM0U8Au2/MHgqvblUwOriG7qVnufD1rrvW5yysmqs3feP9rgYfF7TOTgUT78FW
         6Nuagq1uZgn0GXfImLrS/v7kZfW7bbsxfA2LibqhQA8aIS8OPn6DoQKGcGIz/RNfHNql
         s0jY5Uretw1/S1BKt7lq93h93VZT0PIAoxd3B6FA+JJ/5qqxDHOL+dp92pRGS5MQnjK7
         7e1yYZ/nQbhsSNM+JLnd4IBcdgLmZldyV0wjb4ErZvdDI3ah3O/sm5PqWzSr8j81rj2b
         eVfg==
X-Forwarded-Encrypted: i=1; AKwUvBwHRrXs4r3EPvICb8VU0ecVKzkeO+JgjSc05kjBaR7T45YsnzZTBO7YSpsYSCEkqyImmR6UytxFQts=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sUs0TB0YDtAKY+889bDePoHOJW3H5gNOgeF7ttQttJngQ5vGQ
	GY7E4brOdKeGSdxj9l/0Uv9wI/sWd4tjxsjY3uzr7bxZAzS9ZTfhYwlc
X-Gm-Gg: AYBFou0dipFyzJ+/nz2j2EoNlhhNTrcS7xm9TEMvKpWHnmPS0hBbjPjTJx0QD8WBJQN
	+Xzjg09X9jRA5hPgvYBpjIfr+roHdVtEdLLa99TqdJwTKH40ulq8KyK+vDo05KDQSSyl60TravM
	zf/Vagi76GO+inAsuSnlQhV/uJGrG8kZRiZvycXZh4j9Re3MOk3rgVJJkEY6zPUWY+PvT07UN9Q
	L+m1ZUeJbL7f1Nc+A2ingAggZLayoq6zMTiO4TD2xu9r6oxmPLyTfHRfGbT56aDloEZ5HOSU7sV
	NFULWfeyktUxXgIIqDKDnUuqdno5oETqBiW4bxx1fi7+CRs5Iz0+yxVgTzVLo7cIregGrkE1EPg
	NuoClrbn6rzfdTQsKU74gKvW1fwTaP8GH5GW4bl2BxblRRa+gwZLNOUYT7lSWDqKevczeY8nWKt
	RRztTyG5NQAiPSMELSNJmzQwfSjCLFOhJyvSvvWT4w8yInhARfIVvbM/5DR6H7BIMX9O6mO5Nq+
	6Z9SEAWE9oq0mBqfT5oD6574KpL6l6i3tpnShstPBE2RrFP7ZXa/Dly4IzhFxHJGIApZCHGYzub
	J6VqGuKKPkvx3GnoZvyYY4YoNehzumV+z0mBoZg=
X-Received: by 2002:a05:7301:640b:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-36a42363ef8mr22540460eec.7.1793811559006;
        Wed, 04 Nov 2026 08:59:19 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:18 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 26/28] hazptrtorture: Add torture_type=none clean skip for rcuscale coexistence
Date: Thu,  5 Nov 2026 00:54:44 +0800
Message-ID: <20261104165504.2430480-27-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When both HAZPTR_TORTURE_TEST and RCU_SCALE_TEST are built into
the same kernel, hazptrtorture calls torture_init_begin() first
and rcuscale fails with -EBUSY.  torture_type=none makes
hazptrtorture return early without registering, allowing the
rcuscale hazptr scale type to run in the same boot.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../selftests/rcutorture/configs/rcuscale/HAZPTR    | 13 +++++++++++++
 .../rcutorture/configs/rcuscale/HAZPTR.boot         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
 create mode 100644 tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot

diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
new file mode 100644
index 000000000000..c5e9cf0184ae
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR
@@ -0,0 +1,13 @@
+CONFIG_SMP=y
+CONFIG_NR_CPUS=128
+CONFIG_PREEMPT=y
+CONFIG_HZ_PERIODIC=n
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HOTPLUG_CPU=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_HAZPTR_TORTURE_TEST=y
+CONFIG_HAZPTR_DEBUG=y
+CONFIG_HAZPTR_STALL_DETECTOR=y
+CONFIG_HAZPTR_STALL_TIMEOUT=1000
+CONFIG_HAZPTR_DRAIN_ASSIST=y
+CONFIG_RCU_SCALE_TEST=y
diff --git a/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
new file mode 100644
index 000000000000..e9cca4cf453b
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/configs/rcuscale/HAZPTR.boot
@@ -0,0 +1 @@
+hazptrtorture.torture_type=none
-- 
2.43.0

