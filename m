Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365823;
	b=yi4Fk1ETmzG942BzvVc7CVSh2Q6P2NnCAYprKEPEjM8YTs4VaXjG0l5MTc05hbetUpI/
	 ZxMg4tdghhDPvX3XvxD2isdG3ZZaoHKostQk+MSgBbzhP3zVrmJrg3Wg/YyopM4xf6Mr9
	 GnoL+jtoOn01ksaLhGHHqfhqXrA7h8j0/7IeNEATBRGrAykdC5vBbuLUoJplv4rKtLUBZ
	 adrlmZpg+5+Cd7oAW3d7MVQrfo4ta1/FuxcAAFu49FS5UDgnYYC5/3b0Siwj3ETSDIgt9
	 LKGLUC8EbD7uYGjgXWXNLCYlupD4hWLH3rXCkkXZiZIBdRGXGccIOBLpmmIGgNYtDxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
	b=XOCUhBBVV8n6Sx6Zbj7d7GrsYrNy4aayKcPrVcyXbNBbTNLjzL6gQQ08snR7zua3X9Gi
	 LY7PF3l+I4QSYmhStzovztmZV7QNua8M9XUGHh1Igu0pdKshEqlbykTBIAHRStLB88dLp
	 x+Ss69SCoUjMLwCfgR7liTorONROFNwLZzIuZw6Yu5JI+5R16+oTw2akDKkeVQXZuv0Iq
	 q+TZ/s9sO/xMKGKkyClvC43DDYYSVShkPhN9NebYTLZPjToIXxOLet58hnjCh1huzMlHX
	 nt5wE3tB0T9hS7akk3jLjo9Ez9x2/Cr3Yf+sSfoYyKX3vqTAka3tkqcI6sj8VFx+i9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE03F606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE03F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRnwyNK4
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4190242eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365822; x=1794970622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=nRnwyNK4+QgxDLZzdUu9b73ahM2d1sl08rYnO+5mpeJnI+ijjzki+f+1wpSUL761PG
         X08xPA8vR8t6+HjDpo6t/3TsOwlJfgO++OlIxFdQKzVrx3R45DnjXdl1HSeODB/K2JS6
         OPnaR7Z4Bssb/aveSf6xD+p0pVrgqGVvdi9ELDhTb+ny7//QIXQZDX5/4Jqj3mvpsaPY
         Jfk+cNqvhJ1jGZtvloRIaZsWi690zZi92IhlzA4EXMj3/1ITfdNk+O29nKxM7sTlJ3cx
         ozPVl/u/cXtkcJLYfwLaR3QinTV0TjGLVhuv3K2Xw1uEBsQbeyviiJiRo+2t55bXj0SJ
         UgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365822; x=1794970622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qp80d0Wb9ndtvBEt6iVPc1UqtP2sqVWAkNfJ3zdnMcI=;
        b=rnMfMxDz5HPh30Wg4+lUzoPWohGD32SRcYahC3v5Ppvli35//dknD9xt4U6RMearJ3
         Tdj1AQK2DNE5F3y2He7Yrw8YCBhM5z1ksfWTzjXVrU/sG0km8Eocy8eYYU0afCbYF/v6
         nOMN2QWcGigaoUar1E9QF92NrQychr0tyQcPCWG9U4dJKiFVEUFNujwc0DOyg/rAD1xN
         YJOVa7o5d+TmmwjUwJ9O5Kii17BH2XGNSRp3mVJVOWTJPjh8xNcGPpjAHeVAeaq43kdJ
         HbrbWMv9BvIgG406ONKP9tf2NQBAJTKWYHB5GCEFu5mSLTBT3nX7E6RlAwp9osEPiJtM
         y52Q==
X-Forwarded-Encrypted: i=1; AL+hErGspl2xguHjSrmxOSGb4jJjxKbjTJWs6zgQXOgfytltddo9uRrdM2PZf/i3DQ5IbyG9th+o/KpDDHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g562qT15BwcIPOljt6kW0ywHSwH6EP3FeAVwiTF1GCM+/JxTp
	Rbxq63sv5TLlPo+2AIUUvBnM+H+EJuDBO3buCWrKHN8/dVgE/mLqap90
X-Gm-Gg: AYBFou2YBoO5SYCbAfnuODvGkikd5PzUJjOo4+Kvft/wImcNR6wQfUm1GoJXLmFpsJe
	djj3tH8mf3dnDl5rB7/o4n3zeLj5yZfneFdKLl3Gm5fA5e4U+/ey6uHI/Pa/F5C7OZPYZAshD6n
	BAuNk/XMVTeYXJpMCsF2YSIUB5YsfgkL+/X3R//NxEXmoZtIMqvwZ5LT+PIzhHJHPaF6QQf7nPC
	SS9py/zElXIv1x+Umqcm7OtLZ45+Qog/LT6+mj6YcD+w17dQX0QW4igQXNERwj8vcXGlABQZiLA
	l2zlO5I4TtL6irYT7fwvbVk9gyR5EsPow5f0bi9/pjS64kYHmayORrycHFWL1qQnZ4HjkA55mri
	3xHAMYJKYgiiJwKjk+DZsk74ZRDO0K22RTbqbpYuRMbWeYu6/Q2coRmWjyzr4pGB8gCWxrcBGPZ
	snQoMoCk9PhAtXNB8VLqmzyfHLOescD7QEGH63NSAAnjEyUXO39u/FtJObbz4TiMtnVimbegMdv
	QfsmK8i6sdbG2RuQDjvicQhtM57+aThXLhVvW6DLoYnA2hCn/1BFfVMp9ErFZhWfT8k8bxYV8ZZ
	CiYTFalUMAscoF3HXyMq7q4+aDHELZ41JsHZIcoPlTuvph8N0wBzVTrSPdDhF+0bjf5cAVqBDJQ
	A2e5bl7w1bLlcRX+dCoi0Im/Vto39tkT9KARNuYpncWQyG33+JLfo1EEigTsDUoMjNoVr8w==
X-Received: by 2002:a05:693c:808b:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3768646897amr1766149eec.21.1794365821641;
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:01 -0800 (PST)
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
Subject: [PATCH v25 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 11:56:39 +0900
Message-ID: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
Content-Transfer-Encoding: 8bit

This series updates ALSA PCM recovery and virtio-snd request ownership.
Capture receives into request-owned buffers so valid short completions
can be appended to the ALSA ring without leaving a gap.

This replaces v24 in full. Apply all sixteen patches to the base commit
below. The previous version is at:

https://lore.kernel.org/linux-sound/20261111000543.28550-1-mynameisjune111@gmail.com/T/

Changes since v24:

Capture DRAINING keeps a full buffer readable and reports progress
beyond capacity as XRUN. The read loop refreshes availability after an
unlocked copy so a tail published during that copy is included before
EOF. Playback drain completion is unchanged.

ACK checks the core buffer-access gate before entering the transfer
path. The existing PCM lock barriers in prepare, RESET, hw_params and
hw_free wait for ACKs already admitted before the gate closes. Internal
RESET pointer observation retains its separate bypass.

Playback period work checks for new progress or a latched error under
the PCM stream lock. This prevents work queued before a paused RESET
from publishing a duplicate period after resume. Prepare and RESET clear
both the cached device latency and runtime delay.

The capture allocation and copy description now lives in the ALSA
configuration guide. On MMU systems, per-period page rounding can make
additional memory exceed the ALSA ring size; the request buffers remain
allocated from hw_params until hw_free. Pause documentation now
describes STOP/RELEASE followed by PREPARE/START. The ACK
error-propagation and teardown wait patches carry Fixes tags. Patch
descriptions state their changes against the pinned base.

Validation:

The pinned v24 baseline was rebuilt with the saved KASAN and lockdep
configuration and the same builder. Fresh cumulative W=1 builds cover
stages 2, 12 and 16. Each passed with no new warning lines in the
changed audio builds. The full baseline build retains 517 warnings in
unchanged ARM64 files; other intermediate stages were not rebuilt.

Matched synthetic ALSA PCM tests compared baseline and integrated
candidate. The candidate preserved and read all 8192 frames in a full
capture buffer, returned EOF on the next read, reported 8193 unread
frames as XRUN, and returned both a 1024-frame prefix and the 512-frame
tail published during an unlocked read before reaching EOF. Playback
drain still completes. These fixtures exercise PCM core behavior, not
virtio transport or physical device DMA.

ACK probes on baseline, isolated candidate and integrated candidate
verified the baseline admitted a gated ACK and queued TX; both
candidates rejected ACK with -EBADFD and queued no TX. All three also
verified completion of a pre-gate ACK before linked prepare crossed its
lock barrier, and the internal RESET bypass. The integrated playback
probes verified stale work across PAUSED RESET/resume and clearing of a
synthetic 256-frame device delay after RESET and PREPARE. Clean
integrated RW and MMAP capture runs each lasted 70 seconds; all seven
segments totaling 7,104,000 frames matched the unchanged independent
oracle. These QEMU runs reported no KASAN or lockdep diagnostics. KCSAN
was not run.

The default RX path adds request-owned memory and an IRQ-path copy.
Packed status and RELEASE/reprepare pause are opt-in and disabled by
default. CPU and worst-case IRQ lock-hold time remain unqualified. The
playback queue cap reduces buffering tolerance, especially with two
periods. This revision has no new physical VZ or KCSAN qualification.
Uncertain control timeouts can still require device reset or reprobe.
The deterministic review fixtures are local and have not been published.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
