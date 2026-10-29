Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263887;
	b=LYcUYcnlw3gkH9sKoBx+jQF0ETVfV6s6V+bgXgNf3i25C2WXS/cLVdYYylxrrNHCrBFF
	 bS6hI1Wu9FFwBqDw1MXH4sEGnc9Sy6xX0GxVMbaGbtfP0hQMxGEAPM46MLovkDfLWQOa9
	 17JAq6Prvbdw/dtgZ5IleIQez1Nf9W9BJ6JUmWd3UYmYbUDHIeoucJWWin/fZ8AFytbkl
	 oPp4AqShcmozH1WyfR7Uz5coVIEHeSSZ9DKJRrnVjbkuk+oXsH2jON3BRD42qiEKicfqD
	 07CGgE34nYn15AHGlsr7ZzlDEJnkpSTOS0+4j02+kvRRuX9qOuDae7/6hztEMJ+T3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=Yz+PFUzF+7AXbKrWQlAFbkv83Nf9xwNJkPRYk4EftIFtiCuN/974ixEi9D38snbI4WVl
	 pOwEcBdVtU/motsIVpRLfyQhnBX6VnS7xALio8VPrUb7AJYobCNyy/yaFsxlRcBd3fr1U
	 XAVhwSL4An6SQJ7IX/aJ4OM3T7al1o02Wsl0S39siC7KjmT0mGxRD/IRoSIYWc4+90AKi
	 FIwGpgAkxjPvCu6EfWDzSFiUl60kCWX3M/QsYPilV47QP21ci6jUMCHXcMWjxv8F1JIu3
	 KNfba7IiEGq6ZcxDIRnNnvwt857iUY6teQQiObUMagKVUodjT+Kjc2F0cx4XdL/hlRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92E60A2602
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D92E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QwSdMdDx
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so12095405ad.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263885; x=1793868685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QwSdMdDxdAQT2ZVW4inzwIEgbDlf+xi7TJUzjvFmUlGnZi43i+k5ZM3vjXLcreVLDB
         BY7K+G6hoM7VVbACa5QyQk5mYd2K/atr21Z71jMUh4ITbUgqHXy2mK5jXbpFOCRvLE5u
         tqdx0X87XfigTw+YYgNmW15uPM0Gxl51qNylrRs9PytUCqj+wGwphQqDw4pkiIQfgp0M
         TzV4rgNnIAUyvxzd44JGLPjY3kM8Y5JxUaNDTniDHVxTH4V61C/8AXlSzBpvqApLzcHS
         LWLr0uE/oJ1sS/pHwXqm0lDwwQMlw5gDMjuCACJdqYp/KJ5QRcZFfVtSQKkbqF3Wh6NT
         Dk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263885; x=1793868685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=JfNxEj9goo2eqiQSyNLHmK09oUmwEu1UwOA5hZ18dz+tn+G5Lo3WucMcpYMcM6bGw/
         Eb8xv2LHa4ll7+BXWplmkIHzHK89Ch3I1JK1M0F2QnRcbPArlBja9EyriklZWLB08OXd
         nc2ZQe1FM+pAXG5DEumSBCdpOzrgaZFk/OmCbxvhs81yIDCg+D9+TpXETsSf9SqnA45/
         k59L1InnMf9syFm6KmTOerZbZELcQ6Bs+Xwoc4KtayDc5bx4/gKtB++eZKliINZna1tr
         NgVa/XCkTBlwXIrCSczQa5LX2MCwrvecT3bYD7ishlHu2PVvqb5ZzKyRc048CHdTBHCU
         T5LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCIbn3vrCJxRkJezhpnVpNlIw20bS746dwaNtCRGjGYCRfaQKe7TCf9R3h4ReuKNXzcvYHmi6fE0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp2PlDZCBk3Vn+r6DLStuE1xB5sTRcVuoSgqAfYIHWV5ZUQiwY
	t4yq6+ea383bW8cXBqE5/ec42VOLXWi7SgzPom5wdzKRppir/2OsaflX
X-Gm-Gg: AYBFou1P6DqsrBNoEq6vGmXdphOeyd0/r5lRdkEks4WJlZbtYDw0xcxRLbBJgacj+NE
	gfn7Q1iw3imMd3R2kSdDngfAxlGDbsnvS5v/rXX95eIyx755tmxwRJiLJhDQAmOOFaS1sn0XOUp
	UE9ChuTTiz+1oLM8cNWGPMURMLafSOV9cen6PkVUYSmYZUcvwqpOAbmVE7l4+q3J9jYEEQVloVh
	Ku6Kh1wpEFpCg9vWAFJdyAo7+QXuLfycGv64/ndD+sHjsblI6g6ImZ7pUwY6+e/Lgfp33U+Obie
	YZPv6/e8xSfvlj2ubu+QJwTk2ldBhY+U5NOoi2swvgBvZ2bKcI5V4OXEMqRe+XNxqmbGKy+Tr4R
	0y6X+G8ShPLsOcTnvaSpNRIqtuN7vXPdUal2uHWlUzNcsq57ZDQpLcepmOfTTWnTwzBd8C8HWUC
	6UnynWU47bguzgbPhu3wMisVBJz/n10AE9pv19wGwbIInE8VRN+emvT6fA6ekALx8BGLW9u0qlS
	QlMX5TeIpFcO7446SYD35D91e4YU0MgvOGn1T7k/6rCg1cKWg5560/+jBwuVWiHiuwr3mtAp9O8
	8heNB66sjxky4d46mpLkV40fKiaWeUohB9uajEVMISoaySYZ5K3vOEr6GyftIf1Ir+PQG6CKuam
	1bGendVDHS7Pgg1N/6t1vPu9o6NG83TZl7chm0oLAGw==
X-Received: by 2002:a17:903:1a0b:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb0012b52bmr46327015ad.6.1793263885507;
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:25 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v9 10/14] ALSA: virtio: prioritize staged capture period work
Date: Thu, 29 Oct 2026 17:50:28 +0900
Message-ID: <20261029085032.70689-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
