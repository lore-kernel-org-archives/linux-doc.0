Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464749;
	b=BnGE4cqfIIT/GbYGKj2o/QwxfDGXTWOV9zknJVEDHmvktwWt9gFPeJOOmd9zWz5uhQOq
	 2ytjqPLL6PqQB+VQDyJiXQ/Bip0voEch8BwO1XmdxY67/hiZ4QgXK818ElAvhaCCNDf5t
	 3MzZMJwY86ZRLWVBkAWru2mirWb+tA5ah7tUnaFBULJ4x/3KtkMD4B4BolpdQxnqCrOYJ
	 rmSXHNKh+cYj1GV51WFmPxngIgjr9N/UDub+NORiXTS3pCgBLCS5nnT50cQKBKgX0WBCa
	 3HcPiQDrCqXr2pp7zAblhIhabWkvQCY6LHiS1Q91Rm6RljE1/PIM59sqFbp32/DG5cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=I0LRyTQ2aJHLdkKI5MpRkr5E70luwNEX0dx+9v+Kw1wuCVpdmH7wyY9TkfwUZ218h8KG
	 OpDkEsEJAUpPuHRHmkcV9DwJH6mR2rhx0iuXpoxSiFKd16mKZJJ/V7RfSZFI48Pr5FH6Q
	 NeQjuZ3SkG9245LD4l5bAYBJgmqsIxQnWE9KwlwmOKkypy9ZzBYPhYnMmWjZDhC5DvfoB
	 abGs0XpBUP1H1pDPYKQdyYDfI0Z7eLPkq3Pyq54+cjIw8DdOXYzhdtfF1XYRthorMWkuc
	 GEcoq/UpMuCWo//912qkS9pYa6fm2OtIavE22fJl2jREVEcDY2AXDdL4WScu19YreUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2460A5BC0
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B2460A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LsKQS4Jz
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea138a3497so23753735ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464749; x=1795069549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=LsKQS4Jzs+wXGEJdLf8qkH7Fcc/oQvJwEdPOojVmevEZeALyKb/FbSvjmLz27vsRd+
         dNPvbvWqEk5orKK0s8cKo84p9hCE7kFosWJhIWG2kkBJl7wX3ziVqJ47RSlwcMr+8tcD
         EjUfnkkbaA12y+ORwk93JMkLBccfKRA5ZjzuBMR/6hPO2ITdOjBYMcHbcM0x/I+v3xWr
         gc0DIOP5uxykyoO0EP88Hx/PNYpffu42l0Qenes7JZW0bjmVPNamxq2pKRYKls7Z2gr3
         hET68JfaTCNDjD5DA6/5Kn969iBFj5eNCzD4fKEINTA7OCqAmddabm6nXKHTO/O/jscl
         5JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464749; x=1795069549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=STn/m9F/rVgJczYvwdf2zHoNAjrv9oZpCs3kdMcMprUSodww48d6NAsOVmp8tKu5qL
         VyjCXY7t85Ihl9+OBpRA90ohuSyGyZl2B8SYjEgerkar8/AINdoEcwBApip1L71yvPu9
         4Ogal9CZ1MleI6aJ+do1iwZkx/KU3dRCosSicdUzej+HYlJc4JWMU6iG5zj0yRR2o+LE
         x5O6tpLccGKEXB+dH8PtVDj61Uel+QZStiBKRQ76TkGAVNlHD3wKOJLXUh6kuYwig8/N
         gLHpx0L1PNYrxRPnpcmMS1ktu0jM3AqRPdN9JQojdeOjMAJf5e0iu0Yr9fpNWLBb/b4I
         hV2Q==
X-Forwarded-Encrypted: i=1; AL+hErEt7L12tjaH99lohca4eJvhr//L3kCM9U0mf2WIa9/U5LgfbNIbcCQQdDMYjo0zZ7yWras48yIyX80=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VVNKYogELthcM47cDYlEObdrw0Y+iFhiRkrl4bxuXTxby0jyY
	AOPdVu1LLLfYLpj5U3k+vr1G/pEVvXXSwNEXIUeAUZex9oGHBwsSk4RR
X-Gm-Gg: AYBFou2puRB9vuu4eTW/swp60iMLZqqffcL26SJyYVA4t7aE3OlSuFPuR1VUUIRNbWC
	/jH2Sm67OgHgQJniukQLNWGm2vcx2jWVIJ2HONNiNBiSbmYnGaGQ7ZhBLof2SUc/2JH3ccK8fCF
	4BokAVfvc6cIDP1jC/Zot525gVn5zdnGD1kTaKLlN/Awb3aLwQTdzU9saU34VJgcw2MQDZkNpHc
	wtezoI41pDrPGWD227o6eWD9AJ+rLWkXctwdWOh+WQcUUen//cjffkA2rouXTRZmNHnZFlPF8+l
	fGqXWt/vQbW7/zvQjd8K8MihJF+21WlOW10EU/DQV6xkSrnN8sRNl78uKq7pzomIfIkxIZx4Lk9
	c6BGuARljm9LJzalNQoLZruCp9wp1nsaEv8v2wzNLAbrrjCE5US2wybWz5ve50tTKbHf+vC5zxE
	7cRbB24Rgv3TXqtI8VFaa++g5b/nWckWUYi1xB1p/EcxQMaasvs4/mqOZsMW3D5BctnwZney4w1
	VHEC6kTfocKcNSRuYOpCrjUE0/5M5XSUm1+hh6XXHsJEBolkHx19HqeBE0aLAUn742+UbwnNB9Z
	6QWkTF1Rc60vBTiVWn1FblrDPRFf6Y41QH0kuJxVvtaqS1/tD9XlhREEHVV56pFbAdJLkzQymWl
	bjbboBtXQ01cSMEHkVe1TR4QL8tNDoXZfMxOG73nxVIO9QsU=
X-Received: by 2002:a17:902:ea12:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2edd76c1e80mr55285125ad.19.1794464748634;
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:48 -0800 (PST)
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
Subject: [PATCH v30 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 15:24:44 +0900
Message-ID: <20261112062446.159-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
