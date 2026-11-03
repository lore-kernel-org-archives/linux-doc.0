Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693308;
	b=b0Tb2+bjgCipN4TrJpNpq8y4w6UqeB9ECjGkQVfNFdvoVUyrSXP82g6natQ2VmurGLXA
	 vWPyf2Fry+WXT/OLSQBl2LGH+kLs3c4AD8it3VJKcw6BK93naG+PBR4Q2mP4DJAC0k1Xp
	 56p3E3J//b5nyV81RWuxvZ35PzDlphFRiB9u7zaEU7ZvB0VqOd7TO/VPNT+vePYxi1sJP
	 aETx+HG5g/TIF3xKslQAJwsmI8CUKUB/npvkJ2MgD8Bkyhj6gBLS3fZ/bWVh4KXtII347
	 sep2ZIilL4gzXkCV6RB6Z9XCUdCfEB6NCNl2WoJng67BJMho1Jbhi8opqtIuvLNGjAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
	b=NRnLAOjmB3JqztbuWUB7FTzcSufdlvohDRWtJS+2Tm0+KU1v2lEr3c7NsCj+YWNEeXET
	 DlF9+2Me8KHIZpbqU5BHxDaRI3CGGO5hnOiAV/EnqYHFxivV6SL6/dpQWkYMX9S+dHwql
	 +62D75ykk8Rv9fM3XfKETV8uSm2MNRR01lzOY3e2+tq4X/K5X41ehhC26BbSeUIOunRDL
	 IMNGYxA0xgJwo+3AHegLDh0ZA+0kupTjc85cBm1K03Pl1Mlbu/RwPPdrLR1kHsaCHI6cp
	 Vi/dipBk5P6BwVjTlIC2EX4OwRgjFryXpZ8fyYnYwJEq31WoWkyHrGeuKJm3tl1as7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIDvOHiQ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84269606A335
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84269606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIDvOHiQ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so512421eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693308; x=1794298108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
        b=gIDvOHiQA62EY0OhRERy0FS56JN7ggqgiTUAPuG/rYwzPoBp9Cc8DWwLPSFzb5i05z
         RlaVeBWgolcZC9FOZf2wQ66AUMiC6yDX7oa8gqO06N2Gvzh3TmFj5iqWkdWxajc2uGFn
         l8iUxCLQ0+H+Ot3L1usXT7dGPlHaW7HZcEbLlMgjZSYk6KjdiJHC6Q8V0uFaDP9WOLuI
         eua1JgO6kHawTnir8t13F+GYAd16WxWM3G/sr1uytrLegMjAohjoxLFuTsf+PdjkQJ8O
         fGm+rHRZUiFCxhjh36oRwjCXq6daVYxPlSkM4ZH0Ar9LrCUzCDx+HHHHlyq11sbN1vmL
         T9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693308; x=1794298108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXz+ijE9EUDzSG+3qju7ZVTn1bPYlfF6y8GttsYWRPU=;
        b=QY7KKgAJpZMQxUf1ICsMyTaydHPOod3SnRSFQFRU3A/1fi/8cssZlq6COlOMfyto22
         mB5gJi/B4iWqqQKYMaCmevz3DFZz1ex5QqpXgeJ/I2DCTgjCn+MPGOImkb160hBFiIFb
         oPLgVA/JN8vwCwcwhJqg5mfZxQkcFwaqqSkC15nXH0pBYfVo1RXzKgrxI5aaiQGbf7hJ
         BTc9NkSk//5OVWx8YzkKoDHVWtskkXEl8xP55FLCdU4kRe7oeArmgJP32hS8ZBviIHFy
         Ud4AkhlyhpSwlf4MjBSIOG1wq3LaaXt76cpsomHfRm7RbEQqURaCZyRxSvbZHLsFjza6
         +VlA==
X-Forwarded-Encrypted: i=1; AKwUvBw0v0w4KGQJ8JvupgSt3ifGEv7EJlOZhSy5oJL90cQTwqrNjwWg16Hcz/m2cwazdbbiZ8MFCmI9gzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ec1Kb7uVWYNOEn95dm2GieLLwsoXAAWQi1+cZhqbmJpjLF9XS
	BPhRyKT2Cn89dZ5rnn9k9MAqnYTofT7oz/rY/0IngPCGmuFBfCP0+UaEs2mGaA==
X-Gm-Gg: AYBFou08e/6+EH9+bBJtePUrHt4OXzy0qYiJnE/02iEbcjpJbbRQTN1ae9YbIsHiCv/
	Ja6GgV7Pho2t9gkU8ioe2r8cae0+mKtWd/7mpIuMTXZFg460kDom/P8VBhA3aKOS7Bf4Mbcfolr
	Z99MIxg7D0XZKcjkW5s6qEFuxc0opKUm/xxCV/E/7byG58o/D6MMvLxFLqbtyh2YSOqcXoojXrF
	eiyLFZ7d1pPVfsHbK1CrQ82QphGxwqoDY1PWr15gX+2KBm8VQgSQcLqBKXRGq3453G7Al0b5G6K
	w0HveoVdt73eaXsLu8uAjf9SJt6dTyLujp/G+A9YElsEpuDPTKs5EjHbzrmv1nI+EUiIBRruFk3
	icUuCGDOzOhSyEeJlRf271UefTvTRuv4NrnMJIVbWF/TmJLbqGkeYc11oN5y96rz4b6T288i5JL
	kjRGaWkExd6BnvnFyrODLaWR5YnrVquoQYa3yNJNQ+QGAN6lhGi8z9dsVP5cidBamfjPG9hrHG6
	/VeSPkdgn8zVvhCi3KE51ZDSn4JCWd0eu3nFptI6M64wspqKu9K9jvP1dIhhF3LQzfRO4gRuGWt
	WRKEVdcmNMG3bO64MNLu5D36PsqY+ePOfkMCNZenh2HFEO8rFBz+2dBehTgrnpvp7aBsh1ON4Um
	hhMmg/tiyYLfvLeiLrStjnpCmXT1W4zZcp9/ycWr9rXmeH7k=
X-Received: by 2002:a05:693c:2184:b0:36c:9a25:8073 with SMTP id 5a478bee46e88-36c9a2582e2mr543808eec.2.1793693307306;
        Tue, 03 Nov 2026 00:08:27 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:26 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v13 00/12] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Tue,  3 Nov 2026 17:08:09 +0900
Message-ID: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Hi Takashi,

This revision addresses the v12 review and Randy's formatting comments.
It replaces v12 and includes the unmerged prerequisites. Apply patches
1-12 to sound.git for-next at
a4311e9447bbb219044db38897f95be112f46a8a.
Targeting 7.5 or later still works for me.

Previous series:
https://lore.kernel.org/linux-sound/20261103000403.67106-1-mynameisjune111@gmail.com/T/
Randy's review:
https://lore.kernel.org/linux-sound/dbf3b343-0af1-4297-b78a-bed68865d59f@infradead.org/

ACK now checks the PCM state before changing transfer state. A raw
SYNC_PTR racing with DROP previously changed SETUP to XRUN and re-armed
stop_operating. The correction preserves SETUP and rejects that ACK with
-EBADFD. Event callback admission is protected by the event queue lock,
so a callback pending at disable cannot dispatch into freed ALSA objects.
Enable and pending-event draining use the same lock.

The prepare gate is cleared on failure and device reset. A successful
hw_params clears the suspend flag, avoiding a second SET_PARAMS during
prepare. Staged pointer queries reject unavailable epochs while retaining
the released paused compatibility case. Playback pointer and ACK paths
honor latched device XRUNs, and TX completion preserves the latch. The
pause compatibility START path reports a latched XRUN as -EPIPE.

Staged ACK retains an unconsumed sub-byte frame for the next complete
byte, including appl_ptr boundary wrap. Capture RESET completes the
private cursor rebase on error paths, retaining the XRUN latch and
notification. Synchronous teardown owns a balanced work disable until
the next successful prepare, preventing RX completions from requeuing
period work after cancellation. The last completion always wakes the
release waiter.

Playback RESET changes behavior when TX requests remain device-owned:
it returns -EBUSY before changing the pointers or queue accounting.
With no outstanding TX, it rebases every indirect offset and clears
partial message fills together. DROP/PREPARE retires a busy generation.
This affects playback callers with capture_staging disabled as well.
I would appreciate review of this busy-TX RESET policy.

The refined partial-period test demonstrated why the accounting matters:
a 64-frame partial write before RESET caused a later 960-frame write to
submit a 1024-frame period. The correction waits for the remaining 64
frames. Linked RESET retains first-error and partial-completion behavior;
both member orders and group prepare recovery were tested.

Full-ring capture overwrite protection remains enabled. Delaying RX
observation can overwrite the ring before drain. The candidate still
returns -EPIPE in that case and returns the correct 64-frame tail for a
normal drain. The post-cancellation worker issue is handled separately
through work lifetime management.

The suspend-flag findings share one correction. The playback state
finding overlaps the ACK/DROP correction; its remaining XRUN handling
is included here. Capture compatibility options stay opt-in and default
to false. Every patch includes a diffstat, and the virtio_snd parameter
entries follow virtio_mmio in the documentation.

The series layout remains twelve patches: request and DMA lifetime in
1-6, core stop-threshold access in 7, partial-progress notification in 8,
the optional PCM reset operation in 9, capture/lifecycle/RESET handling
in 10, work priority in 11 and parameter documentation in 12. The core
source is unchanged from v12.

Validation selected 19 ARM64 QEMU runs with KASAN/lockdep and separate
KCSAN_STRICT tests, including expected-failing original comparisons.
The correction passed native and pause-compatibility lifecycle tests,
prepare recovery, reconfiguration, XRUN delivery, repeated teardown and
both linked RESET orders. The staged 4-bit ACK and pointer/error-reset
checks call the real driver functions with isolated kernel fixtures.
They do not establish negotiated hardware IMA_ADPCM capture support.
The suspend test models the flag before real hw_params calls.

Uninstrumented ordinary and staged capture each passed 70-second RW and
MMAP recordings with RESET, pause/resume and reopen. All 14 segments,
14,208,000 mono S16 frames at 48 kHz, matched independent sequence
hashes. These results cover ARM64 QEMU TCG with two vCPUs and 512 MiB.
Physical VZ/MOTU, host sleep/resume and broader format, channel and
architecture coverage remain pending. No general high-load scheduling
improvement is claimed.

LLM assistance was used for analysis, implementation, fixtures and this
explanation. The patches carry Assisted-by: LLM.

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
