Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850728;
	b=QswEdv6bY4u+YCGxIo07zRzQZFz3z1/urKp5IbW1uQVImUePYRtzYmfpmnRqSDe2Y9eM
	 FwivliCC1/TMEBo3IGGIMuZYVQl7sPK+VJMOVODw4Hno5Y99TCOUHr0RUGZvOF1H4mB+C
	 a4cviIEAKrxx3/5F5PNRARt8dRQees9eMxOF9PB+dfasKljbsE/Fsn5pQpBqmV9dOsOuc
	 kKAia5EelXOLgdZ6xFoR47+lOBneGMATcIEioh0yHEbUMQV5diZVwFfXz4nY86Xfxi5o/
	 Ip4771eo0RQ2IcyRNuxAtCIRquH4Dfyvn/EF5n1U8kF7nfUobxO2l7Bhzi+OQbudF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
	b=fiAB6MTLh1yfky8jv/IOHpLrVYw7ot5yg8ri2msh7OYAj+6vkkAO28HDdNFVYGFeJsJy
	 VCx9cPveHdpnwcrKL+syvBKjOIF7+2K1k1E8+mz3ityYvwwJm9wV8mK0ZpeSMey1/mkTL
	 eX/1g3/03BOGBRhLvKqECALwWmkTH4vGPDT0mFscQPoF8z4k6lqr+aKtvBhH/fzUl9K84
	 6aXa09R6gricZJxsJyHCIQVc2tKYNHUYVg3FF8kKKVKz3OgDuSTbJ4Wvf06oQ79V4WaP7
	 THAC0Fb9YsluKE68M5pJ+yEDOiWPnXszJaZZXwFmB5oKREr1NmMOjYcNJ0gkB8ScnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F5606A32F
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572F5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKpxFtJI
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so9799108eec.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850727; x=1795455527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=dKpxFtJIyWFjlQRSKbKIOU1/Oas6D/kgChSi2PmhJsbm5FtEqvv9xhesQJVCf12raU
         sUMDR7DzniiYa7v+4fuLtHlyyZBTs+IIwyBU3sFLYGJYb10jER85jVVeaRQ8ftQB+IK3
         kA69IAlKM60thCxjGq1wIkuG6Wj0GvAtsQmT4LvXz3bHPfUf/g03sCmYarJID/W/PejY
         OHp5N06ca7kZ/adfmhspTE73A2p+/a6KZhg3dKjyt8/+ywmTa99RrY/d+Q2wQLXba4kT
         Ad76ynbx5wpiNG709WvXE1nfLHM4EcsY/tD0vm+jPrufY/zb2Zvay2NqACNzMC6dwzib
         yaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850727; x=1795455527;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLSjTS2pwt9wjNyiWIDUlRh4L7BmtQghZ/YF0bk5FsA=;
        b=cSmHMOk+0jUsUJejRTXMRLVzmZnQ5hnFPJ56pevuX0w6QKR0VVhNRWbhpb+46BGJak
         dtjqn6yociaCB4U90auhkTzvqwQHwm4BLnzkuHj/iv7YCS344SoJFlS4xW+NhAS4mnXK
         Un8zgyw44KQ9E9JaC1sVcNe94+6u/JtiN1gWS565Iugtcc4QeMxWiuUp3boBthUWYDtv
         LatbzZZYZds0Je1yet/v/gD0Rlj1jmoVLKEo5Pu8Ha6gtdm2ZkDVkqAujsGuDhKyp4bO
         803CnmitppB+P1In/JjSfbSCyxNQFBuV5BHubv0FU4kl5U6MaolDQt8avFoX3wV256kI
         w2ew==
X-Forwarded-Encrypted: i=1; AL+hErGREhcfTpJDefHHFdDpUfbwQljhJc+XxEY3gIV/xQCsrwOAMzGkp/O3vcISyrNWw/e8iuzbSB1CRwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nOQC4QCT46ztRwk3eeqJWPXKQdIMyIfezBCZU9EaUIhVFGmeR
	EFoyq0dnYHWCUi11mI00A+YDMfvd0okLI5jQST9D1U/yxGksyYzsfBKg
X-Gm-Gg: AZFdTZd3JLuL20bH7T6mWzXmgcLdYfmpFRF9vwjaPihIoO2VTLmc2F4TjHysuvCouUw
	+7BP/AgtbYpjqPops40G2XJK+pLYYSpjRjHoHea6F7dZ0do7vlFcv65TPS6u+jbt2ZuLQVEHcVy
	C5M7K/euruTHO1b3KRUe+Vqvm4h6VkFHoEuRyYR2PzmctBRimyFVLtAiiu/A5N/I12jKSaLBbr5
	BSzVht9n4rqMC5fWUDy/ribZz/IhivrPhabxl7EVyEXecGpI1qD3K1pl4t65fC03iRoESSCZs0W
	F+9FKAs0+3PJtN51Hb2FmvGdBydTYu45DzXprVNl5BfeYYdu84pbZj/VMLxrvD6HewoWwFc4Q5g
	NecG2hK2CVxJ0W7eMnBNKrxorK1HJCav86izuCo/1RW0gO48rR4uOQjoJz/5uH3QuwDwspORasr
	5DTTqswSFC3hApc6FNwElYtDWA0lUHqOWn9NDZn7QSE3apZLE8VmKD875sPB4HViQYgvYBc7j4h
	f1doZWbGsO6UeRFLeUD5xRI3+L+oGJ2tV2chg5YKP6emZdo+4VhSTANwx2Q5ZeK7pKqfSETd7d4
	TdzBUqVa3wpPCFzVVjG5QOkQ8B9KbIs=
X-Received: by 2002:a05:7300:6aa0:b0:36c:b8b1:a44f with SMTP id 5a478bee46e88-37967ad928bmr10061049eec.31.1794850727398;
        Mon, 16 Nov 2026 09:38:47 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm36635215eec.15.2026.11.16.09.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:38:46 -0800 (PST)
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
Subject: [PATCH v3 0/3] MIPS: SiByte: Add HW PMU support
Date: Mon, 16 Nov 2026 09:38:35 -0800
Message-ID: <20261116173843.911523-1-f.fainelli@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series resurrects the SiByte HW PMU support which used to be
supported with oprofile but was later removed.

Changes in v3:

- Use boot_cpu_type() when identifying the SB1/SB1A PMU instead of
  current_cpu_type(), avoiding a preemptible-context processor ID lookup.

Changes in v2:

• Preserve usercopy fault state during callchain unwinding. Save and
  restore current->thread.cp0_baduaddr so faulting unwinder reads cannot
  corrupt an interrupted usercopy’s recovery

• Balance PMU event initialization cleanup. Release resources exactly
  once on initialization failure and install the destroy callback only on
  success. Also check event type before rejecting unsupported attributes,
  allowing unrelated events to fall back to another PMU

• Keep disabled PMU interrupts masked after EOI. Add an SB1 IRQ flow
  wrapper that reapplies the mask when interrupt work disables the last
  event; the generic CPU IRQ EOI would otherwise unmask IP7 again

• Fix a documentation heading underline in sb1-pmu.rst (Randy, sashiko)

Florian Fainelli (3):
  MIPS: SiByte: Wire up the CPU interrupt controller
  MIPS: perf: Add SB1 userspace callchain unwinding
  MIPS: perf: Add SB1 and SB1A performance counter support

 Documentation/arch/mips/index.rst       |   1 +
 Documentation/arch/mips/sb1-pmu.rst     | 162 ++++++++++
 arch/mips/include/asm/mach-sibyte/irq.h |  10 +
 arch/mips/kernel/perf_event.c           | 110 ++++++-
 arch/mips/kernel/perf_event_mipsxx.c    | 397 ++++++++++++++++++++++--
 arch/mips/sibyte/bcm1480/irq.c          |   7 +-
 arch/mips/sibyte/sb1250/irq.c           |   3 +
 include/linux/cpuhotplug.h              |   1 +
 8 files changed, 666 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/arch/mips/sb1-pmu.rst
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

-- 
2.53.0

