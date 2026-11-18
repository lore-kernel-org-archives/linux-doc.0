Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989638;
	b=ZUuOqImT0FbAqj8J5b3sPKTv9hOwwAVwMPnQ83i+FeQeo23vV+NMYRkKO3mvrvAp5cfw
	 EPwod02pVyspvQrn5nb4qw4WV5oqH+JtDvg073t+B5Ba6dlqHmr183jxrWD31/Vsbio7d
	 FxP44DARs6kZZKM2jmwIAziAt3Opc5UBJ2c7GGXZS6ANYMbnSSIONe7jyn+hKoaLGRA7c
	 LziYajmHqIGQ8rwbW/7d+8gye1JwjpKPKWGWmc0DWoQNnjFkneJVlTPxaM0ixG6a7ztDm
	 V4WghmhSvoml7nit3dwLlHnYYGbIl90W9NbeLZYtIlXKLMSJTcbDmHpYpuM4lX+yJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
	b=co/zH+cQ+sj+PViUW4bd7jY92ZFhpsjv7/7L/bOlRVLMorDa1P1V1I4wdsvkkT4Zkauw
	 R3IUGz4XhujKz5ZyploJqEYknD/D5BZz+ZPeCpz1Q6IGmpl5zh/7zXtHHcFDihN6W4tSA
	 GvyMcZ0fGTHuio8ezwSR2Vu9zBogR2yI9Kjg8LJYbE6mNFNlz16ynG8OIecU9vkDp06TN
	 4GnYQA22Jr5fz1jPewXFyyUJgSvZDSzyP5oMaWBjxh2/IwvASFJH8cPorqRV1DMgJTGvf
	 Y8Nzws7nCknSTi7W7BD4GE2ihfNYREO7NnY5obzTc/BIvH2QFQT4fbhKOtpDNYnXh5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91644606A32C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91644606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=CIunQBLg
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso478351a12.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794989638; x=1795594438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=CIunQBLgc0sEPmk5ppffRBSZDZbkW76BiQOaZUO8soHExpBHJnYv8WDK4meLo+agIy
         vzIkRO+obk6Ot1fmhUYUiuYvABmbRemfhQuQUOV2jdimXfCnYvtX0z/+0uFTcD5uBq6v
         Zm/G0xUvKa7xXb3P6PtdF3bbeTMmH5XitnUspTjYLOWzUXJXsyh5ma7+MYGvcq/mCPES
         6GlWX5i55NsE+df9rb6hhDEQKBzvirUY7tAzV1kj7U3hn/59uBGkFtUYz8Xe95QrQqhT
         WySkCR11s4NpK6cZiPLtRM5nQIr9L0rcKuKwYdEvVTutvsF8xk7vB4ParRr9xy+5ClKp
         dt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989638; x=1795594438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJZ+Hdtk3ZgO4GcY5jYam6jCeDolIL+Wbgosemj6TVw=;
        b=NDt7xeI8J4x2Wy5gOimBU7ONVAbXlrzTKpMb+tU5sWiSdXJgjE5k5MZ4yUD66RWqRg
         OZrfs70nFRx1YOBx7jAW5WzH96r3CFuzC8ScX5QgVWdeW7WVpcNQdJqZleZwfc5hvAkL
         3WN0PCfpqMD+Fod+cZXP6ktQNC+u9kHXdgE5Q7cxxC8qK8sPOag507vFuDcG1rf040cF
         j+b+Q5lWa63l5XPRD5Gf5LWX6+459ftZXh+bl8GKVD52z0Cw1CnMfJXz+HCTev0jRNiV
         79W+tzfKQNC9AJ3ngbDzsKKmigtNqwA+uZrBDsU85ERd0GLBfMLMbtSpCbvWgBj0HqTw
         QIFA==
X-Forwarded-Encrypted: i=1; AL+hErHzLPIAi6PLilD6XLKfmBZz3XcbiHsFrP3D9J+fvfi15AzdZ2hHJl64lEzIRtgeg9Pfq7f6IB5YmDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sW3zpOA7iu1KCqmn/liW7zdeoXD1Wy1JTQgm1yJ080NFo17U+
	XrmH/xDOE+l3YsmUUtQ4Eay2TbIvA1TQIwy8Aw4icFNsGjvv0dlsjokUGao8te3gL9c=
X-Gm-Gg: AZFdTZdwmz/RlvGNJ6s8qXIWO+ffmEj3GrEM2cpcz+S/qL9qTpY+uM5lxXR/iuJLmGY
	TVp+1D3nf/0vwTPHPMMFDRdB+oT1pm9ZFj0EHgrlDHDM6i6/rMqAuPAQKYbzxMaKoJEqb5/IOI8
	wyqdZZPtDhEWV9LfxtUlZwUSvfM4JPZImjlQ601UKOuBjG788W/O1/tSDbKMnSyTtjQclzXsQvg
	l2wNAK4mIsJZsbLdg2Fd8QThGWSiipZlSWw4VADNwnTm2G2x0u0MxV8xAXx64SHE91ZaAtL+G51
	jqeFFDFXZyIN5bHfSkSClE9sCAXtu3PJI5nmTzV176TrrPcU6S/AhwbYQCokW2WT97aN6PfgX+2
	32+JglvM8fNAFtS5XKZaVNP3f20sGMx+C65EHBSoshHsEXz+1GzLf8M8EQuodXg5pQxfDD28m0S
	wHE6AsL+gjlEt2fnh5LX2keMjdbDzUOPToEpITEgDmGflyTHhSg7mAqDpUyXDo4zHsbtjuiFa3O
	E3Vzp7+EJhYiZ1nVFvwu9ePv1PP7n5rgmJ+FqaH8CNLiAuLwkmScrE9myqW3Uiv+kpgbIRVeGVv
	zCmpukvWYy9J+Wb2tCuLEaipwxNpdZ0v98QlDJchdlXzLWiiP7h+6Jxko62XU9/f5/qkhrivfKg
	lUdhBiWI=
X-Received: by 2002:a17:90b:1e48:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3b3d0640e52mr1931726a91.6.1794989637815;
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde50sm3254680a91.14.2026.11.18.00.13.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 00:13:57 -0800 (PST)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	andrew.jones@linux.dev,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	atish.patra@linux.dev,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	yuanzhu@bytedance.com,
	cuiyunhui@bytedance.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	will@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: [RFC PATCH v1 2/5] riscv: Detect Smpdis and Sspdis ISA extensions
Date: Wed, 18 Nov 2026 16:13:30 +0800
Message-ID: <20261118081327.10684-9-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
References: <20261118081327.10684-7-zhangzhanpeng.jasper@bytedance.com>
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

Register separate machine and supervisor PDIS extension bits with the
existing ISA parser. Reuse the DT extension-list and legacy/RHCT parsing
paths without adding userspace hwprobe bits or inferring S-mode access
from an M-mode declaration.

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b5952db9259f..0eea8158b4af 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -126,6 +126,8 @@
 #define RISCV_ISA_EXT_ZIC64B		116
 #define RISCV_ISA_EXT_SV48		117
 #define RISCV_ISA_EXT_SV57		118
+#define RISCV_ISA_EXT_SMPDIS		119
+#define RISCV_ISA_EXT_SSPDIS		120
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..982231fa290a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -651,12 +651,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(smpdis, RISCV_ISA_EXT_SMPDIS),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ssccfg, RISCV_ISA_EXT_SSCCFG, riscv_ext_ssccfg_validate),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(sspdis, RISCV_ISA_EXT_SSPDIS),
 	__RISCV_ISA_EXT_DATA(ssqosid, RISCV_ISA_EXT_SSQOSID),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
-- 
2.50.1 (Apple Git-155)

