Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267656;
	b=sQWwBM4Ax0vWo0cbccwgo8UVPCuhIv24BF6uRTjdmrCd8fIzdd1ZoTvWXcmIJZwepKIQ
	 OQC6Zzin8224tQ1xyzs0g7AfEhCt0Ct6qNlc0yQIFdjsly1IgkC9n2UN5V8i3lQD+3vns
	 /75rS9/QWUXzA93V53D9hcfCB2lMMvTrXpfN1NHB9jt7zlKFtXx2bDIv3YKPVnQ8+zazk
	 ijD2gjOasYMO93U9szru4gXF9SmNiAsV5ajQv2AcL78LGjX8bprwI0VQLe9m00/L1pJV2
	 0tnMYeeKTWYlleSF483apR/qzAt3eWUCqGWbV+6oVyoV2d7737gBQkHaILX4rbTZ6Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
	b=COE0zm29+ssdF9lSEc+5S54BkVnmWRMjLgs/7c8LpZcqJt7/YKjoQcmP9Tt+M4EG4qba
	 Tqg48dr/TBV4j4iVsV5guCiEktaq8CF9NHvKftD2W97kzperRgE1QUFeVD28kGpP+F3UU
	 GqbFVsPRzEeZdk1j5t57qbJSe770Cb0ADZRljVenH2yg0sviv36f1UOXOG+b6zyYPWBr8
	 l++b2PAWCF+1PZq5h7qMPKfieLruxXXYbn9LnjPhZtqWzjZAoMionJ/ba7i8jOmuCndFS
	 NCU5D67fjDVq433DECpXnvc9kUAg6qWaLegaPYf5dKgS5213wZnoJuVlNs5ryLxoKQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qesG04od;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34786606A321
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34786606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qesG04od
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2242096eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267655; x=1794872455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
        b=qesG04odxfpBZtfCMKTdwe/M+Hum56hQAH30/p3gPPawxpDGXutP5N+uUzDKwEYW0Y
         rLf4J2ajAtjtblJKv3j+F129cLfYIWr6sHzJOztYwi4lM8PlUxulmUBA+U6X6SVsCGnq
         UCu4icfIP4KFsz/gcIdLL/ib7TqSEh2DGQrGqtr0WJVUBBsKNh8heRQm4Pl9PGnmzxBW
         80iOyyydUrh7dq2Mf6ZxaEHhBhA3c3+r0Vy30+f3g5W0ETk46QVcfqp4aJhqh91BBbAR
         qtYSd0ju5yn5XXRZw/q+zUyQO4D6jZPT/VKclbdTkGroxAb8vjgGqc4rbJKAb0y7dmZB
         0XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267655; x=1794872455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYh9+NfHPKZajvTz1xi7cTDaycXDIClv3BtU5BxbMAs=;
        b=ndkjHo41v4Fddjha9wZi1ouws/oT4iXT+PKWq7ETaKUNYKCjzkVJY+oi6kNI4oP7B6
         O8LE1yiQJwM9PAyFkpwKNGVPVbfwrYNIS20q6/RjS+Jxo2e3iA6+G2jvbRwaKSKZDMLK
         7Ap5Gmrj0x22NXKgfoPEZWWaf3O3li8haevv0X+NFeH/Vj7jPzR7P5nUXJKY4E2ZI4nu
         ZBYJKsI34V1w/yNnUm369xLHvvLP+vkYpvRDvsPCGjcHSqZx2zYB7TgUqjQtDjuFpAXV
         Ei/FC1jo3+Om2cvtAuGryMI9zxkQjre1HffdAIBNJQkZdV4QP84n928YZ4eV7AX31Sur
         bbiQ==
X-Forwarded-Encrypted: i=1; AL+hErFS4XMMguRjpb/bOU0hhSkbaUKjyb7lP0xtRhe0WLH/n67dyMSHIoUh/K8BcvFyB9auVlYOncUuwuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qUW5nzF6eY1D8cBrzUCgQpHBEApLwSBVQVtRwVDyAQ1rtQ45O
	Xq/0vbq1x8LptCMu4cD8toLOypWWUc7b/lzuEnDCwdp3reMsGFerSOEc
X-Gm-Gg: AYBFou2p4iEvXm3M2q0SSE6kw3nEZq4Ltwj8JwUu/3dheGsW03wwLqemepOT/XVzUNA
	R4i5X/T5voSwv8tI89/T4J5RpTC0nWPoO6G32AcvVId3FWSKLwlMQyI35eUoB3StUlcEsWHCIMJ
	qhtRFFOvdRzrJ7iyCIEH76FrFH8MAo+50ob11vJpc53kRmfJRIitae8j3H+ok+dt6TUkzqkQe32
	GhpGOVT9Bk+L8HfQwfRO6W/uhS5U5J9zHQ4ZFKcecRP/EbkjVSbnZ3OQCwWIg59AlzkGqFtP6KA
	N/0Y6/IYsxQ4430zvGzuWk4NBN4LrxnYTWVlcUfjhwrcYQ20vOD/2M2VM++dTNrZJxVY1axbQdD
	S9Ah2PY0T/ndS72OeEQDI3PKai8nW5t19ZLucMDqBKZ4vgj7v3RZEHG74ptcih2CD0dKxgtlkis
	LWiOZoJE+o92HT8dA5UHrl3Hru4XsSWgquNOrg6kGlXuxYizOHghtqL/6wfiA84k+TpHX2rlUtX
	B+9Yp0/vR5spalvoL+yT2HsNrrscoOOCALwtdKD1w9XE7h51TJMOEMkhega6hrS3cy1JK6+f8YX
	tqs/GdaWFqb+ai7RYsXKKuBN0yeOpu3IXkOdc1gYloEPPM/xCsNRInmKMlrTWY3J56YNCbXZHZW
	yYrXKw2Nbsc3LWLEefZLPnhfDZ3MmSBk45nPRmpU+FJ44OyVTS389bCZCXHumEgPRJ1Oj
X-Received: by 2002:a05:7022:f4e:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b3b5fccca8mr1420330c88.15.1794267655107;
        Mon, 09 Nov 2026 15:40:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:40:53 -0800 (PST)
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
Subject: [PATCH v23 00/14] ALSA: virtio: serialize PCM recovery and capture accounting
Date: Tue, 10 Nov 2026 08:40:35 +0900
Message-ID: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

This series updates PCM error recovery, queue ownership and capture
accounting in virtio-snd. It also provides opt-in staged capture for
backends whose completion lengths need explicit compatibility handling.
The capture compatibility parameters remain disabled by default.

The previous series is at
https://lore.kernel.org/linux-sound/20261109051618.22506-1-mynameisjune111@gmail.com/T/.

The v23 changes address the v22 automated review and a separate existing
linked-buffer locking problem. Linked prepare now commits member states
and driver admission under the group and member PCM locks. Suspended or
disconnected members keep their states, and a canceled successful driver
prepare returns an error to its caller. Failed prepares notify only the
attempted prefix and do not generate a stop-timer event.

A separate core patch closes every linked member's buffer-access gate
and takes buffer mutexes in the stable group order. The caller-first
ordering and caller-only access gate are already present in the upstream
base; this patch is distinct from the prepare-completion API change.

The failed-start patch owns the direction-independent error latch. The
later recovery code keeps native pause admission closed when a linked
resume rollback fails in PAUSED. Paused ordinary capture preserves the
accounting-error XRUN path. Staged capture rejects unaligned application
pointer deltas before changing policy or counters. The DMA lifetime and
staged-capture commit messages now describe their full source changes.

The order separates the ALSA core APIs and existing linked-buffer fix,
ACK propagation and failed-start recovery, message and control lifetime,
teardown waits, opt-in capture compatibility, work priority, and option
documentation. Each patch is represented by an independently checked
cumulative source stage.

Validation used ARM64 QEMU with KASAN and lockdep. The eleven changed
cumulative stages, 04 through 14, built with W=1 without compiler
warnings or errors. Applying all fourteen patches in order reproduces
every cumulative source stage and the exact final candidate.

A test PCM driver passed fourteen core scenarios, including linked
success and partial failure, atomic and nonatomic locks, suspend and
disconnect cancellation, overlapping DROP, an active sibling buffer
access, parallel group actions, and old-generation ACK retirement.
The stop-timer change was checked by source review; this run did not
attach a timer client to count timer notifications.

The instrumented virtio-snd tests passed definite START and STOP rejection,
RUNNING pause restoration, failed linked resume rollback, deferred group
XRUN, DROP, prepare, real playback and capture I/O, and reopen in RW and
MMAP modes. Actual SYNC_PTR calls checked rejected ACK rollback and
unaligned ACK policy preservation. The alignment and invalid-accounting
inputs are synthetic test geometry. A separate stage-07 test verified
four START failure/recovery cases and failed playback drain termination.

The pure final driver passed ordinary and staged RW and MMAP recording.
Each configuration included a seventy-second capture. RW checked three
reopen cycles; MMAP checked RESET and a reopened stream. All fourteen
captured segments matched SHA256 values generated independently on the host from recorded QEMU sequence
epochs. No KASAN or lockdep diagnostics were reported by the passing runs.

Additional tests used the same candidate with strict KCSAN and lockdep.
The runtime selftest and an isolated positive-control race confirmed
instrumentation. Fourteen core cases passed at both default and higher
sampling rates. Twenty-four driver control and accounting assertions
passed. Ordinary and staged RW/MMAP captures matched all fourteen
independent signal segments, including RESET and reopen.

The KCSAN campaign did report an ARM64 saved-PSTATE race outside ALSA:
copy_thread() races with spectre_v4_enable_task_mitigation(). I built the
pristine base with the identical config and ran the same fork workload
with all sound modules unloaded. It reproduced the original pair; the
ARM64 source and compiled objects are identical between the two kernels.
The report remains recorded, so this is not a globally KCSAN-clean result.
No ARM64 change is included in this series.

Physical tests on macOS VZ used Scarlett 2i2 input 1 at 48 kHz. Direct
ALSA RW and MMAP each recorded seventy seconds, with signal statistics
checked against a simultaneous host capture. Pause/RESET, the first open
after killing a running recorder, and capture after VM restart passed.
These tests enabled all five compatibility options. They do not establish
bit-exact physical sample continuity or Docker Desktop microphone support.

Two test-tool problems were corrected before the final runs: asynchronous
ACK snapshots could evict a control-error record, and truncating an old
capture file after START stalled the test client beyond its PCM ring.
The final MMAP test prepares RAM before START and writes output after
closing PCM. Source, config and data-oracle acceptance stayed unchanged.

Synthetic alignment checks do not represent an actual sub-byte capture
device. The stop-timer change remains source-reviewed without an attached
timer client. One-shot command rejection exercises a definite error path;
uncertain control timeouts can still require device reset or reprobe.
Heavy-load TCG scheduling limits remain outside this qualification.

The staged path and its backend compatibility options need maintainer
review before they can be recommended for a production deployment.
