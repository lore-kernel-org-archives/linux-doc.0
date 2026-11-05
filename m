Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837403;
	b=rvZFyN30TT0kxYDgiemb8k4nk17X1L8XaHsFo3U8Kv7Z0KJ8ydPexRKdOfn8rFL0cOrb
	 CPF4GroPivJnyVP335rb6wpKJh5ABs5UZ7fAC6ewTEI0aplIIsuxmkppOmOYmpjvanJLQ
	 30gSjXF8cVI5ZRPWlBQsNDJBMNhkD4SUKR1EzT8M8VhssK5oCfxJZb46d070ibhwMW04d
	 1p+ajVzx2Ucutqd5O+CYbwrFjIh5B9BpLeVZOmIn+A9IWpZPH6BbLhmbusy2OzN8fKMeC
	 IwCHAYMFI2S6s5cNZU8vjtiW1KonA4WoecLHInznmj2V/8XRa0KUZvbEsa/PHap8cnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=3z+k8oksdZKpAdKiKhuZPB9EJbprzveyZ6s/qB50TotgYUJnOz2oFimocLuwCxrmZBO5
	 MVN2RQY5NK7fzwEKkSYbvUgc7MqjLlSaKu4hssKqIcxBrJfQpBYWOrZg3t2DdSkmg9KRO
	 SnCtgNi4QMzxMNmIZcmUwWKGQadszHrjNn08wzOjgXbdhNv+prZtYYS1ACsul4xkUnm9r
	 ItRZH/byxSmxRURcQ7ycnfXMsjXBg4rC5W2C1wZCBRBDb2hmMShBRktvrCACWIYfcf5yN
	 bOLZ83OBc2+s/5XE5JalwLcDcoKLBUiQDzx9VimOG2hsAn8xGKy6GnI1CqDJdxLBfpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HxnZ8/7F";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BFB6083614
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8BFB6083614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxnZ8/7F
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so746074a91.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837401; x=1794442201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=HxnZ8/7FBdaSWNp7GT45T8W1pLVEHmGpuH1QAxCdBljbCMJST9iYBS6OXkICqek1fl
         QFLpgpHuBISFlZebkeCS+cS40q0JeS95x88/tZUmvmR+WTaNa2alR07V40ENRkpOH2tz
         BZNRxzAcWaMECNzYIKjLQnawfhQczbDFkIZdtKNRYtFInKia93FqH1QpG3VutIYZurST
         ebTLRYQge/XT+vSR6pQHfusvI/Hnrq1ycMbysLxpT2BMcSL8Ga4gNsPSunlNJQBZ8+vY
         FhvcAS4exNamcD5Or+wRla9UL8GM6UXRJJwImt1bE48YsyBQGow74Es9x5NFmUqtkXUY
         7XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837401; x=1794442201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=Ym8f5PE3RNArtIeAfG1rKZRpVWqYl1KrHKWR2B+1RPfrERAYzyxac8jlDXSW2PKSPg
         QNNfFz5HlBpxYlYcwzV6jme/ntRzIShYOlVRjwGeCIn/mgAxmnIX4+aiupiFeKL8E2d+
         CqcMstELGNMqX2Uw8JuTSG1su5ExZfYQsz5rrTDyIo26/bvai7wpxq6nlbetRLY55AyU
         Bzr59Tv8xjEqyv3Pp0ZAwLiUfZfHlpSwKfTT9KQMoMe0BouqGY/l5WRzaIRrw5VXM0Z5
         vKjgc9Fx90cnjLZRGHqNhbVB7IoJDPVpXIErn38aUTclrCw8ndtBa/92mdOnbSXEArp0
         YWCA==
X-Forwarded-Encrypted: i=1; AKwUvBzvuqJe6JSyvMQj1U0TUTTn0Z2xRMOu5Zj7gGiSIeWnBpXLrT64BiVIMOiMcw2UkgMxNBDJJBsVj34=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xu86xn+JVoxWFjjYbYiITcrRZBb4eD+UPbQvAg6Zq2Nt/O1R3
	n01b+Q0HSpzl6fWwe7TeM2AH8Gure6RNK9WEtMt5P24a2xKEXu6Zl37g
X-Gm-Gg: AYBFou3iuWKscP6nE00MEyDsIv1AJzAirCvmifFLpbs8QOo0YaNW67fENxApY6SWB8s
	Sz/Hp2jYvHdqPVMpOOPttU2+/OTrgIVT1GNF644XXYe75R3zoaBj0gPnz7f0u70ccufhw/eqLwd
	QU+ewzoLafDxjoVwki80ul9FYaFm8j4GuwY9WcxeqGVY5hO2lUd2Qp6NjpbXqOhd9l7HiCmUg1A
	SU3jI8aJuKIPtBEYs2KyoRx+kMJ9l2WO/k2/mWfjDwYTBopN5JfxwOwTofsVeC8rZI+tkrmiw+h
	9EB+YZ3BFMlQ1JShnYUgU4TFVweS2Z23wEOgPIyfOOYhrEewEg4mPGYmQUFZhDOb4JtKQQfprv+
	HkcgYtkBKysKIRKE2jEBtM4Jgztc+7mL95RyoIgqNqzBc4Gb5q349O26qW8W60W+GLY6jwqM6xa
	omzlooeJEA42aNcD4G7Md1QyVr2ZT+iKnay7Hq8iYTOOUR4afP+rFsjQj0u93QUlo2DDXeEkIYS
	+i5eMMvkJELHKJIYPVm90aAFShr6QaFvBkBLLbIwFBLjeMKguxVYhvZ83DZFBMP7wp02Dzs3+3O
	4G4g/kt0ErAQ7FN+E9uIVqQMqnc2yDp7DlAiumayn440XahlhQtBZSzcf/jttYZ+oFZ9C0a6NMb
	0U0IwQADNI+vXgVVFEOvgopDk6MnN3zTcii3Lsew+cYZMltY=
X-Received: by 2002:a17:90a:d887:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3ae897c94e8mr15687754a91.10.1793837401292;
        Wed, 04 Nov 2026 16:10:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:00 -0800 (PST)
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
Subject: [PATCH v15 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 09:09:14 +0900
Message-ID: <20261105000915.15177-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
