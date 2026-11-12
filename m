Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510567;
	b=JFLeisc7oKhFqpVnVyUCgxIySDkVrhECwFZ5yqaXPPHlaYkx9Q8t0K/qrzKJYM4Sorht
	 GoXfDHhzdLHuvxmf4Pon6ynX2ZuAoGRnX5sBLUO7aU1HSdO3G/MdASNnCDVe4X6Ad+Jfs
	 N6xncEztRbEbDVVRnMbhx9Gv93vAe5XRaS7UES17F4ybbSMh6ZmNXj006lN7KLJmdC+AH
	 gLrt1uRSkGoetcdVN8atKJ7mWe/Ct4TnZouCr/rzHq4tid4EA10aZrdmAF9T4ncv7P2IH
	 NWvyjrGonQx7uooTNgAI8R+i/mi46KzuimsREuzhrhQJyhArpaEC0uvJKkPqRLssUDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
	b=3yqlXFIMjBpK8yna0g+6fOgxqWDwG14py2iBifoZhezCx5sEx432WUASvq3gSEMK44AK
	 kcs/sMjqhQ8uziQaglodKt9dM/WbdxvEd6H2HibYRk/CD7FI1cMAMLJAC4n9Y/Io7fyDF
	 RWZBuTsuZHiBxOeONpoT7Tdbed3TpXMma9q+5fdTg8N7JM14zI166wLhLzpqFnY7HLcIv
	 HXCOeY3JUXTJKRWhVayYHp8oE2RBFqWjRueocwin8s81nruA8aYQ215IESkpsN1G+JG+c
	 JzjhJ6oyfuhv0eKqZz7rWd4MLUuxwaDxEIiMwCkL3ZUUuRlKTKfN7xYR+XKdw2nLOaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1163660A2600
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 19:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1163660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpIKNO9i
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37628596783so358480eec.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510566; x=1795115366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=PpIKNO9iCXFN0JuyGZ/RjZ00OHOtXTxwdAm4SLsStsWOLkqrrwwVw0caO0Ele+3UrT
         GxTZPKtkK51agJTDDENcxoOs0wyewqtU13D1SGzYQB14hbh+382ev0/qIpmG701aBiuJ
         4W8Z7iwA52jkHhetKcadgSjc6RFvrHLBovzVvAIMGDJOt77cAYhORPDFKD+tjbiS8OYk
         7d8uU3QRfp0pX9o+fiwGd2YvMiP9Busry76kmVmG/GIoXyQYHnPZyGQm/GdfBv/fL3X1
         HBrtnY+BdBEIN2CyYcKuCWAMWA8/Jm/pyolaf0VaUdNYJfdJqd1EVuybQ0mF/RGhzbCG
         DBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510566; x=1795115366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1dni8wQl+kQkoRfg2fRmlfc/EYuUZuhfj3zW0/x6MU=;
        b=jXbcPrka1oDWjr8KS3YEX92cCZrUXnRsyxxRPStu8+pgknJe9SvKBW31FDSDEBQCjC
         bHPtnhxYCXQiWkr93B9aK8MQkiSBlqLwnCZYIUkm7SNLLIxrrY5fiHwzuHa46XkEibkt
         0dFC7/sJ0GSex37GBWJPk2Z11AAsEBChfW5YjA7jWvQdjdGH5ovkpA54nl3tyHiTmUWt
         FJCUuLNUVtCd7egaFHZoPaAlV5sXA7vTvsz1JC5pXTKrD5JrBFK18MLOViClu9RhEExs
         aLulJBgkyr2PZr/iTDVCFZ2xnv11E+PTnO+TUv9VAT/RPcMG5MEbJgc1EQKGadlOYWgB
         bR2g==
X-Forwarded-Encrypted: i=1; AL+hErFzPyrCw90HLtsZCM/pzGjb41IAqBsac0h4wchrT7oaSrO0h4/xhwpw02fgEjOkXJGjOBtlhLxFBXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Lwo6leLaaH+E5T5K/8JTcKdZqdLjWzjA1u3pnQ8DlfsHbg7WM
	srJFeOZe0u0NjT5G87aiqb0bDqLjU6ZOK9S7H3P6zpI3P3rfCnpyoQs+
X-Gm-Gg: AYBFou1aXLS88AgTPRY1PgAZJWGrllGHV2UjBp2q4gYsjfxi2UfPRQbbGOkwM1Di0I9
	w11kOfmHisEw9KvRbZNkaz0us8i+6LZhgmH1ihtmQNmWtwDWRYhAh6ZIA/DczybxcD9ObsplGYS
	APl446ZdQ+PoWWP8gQ0JZKtRJayThHIfc6g3Qja6G8AfgZ9Ew1TwnscT5WY9pxMQI9o6Z9KW0hw
	gsfTQj3wESzV9z3WA6Wy7U3BujzZC9xnrpe5i5wqgpgHtfpnFy/n76puhwYEC2qMw5MSui1oWbD
	7VKymnstq99p5Uip53MLOecMfjoTTyVvPu6oYFyvNHJ3xjPKvnyTLfAI0ozjyxWVPYE4OmP0HoL
	V6XgI08Sgxu8MNvSCVsQsYY51Aybbanx6cCkat7LYjAmu4kHw/BMmecDnV5prcxf5PYU+XuAb0M
	INNZs024HrZIBfi3kFS6VHpXyXPZTTkeXXfyFFijrs+jO3oFOBLBvxdft2hG+vXQf5imwidDtfD
	0Q4Q/Ykv8QpYHvHotHFbuYonD2BfSPMA7sMcs34HsZ0+OjoT8KdIlglQBJDodHeC6DeRMSy1zLm
	eGPPZq6g
X-Received: by 2002:a05:693c:8816:20b0:36f:350b:3838 with SMTP id 5a478bee46e88-379671247e7mr76378eec.31.1794510566008;
        Thu, 12 Nov 2026 11:09:26 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm395674eec.26.2026.11.12.11.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:09:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH 0/3] MIPS: SiByte: Add HW PMU support
Date: Thu, 12 Nov 2026 11:09:13 -0800
Message-ID: <20261112190916.3725141-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 106 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 373 +++++++++++++++++++++++-
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 647 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

