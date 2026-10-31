Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412541;
	b=4+hUrRjnlcDWAF3lHbHkwOqNGPzASuCyYb+E/b10WFwtp7eYoRAcU0Fea+q+mxvkcoiT
	 mNMFJK5BFUcLp0EIBVZ7yGGsw6qHytaXPFXfwAAa8hQujVMkAdNOeJPFpAvCqIlbgnWS2
	 L9J2RaQYkAPEWPbQRyDuvpBuLJwdZhaCgez3bm1BqJRkj4XZHXykTJy1s6ErBTJCoHwo5
	 WyBmr3KHL1oAk7RuAHMB4gP5s3Shuv64YGZWYUFCDm1F5gvjHmDFRyUifB7zSC1ndSpEo
	 Fbrse5PhdECEtQJk/5yQbjPYigXCQ8ixU0B8G216mMUDkWJgRg+bmaePouL7S61ahgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MVIovhDLIigdwTu9NQZWopzkWwc96koBWGrzGbTR9UU=;
	b=CZ0DqfgJ/yMyI+ipR4ZZYielKXT4xY4GZpx/iI8S3zwtNUGi6grOZo6oO0PvPmg1wk1I
	 6/7fENRRkTYMsK+OPvUsqx/R5V/V5C+yO8c+mEnwsHILFcy8jVFRsVB7RhPQdyxDdpCPZ
	 j4+uUR3BEsN+7oYRJE8y+b42sFg81Q7Z9fCJsydfPmpl+HcbS1Wkz54kL/YK1AbRHK5TQ
	 tECXCKiBgeImSdfqYoB5vPhfWAuHCG8Q4MM7tiAJPveVU2BL000tzFNY8ZnkI360EaZ5F
	 MEncqPw+n2uydDbjzKmBXDJsc/X/Ri9rB3PqQE7IngcJkcdqX5QeMjg23GXHM/6CjHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M14cqGGw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B1B606A31E
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23B1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M14cqGGw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a18fc7a38so635738eec.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412540; x=1794017340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MVIovhDLIigdwTu9NQZWopzkWwc96koBWGrzGbTR9UU=;
        b=M14cqGGw2zK8bMlycZrW+Fj/EPdghAzZKOTj4bFkFyjqR9IJ0rSPgk6DYIQwtSo/5c
         hYj2BGSDn8CtZ/quVdYYeP7rXYsDdOYM4ZJZUBgCE9iX3eYwuZ7j6KfUG/KvjMjiwwbu
         WYtmSyH+ec1GT/CT1xIEOJ1XixwkWWmbnYY41LTWgwLGj0R/WajS0eENf0x5/k+dV6LI
         xwFEl5JnKKCHZ4hK0UU+Mg9HPuQ6XThAO6bldaCwPZJafjuZ0njytrwhzOmHO1U58Ho+
         AL2mQ16OCzfwQq3JmRF3xvl5/JShaGYfEDEiK3B1Iz57NzlSzOpwyKzQ/OqVJ01/vFbC
         Qqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412540; x=1794017340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVIovhDLIigdwTu9NQZWopzkWwc96koBWGrzGbTR9UU=;
        b=dr9oEhma7k+BeLORCWCx7Akl0E2q9xkpszMGQDddYzVVLv63hLrXb7+qW+SEzTiDiH
         L9Yf3Ypg7lCHnqrwAu3vqBW4C4eYuBK0MChHxszyOdxD7dUbTfC9K1yiqo8/Yh/sVj0u
         TpgC4TTyu35fF9APWry6aqz2Ek66k6Fb+vQ7pdj4V7K/81fuy4CeUhg+c3FLjAxmp3QV
         dAZrE3AZXYMnlB+2tUe6Kmhw0HRgPYxqWGF6sToeqB2ROkHVENpC9WqhbRJTQohfyuiY
         pSN6Ds9PeUBJTyD2WZFB2SkF+cpobDj3OLT9rGmQ3nn1zmBKO3EbJwgVZD9ls2MqjkPK
         towA==
X-Forwarded-Encrypted: i=1; AKwUvBwsXDldZtNhYrVZVObHpJHAXbPOdMNFM0MDPCsfLCvLM3lXs8yRc6X9773y80SXZybsjsNsJFdx8Nk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoCEupNM3vlzUnAbW53EiHBSMReglVuZy79MN4eKn/xQ5PIaxa
	JdW09SsdkVHXzJSf7+VgOvVsoP9djfNpnqSvVp0ih5ebGO/14mw0FZ/P
X-Gm-Gg: AYBFou3TyJBC5r0IikpXPiOTsqmO/4rFwq3n6Z4P7aWWKPyIQzuQ42nhkcG7FjWmedB
	874yLulszKsK7ENHgdOGe3b0zw5nDsdvIm0xtVazxdoyEqBfFAr03pniGbTdnwr9/+YMWSBodF5
	Ktoi2kRvpW9AHoDEsQ+kwgnbLcZxJtvyKAlBM6XEv/75Mjztyhqk78OmO6dZAjwU6Cg+SwOX0Ak
	smj+Nsv3O+eJ+H4v7+20NVcZ6mmnnQFV8qY7uJa7+KBZrL6rUKydiTu0H6GDgLsxsS+vE+rEyfr
	9J4bP2Klzpqo85zs+Y9Cv6UvAIvSMdje0+cjfMHY4BOLs6E3nQ3kXIoodPzIRS53ZN17QiCvGHr
	5y7fQrlWgk0DtuyMuwekW04cByc+9/zzVwEiZDYI3nAE93rVgLp7C1h+sdP9fVc/+IgcpEefi2Q
	1nYAt3BSdFWx0BmXGDsNxNgBSbW779gEB/hm9SuHbvfnZ/pjxK+dkG78YwLty3tQ9BSF4Dch+vO
	6GLcrr8JxkMA1U2Vlt7L5nrLQ1q1vF8WZBcCRu2SenBAjELp1T98GekpRhmTNMDtFM1Rx/PjVet
	t5+pQZq7IysPZjhYO3cDDjfdjzU3wG8JSlKx3I4b2wuyJHK8v2Dj0pgbP8d1sMVH0COQK0QXHzk
	l/XVVjmZaZSlzxQCG1f/rqB8v4sfp7qmXfz//nRVya3BpCQ==
X-Received: by 2002:a05:693c:880b:20b0:369:ff7d:840 with SMTP id 5a478bee46e88-36a423e3607mr6346423eec.21.1793412539983;
        Fri, 30 Oct 2026 19:08:59 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.08.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:08:59 -0700 (PDT)
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
Subject: [PATCH v11 00/14] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Sat, 31 Oct 2026 11:08:41 +0900
Message-ID: <20261031020855.2402-1-mynameisjune111@gmail.com>
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

This revision supersedes v10 and includes the unmerged prerequisites.
Apply patches 1-14 to sound.git for-next at
a4311e9447bbb219044db38897f95be112f46a8a. Targeting 7.5 or later still
works for me.

Previous revision:
https://lore.kernel.org/linux-sound/20261030052629.27742-1-mynameisjune111@gmail.com/T/

The series adds staged capture accounting for shared clients such as
dsnoop, lifecycle recovery, and synchronized PCM RESET accounting. The
capture compatibility options remain opt-in and disabled by default.

Changes since v10

Sashiko raised nine findings in patches 4, 9, 12 and 14. This revision
folds the corrections into the relevant patches and carries the queue
retirement checks from patch 3.

Patch 4 seeds ordinary RX once per prepare. Native STOP leaves requests
and unread samples owned by the current ring, so resume preserves them.
Consumed or discarded space returns through ACK and RESET. This avoids
inflated pending lengths and resubmission of unread DMA slots.

Patch 9 restores notifications after rejected native pause and handles
both success and failure on the already-running START path. Ordinary
capture now honors the XRUN latch in ACK. Its monotonic completion count
also detects a whole unobserved ring and reports XRUN for prepare
recovery. Capture completions preserve the latch from this patch onward.

A first version of the recovery notification exposed an old ring of
samples after paused RESET. Passing every wakeup through period_elapsed
let ALSA infer a wrap without a newly completed period. The worker now
uses the partial-progress helper for synthetic wakeups and retains PCM
timer notifications for actual new periods. The sample comparison and
a periodic PCM timer test both reproduce the candidate regression and
pass with this separation.

Patch 12 removes the second appl_ptr assignment after a callback member
has completed prepare. A linked member's prepare can sleep while the
first member accepts SYNC_PTR. The callback path now preserves that
acknowledgment under its PCM lock. Explicit RESET retains playback
silence handling; prepare leaves filling to the normal START path.

Patch 14 checks the existing XRUN and lifecycle state before mutating
paused indirect accounting. The RX queue and substream locks cover its
pointer observation, temporary accounting and refill. The notification
floor follows the RESET observation. Refill failure retains the existing
zero-return policy while the worker reports XRUN and prepare recovers it.

Patch 3 retires each queue wrapper under the detach lock and checks queue
identity in PCM, control and event callbacks. The proposed detached-ring
IRQ failure was not reproduced on the tested PCI transport: forced
callback tests passed on both versions. This part strengthens teardown
ownership boundaries; the transport reset callback synchronization
contract still applies.

Patch layout

  1-6: ACK errors, START/RELEASE recovery and request/DMA lifetime.
  7:   Core stop-threshold accesses used by capture policy sampling.
  8:   Partial-progress notification under the PCM stream lock.
  9:   Staged capture, shared capture policy and lifecycle recovery.
  10:  Staged capture work priority.
  11:  Capture compatibility option documentation.
  12:  Optional PCM reset operation under the stream lock.
  13:  Staged capture RESET accounting.
  14:  Ordinary capture RESET accounting.

The core API additions remain separate from their driver users. Drivers
without a reset callback retain the ioctl path. Linked RESET and prepare
retain their first-error, partial-completion contract. A zero RESET
return allows the core rebase to finish; later I/O can report -EPIPE and
require prepare or reopen. The internal snd_pcm_ops addition requires
out-of-tree modules using it to be rebuilt.

Validation

The functional candidate passed 23 ARM64 QEMU runs with KASAN and lockdep,
covering error injection, recovery, reopen and compatibility tests.
The core fixtures covered 72 atomic/nonatomic, callback/legacy and linked
failure cases, including playback silence. snd-dummy and virtio-snd each
passed three playback/capture cycles. Additional timer comparisons kept
real period ticks and removed the synthetic resume tick.

For both ordinary and staged capture, an uninstrumented kernel recorded
70 seconds through RW and another 70 seconds through MMAP after
PAUSE, RESET and resume, followed by reopen. All 14 segments,
14,208,000 S16 mono frames at 48 kHz, matched independently generated
SHA-256 values from QEMU sequence metadata. The oracle includes the
intended RESET discard and backend epoch boundaries. The earlier failing
candidate and its sample comparison remain in the local evidence.

The paused interleaving test verifies the new atomic observation
boundary; it does not establish sample loss in the original code.
ARM64 W=1 Image/modules and ARM32 LLVM object builds passed. Test hooks
remain separate from the submitted code. Each mail patch is applied to
the pinned baseline and compared with its expected intermediate source.

Fresh v11 postimages at stages 3-14 built without compiler warnings.
Nine additional stage VMs passed, including eight injected recovery cases
at patch 9, staged native and pause-restart capture, and paused RESET at
patches 13 and 14. All six additional MMAP segments matched the sequence
oracle. Neighboring patches have refreshed contexts where earlier changes
moved their code.

Packaging also adds braces to one existing staged if arm. The new module's
executable, relocation, data and symbol sections match the tested module
byte for byte. The fresh stage tests above use this formatted source.

These results cover QEMU synthetic input. Physical VZ/MOTU acceptance,
an independent KCSAN run and broader format/multichannel and ARM32
runtime testing remain pending. The high-load TCG scheduling results
from earlier revisions still limit performance conclusions. The new
ordinary full-ring check reports -EPIPE where the modulo-only path could
wait indefinitely. The core progress helper and linked RESET contract
still need maintainer review.

Coding assistance was used for analysis, implementation, fixtures and
this explanation. The patches carry Assisted-by: LLM.

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
