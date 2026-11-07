Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062068;
	b=fNMfuVFNaJVOEWhXTc2c/e1kZ1W1FEe/q9QPKeSLHH9Fxj1IML/ujAY8Knlk3gU0lJKw
	 QgPE+exSRquzRCM8cf1P4ZC6PQPtciRZfWNymPHfO9vhO4f4lt0PoGw9zRbKxQGhAwyz0
	 rqUmb9+iLcWz+mzrhk5s2WgOqTeZk1aTOL5YL5gmeCsDtEr06xYMmFNqnUubiHNDXiG1k
	 BYemoRh91zyyJtBb37Nwh6dR0uHLt4cWVktoE7R5DtrRIXx1Qw323pN+9S7s2vhEkV32S
	 gqpe1BC/5Bx6pawuMHqQMow/NL3Y+hoAcQs1WKLSLmdTkuihjRP2uzoh5zcCLifMk1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
	b=keGZoJWqbS7og9dOaS5BKxLGO8N8xBKmeRSxIgcucBWyCcZLFp+C/ZqVT17DNGP7N3S8
	 OGTu9Na6QxyOls3LexB7pKdcQweJU7rXCiMQ7VFhP0Kyh33YctH9HdekgIbuA25stXwbi
	 0txoahzURBQn0zcpN/7PdGfS1njzsoe3FvfvjEEjvqcPTLxc0TcNks7GMGFyk2s6SVqnP
	 wDBVwMKmUoKwTATNzs9kdgJWaYYlCyWZlVkkh8QpSTW52/jOiarB8z86pMTy6QuN2J+El
	 bVYoKLWKxbI0Xpz3054NI1RQhKGWCYSDFmc7lEsn4GEdQTsZjl82KCvRU5laUL1r7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="k/R8jpmf";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6D606D80D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40F6D606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k/R8jpmf
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37198ed3727so293221eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062067; x=1794666867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=k/R8jpmfOfJfq09NGfHnd11AgXL3mVYVqfHKIqKiP+jSRBnkcz02FmHvEadYIgV8yE
         0dPt1XcmXl13xxtkUH7KoamOPyumrG9iT4cnDz710OQTxc8VsmY6pPbKevs5sqkdyHLT
         WoEDw8boiklHcAwJ/TbZmknA/GYYb+gSDZ6Y2WhjO//yoOuMHWeQFUtEajTmMLDjN5va
         JWQwam6fJrEIhVVCalG18yHrb9kssQ15J3Zl9uOXmeoygSoe4YEk8N/QCW1afc5C0SBw
         n89oVoOijyMmneT80QZKwo72CJ7Vfti7v3wOXl556zYIOHeCwqwKgTrZPrgCMWdr6DtO
         9nrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062067; x=1794666867;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9IhTrICt6K+NOkiZzpJZQeSi8q6GVOO7e1Gifk4LmM=;
        b=jGVr9a7v5SH2FRrw+b+VLJlpO5wpg3MHBgafsutxU2QqMPSF4Q2b0BBZBFgWGA+ceY
         0ApWvNyzdMQFogrQugsjGmZtRz+qs3P60+EsNxmYmaDKMxYVWg3JXLhEUw0SpPYY7ltQ
         b9/p5C7+dMnmTm3sVYmgZwZIni2X/y0hAy7vb4QxzO1hmmF/GpSbL3veMLvomnA3zTZ5
         oOpqC87L1E6Tkxopnc+Rh6+eKwX34/sHcdrs95NJmUUUJhd5BMF+ChlmL4R287bQxb8r
         Tgr9TIyDH1rXWXmvXbo+r3TzzQyp8On0qEaQd4Sya08Q9B/VOv83MM0ae08uKGxo86t5
         oDJg==
X-Forwarded-Encrypted: i=1; AKwUvBwXhc6C0hFzonvjJ4RK1BI8uA+vLJe0gaUDLBZDzy4qOuLCwyDqzuVllC1OHSZX8NPhXJE9uiGg4e0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7yjR9zoQOm4kgmy2GWwSC+CNLO+8V4xSIIFhsVQ13ybqYWl69
	p9ETpMZNT4msXnYNTQECkqpD6k45SrfwieaV7iHyxSUuVSBO/JY6gTC4
X-Gm-Gg: AYBFou2BdKYry5tvzHU2p8BF3RjQPWiPj3ChFaIlO5MsuyadP/zUjxKKMZ/GAWrQMtA
	RWpNCsB4RjYsyl5AeWjyMXCHGa1qs+uE3GspENr7TUwNfeY80nJRs461Kl+DLGppgxxq8XcR9WW
	r6g0yS3RqXPoKrLL3/49jGmX8YZ/riTl9hgV1y4pcBD5BOMGguTLzKRXhuzWDd8zXkx6e0GI/28
	ZJxQoBQZ0zw8qfwvTYOHikIL6pVzR/n4+MmHTqCk2ReOcquCVz4xGc2CjCpJ6e1/gOW/jTFFxTG
	qUR4cx6pzFCeimvIm/UhdWMb3H3hE22hOD5sUbeQ/0htxHLdC68bg6QQX7N2m6wNC5vgKJpVmWX
	qey52mWev4lRg2JlpkGI8CgYZ5NhO1Zzz85Zy/HnS4a4VFauSPTTmxvw1UtxAjLfcIpZzsWAC62
	CInDiA8Yi4dnQCOGeAFcEMSyCrCam4kAUmG8jk2NulD5Dmw8DA7UJw956vf83ltSYzbEKra5fDi
	73llDgQNu+a+tGftrMmX5dIDqO0bKm9M8JoENB5nSOk6iz2W/itY9DO5PtKFzTuUO8c/MVD/8AU
	wN67q1y/cSTTWQWwKDfAWWyYBbNG1RjzQjYKjKakX+d33A9V50Ygt1jQsc7vVWAmdrzgclHFwho
	w7GUeLmHxS9oD/SbNxqcb9jAZv/v/HsSaa0ShogzVF5dzwA==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr3070962eec.14.1794062067100;
        Sat, 07 Nov 2026 06:34:27 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:26 -0800 (PST)
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
Subject: [PATCH v20 00/12] ALSA: virtio: fix capture accounting
Date: Sat,  7 Nov 2026 23:34:10 +0900
Message-ID: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

Relative to v19, patch 6 moves the virtqueue initialization summary into the
commit body and removes the unsupported event-message ownership claim. Its
source diff is unchanged. Patch 7 also rejects ordinary indirect capture
appl_ptr advances that are not aligned to runtime->min_align before converting
the frame delta to bytes.

Validation:

- The final ARM64 W=1 build uses KASAN, PROVE_LOCKING, and LOCKDEP. The
  cumulative stage build checks patches 7–12 incrementally.
- A synthetic exact-validator case rejects an odd frame delta for 4-bit
  samples before indirect accounting changes. An aligned sub-byte delta and a
  byte-aligned frame delta pass. QEMU does not advertise IMA_ADPCM, so the
  sub-byte case uses synthetic runtime geometry rather than a real stream.
- An actual S16_LE capture accepts two half-period ACKs for one completed
  period and then recovers a full-period read.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-segment oracle matched the QEMU sample sequence.
- Inherited v19 raw SYNC_PTR and paused-lifecycle evidence covers the existing
  accounting state machine. The transport timeout and PCI evidence covers
  unchanged control and teardown paths; these references are listed in the
  manifest.

No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261106161838.94308-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
