Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182105;
	b=jWT8IxG7D4BRvSpzNGdyaMSPaqeM4lX+KTPol4ZbsVz900guoEaZVcP3d3+1d1thTNQY
	 FENJg06vVmtAhtNnvS4xD3P6Xjjqhzn8ARAQrkkKvLOMN3Q0QLxCL1laaopvkw9PCqQhK
	 CqJDTgrtmgz/HjryJgMjG3rQ8nVFwSE8kkQHcRDtqHdymdFsUwYt4oh9ENWyJloY+ihUk
	 sG9E933jTHlqdCRvMEVL0dDyVhYhCwJrLKSFgAp8hZuDURq2rJ8jxfswlQdi7qNCV2fsU
	 z6xkKpOKeIflH/fMVFb2ATdv+Qoo6qrAV6vmXY5XiRy+WjiZpANEy4wGzPJKYv+Vp1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
	b=2VHAD0xaw0MnVRbsX2Lv3ERoGZLGNzPSqf65fLh3RpWr3b6bs/yJFKhEfo5ZOAnxdyB3
	 fpUU+rkT7mjrkcCQSbP13+XETDmtUR+t4ohPyGNZh5kV6wy+/nIvvhT49vzXoArI6u1v0
	 oFSuIEHoPmdQTSMs8cHbznDEEiPKW5cbMGl9NHn4zIV3bS6V8Qave6wFJFgaDDcO0jUxG
	 f/JslQkZ3Fu1UQBVg0KShjZw9vs1EDVLpwvh/1hKpDF8ues0kYFD79KFs1OIr75AWjQSa
	 n8SdefKGTyA31tg2aMGH9AV0NbejzUmmB8JuKupd5lSWGiWCcs+t7pX5fE88MHzVR7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2FF606A323
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFHIbKjE
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed2b4348fcso998325ad.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182105; x=1794786905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=sFHIbKjEJRaY4JsTqNuS3RtpuMM5gvvAOlg0e4OnoEsdETN0c1AReW99EapQ7+EaF2
         wla1gubVvVOPIJdmnRBIEn9bVD4kyFrBzteyiXL5PCVr9n8ZBVbFOzh+lKsHBr4Knoca
         Kc/qM/oNlN2xFza2aMAFL3EFKKZBLgSxF9nZ+qEUq23dJOiHYl+LbpuOTPPLp05w9sGN
         rwUOhbSNKWGM4lz8pgEkF4pw+UuoPGqpnVlDopQRJsAt5keblN4eLxdLOBiiTKqD7txc
         5i+02yuWu7U9/bUp+kax41mtdr8DFaAWu+62YUK8MY7jSeETdpKh3YO6xSgRsJ/DuiPc
         yPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182105; x=1794786905;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kE0ZWbTzn+IpvDi4kY2FVWWgcmx6tW3ivlKQ8gzZvhg=;
        b=pMBWpl9IGmY0mJ9ZssxhBIskRVCDXb3HWlmESAIjMtA5h/+5J6aZUTISMYlDAakVpn
         eluLMKUPWGQy+P2g4f20C+EU5bk8efLMJlyeosFskTCX2pZLF5L0KMlMkOFy9WCkzQrG
         g8P6UjwLnLSiibFQUXdfyTnnsH3qj3PYiPMv9QY5UydHo/3gA9LwVCbI7J+Ubv4Eu/wg
         P5K1YDAf8vsSlIlpPI+z58ZxJr84HmG4l3g8ktSz4Alkl9e7kkPCQG9GR5eOXhL41sWn
         IXliyRIj02hoeha7Bg7bM/YV8F+u53bZFy1N4BOX0Wm+CY427bxTAqcS6VY4RgZFy7M4
         6Mfw==
X-Forwarded-Encrypted: i=1; AL+hErEFgn9WNb0vbu3nO+5jhN59516s5YzpBCtUea4W98wcG6jnhjnfYFH3MA38Wc+/C8qF/Yt2falaaZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y2EjCPzn+IsV169EN1IoEw5uw34JpkCSh4Zdn8BYkQ71zdk0H
	aUskc8x+5Ale/OgoGTdNLvp3mh4KQqp5DKQUo/0QJ45u8ReZQ+sGZTc/KzIB0g==
X-Gm-Gg: AYBFou2BmZu30BGw9DVvq4Ymhj+xKqMsmCoLxoug5JEAR9iTgV/8TvkToHekkdk9ODe
	Zfa4EkK2sk22wkXtSKTKawhFCiFxUMfOgmTSVC8FcF2zKusrUzHdX3aAKalWrfGX23k21qfEjJi
	zxptu0hTD1YzmU6Vf8Ifz++udNN5yx6LkHTABPVjN8h+VRQkD7ifXtWpDuKfCWqgyRuN232iGWm
	VKJVA8A0ULMliVCkZO8qVecMrk+G5c/V1v+2r2GXGzixrrVNY3b7ULnywh7NhGgvc9OzHxISPB6
	wuWEkKzVBKo4QhcMkor3Q7xOTLki28VLqjk6KLKz2rEscegcXC9H3WJ4IyGPkS5i1Q6IighCy8o
	JpSIqw9VqFNLplkuxkkzkyQeQdpXllQ1pF+T0CubF0U6G4LOb7F8ITjOA+56tjNmyuzykDkEdrA
	qH6KrhtJk3gYs0rIdbtYJTnPHrKrlXqPkpIPykO0pzXasQZ0Rre1lnFY7Mc3rvIkU7pZagw8rjT
	VWRBeEZTTkaGQT7zN0n3JZX12MJL/P8VOmwXJJAmvIiGda0G14Isy8FHXGDKbOtASeLeJIHz/0P
	7RJji3k3tXbrc0gfwSgmfGsLh+DcXzTMOXhtb15+wInK80Xx86SwC+4qP8R9V3fm0+Pc0p25ejO
	7RFZfJTQgnyqvfpxrM+v2LVSma1qk0Wpkd2mI69qMFxG61tk=
X-Received: by 2002:a17:903:3846:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2ed833c45c7mr24963405ad.8.1794182104822;
        Sun, 08 Nov 2026 15:55:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.54.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:03 -0800 (PST)
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
Subject: [PATCH v21 00/12] ALSA: virtio: fix capture accounting
Date: Mon,  9 Nov 2026 08:54:45 +0900
Message-ID: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
a4311e9447bbb219044db38897f95be112f46a8a. Relative to v20, the source delta
is in patch 10. It gates START and PAUSE_RELEASE while PCM prepare is active,
before deferred XRUN handling, and repeats the admission check in the native
queue and pause/restart helpers. It also retains the stop_operating teardown
marker for a stopped stream after pause/restart RELEASE has drained device
ownership.

Validation:

- ARM64 W=1 incremental module builds passed for cumulative stages 10–12
  with KASAN, PROVE_LOCKING, and LOCKDEP. The stage-chain build used an
  isolated copy of the frozen v20 build cache.
- A separate candidate-only hook build passed five bounded lifecycle
  assertions for prepare-time admission and paused teardown-marker retention.
- A clean no-hook QEMU capture-only run passed RW and MMAP pause/resume,
  DROP/PREPARE/restart, and close/reopen flows.
- Ordinary and staged capture passed RW and MMAP reset/reopen runs. The
  14-capture oracle matched the QEMU sample sequence.

Lifecycle attribution is static against the immutable v20 source; no
vulnerable-baseline race reproduction was performed. The combined lifecycle
and playback healthy fixture exited 1 because its playback probe failed at
raw HWSYNC with -EINVAL before attempting pause; that run is excluded from the
PASS claims. No physical-device validation or KCSAN run was performed.

Previous version:
https://lore.kernel.org/r/20261107143422.29319-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
