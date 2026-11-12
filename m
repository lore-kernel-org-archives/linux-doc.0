Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466176;
	b=TVLQ2P6fWu5S+Wt1f38WV+Fw9Hvn5Dq5Ahy5ocD2lOgvvne/Y3CEIWu0axMDRBytpzCo
	 BIPdVXwxvBsumBxrOg/eYq++fcsCRD/45NrLdg77kdFTm7dB1nL0TP7aiEPXSK7VhP280
	 iKjZOsJgRW+w87DJBKrUyitnzU2L5Mn1d/6L0zYM30a66b9f8xzfjSFb52u788cDln5sS
	 Qfqh8Ub0uCHJv7Lu20+Av8he/NMB1l3NCb9SPt5+shq/J5iW1I+m61rz45UTyWkbmK4ls
	 BNZXMdnllW2G9WZESJibDl3sCfi4jv+xCsEMA4ItWgqLZp+XtrUQTSsoZIG+HSdpSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
	b=jshUd3d09UcrI06OZyocIYZxtVlsTrqniHsnLwZt2VEn5ah0m/r3Qzl876DQWJeQVxfo
	 N58qeO96/tIKZN0ZZjJsPIJKnFxzyITOEwjL7HhkWggOGMf3BCEx2KWc7XxEY8GKg406T
	 AsYd4UflTGMFfz2l5Yxod8TCuHXeWEUpzqttCfPpcna4ooXrKJeHes5kuHW1yuKoKqPqA
	 yqI+TUQRFvcerWslRInXIhR6lVxwKi0hazmNmd6IOgINj2ELKz/BJQSK4D79k4xM6ev7z
	 gCCWl8j0yyzttf/YoljVYjw52Fe7YOSlqMqpT/P///GJszLHySfoSTljyIDDytuqKFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41469606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41469606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NrJs0ywH
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1907846b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466175; x=1795070975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=NrJs0ywHxwQmYxpFgdUE4ovjEw4keDZ4vEs91sDaR4ZOgo6GsR/kGgwoExi7uYiVRJ
         raVKFiUVvvurjbk4wYu1M/3iEgw4YVVQvU/d/VBpNS6Y8qA53+JS4kJYLZiPV+BkN38t
         2sL8/Ullur6oSL0dB39+0e8EwWmJxoegnY9vSXEMcTP7uwLiQhm9UwSZKr7FnIJQqCLY
         e9+QjwDYlCTT8wyfDPoucwCK4UEFF+/AQM/QbhTcv8rnb0hSL6YAqB+awj8VB+kzFLvA
         CKhFJY1J5BAJS1vrhfuHwBrfuOt9PHzQp/XDsqfuGiQbTe9xeIuhTMB/9cNB525WSKAH
         aqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466175; x=1795070975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CtM4Km47FwSZ7A2ZhTWLoLh7n5nVkJgAgMwOn7ZBsV0=;
        b=YKx2bxtWjT7wwxT8U/iNV4KHVQF5izsShpJNBWeDYUIOni4e98TsUQxu9/F0CTKt/M
         mn0Vfu5XA8fezpYf2kvYtJ5tIV5T4BFMwieCCf9HWQ40G2bXKLxHhaIkpJ+L3e0MmM1U
         NrDBmHYdbsyFm7T16WlhA3kzOU9M0fXkWJq5rB6Ee6fYRBLvUpTi2ZUR9hog8mzbDKiJ
         NGqIyBkBYn3L+xg1kOttBvTOYIdFTr6Pf28xDs+yzzq3L9u1PF4EuJdoGE83i/HPcW0N
         NIrOdvHpV/sBD/hawKN4JDmG00uM+qDQquKrU9oIRcNKr/R6jqJRP0alGJ9TcL798vA6
         KbNg==
X-Forwarded-Encrypted: i=1; AL+hErG1Mwl+SIhalSRyMY6hgEKQzF3FL9OdP5jpGTiqzaNMLnj3TQKB2Q0g3ByG/QfVbwbC3qZOQFp8Cuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tbhyj9zFIpHGtR9x4UaQOaAFNX+W/Z1xL6Bvw93Zsy1dZAV9s
	X83DUWB+ID3QQ2bRDdqKeAEq5O4mzJII1qsJ6w7GRS+j3juubbz1ZXib
X-Gm-Gg: AYBFou2JRHadLhTvUXviS+0ikEhuMfHgNQUARiDwuXGCm0jLb6zBfTpqkBPRYwXaZgn
	pYdzA26N3idt+wXsVGv97kuh0bNwfL9hYgYzthBmjVCXLuct3uqTLmYI/cLjsL6PLoisTFGNeGk
	KNsqrkhE6kNw58NspRlGD5tYb4SVTrEyNSc+RB1V19xr2RJuOP74GJQM0nWvNcKx4Z23BsYhxOe
	FVXbWSrC8vXUJa4ElEjhINLQJJa+LzU66glII5WHrYyitCXqb8u/knUThsXnuOmHV5Jn9UvXEAu
	H7EXOvh3uYbqvmgjokSyqsj8FeHvVz7kKDV/k0V7iJrcbzQhbUfHnyMcERppXOnjTJ2L4ECYfF8
	y3Fi4H205GKq2qfZPkvlT3rPbO7NF2JuGN62a8RTbhrtAWc/vx6JAuVefAIVbIrxVWYgiFnH4n3
	hJ/0fxsHX3koHUPDVyz09YqcHMSa4eabgSDC5M3dGt4IWgLxayADrG86FCUzExdR+uhCZWV27if
	xQrvbQx4CtUTQsTi73D6uIADBNL6efQAa5JU8EIN2XBWGoCGNEt8MY0rJfLzjHcPZW20t5Lo5q5
	YJdrjuRqFBOqnn/JEmkfv6NcYYoTsVgyXcdxqfIM5kDDaS/vMnoLjSEAkg25Pxb4oTuxurcE69N
	1WCOe8TmnBKHEc2aHE6RI5jgZ630fsu5dKMAa745c8C94gXcve0LfOcTYST1VkO+YWnS8
X-Received: by 2002:a05:6a00:1786:b0:8b6:4eec:f50d with SMTP id d2e1a72fcca58-8bc1c49c6camr4569616b3a.12.1794466175471;
        Wed, 11 Nov 2026 22:49:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:34 -0800 (PST)
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
Subject: [PATCH v31 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 15:49:12 +0900
Message-ID: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

This resends v30 in full. Gmail rejected patch 4 after SMTP accepted it,
leaving the v30 series incomplete on the mailing list. This version has
no code or patch-description changes and retains the existing human DCO
trailers.

Previous version:

https://lore.kernel.org/linux-sound/20261112062446.159-1-mynameisjune111@gmail.com/T/

This v30 revision resends v29 with no code changes. Patch 17 clarifies
the commit description and moves qualification limits to this cover
letter, following the review. The other patch messages and code are
unchanged.

Previous version:

https://lore.kernel.org/linux-sound/20261112053446.73504-1-mynameisjune111@gmail.com/T/

This resends v28 in full using mynameisjune111@gmail.com for every
message. There are no code or patch-description changes from v28; the
existing human DCO trailers are retained.

The v28 documentation patch 14 was rejected by Gmail. Sending that
message through my Workspace account made it available on Lore, but
Sashiko grouped it separately from the other sixteen patches. This
revision sends the complete series with one From address.

Previous version:

https://lore.kernel.org/linux-sound/20261112043516.37010-1-mynameisjune111@gmail.com/T/

The following describes the changes and validation already included in
v28.

This replaces v27 in full. Apply all seventeen patches directly to base
commit a4311e9447bbb219044db38897f95be112f46a8a. The previous public
version is at:

https://lore.kernel.org/linux-sound/20261112004704.49758-1-mynameisjune111@gmail.com/T/

Changes since v27 are confined to patch 12. The other patch diffs are
unchanged.

I reproduced both capture findings from the Sashiko review. If request
N+1 completed before N, RESET could leave N+1's already completed
payload eligible for later delivery. After an external XRUN, rejecting N
also left N+1 buffered until generation cleanup. PREPARE cleared that
state in the control test, so this does not establish a permanent
recovery failure.

RESET now marks valid completed payloads present at the pointer
observation as discarded while retaining their ordered placeholders.
This lets the commit sequence advance when older requests return.
Transport-owned requests and data arriving after the observation remain
eligible to commit. Repeated RESET preserves the discard, and invalid
response status still reports XRUN. Rejected completions also release
returned buffered entries without resetting the sequence of requests
still owned by the transport.

The failed native PAUSE path previously reopened the queue with the STOP
quiet boundary and capture_stopping flag still set. A running stream
could then accept an empty completion without the normal XRUN check.
Rollback now restores the prior flags under the substream lock and
checks the reset epoch before reopening admission.

ARM64 QEMU tests use the actual driver functions with test-only request
ordering and STOP allocation-failure injection. The v27 baseline fails
eight affected assertions; the candidate passes all thirteen assertions,
including normal reordering, post-observation delivery, invalid status,
and STOP empty-tail controls. The running-observation test invokes the
actual pointer-observation helper. Full RUNNING RESET ioctls are covered
separately by the production regression.

The production driver module was built separately without those hooks.
Its ARM64 W=1 build and eight QEMU regression runs passed with the
matching v27 KASAN/lockdep kernel and core modules. These cover RW/MMAP
capture, PREPARED RESET with DRAIN/reopen, RUNNING RESET, and playback
PAUSE/RELEASE, HWSYNC/poll, DROP and reopen. Capture includes 70-second
RW and resumed MMAP phases. The independent backend-sequence oracle
matched 7,104,000 frames across seven capture phases. No KASAN or
lockdep diagnostic appeared.

The kernel image and core were reused unchanged; the modified driver was
rebuilt. Fresh KCSAN and physical VZ tests were not run for this
revision. The earlier v27 KCSAN and Scarlett results describe that
earlier build. The controlled tests use synthetic requests and a known
STOP failure before submission; they do not qualify transport
timeout/uncertainty or demonstrate out-of-order completions on physical
hardware. Intermediate patch stages are application-checked; the fresh
runtime tests cover the final candidate.

Review addressed:

https://lore.kernel.org/linux-sound/sashiko-outbox-210240@kernel.org/

Playback validation limits: The one-period reduction in the TX queue
has not been qualified for worst-case scheduling tolerance. The tree
through the preceding playback-completion change was inspected but not
run separately. The playback gate tests used ARM64 QEMU; they did not
include KCSAN or physical audio. They do not qualify the full series.

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
