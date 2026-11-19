Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090133;
	b=aQQq3gP9kMuCgXsss2e2Lh3oEx+5vnEqcJANq0U6PBA9pWP9mq6a5U478R+R5d487/Ls
	 Ds0OPjaGJv72MEb8p3Jscjrbqp75iAmP3ajWY1/HskepXu3zQen+9ZsTcMsGfO3fbeD6+
	 Y3dHEAngPtBUhLC2uegtWfRIyF4V+kUiV1MALc8Ma7x+aAPpPmQyYolhumdZHP2fC2ZAr
	 nU0zJhUQMtzVVOg5ovd2L3Ok7LJl62VtKFG5WPiMin0VfGytPawbEOvSS0JDhTkhXuiP3
	 ZnF4KVeNM6fDtUJ0dDY5Fxv7ugRH35/6XnJ1lz5sYjH98r3RXlWIzlikBzqo8dTVT4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
	b=37HmyLEMwaeToXElF+QvVb/NaPPssNRSu1zM6r97R7ouNhUf8ZEFeMt0OpOpNSuEQKh5
	 VAUpgS9DafWjXZgXT83hJgyMQfA6AMMkD3bqURi/VAM0RbDqxktKDcXzNEM15M954+KvM
	 1xKIvnjXb9OmEgXiee9eK83X5OCJxuZ5moDXbKPTMyDkzAm9bgh24C6J9sql/PN71OM9J
	 CDmfis0h0dXqdiBmt2BsGk5U5qPFQA4P0n0aabjh6prx/ZNuuJBfU6+DvtGZSL+RhwyVp
	 aH2mSNsEotb2N1nSCg8neaS2zqKE29Qda4vx36QkUGI7Tb8MkEVcm0KtoTrf0n+8DVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="Yr54Sx/e";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C220606A320
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C220606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Yr54Sx/e
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-38190551625so3687922eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090133; x=1795694933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=Yr54Sx/eW54blrGKLnbky+TF7Bcgde81YIULCoHCikwMRgKHTDWEINeq4XhmBV8hFP
         Ks81No6IvpCgGDXMjv5MNpUvo037+yONXk0OviEFHQxxfs7AekLO4ZH5A4ucE2gm1JER
         gHLtQyPCKe3weWPQSLtOyTZ9YlA2dYd53Wy0EG3wRjT+p1MZ27g+WnqpUJO6xIe95oVf
         jGnH5tgthFY45AyAczhITnL+cAGs8GDiadYVW4GQVmc0E/zrDGF0fncYHRuUb4afdvdJ
         XUfe78giNuL7w7fx55++RGpYSAtfWA7uAvzxfXnZbe2tWeT5DEhFVEFN3hfeYzT0obYi
         llMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090133; x=1795694933;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw3u54M9upMKnOTAPQin/ZVJiGtWbtiuAdgAa3Btsi4=;
        b=hwBFMGd5dre707mwBj2U4tE0qjfAoZqTTVe+f0/Ee558GlbSDXgf3QgRzXl1W5e11R
         INsnZ6KTFt+Hn2nOQMp5PgBg3Z6QocCAV9yvZCCsDRqUUMq/lUxI8GeeERSsi13df/St
         nw/j9BeiWcptfu2ZG8pTWnxTiSjMahQZoSv8Zz78NfJ/twEpej3g9uXYcxyoizfnV+Jj
         X9Fali8Xna8+9VUSV1iep8Tk+dFWMgQbWFNew/Oj9SBZy0sFYgHmZb2P/QEcnmfELunY
         oenx3HXxtwJLHYYZhsI3U3Vf7PaiKgJieji68YDGsbRor4EWUUfIzOcR9GSgztS3U8st
         NM1A==
X-Forwarded-Encrypted: i=1; AL+hErG1U4ECMs7rMBKV8BV3JziYTbe+7AA/wLkRZ+b0evl00oc9PlZsbR5afjaTNwbkpN/yvFi4sZ6dq7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OxykqXVtvuOa0Cwvw0ntd9s0CMtsCmuSPecVCa5Xzj7tqxZxa
	LOZnDzGxIRsnyQKBMDH3aGtItQ6xnhNYbAau3em+8J8b7JzcrWsbfTPNmQek+7zLnME=
X-Gm-Gg: AZFdTZegvvha2ed6hJjRnT+FRabqDDTMEEWTuHM9NxWSkGZyA+0FSwpWQRS7IWyj5cS
	2C0Xl3vmxV7Z+80y8WIAUhwaedw0g/Iio60yL9cfPTzzi17hQjvne/BIZIWTDXm31g5PiNxbmTI
	I7qVpJiQSoYddYqCiHoVv6Ylm2OZ3vDcwvYzDEKjm8+e7dK09zAxlmQBND9KYA1YAeamOPhI4qF
	+NLZtxPzGe7MhGDYTJOU8cXyPi3dNY80Un5INK3Patsq0qLVtRndoFUsle6GIdzkcsWMrTtQ9j6
	J6BxAwqJJBsu/9hS/UjI3hNt0R89CHbGvxlNenTCyAm5Y1LeaUXhbgONNXFOaj938F+dvrS7/bm
	8kmShsEimI6qXutRAtKcRYksjSWygITdhB5fu81ItMVWbLXZENkahdDozdqnPK7kq8b4nwHM41Q
	FT8c+XXtLAsx7zqBzdxQagzKTHFLl8fIdCTT/Neoq88L69l8Yl7CWzITyxuJgKfa2pRSm+GU9yq
	Xe8lA/enLtC28o3PsIUbI3c2tJAW5TIQd/l47vHCRNB1VKBIMS8iII3hBut142vfkkJeRHQy7p0
	9D41DTbeuMXZJEC3J7N1/fcSihbeJYgModXQWzcIcgyUWRG4yrIoFgA1nN4ozIQK0ZkD4t2yqHv
	v5/vmX8Q=
X-Received: by 2002:a05:7300:b092:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-38280078014mr5600153eec.14.1795090132300;
        Thu, 19 Nov 2026 04:08:52 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.08.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:08:51 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	himanshu.chauhan@oss.qualcomm.com,
	conor@kernel.org,
	anup.patel@oss.qualcomm.com
Cc: clement.leger@linux.dev,
	cuiyunhui@bytedance.com,
	atish.patra@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	will@kernel.org,
	tglx@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	shuah@kernel.org,
	yuanzhu@bytedance.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangzhanpeng.jasper@bytedance.com
Subject: [PATCH v13 01/11] riscv: add SBI SSE extension definitions
Date: Thu, 19 Nov 2026 20:08:25 +0800
Message-ID: <20261119120824.13969-14-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
References: <20261119120824.13969-13-zhangzhanpeng.jasper@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Léger <cleger@rivosinc.com>

Add definitions for the SBI Supervisor Software Events extension [1].
This extension enables the SBI to inject events into supervisor software
much like ARM SDEI.

[1] https://lists.riscv.org/g/tech-prs/message/515

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Co-developed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Co-developed-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index fd6266a7b339..eb22d79cea61 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -40,6 +40,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_SSE = 0x535345,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -508,6 +509,68 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_sse_fid {
+	SBI_SSE_EVENT_ATTR_READ = 0,
+	SBI_SSE_EVENT_ATTR_WRITE,
+	SBI_SSE_EVENT_REGISTER,
+	SBI_SSE_EVENT_UNREGISTER,
+	SBI_SSE_EVENT_ENABLE,
+	SBI_SSE_EVENT_DISABLE,
+	SBI_SSE_EVENT_COMPLETE,
+	SBI_SSE_EVENT_INJECT,
+	SBI_SSE_HART_UNMASK,
+	SBI_SSE_HART_MASK,
+};
+
+enum sbi_sse_state {
+	SBI_SSE_STATE_UNUSED     = 0,
+	SBI_SSE_STATE_REGISTERED = 1,
+	SBI_SSE_STATE_ENABLED    = 2,
+	SBI_SSE_STATE_RUNNING    = 3,
+};
+
+/* SBI SSE Event Attributes. */
+enum sbi_sse_attr_id {
+	SBI_SSE_ATTR_STATUS		= 0x00000000,
+	SBI_SSE_ATTR_PRIO		= 0x00000001,
+	SBI_SSE_ATTR_CONFIG		= 0x00000002,
+	SBI_SSE_ATTR_PREFERRED_HART	= 0x00000003,
+	SBI_SSE_ATTR_ENTRY_PC		= 0x00000004,
+	SBI_SSE_ATTR_ENTRY_ARG		= 0x00000005,
+	SBI_SSE_ATTR_INTERRUPTED_SEPC	= 0x00000006,
+	SBI_SSE_ATTR_INTERRUPTED_FLAGS	= 0x00000007,
+	SBI_SSE_ATTR_INTERRUPTED_A6	= 0x00000008,
+	SBI_SSE_ATTR_INTERRUPTED_A7	= 0x00000009,
+
+	SBI_SSE_ATTR_MAX		= 0x0000000A
+};
+
+#define SBI_SSE_ATTR_STATUS_STATE_OFFSET	0
+#define SBI_SSE_ATTR_STATUS_STATE_MASK		0x3
+#define SBI_SSE_ATTR_STATUS_PENDING_OFFSET	2
+#define SBI_SSE_ATTR_STATUS_INJECT_OFFSET	3
+
+#define SBI_SSE_ATTR_CONFIG_ONESHOT	BIT(0)
+
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPP	BIT(0)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPIE	BIT(1)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPV	BIT(2)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_HSTATUS_SPVP	BIT(3)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SPELP	BIT(4)
+#define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT	BIT(5)
+
+#define SBI_SSE_EVENT_LOCAL_HIGH_PRIO_RAS	0x00000000
+#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP		0x00000001
+#define SBI_SSE_EVENT_GLOBAL_HIGH_PRIO_RAS	0x00008000
+#define SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW	0x00010000
+#define SBI_SSE_EVENT_LOCAL_LOW_PRIO_RAS	0x00100000
+#define SBI_SSE_EVENT_GLOBAL_LOW_PRIO_RAS	0x00108000
+#define SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED	0xffff0000
+#define SBI_SSE_EVENT_GLOBAL_SOFTWARE_INJECTED	0xffff8000
+
+#define SBI_SSE_EVENT_PLATFORM		BIT(14)
+#define SBI_SSE_EVENT_GLOBAL		BIT(15)
+
 /* SBI debug triggers function IDs */
 enum sbi_ext_dbtr_fid {
 	SBI_EXT_DBTR_NUM_TRIGGERS = 0,
-- 
2.50.1 (Apple Git-155)

