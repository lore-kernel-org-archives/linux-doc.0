Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412572;
	b=hmfJvhEcy3L1b/ZSRLxGAe8/grjOipnHzDZCwgkIx5qqCwEsHsP+PEtN8058QywRzhCj
	 yhvzw7tY4RQYmIiSPMv+/5QWNrIsAhaSUw2W3JnarBdLsuMobh0tFYq90OK8CnUn33PYy
	 r6uI7SF1zGhCErFUI1ZNsY0knw1GS+sy/nRy74YDYywrfK1qHwGujszsf5Nx80vO+4rbV
	 MMl76/W0DylN7VT++6vFGQZBF3BNUCWgXFY6lxXOMYl9QlC3/Wk5zT9z00AIsFH3CaNC4
	 Rf/1+gGSAbTNGtAN5UdUEqrJfWC9g+xoEkMQmuVZV5ckR9Favzp0TPa2wf2WJn1mjjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
	b=c6/cKPgPBPXJctnLZQBKevM+daoX5x2LKE5xUXVszQQEChOQVoINcg9315F7EEor4N4X
	 piBde7of3/9Ydm3/w0TgPgLolpLnbR1Dn7MX6kI44+nhtdKvlbyhRar5cDHuyb0zjlh/P
	 8ZYQQoTLuF8QZsA34g0Zo+cOoG2fYzBlDyQEjSWgpjIbN6zPBS6K7iJjxLk8BwjZiGrcA
	 qXdjkpgyPbh8pWDeAAXbjC+TISotZjpft1WkpAqCYG6bBH7gZD63yy9TI916RhxyO07y/
	 1TsOZHXPwJtJmCxPMNPwyiB6x7mcBQMwZnaU1zAoQ5mZCDepIgJQAcHaWdXpkDDBnfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W/9XsTiN";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36167606A326
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36167606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W/9XsTiN
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1917848eec.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412571; x=1794017371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=W/9XsTiN8vUYZoabNVR0HlHP0UYxL+wsdCGZHZY6+LjYxmD+7QQN/7QH4j4D82iDLs
         BigL4SDx2mXBUNVNg8ZLffFXVDYzwrEudIlCWPEd39VL5GrMz1eX313tPF3hZDrX/y/c
         Mv2SjKP3DPi3VEHtaQmeubx76cvByP6n7WbNxwi3JSVCRlW0JcsqFREKZuBUmVIRFNPC
         ukkNUH4waDjDRUlXhJRD3vE6Z9sdIYzbaID1G+94HOxpfQkvqjQLk7tME7yROdvdxVih
         AJS5et72okgj5kMtTJeh/1l4EmT2XJ+KpB9HPuiisklT0mhthHAdAnpov0KZ1GPFJRCq
         ny+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412571; x=1794017371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVOqK+dUFrJ/HwUxLGBp4tSHQgucC63Ybu+Vcv9325E=;
        b=suvizUerZlBg1AvonCjqCuGGjltNzhksxIqTvQWq9Oxh3S9jacRqZHoQmuk748vGRt
         1Gwt3rga5uDqqxgB7/IJc0du/iU6mTq7lXBkT5ytMjuY/RIgGdxUrkrco+226Z7nlUO/
         oxHNdcM9nFZPEbJ0hjZB+DyoOxODtX9zChMNevtsAxoeBuWDXIUKsgP9EWCB6+OkiNlB
         WNG10AsRrpeRoUCZkZQH8cDyKj9HdzlJm9PT7d0SANEGXWFKmtLK4R2WltyRzBCvHmdZ
         4qA1dymk8ezNtWtmifuiJFAWpAYyMHI6Epw1XBs3DJf28vP0QuMRDU4y8gGdU+LeKUxe
         5RQg==
X-Forwarded-Encrypted: i=1; AKwUvBw0KG5dRjlnpQZiDZmIKozGd/MWUKbGk1gHtiysHsiPh5pnHNYoXbnnoNVw5mbAr/A8NEiOPKxgNtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvtW18Yfzn1/X2NA82862B+0uRC0mfneZfhsJaw1DQOMbzKrAH
	9/k5xkE48DJPkZOsp0j3VBQxShYpqdRUFQRiXlrn3V1sxrLPGrrXAjE9
X-Gm-Gg: AYBFou0lo4JFj1d186A29vc9jenOrzfJtmbZXQTGdK9co9q2YBlh1dANCwOQ3OUTy+I
	q8ZrkyTidUWPRwALxmURFUBJ/HWw2Dq3Szdc9M074RCv+FuFGoxTgUtnhAJBoCPCDamuJCKT+sQ
	0EQKaBK4oKLD3yCZwGsc7L2k+J4k4FlgWKh6DiVEu9BDD4IMeAZzLuxFhpiGjdyZSdJOMNiViE2
	aKOV3dmZBcTOP3405Rm9oK77+jwQtl+3IKzXp6X6YYa3JMSvzFW0e2bPj7C+atdIU+mGqWqir0q
	SeuzTi7+f9g1LNYvNjl8bC/le0AoExQ7sIwAJIphCw45XJ/Fm7E7RbwDMtE6XXnfmyKebIYD1n5
	9oim6Vgy8TdxdNlY9fmkaqMslRUkLcBhsl2qwDaR2t/L0zi/5dNnaxxf3mbuO6aBawb9/pci00W
	3t+PVI4QYNy0WSlLJGES74tj4QsQzktxoRjOwHO1XJPCTSATOD4fbRujyrv3LUH6Lu2zqKy0ucj
	ZCG0vxCX0y2q466YF09tU4rC8UyTclEn+oXNWEfW5pdcOGnjrMp2WVpwLNwjm3MRs9ke8wbzQe2
	Qb3/PKXL9LP3peL7K3s3I2cPZE0RkJneTNzvyk3Ac2Ap0ziHFVgUf23Wa/uy1b6E0JVpsAQRzXq
	6V18W1vqKGwe4ijLJxVphmRqKv8KUWkdQd45t1QdWt3ZWoZ/V9YiiTTaDQE8GSnl7dK0=
X-Received: by 2002:a05:7300:f285:b0:367:50ee:f7e0 with SMTP id 5a478bee46e88-36a4244116fmr5219036eec.39.1793412571307;
        Fri, 30 Oct 2026 19:09:31 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:30 -0700 (PDT)
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
Subject: [PATCH v11 10/14] ALSA: virtio: prioritize staged capture period work
Date: Sat, 31 Oct 2026 11:08:51 +0900
Message-ID: <20261031020855.2402-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
@@ -161,6 +161,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
