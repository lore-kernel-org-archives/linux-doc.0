Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090227;
	b=ZlzjuryhZ2OfDX0Sm6LwFBkqokpXIDAQ2ytNMRjq3ARLSB2uPkSHVJSB6IS/QiNzeYkD
	 o9DaZ3y1bhCSakZbmjyO4/E5eFQ3y3pX/N6dtCEtdED1fT4omg1uPgDOK9A1T9q3rQfU2
	 3S/ULGrLc8/X6hzpPiXXdfS0ZzN7TEPF64nWgMpm8h6+qaGKc1t68VQElNZBEh4PMcB24
	 45iz6Mn+Z3Q+BnpgFw8q2owwWs0DRL9lWvEWINXWLnB/RuRLx6dwHMB6E4cPBpyNZsCEd
	 n0BVk6j9TF88XXKGobOdBfeyoAB2P6q892F+BW6vA3qJaQeUbGtQ2yYsx53a09Czsjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
	b=BIc4Pnl3VdopT38hWBvpI5NWIqucKyFXIWLSGRq88MVq3VB3bOjuR5NE0DlX2cVbWoMy
	 kNlTIF+LO5weT5P9vIEPVwlTw0/qeL3K313UTdzKLJsHJTpCiQGUMbfjRhweuOk2w7gkT
	 MucK0jHh7T8mSHYO0sO5E3wuIx8cMlbioD4WybbPNQztdJS02GezMJHWH6NgAJQMWzmO6
	 bP+RXCyzgD2l7wFz1oYm8SkdlolbNbuuqmy1LmAZon7qKb3TIkXhDjs1t/Ik6MIjRjloO
	 bRti1gwn3Q0K/P+HY8Vx65x7vjXIwsyLA+jTEmJ2tmTT8tGTnPCn5oa6M5ufTtIx2TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89E606A32F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B89E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VEqxmkSK
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso2918946eec.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795090226; x=1795695026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=VEqxmkSK4eWCu5l3irtVT/zW/JOHulXWxYT/po655TWF4gILDkLFKPv1BcgYrtWYq6
         NhYw6ZaLojKoN6hFsfSQjvERRHoVsJlZGzxtgS+UYf5mQzAC+zQ3wNRFk55Q2XT2sBao
         IqNO3k6dyAlfY4caVvumv02B3IzsNSuYAvym6mjWRJyFBTL6oamVCfgCauoMR2UPq/kx
         eEfy8I1Ucb1AYI2eI0Gg3yNN/LggBvxf2TO24r6Ca5d2oRXT4eecvoXQSJhkQJQyyTQY
         +8cvCYlNzWcCPfmy3eij9uBFElf10BM3WsNrVilBe33rC9y/MnA4Mop+61oSqy6EXuQ5
         17qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090226; x=1795695026;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AYLDQ+yf8AHdWNChzIaxivscwK5yCyOEEBVUQLHdUIE=;
        b=AHZizbd9+EmQyDXt/lcipJINTDu2jCQIcvWVJB5JzeGUlkIc/VDHLbYXVh0MOOTOxu
         Xwi7u1t7seG70baYUPK/FWPbL9csMlqi7sCnp/zDMioGj6rFRYk/O72IF8Vg3OeGBeKJ
         ODVHBqVGZtTQwlowbJgdWumsFOU2J1sNG2sAzTwCNSCbGxHEZx/7+JYD9iN1BAPR4ZQL
         +uxaG7Fnd6sI1jD/ugaf+WmveGo10N96A8BN1nVz+jOh4RLC79mOIIol7KpRJOaMj2eq
         U7BnbTrEkSttZb0IQKK30M8UHQi5Q+YJ9KM/YMhnEEVi84QH5CkqIf4dbNUA32AwYsFM
         IW8Q==
X-Forwarded-Encrypted: i=1; AL+hErEUbUk1e1FdQSWvif+TUPt1j7Z52G68l6GYmy8sjHdJghbA6PHrjRfAlIV95JERQ28/BkdNEV7RWU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G/Diosr6Ua7zcKkYWobQE8HxXmxC+Db3bpZCfSS+4lYZ+S9aF
	coz7Net47QyMm+btx7nADwgz9p3ZTwU54vUQKL1MI0aatVD6ylYdEZ/6juOQUOSmC/s=
X-Gm-Gg: AZFdTZelgTmLp4bpJxUmarzbk5sauj7UxDCygjMbqS01N6hQFSwTHGqEJI8RFQn5Daf
	TZi26LU/7ZkjnSnRVGXgea5AvajtAe4mfs2S/tPAX2TtuxuG7RF3qfzLGFEHLiSzSg3nPTu4EfN
	jNi4FSg26O7/zMK/snWxfUId9GA+3SxiTE3ngN7v7F1Y0cUiSmVrUME6hexi0oco8rvHV8wkoWS
	vFqC5irVxXvT9URgvkkYHq0BOY9xN4wTLpP0M/aiDWNvW3LzZJSh1WnOJS2bZhzZZc1xOIFqs3T
	4ORNC4zQ3T4r5/HQZzIw9QWY4Gsveyh9Qwlj1qFDd2UB2e3g3e0nccojTt5HwtaweMmXa960wMg
	B7HLJdA/nmxOcLIrpAFqsQufEyuwjZemuWbJa2ywNl9Z9dhHdmdyp5lZyqxkfND/KkigdcvcFsR
	703WrR6iKRYJTvUcasRhuRSTOciLyGBJyXG8Bfkm6z7iGYsbEeXSZNoFc8Lp4H+gG5LFx0qQZ46
	HDohzMOFltqCp8vJCu7+RPbN1H7CVpjgNWB4XIBuqib5FtLbCr3h6Q/griWJqvoy5pZv/qRaM70
	OvnKUbrKUo5bdHWE0u8sgmS+fWPPa+GsOdSrmBjPKY47Otbnxg+j9EFjcmST5RcfCYI1HXrfXIL
	Ipd2xGedICRHovkfMDul7CFNQz5sa
X-Received: by 2002:a05:7300:3e86:b0:36e:3ebb:7ef3 with SMTP id 5a478bee46e88-38282bb5c41mr4863247eec.39.1795090226193;
        Thu, 19 Nov 2026 04:10:26 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17604650eec.26.2026.11.19.04.10.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 04:10:25 -0800 (PST)
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
Subject: [PATCH v13 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 19 Nov 2026 20:08:33 +0800
Message-ID: <20261119120824.13969-22-zhangzhanpeng.jasper@bytedance.com>
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

List Zhanpeng Zhang, Himanshu Chauhan and Clément Léger as co-maintainers
for RISC-V Supervisor Software Events, with Yunhui Cui as reviewer.
Cover the architecture entry, firmware driver, PMU documentation and
selftests in a separate patch, as requested by Himanshu. Also add
coverage for RISC-V firmware drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..c2d283895ef4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24060,6 +24060,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -24072,6 +24073,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 R:	Valentina Fernandez <valentina.fernandezalanis@microchip.com>
@@ -24128,6 +24136,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -24176,6 +24185,20 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+M:	Clément Léger <clement.leger@linux.dev>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

