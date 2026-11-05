Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862536;
	b=x+ApsJ9pTM8s2OSJGumGE4hWKA/GnS+wZJb9vB/+6LDJmAP+ExUcJtf1T8+A140ogLgu
	 OAL8YonzBRnz21EFtJ6OOSABu115g1Tz4Ez3M6HQ+Z+0WjCgVuZXzr8ltLBGseIP2xZZw
	 zEiXHa2Ts8rUnC7diRiRV5scdOT90o+tDb75ZeyD6C+HlkVutOKQ8LLi4+s2a1XERd++n
	 /Gu7uJvFAhP/wq9asa970o63OuDiID0uoRnXY58kfJaTQKv5N7sbDZiVhmcT6UVc0SvMe
	 q9grN7q+dKnREuxASE2VdQRNxANDKxSHN81PSi89NUu4WJ/PfZ41b0mmpN6ztrIPRcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
	b=GqR2gMnyR6RJNbNarCWSHGIV2y+dYBwN7L9y0iQ/uXNVIb1ZxkGBRGbrDBkCfencQLZU
	 ShRlelivf65YPybv6R3zW6QTX2Sxm4VHZsz7IHcINd7Phtvwo1asIqUesKSjzdPoeyLFZ
	 E2aprj/q9Tve6smYFJvcyaT8T68sM3WW9kfTbn+hGuCeNZ9Aiscj4MEPJCQV3geXvSx7w
	 fEwRde5HnCemYD28c/wl5CHqJSWYhH2Q7rbg7iT6HKEmvz/i4cJoTTJsm1fe35bUpEkkQ
	 gQP1CD/O1il5onxr++dI95Yvu9JcQNF11CuwS62r9K+bFRGPHGymOswiBCVzzDn6aww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15407606A326
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15407606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so2138012eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862535; x=1794467335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=g8vJaLNyWdK/2IwJZX87OinpbOSbz1AbzBqDx/r9PNCRj7gx/giJfw5qv+KHxpT8Ea
         m0okD5WVPkaK1r1dc9ypYrL1bcsWXabUAEnyvHgKRXf42UnDbNaEtzqN1lYChqqZmLnL
         PdynBAI/2lnw3d57FB0NLENAxt76wBUE5iyvJ8YFgwT7iEiZKCAp7g6oL7Ifo3wDLpjl
         WPu2dV5cuTIiWH8zL9C1Il0wUqCoGzu5HWGC8lXbuj853zQq9MNnztipXFpP+N/R00+i
         s2PtGX7PViqxqZtr3abHvLs6IrL4BdJ3jj9aDRpSOVJBKmKbWBG6xv1hz9AYHJ9Z1gDf
         hdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862535; x=1794467335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCJQrdOJD6q85RoEuEvG9HE6RMwlPauaG0/4SV008m8=;
        b=PF58ZCaDv7IUCaf71l/6GYaKL5QAFpL9UsllXwGcJkCbXvkvOuekDEV63z/R170rzx
         CiVhRJMUxFefgG4sJqO3AZIR/c8LuRuxbWIJZeHc8Ul015ToCBqGnWAkShMs4znTdRYI
         qYje9Ms0bhx9gQLjUAs/lv49+i8iIkEJ9vkN9merLnzTbN7K8rKOZHjArQSZcguryr4R
         ILlHS+n3eNnAohz1JQtSBtlaN9I+4eq8PPSPQJevKNCssD6DFoNgjd6gwLQGOL6rSAGN
         IRORkddV6ok7xM94Lm0pLXmHScEsK3EtDF8tKBk6zkRcatfcWYdoln4TOERFEu42m8UV
         S6TQ==
X-Forwarded-Encrypted: i=1; AKwUvByAC0skX1zlicui55d8PgmWnYUi3A8cj7CJ/vKPrOUqEVuZZXTd8iXIHz5l+lxgo8jwDad1ylszLs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87lc7g43PjzcMmcWcGr8UuWExbM2vIK2vOGGFkKLuNwJon38ZW
	oVbFT2VXvTZcvVhOBhu3MzYcSnEYyRCDIGJuwlOoP1rlhLteMu8P1yGu
X-Gm-Gg: AYBFou1u0tRpWS6HAXxVLL9LLJPuZrTjNaBsO/rzvjKaui6JC68mix/Lfgh0vN8Fpwo
	E/W4Cu0aIxQscApRHEk4fPay+o9xXfiEywSMU3B4pIKZiVuO9pYg+N6jZdeXjhvpfQUJ8Im2XBK
	40Bmk3j/EV5PoJODOWdd7yUUXhcL/SKclIAgfn3SB+AfWxpFz8FUIMMJLxEPJVx5eIPiiDZ4vgX
	QO/Nudq24bsjfKrs1QXFwJskSgd/rTrlbM0ahTmt7Z/hPq/9AhuBclsiA67E7/3rjPT7YiAyYsc
	rXpHJft2zK9v2Dsbx7ecGBn7e43wJClkw5gg/P5tJIWryytCFC122+B/k6TnZFWVaWlDv/2H/bT
	EpUJBvqRD52KEmo+YmRmdMRCVAEC611ixPTrnSlMFLN57xHJUHx/0cFYAnKayM7tcXGIWPMcuPZ
	9aqXdAwTgx9Nr5+jAPLN83/SmFXnTiiO1JP0fLdWnVfKg79nqKS4gz4yxFNTJspZWVWwL5hzBLN
	ZAORdRn0V03WwWKnAtC38pZC6eigzIB2Yi8UtTIOtgt6Gn6fVGx1A6dOP9+o/S6i38KAxL+Q4nV
	mDYGN/U5WDfGsezDxqIXfOyBNh3krAsoO16uct4wHNM44py43trPcnciX3nw13+1TyhFlaNh9ID
	S4Gu+pul2XiuhBuDHRJYVDaJr9tfqBne0+IvfbPUhWZ3kdps=
X-Received: by 2002:a05:7300:5988:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36a42426236mr26992906eec.41.1793862534957;
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:54 -0800 (PST)
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
Subject: [PATCH v17 00/12] ALSA: virtio: fix capture lifetime and accounting
Date: Thu,  5 Nov 2026 16:08:33 +0900
Message-ID: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

This version addresses the v16 transport and timeout findings. Patch 6 tracks
successful virtqueue allocation so rollback does not call `del_vqs()` twice,
and so queues are released after a later event allocation failure. It also
keeps freed event-message ownership clear across freeze and restore. Patch 9
keeps jiffies timeouts and completion wait results in the kernel wait API's
return types. Patch 4 keeps ACKs rejected with `-EBADFD` during XRUN recovery
until the core publishes PREPARED, preventing a duplicate linked XRUN.

Patch 10 retains the staged capture lifecycle and DMA ownership work, and
defers linked-stream XRUN delivery while paused. The v17 follow-up arms
`stop_operating` for every member on pause, keeps a failed linked group paused
until a successful resume completes, then reports XRUN through ALSA's normal
group stop path.
Inactive `sync_stop` retires stream ownership even when the stream was not
marked stopped.

Validation:

- The complete cumulative stages 04–12 passed ARM64 `W=1` builds with KASAN,
  lockdep, and OSS PCM enabled. Candidate r5 changes one line wrap in
  `virtio_pcm_ops.c`; its stages 10–12 passed incremental rebuilds against the
  successful stage-12 build cache.
- The MMIO partial-allocation test failed queue setup after queue 0 had been
  created. Baseline reported a duplicate free-IRQ warning after transport
  rollback; the candidate completed reprobe and remove without KASAN or
  lockdep reports.
- A final-source r5 PCI test completed three remove/reprobe cycles and final
  module removal with no kernel diagnostics.
- Linked PAUSED XRUN tests covered native pause and pause-restart. Baseline
  moved the group to XRUN while paused; the candidate kept both members paused,
  accepted `PAUSE_RELEASE`, and delivered XRUN after resume. DROP, peer PREPARE,
  failed resume, blocked read, and close cases completed with clean fixtures.
- The final-source timeout pair used `msg_timeout_ms=2147483648` through
  `snd_pcm_hw_params()`: baseline returned `-ENOENT`, candidate returned
  success. A separate HZ=1000 synthetic completed-wait probe confirmed full
  width for jiffies and the wait result; it is supplemental type-width
  evidence, not a device request.
- Final-source production RW and MMAP reset/reopen capture ran for 70 seconds.
  Seven final-source segments matched the QEMU sequence oracle; fourteen
  segments were compared across baseline and candidate.

These are guest QEMU results. Physical Virtualization.framework devices,
NOMMU systems, and KCSAN were not tested.

Previous version:
https://lore.kernel.org/linux-sound/20261105023140.18373-1-mynameisjune111@gmail.com/

AI assistance was used for analysis, implementation, and test preparation.
Assisted-by: LLM

Thanks,
Joonho

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
