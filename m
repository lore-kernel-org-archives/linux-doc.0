Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458122;
	b=mGrFX56nfGAndSJvwbV8NJwPZbi3Wybqjt5IAvrHrWTuSmdHmmBpjHRa06hSk/dmxB8Q
	 oWlAUg7yFrF5C0TCulZ+E+U3SasFq1CdqfgKMvbO9lt4JVs0epxfyfW894Ke38gqTRqBX
	 tmcmyboXNAEJa40LDC8/svahLh64NaHE+c8189/4Db+kRiKTSLs4C/ck74pVR10RVp6ML
	 H0PVj6hrPv9gv/E+Psw2i1zEmZyGd4b/wY+q1MtJ0q2DjCJG1DnsyNZ3ZsKjNsNUme2OH
	 FkT+rpnV9/TtRYJTZ5+9G1saaTWZR6+aKZUyd/ZVI91QLzNmvhEOhvCcYqytrknIpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
	b=DKerWBNOLFZr8YxJWa9KR0RjpYASS8bxihQDv2RXZWmp1nMZRz6n0CRAq6gTvKbwhvdx
	 U9Tm3RErfaKVabbPca508Ak7lTMEqyjlo/TjBPhXp7AeVl2+vA8QySR3P5gqv+FTZCJ9r
	 ZSPJEpDtspd1bc+h56pcWMlsXkN3Lbpg5J6xexOtztGHyxsEjTa+g4EbC6PC0FJn5Ap0O
	 bYyX1Wx3vzxZ251av0iicJ5Of0/e1ZmZxwcZ3u+TQnJfzCBUk3AYD4t32E8kf8GxciVjh
	 lcEISwomoGNiKq4b6Gw4nECkw03srMiIgp0fQrUIh9d5QzFFTDtWQJ1yiiy98ShgTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E1606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qexJCdgr
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so2434142a91.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458122; x=1795062922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=qexJCdgrKqu7iz6QsNmvZZTlpEDaXePtg3UP9eDE4jqQDKJ3v7quaTmb6YAw+YgFoF
         meo/8gibEag/NyGmmTi9D1gu/k6Tcq8Uj/TusOsLsOoY7mY2jvCLdDRMDejmpyEWgGyo
         WlEEgAHuBg2VzidkHQ5nxYdARDKkDx3bmad6I1yMJtgFOB4VDCNqkmAqfxNghH1/hQLP
         r24yjCiiGctQTFBsc4BLHyEmf1Z7iyatcBhzVpcCVxfbu8WYodEm/MXCLc9yOLlvlg9e
         QsMV+h20SGwWWbon6Oq/ZuvUJBQjqW27lebZ51vLDu5etYNzPuJQtqNjPcw4zeyBP1mM
         7PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458122; x=1795062922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sGdYFLdFjnn1Tz0kkUDzZd2/WGgELAl+I1C7alcxus=;
        b=m1l/WKhmSnCm8qdnxeBm24qQ6ZO8g+txoSHb9co4zInWr3U/beq0YVmEZEvmUmYvym
         A8VKDWJsYHbbRkv5mWDPommWKc3rc94aAzjcWXAxVwHGKI1yoxMSb4qC170rIx1AGhyK
         eKFsdizo8B9NkoOF4Lhemy9ZvIiqLiBcxtskEEuo3qaLa7ZJnHwv87vyMNOr4Sc7aq0i
         Int2awVRiS53wKB3cLDBOS29mXmii1mAbirA/SngS3d5Udh5H7U6o8Y5tbS7LL1f/wE9
         +VhbwDCfUfCI8d58d1cadkKtLe7Y/vxgYH4v2SF8oW+oYW9zwL/Z7ZhKsMA0D9XsOlgs
         H9bg==
X-Forwarded-Encrypted: i=1; AL+hErFFJz5Sa4vYEcQ23E/GoTy3I8ljY5ifBoqNVAkgc++SOaYkly6q6Wt8kagL1fKQLtfdgzaNqWaOqLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NI6vdbuVo4fztdaypBaS+acU1FqVz4IcjRJ9sgQ/stsFyo5ye
	xuc/ZRcmS3EdDwIY4q6Fh/tabQ/j2K4HIB4qn46yr6yGrUzU5mzh+XYr
X-Gm-Gg: AYBFou2uDz76b3VGav6pcBa407HvyAA7eaiR9U4ezQY5deyg9X5C9immHHey042XAWX
	sMBMU0x5PFKW007bB2Qi8Zq1NTQEtme26tUtgBtWJ34ZJpDXlPLM6WNhuBefb6ILy4qad2kRBLX
	ZRrvtMa7rQM0Y5y7Yjs8kcyMxck2vGo9zKblokm/YGv3cJmhHEQrIRs4Sn9pQT6VsxcWDLDMTmY
	ztin2XJ+QNg3Zb9AGYLwqUfUyPeqbWQw/m3hs6LPptsvtmHuy9WNFGIxmwrjpdToSwUQTzI6ft7
	Yx6ZMvPpLpe9pCmMNYHgK4pW7U2AmfZohykR7dJje5LQ5xSU7MvabENegT2D9XCzGkpzlbZdva3
	cWAGj/BGIlpbifr3xl8WF6RqIm6S8OJj710kW0oLK7aWgLd3F4M2DEDeXlQVuFmKJljca/ddSGx
	sylemyiHkhwjlcheSVX6c5XvQg1O0Cyxdms28WoWOkWC83QXWNEtUO1X9g9hAl7R+kO7AteYjGC
	y0+i6WPGuReIwqI4ByDrLsRPMpL3FhLSyPMMwGhjlustVgr/1P7Br1DYJY8wlNKM5WzDVgFK3kg
	OP/wL6FynYrZGKst8UndjWyJGCroEpkONunStslOtFUbwk8eJmlgmSj3ElieAUvbbNHoXcts2Nx
	NaW79aZzq6GDR0ofm9ZSehDVjTVwGqlrMxrK406aasYMMtIE=
X-Received: by 2002:a17:90b:510a:b0:3b0:9cc6:62bc with SMTP id 98e67ed59e1d1-3b182efaa1emr4409006a91.37.1794458121795;
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:21 -0800 (PST)
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
Subject: [PATCH v28 00/17] ALSA: virtio: preserve PCM progress
Date: Thu, 12 Nov 2026 13:34:59 +0900
Message-ID: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
