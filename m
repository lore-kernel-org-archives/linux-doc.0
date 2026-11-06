Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923611;
	b=MTS6Mb2wLPlxi6sAd/HSnA3Vc28Y8rDLmdEW7mUOjjr9bzOAJMPPznddj5YGAurTJpKl
	 lnUqtYDIaQmwN6QYcH+QSFAQRbM7Iy8peaJTZnUtuHbl3f4LHODhE/RDXEyjMEu5U1IUk
	 m3a6bfxd/AlPnOap8GhC0BB1zdb4KJC58BqeQTCDBKpBkLGLrKJAzC6iJRElEKN7sS8hS
	 uOvIrTw2oYXaqoej186mX4P03KSwmu/8HN1J/uGLN2gY4lBS5xEUiuxoIBCduE54GreTi
	 oEDr1VbNWeyw2j5/2zkVW6JYpAmoiJAZ8AXCbr69Zo/YY3bCl1Fan3jM4S2/63Msn5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
	b=larHN8iR7KptMPqD/E0W5UCbPtZ/jJzxjZyEkn4NDu8bUsKeG3HcZjaFXof+GN70e5oc
	 X2nXlTXxl8aisUja98lS7N/LkzrVS5xr2u/dTEkDaK1jRdF8CPhv0NxuThXIi2dyrIHh6
	 7xzZid8oK/WlNebjvpbgGi2g5MZTJmSn4YlO6aw5HIuXDgDxDaNYAEWq65dN7O0LWPCWa
	 sRBKqdq7Qd0TENgSSbNfWMgXDyqSF7qj204OXBkL0JmqCB4fjU6zSW48htMp2+RJMGkGV
	 mq7tLRdayPfgEGju1oFEgclYSaQ15oG8slgnJVKkyLlXQSxfpY1Y3xKefjGEmrWyE/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A3B606A328
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A3B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUzlzjXX
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a1947498bso238815eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923610; x=1794528410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=rUzlzjXXQrgeZVhDtCIi0p2CITRdKKsknqZzQuoRnEyAn7+S4LAkHs5nmX3aDL1P/d
         0KGgqq4kJw6sr8G8yU9Hj9E9wcG2dYfMLY4lq3snbaOylEyYJ8rn0l1z747y9h+7G7DZ
         Em8PM2qcC+DGcSyhJWaCZJGafTlWd+WiJTyyjn9wIgVzwhsSzTDnJrzGL3tJGeWGgFQI
         m4e5XcQBSH2r8eFCQ0mJqxicwdc6+3lxNyhBBsGbYqmDw5KGy+qN+Ezg4LMkCErePYG8
         tBjDA3aNSf5gkt49Qa0NB/DWIGgVV7bybfYEDX2zwKRcFI2z09QcEmwXx5ddiAOx48c7
         /xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923610; x=1794528410;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ILyx/FBtGKAhRWTc3Crl9uIFFAT89HD4WOeI2dYsjg=;
        b=gAdOf47PaSTH8v9nXgF4HNdEe/6a6pPHl3HPDqSmLSNunvsL2HZ9iRhFwGAPLbqiat
         Q0gE8ipUTi2eP95OI4iZUHBFI+bZ1/7Q943o4kcY5Vfb76QP4Du01HqOZbAxbDJgyLqc
         AwgC5r1wOAJ1bniYVuRJyYq07g3tOIBniALlf3kJqyAFTDHvzz5hr9UIj5bO+BKMmtIC
         FJHq0DxX0m742AKpcjGAd3R1OQR4dQD8aECsyTOdL8Dy4IzeofFK+z13wV74ZHLDluoh
         km2E7e02QvfTHVOXd03fR8kLQTyokvSJn+TF3OLWTRM5Mv4wuSFcqxMOnFiLb07+QG7G
         C1kQ==
X-Forwarded-Encrypted: i=1; AKwUvBywlbVfOOOnDOpaMqK55I1EuD5MfOnCJT6L1kBe9V9X0GOnwwQmRxIz6BHsPJWMg1oFi6Tr2zVPBLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HpmB+4I+FKv+bP/qOOgCLaMcxUPVjI2V5bbykB86gSEFUgMCY
	yL4Y91oyLnlLTQYtyX+XayJ3fd44n6q7xVd9U7IAJuxNEnhrppIk8Sl+
X-Gm-Gg: AYBFou3nsPz1K1CXFP6T5ouitwaSKKwGqXlEwxMAKvZFO2mzKuuKWY4KiqY5MMVyUqQ
	r0kMZbI7feyaP2sfrfy3PApqf7fTqEwtekaIOFAg996lB/Fa9x3J3tDdsUslBxvLIXwnsUFGscq
	4c0/5B+6ewjLjfZDhw0aMvWaPL54R1noKdUxxRk5zvSE/Xz9P45d/LixKqkalBDJ/gbCLFz9ta+
	RbTLw3aW9xx8u9Kf5UwhhXyqDA4bHcifX7fXhCNhtsp27FMoms39buZFtDxKXR8z0WX5tG1vVq2
	tUY1eNQLDATVMQXAhCdDL8GSEUb7k+bHGJzrzOis1XdUt17ORDcdRwA6VZXYpp/MjDIElA8Zr+M
	HSdRhh0y3TKOM02rM07048l7W7sVIzrBFWybg+4gUXoULU6WlzlyX+L4XRZ61/32VmfE+oZLM5v
	QqbyNgKDCkiCkhwXCeP0Z05ww+4Y26iEcLNlil9eMBGQ5zRmJ1VlStfQqiclidaNe0jro78T0zn
	w3wFK56CA8rCc5dTmsosHLETQg8wb26VKm+IDCuQvm/nsKH1AGn1ZYapOLmJyJrfjNDIXnfyEQM
	JWbl2kZey3Y/Fj5f2UopVuHUB3uNnoGRrGWOGsMlXGTmTmYODWUWi7G69SoBs1dplz6seeAt0ow
	rQsplVA90KAyxdEyjLzgLLYoBGTxPCIVs/eGf+9jd3o9U4iQ=
X-Received: by 2002:a05:7022:170e:b0:186:3f0c:bd09 with SMTP id a92af1059eb24-1b25d29403dmr804327c88.5.1793923609691;
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:49 -0800 (PST)
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
Subject: [PATCH v18 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Fri,  6 Nov 2026 09:06:32 +0900
Message-ID: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

Relative to v17, patch 4 adds the transfer-failure XRUN latch so later
completions do not advance PCM accounting after a failed ACK. The existing
ACK and prepare recovery behavior is retained. Patch 6's partial-restore
rollback and event-message ownership fixes, and patch 9's wait-result type
fix, are carried forward unchanged from v17. Patch 7 retains PCM DMA lifetime
and fixed-slot completion checks, and now reserves the successfully seeded
ordinary capture ring until userspace advances appl_ptr. Patch 10 retains the
staged capture lifecycle and paused linked-stream XRUN handling, and restores
full-ring accounting after active and native paused RESET requeues completed
requests.

Validation:

- Cumulative stages 04–12 passed incremental ARM64 W=1 builds with KASAN,
  lockdep, and OSS PCM enabled.
- The no-hook production candidate passed ordinary and staged RW/MMAP QEMU
  capture. The 14-capture sequence verifier passed across both modes,
  including RESET/reopen boundaries.
- A slow-reader QEMU oracle reproduces unread-period overwrite on upstream
  a4311e9 and v17. The candidate keeps the ring slice unchanged until
  appl_ptr advances. Separate active and paused RESET pairs reproduce the
  same baseline issue and show the candidate preserving the unread slice.
- Synthetic ACK-failure QEMU probes cover capture, playback, and DRAINING
  admission. Subsequent virtqueue completions and recovery paths were also
  exercised.
- An exact ALSA-helper model covers partial-period capture accounting.
- MMIO rollback, timeout-width, PCI remove/reprobe, and linked paused-XRUN
  evidence is inherited from the validated v17 candidate for source paths
  unchanged by v18; the manifest identifies those inherited checks.

These are guest QEMU and host-model results. ACK failures were injected by
test-only hooks; the returned VirtIO completions were real QEMU events.
Physical Virtualization.framework devices and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105070845.6449-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
