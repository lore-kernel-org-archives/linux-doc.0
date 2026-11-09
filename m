Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201385;
	b=kiTDM3Key651K5EStvBJJIJEdPLyOBsP6u90vfhfvsLuoFtNplRu6zU+6laim2PIULdA
	 ojnSH40kMohZK3zAoa7cN3uRns7P3mV1BMbh2N1mhTaSx/LSy2dIqTtRAcCWIoQPNFW67
	 upxirCsrbeuXYxjjnDMoLzjYQxkGsyrHOq8fL9r6PGJIMjIfYU5HF/QOAFy/vHMRP9s6B
	 XbwPiZ0YWdFHZAvlikbzTICUWUGbB/PQGqvQiSq/t4WKcE8kwREoGoRdBYOkBMliBvom6
	 IlP2SLC5/9anY2u8kCYY5rEpbYH+YOgKx0Xj36ulp21g4XeKI6q1jrHgKU8iXFynupw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
	b=rYTEXImW6dHDGX0ndiwhVZuhFbtPJ9qZE6t6J+iBdU4KO0SEt8VeKFxmHVc3ACpEmmJu
	 yuuXFpdj0bQ1uzrllSqYXExhC3L5Hix/7MIyNTwM+gwi2yuvU6naPDdamMS6r6SFvfWoz
	 YZsXnZ7K2G6jRV0WdC5+fOf5b2JP4fxdALI5UCfSLXI0hLa1Ra3/veSDyf5QqKBWx39+y
	 4U3nTQG1Me2fn720qcB8iVjbiKBtaNPRRg3ragYTr5O0UT6riU7aI2OHv69CTgykBk3+u
	 GXDJ8upzzzflL0QfjIkGBH2neeFbI8FuxIh040QmVsIs4Btd5PkIttdUu3ywahHiJhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77B606A330
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD77B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYXvoIId
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so843000c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201384; x=1794806184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=yYXvoIIdM5xFxQUGoLsAq32Y/XeeSUHJ8SoLEgdxZpswbiSUdGMaPpgsaMzEMzKHzo
         8tKee/tcbD/5uTM/XuXWnA9TitmfBCX+hrNYqn+zk60YBQVXnUcf9osk5FrFfFSBeUTZ
         JwPyRln1W3CvY+808BXMx5RJJH9DiFmJzwrWh8LiHh9k2uzn+AQfi2kUWbkG0fUAv+ah
         IrwEEb9VYkk9HA4+mzAVHbuqn/6NN/BJL3Jnz3oFNola/rduWqpyFtVevnus1TNGwMQ+
         uvzmEgMydgPaO8EqE5LXHoQhVhRbQTu/JVzHY3b4c+tWlXrIZB3jgz7wm+8UoZiXA4su
         chDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201384; x=1794806184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dJKjNdPYk3m+cvdLchMSCMmDNiLwFmiH/BaL2cS3TCk=;
        b=e7s9b9QqYTtDjGBJknG1x7GAXqSCHDPHC9pS/4OOdH/EAwTAiVn4To/qw9iUONuBqQ
         TRKhvnvKdQ0YWlLhpDiLlMe2Ap4mE9zpQx5JKMS8hNrPLOYWggUNYzbESriydnRb+szO
         ox4sQ340t36Id7iQY+kASR/eDc9+MEac79oeBHWnO4FghtUdIkvAWu8hadF1o+NqIRfF
         i8tVY5l3iB5AMk4Fxiab/UjxEZ1Av6oeHcD6Z/+ljKfJrZcOca+xbiBc+QgGZoimFIr9
         Gfwwgp7yKABDME/SxkO4zTENnT1lVLqnaqamx96ALsg16W12AnPyeMIH87I2q6D4FNPd
         7wrw==
X-Forwarded-Encrypted: i=1; AL+hErG51L8JTZnu79KNbazeqpt2tzTXV5lBvxF8Pjt4DiCeYynmOo+DkoRbWfyYucXp2ybXzTTLQHpTFnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ooLNARuk6TN6alI/W2y0DkKM5tZCCWxY3G4jzdCp+jh60GGj2
	zOpoADgB5SkJ9WmDU/YbECMWzqM72UUWAdheQvh0EAOF1qWD8ycLCM+F
X-Gm-Gg: AYBFou0JGxPUkUTgK9cBm4qL3LwnSvVze6rGvpjkgI524dEs/4xD6s5G84srqH83Q6A
	0F86u0Wl4YFGJ6rQnLNA1SOKbYcoLYkikNEiRJ1hjx6yc/fuj9YH6Xf53QrLEKHukP/N4j60S4Q
	sPJOLz159LkpcFVYT64ZdngvLThZALIPfA28K8/bu8itMn853aRwUfGuKo94w9wK90fss/Utj81
	rlZhHQjYMFVpLgJV4NjxRwyXYCUnIaheVfihyl5hY04cdP0t3B49NTwkPy6I/DYQETQrhxdRbQ2
	AOqDL6z+6+0JmYDjSKlLV/e5tIYwzaTJ6nC08IQXNReIN6PWUySs53zn1FQXAqMc4OE8/f+xiQ9
	bO5V3PeA8nsdwgMB+Y5P1jKE4++svNjxRva57B8js9/mdwpa0O7T/And20anKnU+I+/Kj8vR2GN
	mC/2RwSF2FD5IWbNocVq8PMNqZ9CtlJt6f5P+Yi9kQe2mFwGcz5X2JQbNP4utRVubhOUjoh25Lm
	RvYr7PzllNlAzjsjaT6aSt+CFBE+mm8nG+Sl2QIJ3Mz9uJqNPBwor2d3F0qBNEV1cot8p/cbj0X
	tMZZnYNLvY5liZE6GiPsnZr2LioOa/LqbJXAGwdZJo7GsZPXPvHJya2T8BBWtEToyWI8HHT7Y2J
	srJsb9dXpPz0+nDB3BkKE1nW/TLntxOwWk2fqaTRCdFEutW8=
X-Received: by 2002:a05:701b:420f:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b39ff1d2famr4693747c88.45.1794201383745;
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:23 -0800 (PST)
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
Subject: [PATCH v22 00/13] ALSA: virtio: validate PCM ACK and prepare completion
Date: Mon,  9 Nov 2026 14:16:05 +0900
Message-ID: <20261109051618.22506-1-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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

This cumulative v22 update adds an optional linked-prepare completion
hook and validates playback ACK accounting before indirect transfer.

The core hook runs after all linked prepare actions and post-actions
succeed. If an action fails, callbacks cover only the attempted prefix;
the core moves opted-in members in that prefix to SETUP before calling
back. Pre-action failures and standalone RESET do not invoke the hook.
Drivers that leave it unset retain existing prepare-failure behavior.

Virtio uses the hook to keep ACK admission closed through the core
pointer reset. Patch 5 also returns -EBADFD for an ACK on an already
XRUN member, avoiding a second linked-group XRUN request.

Playback ACK validates normalized boundary deltas, frame-to-byte
geometry, ring indices, signed ready counters, and total queued bytes
before the indirect transfer helper mutates its cursor. An invalid
paused ACK returns -EBADFD without starting a linked XRUN.

Validation: The exact-source ARM64 W=1/KASAN/LOCKDEP build passed;
final-r4 snd-pcm and virtio_snd modules match the previous build, and
Image executable sections and System.map match. The W=1 stage 04–13
build chain passed without warnings or errors. The v22-only checkpatch
delta reported zero errors, warnings, or checks. The bounded playback
ACK helper passed 23 candidate-only cases. The prepare-completion QEMU
probe passed six lifecycle cases, including a later member's OPEN
pre-action abort. Normal playback passed in QEMU with RW and MMAP,
including prepare, fill, START, supported pause/resume, drain, drop, and
reopen. Four ordinary/staged capture paths (RW/MMAP) passed with 14
oracle captures, including post-reset capture checks.

The prepare-ordering diagnosis comes from static source inspection; no
baseline runtime test was run. KCSAN and physical-device testing remain
pending.
