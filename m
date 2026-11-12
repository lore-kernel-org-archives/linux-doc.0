Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461749;
	b=hhzPp0/UKbgIulZ0/LJjWm1RMojuao7NLrS/+OkQX/La2fPiGTtKQA37GqP2KFQ+27rU
	 CPPk+u1J5bCkSGrL0ZhoUB8T9LX5IkaWnsZYe69kgFdAWNCfTvkaekZvpQD+38eM/ctBn
	 ZWvC8PoSuUM5saodQCk8GS+dBYz02BINLh0ff+4OZpJgzO2sicyFB9Hk6HoDawgOALiH+
	 AVi+D38mPWM0U+JmW8EAtcr6ZM+M/2OOfoeJjAEpvRGnTA11/CElWOfPtTWUgSOI1JgHZ
	 obKMlzVgo76aLYh0XsyY4LHZ2u/Cp0/7M6CxYEqk/pu4tcPUq66HN1ENMxYGrvlaVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=B2Zf0I0I7cQNnoTjbdml23TITQfBzUvb0YxNt5Z4Yi/UfHlsGzKiuVrExLq9uypRmAgY
	 epVhJAsZBt0EFFe7U1ieVwOqZ21HUwurgpaf9F0T1qQe1ijQQbW9UAp4DJbssHoumb4mQ
	 Hq4Fvvua9BkPZaX3RLVKAOzSX+QAfn0ZbLZrgsAKuxBRNWWDQW4CqyIVROeRTcQOQfeqH
	 PErxHT+hAopV8WnnpyTqduYa2e/3Lm0ZaBNSMs3QIQqVq2JremQW97TU0l3m0pqx+KQB4
	 eDc784CFRLlISLcS3zHu8FKiPKJ6nKNHAUiKBfIcjKBRWDTKKrkVEsH8q/kMrNT0c2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mMcXtp/s";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F378460A6F43
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F378460A6F43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMcXtp/s
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so5277422c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461747; x=1795066547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=mMcXtp/smF2zc1bvpl7H3x9+N+w3QIgeSfhjTlJ+T/6oLoBVEdxdUugW6RpiSYdK1l
         K9VVP1aLlnBenyyfrP/mBAWG8vp/tuZZ3awdZZ0zC01dhXncU70kXwqv7+/uvbsF4k9/
         pE7EB1AD2mJ6+15sIaWoDmT35fjMmWNxFV36pY18f29vigDTivdLFpHoM1fhww6hndVJ
         hrzNBEKNyoWmiry78vTUBcnoI2dgTc9a4tQ7Fu08/giW8ikPtX6qm6PoBf2n1CAkZn4F
         XJIeQWS/nkaV2DcOofeNbTnVOICBUKIWcWelCnCMryerRYpiS69uaA7ZbKtIYnhfGvZS
         JBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461747; x=1795066547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=D41tTReMc5MthH/TcjkoDUTcOSvjMpj2FjFgXtXF/mqSYlnkwNp7vhIqV4KkFnxFR1
         5MgOV6agAo8gW7s48KiB5qPbb2HTBChNu94cOKcjBTye+n75knS6jIlkflgo1uOIDR5Q
         KNjchzysb0DiW5yhIuguG+B1UsLn4Eg/24MSw3kvjcKl93R80x/TfTI+8yLHnMo0iI1m
         UrC6TCJDmff9AyHW0U1YdoPBRcys+J9vX4ep1JUMi/0mZL8iRMvaG5tSxpiUT/kNEu3S
         MvacsIs0awpklWxHvdrBK6uBArMGTRMfSUumJfSPcleGyFlThFQCQcUU7oZ7fBdnXOXL
         uglw==
X-Forwarded-Encrypted: i=1; AL+hErHO0oAv5op+pRXz3wBqwa5OsbGeeqvlwaUXNKCOMvB/dXVckIPynBcu+5Hl4+hNE2XFyXDMjOu6jxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/b9h1GMPgan/bMIqTu0oQACuksTpNu0/Pa/9CG5YJRHK/47TA
	N3M0nAvoq9ZN8tDgRVtJFu2zZ661gWAl7zqlbiizA2CroAK/JnJ1Ovk3
X-Gm-Gg: AYBFou2wm7zNS9fCjjbGXNAxspPixFL9GOHTX8GM8gjIMYUshgYoIRHrOtUv0oOqL2y
	l0Tmnr4pqHajhTeMt1tz6I8RoLaeVdwqgVyOA6GrcdaaSSfq/sou0RBxptEYDYX/Ohk4Q+0Ejhz
	f+m2lzClp43HaM2FO0s66iGaqA6HJ+Cy+APg37HSUSb5Wgw4fOZTc4yjAnoVe3EInXAZishSbFM
	pmGOYG9fH8wLooHXn2jl0ukh1S5G9nt+HE5VtTv4OAfUmGVufm44JBJWAUkX4cQ3pK2fU+kkpIh
	2Di2e1yaIfQgQ7CwfFqfNr4r6BEscHFz4arH27iBJBrMWuv3hJZv7P+6WfL3vao/DRzG2Fz5pVY
	mnlxMXv4CcrnmYHwksV8+/rH5cMOtagcQiugHkJLIZ76hl2aKHiNtT8VEN3uXafOGgzcC3QU8nz
	PHAQReNSEYko9E/Ex59IN6XJtPICTU1Wx4kuX8fobKviqWIiHzKIjSqDQ52Vd4EqjjVbF5Y3UoK
	tI8HJ7ia8oSXrd93O2De2TVx09QEBX7a4mpx5PlmsiyL1cdUQ3CXononeHuPfWNrPeDCcontPwr
	B1RiFxebgKTGzFcbxWDITot6HqpLAVnfKi/CfkCYedF9lRff3F5Hv68ySaaEEi1Q0IVJ4h7rPGC
	QWVJvtitKMvxg+Vf1vWgpv1FUcucRvlPaWGHJQavJqulvL/A=
X-Received: by 2002:a05:7022:7e09:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b3c0392172mr4615594c88.38.1794461747161;
        Wed, 11 Nov 2026 21:35:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:46 -0800 (PST)
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
Subject: [PATCH v29 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 14:34:44 +0900
Message-ID: <20261112053446.73504-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
