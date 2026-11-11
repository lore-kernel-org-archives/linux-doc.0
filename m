Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355549;
	b=dQ7WJJNxSJfhHPO9DInRVxouWy25eyESmKNmDXp76d+oydboNsEkRKdclcEDb9nceL+Z
	 uDN4JnPloPzoXPNM18UxqLU/jHUcXIZwel6HWPnEA837+n2bPW8ijOSx31tvki1DekIvj
	 sRZxVs0wQPYk1B+jDjPxYYb8hj8BJguhtIFum1p/q0VAhTgvh35dpQq0AUxwD3L/dYpW3
	 L+1H4v2eI6SSMY4SdnEO0aflkVGrfcx2LwEQxPJdQXSgPn6dQEe4L4RtIhr78JmedVqUj
	 nNWlTPEFLcwHDAm0erdm+HyU1utJsz1U98W38QEs3Mc2MFtQykUo9eyKYNFnDqhjeXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
	b=viaqsX90SFcyLxcJpu5u8NBPHkYvRbqX7Yl+ePY/YpxFyIm2WVm7PhkphulaWtSEbyKp
	 ddKo/KbGDq3F2Gp2ZlOw5EHsuNqWnvOS5jjtlKyQ8S0zCVltlzCVHFNg/wLmpqfeXF8H9
	 0llO6lyYJxJjgKvI34mcZgND2n3vt9ZtXaGzakqRjG2QR/CLca7hpPL6mJrzSYCl1ILra
	 NroZhEJ30Ysp8BRGnssSeWEGo5gxQtiLjB8SOCw9oX+AEVttno5BVu5d4h5PqWq/EDFfC
	 5dvZYVkDh4IFRMPPWFt+d1hU7nkBmQx2gcS5hvO8R5saGzDa28bJbg/kQSuBQO7wMFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="f7e8poz/";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7253B606A325
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7253B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7e8poz/
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so2046652a91.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355549; x=1794960349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=f7e8poz/5Clox4WDRyNqP1Jp6o7MT/306TEdwMySi6LiSghlBcSVIWpUQ4K7LzBI7h
         R5xXkX2l+0WYf9XLbb8f7SBfTozr3F7Jwp4GQxpDCcBdqLhiB1vdmlBSU50ppMATBUBo
         mF3CWHd1VrkddqeilPjFFb0gD7aXtiBbtoX1PRKTtR6zsix/56FfS91XfT4OVzz+54ZM
         mMNVT/CHzCTLPBP6WALCcFLDuuFyNz5mB4GGC2lT0VL8X4ZUFpRhO01/qyEcUJkyTyPK
         Xgwg625Ed8CGDSJ0cVUoemiEVa0pkB7YbcZ/SSJmwiZECuzGV40s/P1IGzxzGOC6etHQ
         HUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355549; x=1794960349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4uQsxXhxyepa6SxEX75JVt+g8l7wUTYuvdXb188cM=;
        b=eNHYpUpMBnkLi7mei3Qqm7bg+21/BOcfIKOMeHhgaXfNLRnhY9+A7ydx1pLsY58Rp+
         xYfPteSIix2gXLsy4FJvLtiasIXgpTe3i9G//yN3ROZEeoRR5mPC86bmrvp8Z0PsMG+O
         a23s/2AqML+u3FzmGQFAyzfHR3z95roxoG1F19xNXDtTqghVuHYEsII4s1VaDawaOrid
         qFqHdfp9Ho3XfDinOE1K783fD6Kz3pEcEzs8uL5hzrGoSVPszisNSaVAkMAJECapycGb
         s+Pi172ZHzL/YWn1xXHZbf5tI+XWQxP6Lv0tz7mw7XImwrrapcQ8RJ8HbLVMaKGZbHIK
         Dk2A==
X-Forwarded-Encrypted: i=1; AL+hErHVPpRaErtItR8i20EGpTsGO+okd6RD+cKzKydqQZqsPWRSupweItRjchVoIG4rlaNiWfLjP/0ZET4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MULhS7GF7xedTER0jmKoo3QjYOITNzXHXv3MNLZeHGYr/+udS
	g34gDGz9FiYgFdJuJbPj2fispEkIrp81N1jXUCltJBSXI4CyQf3cnoGTAACtRA==
X-Gm-Gg: AYBFou1At1gSeEybAmbN+1KNshz9tlyei13vEGUwdIuytPNnWrxZmN/gdrTQwcbVAAa
	jzDa2aPjewW/VM/1Zy/3fEKyZ434KCqcQlf1f7GHdlKodSpUnmZgjONraoRm32ibJQ8v11ffkjO
	Isqxj3NsY1P++DYxKQWTCKye421M3VtC0JQGjL0gH29dOU1wyhu8K2Jc1p1kAeEcRxDBFe6CX5X
	cJTOeDLujyHo5+lVYn/+sIKsM07bf4MutoDnvo7mFsXz+EFjsFrGsSoD2pomDGLFJSyO87XuZ2T
	1O5B7H4dG9i5Z3cuevx6JWehTfaI8Vhj9OaB1EIXKItEmrmAD1psCqttR+YQwJchN/7Q3QZU/X0
	5rggorIKnE0AOtdJpM/BSTUztxmgRrUqhVWFSgzs0K9VIkAPPuEgcZt6NAo5aDDQR1y5rMe6D9V
	MfryvVOVcbx3vadkTDeRwN0Qyzy7SOz/nNXHPm6d7s1zMQyqMVxyE92zPplwBqkZNKnW2p73uhP
	fZEpUCEt2HbaCyVW1oTfft0yjczRuJBKO0dxNEb4WKn5vhyhEhEpG4+6QQuYmH/t67a8OvmrrtN
	l0Wc1Yd3NzUkEBTW86TXK4n5koaLPIJzYdRp2WD89D4J7RMjspN/xeRxMCDpcu0tXVeXN9J8nzi
	/mqkhLetuB5Sjf149Uv2YJcq7OGmRKOtdG24y4UpHNFcG+xA=
X-Received: by 2002:a17:90b:1c11:b0:3ae:a4fe:7ad4 with SMTP id 98e67ed59e1d1-3b182def9e2mr675655a91.2.1794355548631;
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:48 -0800 (PST)
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
Subject: [PATCH v24 00/16] ALSA: virtio: serialize PCM recovery and preserve capture and playback progress
Date: Wed, 11 Nov 2026 09:05:27 +0900
Message-ID: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
It also changes capture to request-owned RX buffers so a valid short
completion can be appended to the ALSA ring without leaving a gap.

The previous version is at:
https://lore.kernel.org/linux-sound/20261109234049.79534-1-mynameisjune111@gmail.com/T/

This replaces v23 in full. Apply all sixteen patches to the base commit
listed below; do not apply this series on top of v23.

Changes since v23:

Capture now retains frame-aligned short completions and handles empty
requests returned at STOP or PAUSE. The final tail can update capture
DRAINING. A paused RESET observes the last committed position, discards
samples through that point, and keeps subsequent data at the matching
ring offset. The earlier direct/staged capture split is removed.

The intermediate bounds patch accepts a bounded partial RX response.
Initial RX reservation, ACK validation and refill enter together with
request-owned capture. Earlier patches preserve legacy capture ACK and
completion behavior while adding bounded payload checks. This avoids a
partially converted PAUSE path between the ACK and RX conversion
patches.

Playback response validation and pause progress are separate patches. An
invalid used length or device error latches XRUN without publishing
successful progress. TX completion caches latency without dereferencing
the ALSA runtime. Resume and failed-pause recovery schedule pending
progress. Limiting the indirect queue to buffer_bytes - period_bytes
prevents an unobserved full-ring completion from looking like no
progress.

Matched pristine-base and v23 QEMU tests reproduced the capture
regression and the playback stalls. The playback missed wakeup and
modulo ambiguity also occur on the pristine base. This comparison does
not establish the first affected version within the earlier revisions of
this series.

The final candidate built with W=1 without warnings. Cumulative stages
12 through 16 were rebuilt after the DRAINING notification correction.
Unchanged stages 2 and 6 through 11 match the earlier build inputs
exactly; stages 0, 1 and 3 through 5 have no fresh build in this
preparation.

A delayed-RX comparison establishes DRAINING before returning the final
completion. The earlier local candidate left the cached pointer
unchanged for a full-period tail or a short tail crossing a period
boundary, and left an invalid response in DRAINING. These six failures
reproduce across RW and MMAP. A non-crossing partial tail succeeds in
both versions. The corrected candidate passes all eight cases, including
marker readback, XRUN delivery and reopen. Cached state is sampled with
SYNC_PTR using APPL and AVAIL_MIN flags, with HWSYNC disabled, so the
observer does not refresh the hardware pointer or invoke ACK. This
checks autonomous publication; blocked-reader wakeup timing is not
measured.

Earlier R5 tests cover partial, late, empty and overflow STOP,
PAUSE/resume, DROP, RESET and reopen, plus playback accepted/rejected
PAUSE, immediate HWSYNC, two-period queues, stop-threshold XRUN/POLLERR,
and malformed TX status/length. The R6 change is limited to capture
DRAINING dispatch; playback and running-capture notification paths are
unchanged. R6 repeats the partial STOP, PAUSE/resume and reopen checks
in RW/MMAP. Final-source RW and MMAP captures each ran for seventy
seconds with RESET/reopen checks. All seven segments, totaling 7,104,000
frames, matched the unchanged independent sample oracle. Eight
additional final-source cases with stop_threshold set to buffer_size
also pass in RW and MMAP. All completed R6 runs used ARM64 QEMU with
KASAN and lockdep without reports.

A delayed-TX test observed completion, close returning -EIO and
continued guest execution. Its buffered log does not establish
completion timing relative to close return, and its backend hook does
not read audio pages. It therefore does not establish post-close payload
DMA safety.

The default RX conversion adds request-owned memory and an IRQ-path
copy. The capture_staging, capture_allow_short and capture_allow_empty
options from v23 are removed. Existing configurations using them need
updating. Packed status and RELEASE/reprepare pause remain opt-in and
disabled by default. The new default path, removed options and cost need
maintainer review. CPU, IRQ lock-hold time and worst-case resource
overhead have not been qualified. The playback queue cap reduces
buffering tolerance, especially with two periods. This revision has no
new physical VZ or KCSAN qualification; the earlier v23 physical/KCSAN
results do not qualify this changed RX path. Uncertain control timeouts
can still require device reset or reprobe.

I would particularly appreciate feedback on using request-owned buffers
for ordinary capture and the playback queue-capacity tradeoff.
Preserving full-ring TX capacity would require a larger exact-progress
interface.

The new STOP and pause fixtures are local and have not been published.

The pause option documentation describes the STOP/START default and the
optional STOP/RELEASE followed by SET_PARAMS/PREPARE/START sequence.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
