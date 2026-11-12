Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458174;
	b=Tv2QQulQJCh3idRvMEOHjau4CdWrQ0qYAQLBRb+6XzV8hTH/8jJlJHuByj0VsSRlNrq+
	 VYO+PcHuzGPNbCFkj5wKGv77VY/D8kP5zqVqaZ1nuyLxJY3Ny8P6EIo5Ay61aPdW21ZSW
	 cZAZmzU7yVNrpEn2mb8pLptgJNSzOFieESeIRIsoRlaTNjt5patYgI5f7ITdhOK/TPr85
	 GdfxcZAQywebT4oa+SkzC6borbR6H48c6ULO/odqwFp40f59Eu1Fo3R33DVkhx5mHGZfw
	 Ft0lzIU61m8Ohx8sicubsu9pKym/Iu4tye+bGZXBKJVhi5dL6iNosn1Y0kuftrcSgxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=No/E64TOsW8XY2Gb2M7XeIHbo7bTD63fXBYYmYn9h5enc2OzIpYzamre6LOIUtdfB+p9
	 3PDnOIjgHPp28C6SLKZm9FHz9eE+Sn9e/ZgUBoJd/Ru9D8GQuE/ocDZ8rWjDD1JnwM5Q4
	 lkfqb5wtiE610ydCdPIBPi5+G25RQZpnnO163lgyuN/EKWTYTXxGLMpktUZVs4zBlBeSL
	 E7Yd41/O7av4EJhvaIDIAi7FWX+FnbfSVi9cvgslzqKcy/tgXreDZ24VEk8BpZoIcBobX
	 Aj8nhCkhU4nHMCZRls9NZo2P89+tmMDuaecuNsG5qQ1/KJFCKaS68wUQ0eTfkbvJNuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9401A60A260F
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9401A60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b179528d56so969704a91.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458174; x=1795062974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=TS7MQGE69+VhsF1sdcynqvEYy24ryABcEOVMNyXXCyOedAYVu5esZPeKOpvPoWPiNp
         SgMxNLtpTwZbYo0q27kvITp/yrdZnxy6+u8FLLGEBN3vVkBN3goJO+9OEwu1HZa0v7Mp
         Jm8y7ZMZoSD5AeBxQ7NN5wetAZKjX1XLvuglEucDZl8vgYaZPO4ISXfA9+D5ioabDHkw
         4G0NttZlPp5SQQnl+21VhB0+oodcMlRUa5Nbco0qMcllJ3fi6T62MewJCGW7WNYCZGAV
         hTpqmskvYcJCRkHFV/CreU/Mf81wTHqUaowXXmR9mbaiuzs/LphcieCBUvMbFEFtYSTp
         FHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458174; x=1795062974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=aOpU2p+ftJfG1HJAwLfcz3lNoG18neWkcOZUSZ45oo+kJfGQAabPSqwwzmNod4jBIF
         Lrbby7IL038CcLT/L8B+UrIsWQV/amtsY2EOK3EZwIrVMYSYLx9nunk+KkqUmqgxrkS5
         Rvj3yAWYl6cJm6koyjds1ygRYQOXeFk/knKIiZrI1yeu8z9aQxoB4KAdh9gZ0V5DOImk
         mvizQBcSBgjOh/SJggMANRkw0p8OJ1d7VQAsUYbBbYJAfIImT4f+24QWjU6u+fFP5xcS
         4MkTyZmB9KNVAn/RwqBTtr868A5i+5Oujabs7pQOHe+Md258cUJy06tw7E6n/X00R8Wy
         XQ9w==
X-Forwarded-Encrypted: i=1; AL+hErHzNkobaGM77h5mMO0Jpw/H1x4L2UuFXlb1Co3RyF912Bqf8PmiwuRsxpbG9PwFVgOD8JRLRxV6VL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+62hZbX0cduoVkDtCMZVf9w8goUwo2jTcHqWigL5CSvtWwFkxD
	bDK5H2hUTrtL35paWAExNDeqlvOuE6EvUs2Uee99htlH/G3ueqn0x0I7
X-Gm-Gg: AYBFou2b/nzGluArxP/I9pk6gPbwGgQxYcHMZxZiAAsZYnMKTwjghGWTrHsQ56w2RMc
	gD7Kf4UC40kFdnTQU2MYWt8DVtUz/rCc33k4QM6NhmFhipUeLtkIe4p4EoTYFyDoOcHpNceVdAf
	fg2uWUVyIfQsq+ZASOpPEj3h5V9zM1nKpTqipgNxNUExkh94ywXDRCD3af9kkltpxiGp1CjBD9Q
	TOA2JCEsuXtY9HiduejinAtSW+FziDU9tCkWB9qKdZGI7bAUj3pWeylBxn8gdTbD/XUddp3Nz3K
	0EKyzCBfuX3gqJDc3cfkWlATohagpN/MPmFctiClb3s5HPUXJWiyXVPTWQ7OcrpJ3e3fl4yhRHd
	c/6JKNPoodRAiChbqr0Sm2z7IUghQ/t7qJOcijVsWpjin4HaxOnupzasr3E86AlLe8phaWwlOmh
	snV0PfNmEAfJuvA9Krl+sggxIqSVNrmyTpaQiUM3DHa1PHjxs/BatOOl0s4R6jqxs+H6rWDnMIK
	XVhi3p5PTbkmWPKtjNkkJeQbbHFYY+CxIZVp4Ap7XLaaOnZwcWtF5og4PPcIHqUKkArZaFL8Mxl
	Qw5cawbtUwKKqaNVVUaG/qS7g/kJCOSKlCUhH9bEl/CYAL4SlAixfNvfpoPFUwi+X5cBf506bo4
	2xqPUvd6Q18vdMaUjjXZxvPMDmyo+KxG8jc96qIc57ATpd3qFT/1kTjhYywLb65neF3yn
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3670927a91.33.1794458173944;
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v28 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 13:35:14 +0900
Message-ID: <20261112043516.37010-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
