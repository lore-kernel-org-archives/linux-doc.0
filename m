Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837396;
	b=j2IJbHLFDArB9GEG93Ijg+FTJRVFKdp2+eLRejPUsAiCij1zJIKY+QIwKtivx3kuEkjU
	 SueVqW+K9hWGSAgXSCHY7fDvr5VRsTHXHaoRoHPOF4FQuBzdHLb++wm/cDoAQl3tBVrpd
	 LSHY9mtigo/2pd54ObAFc9YrXgOFuMMvEND6gcRduURQK6a4KXhjqEU8/IB3K2JlNey1O
	 m+XfD1+OMjyf+iiZMCOHj+KxJ0MjYGB6vPaC2RrWUqBC2kCUgwdr5zC3HMvBWI3w26xYq
	 O7kRDHCFW7ZWanvttNxt3bFM4B++T2Oe7tL736FITngnJl/8kPgyMa7EmpydsUYpybQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
	b=nV2jjUe8z4fEF8yWdoEasp9Oj7PNeCjcp9gxbfenvrvKE1FEXE94fd5v4ODt+BzC8iUE
	 FBaWwezgnXRI0cSd4qagKs5Xv9AtJjJ6GNseKhLMK224kPNTzG9iAleDwBwuVvT/bJG5r
	 m2DkJqxFW3qLuuRULktRWxgUqpI0V40xJ8NteK3GEGUHBd3bM6y2JtEuudUSc8UoB/n9Q
	 z+DoxMNWh+qcWUiPi5Tlu5XF2hhUTGwFPnwFBJM8SB2mHssk9gE+N1ehZ12A7nJ6RjvMs
	 eW/+YqHrGkRay0EGcL/Oeq84qv5ilxyLu+8+9SFbFI2sP8wMtHwt/6A9dfSJzz/iiqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422A6082BE0
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3422A6082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jn+RAC2a
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso961604a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837394; x=1794442194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=jn+RAC2aFvaKWv/CHLd563ZuPUG4ifSHfCIbLG6CaNO18w+mIJYstP/byGNTNPK5Pt
         quRyHYVH1nz7kuvW0f9knNpy2IF52H8qvdrIqetP3wGlRnH3Y9UlAee68jLY30ALXGxw
         isik8PZy48NnXlMyu2JyYlNvFXBj+OMQqb4aci8kNh2hxryKMdkyhwXiBnelVBUEmVmN
         cYEhyRsAM0nPoT/aOVMeRRnXsNvJ/Aled0Bj7UeAM7Lj2lN97lNZsGAH6pc2vkHYAwJt
         xAQy1PUbluKm4bmBCuXttpT2DcFVRTuRI1k8buTqq2NNR1rkGVL3Fp4Rp49t1ghaeXr9
         3EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837394; x=1794442194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hy/84DnLRHSkLYr0y43NMukCMjMkWuzO7+IZ4PjZ4VU=;
        b=x0//HD+QBjroPLdwtlS3J6boX9+mxFaJb/+VTI05tB4TtgyhLDShRA66vOHG5YOuKQ
         I3Ha/6OmDdfQD1mdY1TUB2t2zn8Zke04e8VSoFhIN3iDt0WS+crEaG+QNMncYejrpk+Z
         TY55YTp+U5MO+Cb9hPU2PldYV+uAJenVokqh7FloUVu3fPBsf2gp0mSiqLoPDt367L8o
         eJ/eWfTomsnY+YCTqqbrJwxgfF2L8LA9POdR5AhFDnpC2Z/75dmhoScfgCTV5s9E1nJf
         TpLmWEGYeELdlT2q5RrwVdjo6WEjE+DT4YEVx7m5D7ZesrbKNYaskBQpUeEVj5GPIald
         AMhA==
X-Forwarded-Encrypted: i=1; AKwUvBw6Dfy3+kqw9h6UiCMuWdqodo9Q/C5rzBnBQWol/jh+SC21CFvMf8zfuX5mKM/aoJo+XeOW5mqlLjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z90GlymfJpcUpSKZuup0OnJMlbEgfVVJqHT6fsjfPcKO09fG3Kv
	un5H1zLX8RA24rnOct1zrUOlPB3wqQJ9M9+TZ9kgGm7+t7MWd8mcwPk0
X-Gm-Gg: AYBFou3YQUaIjUiFgZtBx2plVwpdt+Znzd21P6Wc7URhItaceM0Yj7qXbz+057u3u40
	ikt6/o05evnj2EcZrzMnomE2wq5OEn0tfAlMGNPD8V41WjgZT754F45OC447l7Xf2wPWVjtX1WW
	fqWOfuoEVEeNwHygOjPq7roL6JwDVqmOuEO22i8k7LAo7uQYyFhSgQR5fBRoOWmu6qQeYaoC0dK
	1ls4weto5az8Na5olg5RkbwQtw+uunEtl+Ezi4CtmommH0u8v821iuv/06hAvxqfcdT86K/AJj5
	lqOj4LsFwlMHzay+QNTPhqK2dnmFAR6tCODjcSnAqswX/0BaVfum17JVLdfK1OQPMa5dOY3X5HB
	nEJvU7Y6ZPJlvSwYMMrhYbVFnVhQjCArnQhGANWaHC4ODMJNbXYs2hULKHPQ2/49XPLOuzZzeNn
	JnbQvYeMipu2X2XET4dXsqE4M0LIJ53AlAZuIjwidfXrxEtWiZwSwSAOBNlG1tOlB6KNmMEFod7
	5PaNnBMBHDDQKcoZ8dTKwqPM3kQnSf1GXeZ8J6IDtzTtNopAUuok+YmNFX5m/nzRC4zK2j0w10A
	4pfk/YlelRZ1bwpUXZqFLt55A7TsQXwxER1tGS6M+xhvZuXgfkyFwYl5IF/QpfeCfNKbV3oekdo
	n8UrTHbXRcNosnmOnLPYiHR2pf2Vz7/TR5y+Wo7o0ootCTx+qvTkW4qX1NlbvBxqIS1Fq
X-Received: by 2002:a17:90b:2751:b0:3a4:b3ac:904c with SMTP id 98e67ed59e1d1-3ae8984ec60mr14592568a91.51.1793837394483;
        Wed, 04 Nov 2026 16:09:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:53 -0800 (PST)
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
Subject: [PATCH v15 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 09:09:12 +0900
Message-ID: <20261105000915.15177-10-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
