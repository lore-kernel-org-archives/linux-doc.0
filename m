Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461741;
	b=2r+AXyuLbLk8LnInnjSEFHAOWYy/4tYKLmqUkOi4GA55czk7fpoUClvduxBXPyuRgO+5
	 l75WQ04Ia2RYIIEOdGFL6BfiifOo1nGS+WIxekyujWwAXavoOePQRXh7zFV4U//xSC0dI
	 jJ0yAYEr+dt2HVbSPNW3VvPkYhSnmv+aCc5yzS9tLYl0Ris0GSBlkCJWfLOKePErlGlO2
	 x2xs35GMCch2WW+unA/zMIMP4uvX0Ue/BiZptOIc+5ijrtBgbusWHwCIQQ1nK8qZ+26ng
	 xNK8StR1YWfqRg4+YaA54Ndw0vbCvKwBSCJ0xAOvRN7gPJS7PJcHU4Q95rgLUopMRmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=POdtQzTt4/r+Bxqi/UB6wDkXa0gQ5CuXMwNDyUbsoIj1rQh+DTcdNZEZyv3Dysnj3fY2
	 x50gRViF6GIeVb9QdYdM8+OJ52IWJCnqvioDdRjf8cRIipDECwSZVOnYI0WMHorpROKww
	 z3W5/V1Aj7qQFc3y34HXgz77aArmfcdBEFjPKja9kEH7DWTV7I9jn6CJS3t2r4gcXMxYB
	 YqyyLrngYLVNWExDo27m982ptQJYMTJBHarLoOid0EYyoCNqrVIcG2OY0m71b/9co94Zo
	 cnM6EoyRgw7MWP7YIjd/3MHI0OlvLIb3Yq8fgbujLelzo+Is3s/JIo3y62xfcFZjWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2625560A3827
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2625560A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyQax+fQ
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so6474771c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461740; x=1795066540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=xyQax+fQOJnP9PcUgV7TweZR+NQ1LTxbH9Jk6V4hTaYIsxHg7amwm+QOcYew3gn1gN
         WqoyJqqQoCsh0McpRL/K/ZjI5FqunaH7jg2VXe8QUbN5pgT54rk4eewYMMmT4TZi90No
         b6iEQseCC6iFkj1ebcI3E1I61PZl1++DgwaEveBV17JvL+vqfMJoykhctIZGHjPtQtlP
         5EHKtl978/RkybW4lMs15UPREN48GCHQsNz6uZqvm+9IOa04sFtCr2Wqg8visqsw9uXY
         mjIaPQo/HB6WIjiTqz7IrLWucySGLLe9aefd8WBMQ8aDH7TOJ2ddmJ+AaWlTwwMh6eJP
         jpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461740; x=1795066540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=jJ5+TaLwVjV5APJGtX4HU3V1aOi4AL7uVyDGUXbdwvyEwEwDj9f7gYtxUpcP9QIU88
         BXUvIi/ouhGwNATVszoO0WyNB1lYV6STeNjDMy2LD9bMr622SR6g5c9PCHQDH7UT3Io+
         k2HPQ1W7f5Zf/Qu/K2SJE1yYlY+6gWRtUlnlyjRjI9YrzpP/RN2eTL6WjCZmSf2NH2ne
         LGfnG2yn6lCexNFhAECLynJgKZ1g1Z7c5pv8JvEPPmPdN0KXov5A98f1eW89Xr3zBN2x
         IWuEhqHqrPmDikXdpd7TreOVLGYJ8BL5VFjPBrpqnzMjLzZIkzRtHMRIgdmatnQyQYz4
         3NTQ==
X-Forwarded-Encrypted: i=1; AL+hErFrVUawosUSH89OPMVh2WjkmzZ8U2DQ2PdSlTvuKC0YO7totcFIrSOBxdXAqrD8LnulYOwhtVDvJfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/K0SDHpDsiJViDgxWyFH/mlxGWKzhD1gZ2nuqhxX89pvsvR07+
	vVRmnXffkS3L/O9ncbB0cLLBYF8BcKdXMB5SL6iLnxK2suyjQuedBtPB
X-Gm-Gg: AYBFou2TtktBgdiG7d7ORV1Ns7uCs8uyurxOOBkMEgFIHuzEFoa8Nhxg6x0PGOiHgBT
	UXwlb5tuLUxba67vXbq7HR3Rjy1z9MF07WaSBXLjRQQBH2h8Q+8MDEV+VHTgs9lp3yo9+wQRgdT
	mxG8+OAJAIg1pgXqTVX8UGu//RW+ynyF7e1+DpuwjsNz0eAXR+9DlmE/DLhRgCPDEERSOSLyfBG
	n9O/BRnfvsNydbNqT/0EvBRnrHVVO4T02tlr6AKSCGcSPxS2PXZ7jg99h3kcc6AUHUd/sVMhV1T
	N2gOW/MeJq6c3hIf5ionAFkvpvaeHpWOmjt7Vdbzfagc5y7sKZ1KUR1WpGzKkyDIwjtcJCSJqa7
	DX+44EJzC3zRt2f6mLO31VseIy/jtJ1a4POgJ//y0LRKoKoGYmWDNW/p8d2VlynQhatQ8N/PIUv
	MDA4JjwJ8Xbvc+MZ27DC9ZmSPbc21prVaroNyc01LV/036avq98176Imw2pss/GOKlAWVu3xjtj
	HfO9vM4H637Y6eehaWsH/4ipKqTQlcmvNnzxFGvmldzJJSV4EHu1WstoPQYZQ4L8dA1aWkUQK8l
	ErNn28xdU9Sfw7m4V8PNuKVA2VEQ2xiMK5w0xBLS6YWZ8LPHlDyKtW9A77XmezWRKyFG3EzodOo
	R4Ks4k3aS77kDlssLhRHkPBNVWpU/YaKK9lNqdQacO+6isIM=
X-Received: by 2002:a05:7023:a4c:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b3c03767b7mr4301004c88.46.1794461740120;
        Wed, 11 Nov 2026 21:35:40 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:39 -0800 (PST)
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
Subject: [PATCH v29 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 14:34:42 +0900
Message-ID: <20261112053446.73504-14-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
