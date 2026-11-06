Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981925;
	b=XTGJXSidDmQglIn5XxVEc/kCVwtVNnNdEdFPdm7ZXx6/W8pnbfdNGrtpO0R6WIzNybUe
	 n5YaX31h4Uvxyl9PqE2fq7KIAkO5sXnRcYabxjALTv6dIHz4D+uq/VsGHxfOhw/1DN9Mt
	 T4r5iznc2vRbir+zhEoCk27Ufl1m6xrhctpHgWBUHGv6UYF45UfjOh3EfApszxfFtlQCm
	 69OktieDSkmBsIFNBI+C0QFMNJYZEXdY60LppgASAOePRCHXV/8BCmbppkgGYW0fFWpmY
	 4kHOuCd7AHOyL8dymtIqPiw67S5Hx1d6uXXf8zxY94A648V1e8diIR8DAxx50bS4Xkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
	b=WAj3dzQDrXRuY3ZL74ooRg1yjZro+OYVTHKS7Rt+Qy/BNXfwEpdyoNwYCoRetCGrJCg/
	 n63lS6c8YfC4po03X9oHJ52YOuKf7vNbwsEFuFEKlUQOfHLG2CwjCnsvvIJbwy0J/hbmZ
	 XI46vn5rntmBN5oSNmwn1VamqE59qRlDnAc1HapEbx05GRFzUO3pC6MgfLvAbybBpBqDB
	 4u4RSPV9/Cfu0P3QIeOceYTfJchrV6oaGAdZkcq/ZCRbjOH2mDWlaJ4Uz/aM4p2LyMhTE
	 Mhra84u4YTbOVMvxGggRpVNp1DjYfbz+jvwQr+Sm3+GRHb4FVs1GzgFkM0T80ECkN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ive7ZrhA;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF55606A32E
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF55606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ive7ZrhA
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso1897442c88.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981924; x=1794586724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=ive7ZrhAjBWK7ZFfpfPxCUr9GCcskXBiex8vEbprHuYtZGY3J1jvX0EgfR/Nj5BVPT
         XbfIPrSeTCqXV/6JB+aT+7L+xoWEdTofOoqcf/5pTelGmMpqEcV1pp91fYrGUsxxLMAj
         OG0IAR4SwtMEWrzzVV2IbyLrKAGPJ1acAha22WojRJYAOWrVM8ihptmf0/9whUS9ijrP
         XXE3Pa95QQ4ZQM1q8Y0daOtOEN8coryhE+QILNrSFctNxmeHRj3RbZOVNNyu76bquiWU
         w19gBEG2jiQaD+94fDqoB5L0ZMTFbDyrBQw0ku6d9Hd3fYrTH0i4iCdyxu+/72FRz+DR
         XhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981924; x=1794586724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Y8uax/jwHHRfNA5XH8CklJUgH6lZS47SjUqzjnUVs0=;
        b=t0D9+JYT+txQRc8YxlbjyRr3o8NnunJZ/Q73Xq29M7zzM4yOf3zAaOXUfWZZeesM6y
         gE9RLHSLSRgovB6kPVVT6Ut76ZSZ0O+ijJYqDDGtWm7RBRR6L9GFech2IEZAEhLl+u2v
         bTpKCbSzAn63wmuh6/wY3sw4Go1xpLNk0bpfpQlFrtkzzVqCiZS3w4ZSh6JbPkboVsbJ
         6z2LoPIIZjsigwHL7gHWdP8C/I2t0PFjjhfOI6L3BOZxZKh21ZrLiJqb0uOphDTgV1lA
         dKtnkvCusuZmrwj48Oj1jM2L+jJ9RF/WmOD5ej9pBZfo8viZ+G/py4E5AtqqZEC6Y8Fo
         1jOA==
X-Forwarded-Encrypted: i=1; AKwUvBwjOeQMaQXSEUeWPea9zqx1zvuyKfKq9g287Z+d2goFq5WgkzJAMd9FEI4KaU7f/hiEDM+UHNhJr30=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nrhQ4CAivRLo4N/ZKySATRWZjGU+22Qty3KWn7nuGzs369o/l
	CTTp6keQLxYEhnxqKYmAGiXLOyIhC6kwmCVj2qTSjRy9iyPivO8NNcDQ
X-Gm-Gg: AYBFou0XXAalzGIHX9sxwW9InfWnC7SaYuZ+KRkgjZmOCEkvqU/tgdhrRA17bvnCkdX
	fcjgHOUR86VqNUaG4Yf/8lvN1HY/Nq6OUXc6cfSsMR4To4YN1TrW1l0P+U1Mpt0HnrwrTAmhJ4G
	5r2/o8t6r8aiVRdGa4NAOqiJuVWu3+ajIhwlSbXChgXlfOC0i28bSAnyTPYRHK17uZtbGpAF0ZB
	UMzfqGTVwQzfoa0A872QSbBfL2R4DFywThUk0BT4a+RhNPd3HEaujveorEOAt2DteWHn2yFt1d3
	p4LOCDGG/hpNad86/mf3ufDEvN6F9rtvxfREOFwLmMKL+b7z4KUPlQuWpZqjoPRQJ92vZmBPeQN
	gSp4vr9LUSGmoFM3heeq4YNvw0VOg/a8XzgQwaEzUzF81JXSsVfeQ4fFAw4Lm2Bk0mnusunZ7hx
	2iVcP7HM/HtYLelS/htGGlcyB2Ol7rn1CW8DYNNTtxwfxlrDH/ff8jYhz8WqePaJxm1UvS2aQZt
	x0B7DzYft2z0WW8fsJtNvimU4aaXqh0N853mbkpTRbdDl840xsHJCVVL5Q+8PM8TltQfoBxdylN
	CuOgmMbEZWF6XHskkyTpFsgGkmjFIQ3d2B6gU3c9x5NnijcqeKUcDGDtZ5NXb+vVV3/LhbKCIEJ
	OXsN2UbbBsxf8ihxqiNs/xD7SzGxunPjWFRlI9EtEZQGRuQ==
X-Received: by 2002:a05:701b:4588:20b0:17d:7b45:f927 with SMTP id a92af1059eb24-1b25d3499d6mr3671255c88.33.1793981923536;
        Fri, 06 Nov 2026 08:18:43 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:42 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v19 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 01:18:26 +0900
Message-ID: <20261106161838.94308-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi Takashi,

This cumulative resend keeps the twelve-patch series on the same base,
a4311e9447bbb219044db38897f95be112f46a8a. It covers PCM stop-threshold
sampling, locked partial-progress reporting, the optional reset operation,
VirtIO ACK error propagation and recovery, PCM and control DMA ownership,
signal-safe teardown, staged capture lifecycle and work prioritization, and
capture parameter documentation.

Relative to v18, patch 7 validates ordinary indirect capture appl_ptr
accounting before calling the indirect transfer helper. It bounds ACK
consumption by completed, unread capture bytes and rejects positive
advances before RX ring seeding. Active over-budget advances follow the
existing XRUN path; invalid PAUSED advances roll back without ending
PAUSED.

Validation:

- Cumulative ARM64 stages 04–12 passed W=1 builds with KASAN, lockdep,
  and OSS PCM enabled. Stage 04 built Image and modules; stages 05–12
  rebuilt modules incrementally.
- A bounded candidate-only raw SYNC_PTR audit rejected unseeded PREPARED
  and over-budget RUNNING advances before indirect accounting. The PCM
  pointer rolled back, and prepare/start/read recovery passed. Valid
  partial ACKs also passed. No vulnerable baseline sequence was rerun.
- Candidate state runs passed valid subperiod ACKs, PAUSED rollback and
  resume, DRAINING tail consumption and over-budget rollback, and raw ACK
  before and after PAUSED RESET.
- A slow-reader QEMU run kept the unread capture slot unchanged while
  appl_ptr was held, then recycled it once after one period was consumed.
- Four final-byte no-hook QEMU runs covered ordinary and staged capture
  through RW and MMAP, including reset and reopen. The 14-sample oracle
  passed across ring wrap with no KASAN or lockdep diagnostics.
- v18 MMIO rollback, timeout-width, and PCI remove/reprobe checks are
  inherited for the unchanged transport and control-message paths.

The bounded ownership trace did not reproduce an in-flight duplicate
virtqueue add or message-length overflow; neither is claimed as reproduced.
Numeric ALSA runtime->boundary wrap, physical Virtualization.framework
devices, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/r/20261106000644.20460-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
