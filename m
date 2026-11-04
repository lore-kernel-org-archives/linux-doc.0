Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758673;
	b=V9ABbO2eD6JwN9LjrTVVODAbGGTNE/qaPUbaxs0YUUk5k9hPcn2nsulx01dfGWDT4Ynr
	 wstT87PfcN6eu0Q+TjMcDKHRF3Jits5VnpWvEHyEQU7gRPyo1DjB/z4B38zq0+8PpBDcM
	 StcDAvrInjQbxisk2DdeM3ZiFJ0b2NHZQOVqlZ0UoDDeelbgV543EyfQdPK+urJ1KkLVe
	 Fgy72b0gJVCVHDa1q9a4CACdpe41DwK5T4bMZAXnIJKSr88TpAoYVJAXftHeXqQVYTWGz
	 WNJ7M5muf9CdbdSQlrGq7spridE09VpFeQKAbJXG3zMQUSpjuThne5j2L7+5lQtF/5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
	b=0a2rS1S+sO+S/jdDtSt2L7hlMSuJHQvgeCgi5vKKs8pFGvQBzOjNChJDIptZORIFKoeF
	 Kap24eG5ABNX543K5/D7OYRe21H163KApOv0+AnfqcR/aU0taJZ18KRr/B96Q5RTKM2w7
	 h8wNCT2GFs6nn5YPRFudpoedRbSIOtEiHrYOpkYsHNBcnPK473dRv3f8udiFrdRueb7qs
	 T3HlSExdY3FXOLv7wxTm7d23qmygJhiuUuXVwOfC5Ly692A2UpuQCLkXUmMqDZM8hJotw
	 xjDFs7VsWV5/oLq9ylyBmHsk9atYYU7uzEEkQFwsOT9D0xxAz8iS4zxJJSye0qsCtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M+EClprh;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB921606A31B
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB921606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M+EClprh
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a070755c8cso135827b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758672; x=1794363472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
        b=M+EClprhYi+x/aX7h9hnE0QRdMZYpjBdbB9//qVL2E/tWcV+hqL7HpUZl4HD/l8fmU
         yrov/g3eNNWlu9xKNTNXieW9VIWGMGhZgMGE1uohAQiLHZY+8F4QsRuhAU7Q/LSmJAdG
         gS+v6TPUaKcO/TKH93Af1wtCrKeC/FNbPAwXpwo68vrbw4GB3yYTAIdiFIjCTtht8XJD
         AsIeNdMHFFcXqjZ2j+Pi9U36TU2kDD7GtzcveINidgfevSfITK6+ew9NbzQKL0cFQdZf
         BuTvnnQTqHBP91h32T2Y8gkrtlZ19cflNVFD963jajUL8gJsJ7hNMntSxwavec0y6TJD
         jIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758672; x=1794363472;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSQ05M0oQxNJQnOx02JpbWwvcminebtNWNNkIq7Oztg=;
        b=G4cC7xlx5iTvxfMY7ZLGOlosFOuLKf8TSjt9cK/mOH5AODZpt6we7Pq3oUIKFpAEm7
         JOO04qROJqLMwrMGaQ9YRkaaw0WRkCZCvivMCzmwJrfeVGeP+9u8Udywou897Fw46ZjU
         ls+9CnKIM3sCXODzKwTEcCXfT/Ci/BfYw2nsLWLYoqdX86GX7bRek9XF7kb1O3bbAmds
         b4GsLmGG5v5gCsiNQ7n5867Sffbr9w0SbOzWBHYFn7GDVJOePqwc1MjAOkn2P+hGTlMv
         xBK9xnp8VwHO1yxVTCwWmFEPjzi61tL60hwtn36Vu4fXx8wXF0DUG8nszSdlr3u8ar3S
         U/Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwcTvIO8BK6irJ42jQwoeGejx6WlMaWlPYYWnl00aIqOqF9F/b9vHsbyEQZAtJ0np3/QTJhP+dINfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vo5bZw5lAGPYHeQIkpA/Zc9oQiJOaOxmGqzFeLIafGKpAPyng
	SCHh5yKlyE+d6gafFBr7VZDpuW1/Mu0cvvHv+AczMLZB5JtuKL/CTkIbW1s0vg==
X-Gm-Gg: AYBFou1BmZ7g/adRbB/asnLZAFlqsZ4NWSrgRTFSu1xtv/l41jHLFtUbPMzp5ygBR50
	yYGQ6syi7NPrLprAlghorrDDT7oZnYtcU6SfULctx3IF6/n7DJUFyV8bEnTu+t+yGtCzHzxwh5l
	QKEjvb7iA6PhfKpeFlORX9X/vOvtIupZ6nhhqBinvFewjpwT+5gE1ZURo1ERh4p9PC17ZcP/ca5
	f1RSlNhgz1tBkMzQVsu1GN/JdFOvBAP1PEs7IYbLj0ffFAjq/oJCchr85X8y/IQHaCSj07XyTMM
	uCbLy24HIzNeXu87Bb9oS+NXzGRNqsEtada3f1MPx2BwJ2LBtMeamM2Wg95/jN8YtCWAgwXIVw2
	lmtPRQUQCyLBRd6QVZPOxk0sCHd689Y+VVkiG3Tymfsbu/ztdkX4ih3rbSSfdKby/eVMkR799n9
	B/kLQeZAQiRLY+5FIWSkvgQX2rCiZSZ5wKuEpJWnUsXkb0i9/2flxMGuURXRwAIBZo1c4rLHUm5
	MX6GmJDP2EVkkiLG+aJkXRV7cggIVAYvfQ8fb8DHFfy7kDAY2bQ0NF8M23xMW8+kFx2UdvRuHvw
	0rL6NH49QBNXeLux4wUURxMeZcQPCIA7SmKA+W7DnP1zgwK6Dm8W5V8+IFDOXWHxZNqiiUQYr2q
	RiG6nc2uxoZp0bXH/Bhd1s17Nm9szWKWLLoOOBlK3EcP9EqkvnW22hbzarNanub6+9jKOwA==
X-Received: by 2002:a05:6a21:4903:b0:3e2:8fdc:a6c4 with SMTP id adf61e73a8af0-3e928d14803mr13026535637.31.1793758672044;
        Tue, 03 Nov 2026 18:17:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:50 -0800 (PST)
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
Subject: [PATCH v14 00/12] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Wed,  4 Nov 2026 11:17:33 +0900
Message-ID: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

This v14 series replaces v13 and applies as twelve patches to sound.git
for-next at a4311e9447bbb219044db38897f95be112f46a8a. The patch order places
the ALSA PCM synchronization prerequisites before the virtio ACK and teardown
changes, so the driver can keep ACK admission closed while the core resets
the PCM pointer. Targeting 7.5 or later works for me; I have no urgent
deadline.

The changes address the 16 raw Sashiko findings from v13; several findings
share a fix and its validation. They close ACK admission before teardown
waits while keeping prepared runtime storage valid until device-owned capture
requests drain. They prevent event delivery before ALSA objects are ready,
preserve XRUN state through recovery, and keep capture accounting consistent
across RESET, short RX completion, sub-byte ACKs and NOMMU post-STOP copies.
Failed-probe cleanup reclaims event buffers without dispatching them into
uninitialized ALSA state.

Playback RESET returns -EBUSY while TX requests remain device-owned and leaves
the pointers unchanged. DROP/PREPARE retires that generation before retrying.
Linked PCM RESET retains its first-error and partial-completion behavior.

Validation includes 21 selected QEMU runs with expected fixture exit codes,
module hashes, unchanged inputs, VM cleanup and decoded kernel diagnostics
checked. The callback boundary suite passed 24 cases; ACK/START failure to
DROP recovery passed 18 cases; the forced ACK/teardown race passed 12 cases
under KASAN/lockdep and 12 under KCSAN_STRICT. Fourteen ordinary and staged
capture segments, totaling 14,208,000 frames, matched the independent sample
oracle.

Separately, all twelve ordered v14 stages built, with the recorded source
hashes matching each stage. Four targeted intermediate-stage QEMU runs matched
their expected exits, module hashes, unchanged-input checks, VM cleanup and
quiet decoded KASAN/lockdep logs. The linked-peer checks accepted baseline ACK
3/3 and rejected candidate ACK with -EBADFD 3/3; three control cases per
version and six candidate recovery cases passed. The stage-6 event probe
dispatched one enabled event, blocked pre-init dispatch and passed rebind I/O.
The stage-7 short-RX case published zero progress, latched XRUN and reopened
for 96,000 bytes. Capture-stage host checks passed 15 assertions across
stages 7–9, including the teardown gate's prepared-state lifetime.

Two physical VZ runs used a Samson Go Mic at 48 kHz mono. Each run included a
70-second capture, three five-second reopen captures, RUNNING and PAUSED
RESET, and normal shutdown. All recordings had nonzero input and zero XRUN
errors. These VZ runs used the experimental capture compatibility flags.

The NOMMU post-STOP path passed 22 assertions in an extracted-function host
shim; no CONFIG_MMU=n kernel or device run was performed. Event admission used
synthetic events; physical system suspend was not exercised.
Docker Desktop, other input devices, and broad load or format coverage remain
outside these results.

LLM assistance was used for review analysis, implementation, fixtures and
this explanation. The patches carry Assisted-by: LLM.

Previous series:
https://lore.kernel.org/linux-sound/20261103080821.16983-1-mynameisjune111@gmail.com/T/

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
