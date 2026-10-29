Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263839;
	b=SiAHFkiMmwwVvsnmbja7tEOwee7ZKVrZzaO8wWPgQYjfYT+09cibVtq8Y90iDErLvAGE
	 osIE0qiZ+tVZmxS+xJ0FU3k7ndY5EAsIfwl8iBCsYOrrAJTnaODJkjEJnhA6cViBDHNFz
	 k0l5WAjuuu7msNgrlXYayPOrsOI80P8EYlXWjuR3e8+YQopL2FJRVDgJSx1nVGP4LUZ6P
	 BdiEEtVJYFzpTeg4Q4r7TKHhK3cTz3wnhtRcbB6tZ9UTXm6ZsnBIqwlo/WtAknPzhK3oG
	 D63ahAEbh4J8Bfdr5juZSKHwN1A/9qbOcqevayHeW5YM7GLCkdA6mOZynzszcqJtoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rK3sC4K0zeBWZNuCTD+FoSNFp2fytta2s77PkmNPweo=;
	b=zAiG0j8JVM+0FADzAuDJhpxxVCDnLuFP82hpm3j8B2YVn0z074+tuBOgLQqMDA3YbU3/
	 hIUZLSp/W5A5EEmB+w9GJKDu9czc1tybGo0pPZdygA6h51SocszIW4v+o4fZwICdGVhdt
	 pvWgfS7DjlThe7wHSF2uFA6yN/2qj46kPFZFpSldKcTaFdlbm+jaioj0/9ozFlr9Zq3df
	 lLGKiRg0NWJVNC51SQGLKm7UphlqCRKYf2/T/e71DbkNT6maXu2afmEKfV+8k9Ma2YT/y
	 va7dJKs69AGi7PCFwYWEfKQs+7f6VOjhqGtvQt+AcsaMnkdxKmmJ9GTZG9WZ79V3GXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJ5xarKs;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2846A606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2846A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fJ5xarKs
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso10085315ad.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263838; x=1793868638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK3sC4K0zeBWZNuCTD+FoSNFp2fytta2s77PkmNPweo=;
        b=fJ5xarKsXqNq6C5hHG6IpwtTVa3tx/PGiPE7zpISJak6MoHGqyMatMKBWP6I7DH13h
         SJFNuWLrlOLpM/3QHTXqtu4NN6wWJgtev5AWI8mOUE6AMrO6WXp2gYGaEK95/ZQ/d5r9
         6jQjX8zgbBI+/RKP2BTWM4Gm5YsDixP0gGXupkzuX0ClGmutm72uLQm5IvZ0lYMOg0Mz
         d9zlv6FatHNc8bRPM7pBHH2Dv0njte2YBijomaF2SbJ02rsP2ZRlPJYUqUVy+ltheYnk
         Lp5pMmKQAAXC3yV0Li4W46V7kWMDJgvLgo2mpKQE987XRTbP5hDNSvduVlx+lPZD7e3o
         zXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263838; x=1793868638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK3sC4K0zeBWZNuCTD+FoSNFp2fytta2s77PkmNPweo=;
        b=R3FcJrDOX8JK3Z4hXQ48DJGoTb5qWBVQEdj+5xkjsvXCwaXy/6JRPp0eWy2WJkF5yC
         qJP70yyy8TYmiQmT9odt+8D1Kv5uiVv5knTezU0Cn7Qh5hS4+NRjl/LewVL58Dx4ZzzN
         DAggeDngjfGwNFXFXpwhO9/M2ckW5qfHSfx7fBBS1qDpKpNqn7a2cmOEzF5ct/dhn3I+
         f8CzkHKdeIFbm83/M4jrgKfl4nE/gFWgR1kHVJETox7Phi7HL3XkCBY2qCNAAFp0da5j
         tKDsbOXZ6PDO0ohrGXWKpoJvwk+jfDhPArKtzqcGX9hUvWVBwzNTTv4gvYiejMrqVhvS
         ff4A==
X-Forwarded-Encrypted: i=1; AKwUvBwhcBGlAAAcANlFQbwnWbvWXLI//Mp2Bf/DQyR0HWDkRLb99NIqItb93nBqGuFe6mRIc083k2QjaJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtck4l1fmHOtR1xO4N+kCkc+BooOgvlA88I8SXbmuDyQuHvHJq
	eWEJr1TmQ7eqezm3oIpW268ZdmeIJnAdOkJ/ljSHyQXygZ0MCXu7AMzj
X-Gm-Gg: AYBFou27v2bmtVZhwYq0gPusB4p8ka9R0MCtA3T7JWlZVxY0o5uj95nvk+CIGAEiBqo
	qnCR3YWDm2qi0ORj9iftfdDHur/H0XKMIKsFkjmeEpsDkO8Atb7aOPUHWxNve+On41c8p9ci0w5
	G8EzUhhiCCd0603BeFVd8/br3aHpWrlqQxrzQqDr/h7SoEEi3FjuPBT3BaZg/+XlFmEte97zi6w
	4ZQEY2Um3o8S6VwnRgQhCJqDThPkBP1XzqRxhJ5TNAm6gymxIpU2+biN+qfOIM3K3B74DeEBfcy
	YGDYXXzX/rvLObJXe/MQI4G1dYy2nnwGgYKvhXJL9y1wLF/3s7J6Q81Z7HETHkZ0FLx9fYelrQw
	k+ZjUPS6rrfziYCXShAeveXUUZkeJsWC0Be8ga5a+Cp7j1CzCEztODl9Pfw7EpCC56RHyDRtdFx
	PJuHTEKqTlE47ThF8jUxOnd4cCJxjd2HeBlFQpEZav1uqmauBUAAZIQ2irbOLLC1FFP5QUOKJy6
	JWRb5ITMAwuEtuz/u3zIwU+7zhalPgjt2Fp9qTsXOXgYnF6cUxSZsK89dyT/IH22zTUHN8ZyhUU
	+uKGhRhUGZZgRghjYjcrE8xbzE2mcehHWXd+qV9Z1pwvB/Dszxxkf5nyK50Jwz8NYJFDIeEallE
	0YdqE65QObdjq9PzXqLWGTizwLA9RXxwyihoTaqTKTA==
X-Received: by 2002:a17:903:1ae4:b0:2eb:162e:37 with SMTP id d9443c01a7336-2eb162e0241mr27242695ad.16.1793263838410;
        Thu, 29 Oct 2026 01:50:38 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:37 -0700 (PDT)
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
Subject: [PATCH v9 00/14] ALSA: virtio: staged capture recovery and PCM RESET synchronization
Date: Thu, 29 Oct 2026 17:50:18 +0900
Message-ID: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

This revision supersedes v8 and includes its unmerged prerequisites.
It applies directly to sound.git for-next at
 a4311e9447bbb219044db38897f95be112f46a8a.
Please apply it to that base. Targeting 7.5 or later still works for me.

Previous revision:
https://lore.kernel.org/all/20261029054354.2931-1-mynameisjune111@gmail.com/T/

The series adds staged capture accounting for shared capture users such
as dsnoop, with lifecycle recovery and synchronized RESET accounting.
The capture compatibility options remain opt-in and disabled by default.

Changes since v8

I removed the generic PAUSED-to-STOP change. Existing ALSA drivers retain
the upstream STOP condition; virtio-snd now tracks its device running
state and RELEASE obligation independently from runtime readiness.
A successful RELEASE clears that obligation before the RX wait, allowing
a wait timeout to resume cleanup without sending RELEASE twice. A known
STOP rejection can be retried before RELEASE. An uncertain control result
requires device reset before the transition can be trusted again.

The control requests keep their originating PCM epoch through enqueue,
where the queue and PCM locks protect the final generation check. Period
geometry and message ranges are checked before transfer construction.
The aligned control response allocation now appears in patch 5, where
INTEGER64 values first need it.

Patch 8 adds snd_pcm_progress_under_stream_lock() as a separate ALSA core
change. Partial capture progress needs a reader wakeup before a complete
period is available. A delayed notification through the period-interrupt
path can infer a false wrap. The helper uses the ordinary pointer update
and reader/fasync notification without ticking the PCM timer. The caller
holds the stream lock and releases driver pointer and trigger locks.
Synthetic tests in both locking modes reproduced the missing-wakeup and
false-wrap alternatives and passed with the helper. Its API shape still
needs ALSA maintainer review.

The staged RESET path reclaims RX space at the common pointer observation
and updates its notified-period position there. Completions arriving
after that observation remain available. Ordinary capture also completes
the core rebase after a late refill failure, including paused streams.

Layout and dependencies

  1-6: ACK errors, START/RELEASE recovery and request/DMA lifetime.
       Patch 2 tracks RELEASE completion; patch 4 checks period ranges.
  7:   Mark core stop-threshold accesses used by capture policy sampling.
  8:   ALSA partial-progress notification under the stream lock.
  9:   Staged capture, dsnoop policy and lifecycle recovery; uses 1-8.
  10:  Staged capture period-work priority; uses 9.
  11:  Capture compatibility option documentation.
  12:  Optional PCM reset operation under the stream lock.
  13:  Staged capture RESET accounting; uses 9 and 12.
  14:  Ordinary indirect capture RESET accounting; follows 12-13.

The RELEASE completion bookkeeping is included from patch 2 onward.
Whole-byte period geometry and message bounds checks are included from
patch 4 onward, so these fixes also cover partial application.

The previous v8 patch 8 is dropped and replaced by the new helper patch.
The RESET core interface, staged application and ordinary capture fix
remain separate. The ACK and work-priority changes remain separate too.

RESET error policy

The optional callback runs with the member's stream lock held and retains
the common pointer and time handling through snd_pcm_lib_reset(). Zero
allows the core to finish the position and appl_ptr rebase before unlock.
It does not guarantee recovery from XRUN. A negative result skips core
completion, so the callback must leave coherent pointers after any
partial work. Drivers without the callback retain their existing path.
The callback also runs after a successful prepare.

After virtio-snd has performed the common pointer mutation, a late refill
failure latches XRUN and permits core completion. RESET returns zero.
With the notification worker delayed, a nonblocking read can first return
-EAGAIN and later -EPIPE; a paused stream's resume can return -EPIPE.
Applications need prepare or reopen recovery. This changes the observable
late-failure behavior from v8's immediate refill error, which could leave
the rebase incomplete. No new userspace ioctl or structure is introduced.
The internal snd_pcm_ops addition requires out-of-tree modules to rebuild.

Linked RESET and prepare stop on the first error without rollback.
Earlier callback members may already have completed; mixed legacy members
retain their existing post_action policy. An error does not imply the
group is unchanged. Applications must recover the group before relying
on its positions. The callback contract makes this partial failure clear.

Validation and remaining limits

The candidate's runtime code was built as an ARM64 Image and modules with
W=1, KASAN and lockdep. ARM32 LLVM object builds also passed. The final
API-contract refinement only changes comments. Packaging checks apply
every patch in order and compare the result with the validated candidate.

The QEMU regressions cover native and restart lifecycle handling, rejected
STOP and PAUSE, successful RELEASE followed by an RX wait timeout, stale
reset epochs, failed prepare, suspend, delayed replies and virtqueue reset.
The fault matrix passed 14 cases. The linked RESET/prepare fixtures passed
40 cases across atomic and nonatomic locking. Four delayed-worker cases
covered RUNNING/PAUSED and managed/free-running capture, then recovery and
reopen. The partial-progress alternatives were compared in both locking
modes. KASAN and lockdep reported no diagnostics in these targeted runs.

A forced 90 ms interval after the RESET pointer observation reproduced
-EPIPE with the earlier staged accounting. The corrected path matched
48,000 subsequent deterministic frames and passed reopen. Deterministic
ordinary MMAP capture and a 70-second recording also passed. These tests
use synthetic sources; they do not establish physical-device acceptance.

The reordered prerequisites were also boot-tested independently. An
injected RX wait failure after successful RELEASE reproduced two RELEASE
attempts with the earlier patch-2 stage. Each corrected stage from 2
through 8 made one attempt and passed prepare, capture and reopen.
Stages 4 through 8 passed eight direct message-boundary checks. An
additional stage-4 run rejected three malformed hw_params cases before
any SET_PARAMS request, including a fractional-byte period. These nine
QEMU runs passed their expected outcomes with no KASAN or lockdep reports.
Fault hooks are isolated from the submitted patches. The malformed-format
case tests validation logic and does not claim ADPCM hardware support.

High-load TCG capture still fails. In an alternating A-B-B-A comparison
using submitted v8 and this candidate with the same guest configuration,
two vCPUs, two busy loops and four dsnoop clients, both versions failed
both 70-second runs. Reopen passed once in two v8 runs and zero times in
two candidate runs. Observed reader gaps reached 165-283 ms against
160 ms client buffers. All failures remain in the test evidence.

In separate instrumented 20-second runs, both versions failed. All four
candidate errors reached dsnoop's client_threshold check. The v8 run also
reached direct_check, where a later RUNNING snapshot cannot exclude an
earlier slave XRUN. Host scheduling and load varied between runs. This
comparison does not establish performance equivalence or rule out a
performance regression. Buffers, priorities and expected outcomes were
not changed to turn these failures into passes. The work-priority patch
provides no hard real-time guarantee.

This revision has no VZ/MOTU physical-input acceptance yet. ADPCM hardware
negotiation, other MMAP layouts and formats, multichannel capture, ARM32
runtime and all physical ALSA drivers remain outside these tests. The
partial-progress API and linked RESET contract still need maintainer
review. The current revision has not received a Sashiko service review.

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
