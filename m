Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811551;
	b=e33G1X4bxJPwtUuxxeNGcg9OuUIQ7BySq0+DURtfst3IHV3a68840aGRl0jrSXOh5Fu2
	 Sd0pztEvFanW/SMCcyeWaD5xVfP4ZxI5TcpJcHLf42NyJmtm+npKipn8O+dH5oY5ql2o+
	 wnaApBHjJyELHK3urBTkiyn/CsGXxr9qOZIlc3eRth6TvbREXGPs0E6EdmAeNrxunwfMS
	 LxT2R33oXY95ujgZkYt/5i80y5YzX+6epBXRnQzjyqIILBeTkNUC2nEkDuJ/YDrSC2+BN
	 Cl8MEMJTZ9CEf3c0N5ocsJ8r1mAhppC53B1Fxqw2OnsEV6QAT4AA95t5MEdJOl9YzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
	b=05gRe+glkTj3dC0Z1XozZtgQhW2QLYPy2qibmBDsb8hsl0A7fYn61Kp1zpn52xdu4wFT
	 AUwYxZnvUKiXO3yvW5bq/1dB6dgyMtBD89fJXv5/iGbaMb/A/LMMAi2tyEmC5U0wCTXgH
	 ZQCyv5i4GHB+mNhde3Vu2puEFYsU2LXC3xV10MaMho2EfXgPrxBtvLA3/HNA2XqcaS+I2
	 VJZqv3rgvpZBRebCRXQqEoNOTjT10oL0mMJrQup+51aot9yH+NHAA6UKL1OEk3hBKix2/
	 SRw5B2dMxMXvccY19D3+RV/arHsMpErMBagHEflmOtaWeOFgGS0KNYCENRoXQPBFAMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4D606A331
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA4D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y31TZXeY
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so1768315eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811550; x=1794416350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=Y31TZXeYrMNub6CD2yl7wXzZNwbZWHH3eZPG51i7cMvXQr32hmTchJqFckujdmLaR8
         jO2Ybm5+xBQyyCmBfBHUjRxLSITYvm9VfhBZYZctszoMyWT4bemxe4sss/bovxPT2dJs
         k+J4IpNPEe0CddeXVyA/Y7b552MrHB98y/tpmtR8JuVo0QGTEi8v62P+yHXrxe8Qf5FA
         77OjQ6RMgvgZGAeX6Z8tBsU8YO6c7QSqAvOBWbc/pFX2uzgT01/mTcE/PcARiYWsSBj7
         CUZYZ7MlzON05EWeaepGCCOYVGQQlBPbEz6X6AJW+QtO6e0nH21GIU5VM6lSbedpHUeR
         fmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811550; x=1794416350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/LC+6R33q10vqghO7crsZlwQEV9fByooirEbdHEQuEw=;
        b=1PIQRmuB58J8X2qY3zaN98Cc41QYtG3CxoqiMvkz3G9PSLqZ79/iOr6ci5rllqlPXp
         OffI+9MMzjA8VbgjboNPH4/OhBxZuEpF+M+7jWDayvrY0v7M3g01jXsiPqoDyaMIwDpu
         Op7aswl8iXUmWonxqMGVkUWliGgLG/Db0jA/jcns5JnLfy3aVtaW26XRZh3VZuf5tUDh
         RbBW+7d/5ISvIMF5fWETLZJ1+nTnt8E+YXnwBPCD68V6nW46dO2oj3D+Oz8GzBh5eUyu
         6ROhIoiHMix2gZlxzh+ITdH1/ib+BfFYqRV9OB2eAHF5XdW2jQws+aTMWNQd7vx1R3dy
         P6vQ==
X-Forwarded-Encrypted: i=1; AKwUvByxjiOhL62TZl2Xqv0fxOY+oq0Ylr+aEVq/nvnJjabWVV2/QVZ0WiEF8/1Tw+iI2kiu1dSGufbhJyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZkktT55pz9cRNe8W1ONgy78lovKiK1+sl7tGegIsQgroDqlE6
	QudrDu1h9AXOE3cfiudwHpjDF3zH5GIkXwTH6zMLMpDpRT8tt8uGwL5L
X-Gm-Gg: AYBFou24w7QxUleMsEsduBqLOLxxwUVzrX8o50Mtblba8xVj5gp7gUI8wCF3VdLj9E3
	CqU4qVocf7b7zlWTITsLc6U3Lkm8SnN7jYiAVMluZkk59lxs9PXfXXk9KmkRbAfOt0C7hBHdTTl
	GvHM3EaSZXge1+DVo4UT1CvNMTkNtyzpp4eoe++57cwnVlPkLenUMAlEp74U7cg3qFQZLe5EfA6
	EUV6H6zdNYMbIwmcuYVNjAFAjm9TkmiatpLpqFZYVNWzB2R6k6qBjCO/KsMZoWmXVPuCVLKyR3q
	/ux3+QtyNdMV1V9ZAMnTX73TvAg/SuLz6Nh8GwqzioZ0SRMn33LN0QV2WKhSbo8WA8s/u5l+aJW
	Pu/qGl35MNvzAhDUeV/UUb6eiBvWJF1xaA423cKh2m7ZeHc+C2i3152ZWua1Mrrm4Td4zMFAwYQ
	RHQtj1OSFft7G/9pNpmbMjdKtvtqDSCU66XBC05Xa1EFtBq6MPEXympEjKpO4NtaDW3FIgExUdu
	7vz1ES6j0oXB8dG2mqvLpZpsJJ9hcdYK/QMlG5wJUCKIm5cDmO+8YwKt+jItm/jEw4QbiDvFFMK
	YCPGWugNCqtQCZNiwIfr1XsNCwW7K/g3h5VE5lc=
X-Received: by 2002:a05:693c:8945:20b0:36a:2999:ea9b with SMTP id 5a478bee46e88-36a423c346fmr24991222eec.23.1793811549996;
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:09 -0800 (PST)
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
Subject: [PATCH 25/28] hazptr: Select TRACING for HAZPTR_TORTURE_TEST to enable tracepoint
Date: Thu,  5 Nov 2026 00:54:43 +0800
Message-ID: <20261104165504.2430480-26-kunwu.chan@gmail.com>
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

The hazptr torture test registers the hazptr_waiter_enqueue
tracepoint for its hot-address scenario; select TRACING so
that the register_trace_*() API is available.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/Kconfig.debug | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index b500e96ea1c1..8fc6434a05d1 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -27,6 +27,7 @@ config RCU_SCALE_TEST
 	tristate "performance tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance
@@ -42,6 +43,7 @@ config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
@@ -102,6 +104,7 @@ config RCU_REF_SCALE_TEST
 	tristate "Scalability tests for read-side synchronization (RCU and others)"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides a kernel module that runs performance tests
@@ -117,6 +120,7 @@ config HAZPTR_TORTURE_TEST
 	tristate "Torture tests for hazard pointers"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
+	select TRACING
 	default n
 	help
 	  This option provides in-kernel hazard-pointer stress tests.
-- 
2.43.0

