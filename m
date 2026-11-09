Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267698;
	b=3HrzeFMi8baeoBeFsVF9qBKgf1ee6a1zHM5OZmTiGATUyvIooxjLHhVooW2ylkBwX4Lu
	 rZCn0xITpo0GtDkphvOvnh7njg2RpP+Cdg8/r7vaUNsq1TqoDMoBSLApLKerropQUX2vn
	 OLJVtub4dIu/qfDnXoFDjwXwBJc07hqprRsNVuixSz6LdTQ8GjH7rAuX2h2bx7iTDSgCg
	 FpfBO2wtwdB0y0W+LzNO/PkefCeAmWO9QpBOm4ba/DWcLinBSCWfOGk44dNT0QbDlk45y
	 1ORsnh1h6zG7mLXiXJRfLYI1UdGGzpmibXA2QqNyUw1dVlE7FKisk8czjMVhrdEzGOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=qc/TSimlnHlaMCW2Gd6iM9V5DM2XoqjNk9UFKOVHUBrlSb2OuKVAK23d5b9wl1TgFjjC
	 Ew7DY3bAFjTyOfEmG8oRqRtXBbKGoYXUXf2v7rCoNEOO1i/5bDvZ8E7FP02bmH5mh0Pyi
	 go7JaMnS6ndaHcj+HSnWUYphNVUF6lGD3x6WFNYBURWWVxuIldsp1j+KgcRlbk48eH9DR
	 KBZ+8PhzYWdOpS5IFi6aZDiaORk3GqK1vVw+BxFNk3vDTg5MqgJCvy9Gc1VEq0ciuo/Nb
	 TYCiNmbgYUiGvzPhoXajqEOnurZcg0riQFsnhAW03ptmC4HBhQLVd/uM3pEXFQJzbnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255760A2611
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6255760A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOXyq+cS
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3704d30b84fso1820501eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267698; x=1794872498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=fOXyq+cSXf2AlvOAXFEdxNXljERxklqhGVDeNzLAQgY3isaWq4Em/VJBlhnJSZxZcl
         PE8g0gRDmy5rNm4Ud4FHIuklDcKDQ/QXOVNv7xpqhjINNeHNSOwdm7PhW8/wR4hreUhy
         4dftch3sFcEXjvtv5pn0CIfwdkim4i2PqcGa0jJZD3Ut5/LpmKwxi2bJISrXl0ZEQ7zm
         jEFS3T8EovVvtnqHOGdh4eWC4nmXHuX7vj4QzN30xKCisUwrwm/FPiwFijGKYFA2BdW9
         T38ErkoLFesub2KMAeGRt6TBJvjqnjNEamtaRV4q+0b89AoE5e2qs4I9buYdqBRoqSlu
         AtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267698; x=1794872498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=d6P4vCvGC474it5JG2CqL/S9zmQkYD/2vtwkdpszZPXCL+im91zJbfa0KuvG03MoE4
         PAgu7QRDmbwcoqtMY0N+dwgigkwxzTbH4Ti5GQ5AafIbqoxjlSm8EApBUN1lQI1WmhYB
         KNH49EiOQ61hlIUNVJaXkZc2XhhoIS8hb3iL6twMSj28yi0xGv8p3ox0ZGB8qmqCVWpN
         cWUnkINHIC21AILDBPVgqow+0rAYMsrq1J+i1gj46ks31hZ28kO98F+hB4xxUleix5Ew
         wOommOBFe/mfPJtPq/VuzbFLuuF5iZ7pmVQWA5yvWnqULfdmQTumTVacOgum5lSjY2Oz
         1Flw==
X-Forwarded-Encrypted: i=1; AL+hErHzOycC8r0eVPHMYA6T2V+nBUQvEcYA2hARJTIDdNT8h+XnkwB6TzsF3+KE+KqKBQuCheTFqUF4k6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oNEYep90N9VMOA6KbHtcoKGJWpuOYa8ZPt4L1a1qRUMwtLh2n
	4mElY3QroZP77UdvVoFohq3s7abNI09DHnXG/b4/f+rizq9Ou74E+gkY
X-Gm-Gg: AYBFou1AYfk7tH57d9t7ln7W85+R9SJQf1W5L5JHUoW1zoiva08uM1qCjkeIdQ+kWk7
	2Mb4SBPr7y1P1A5tfLUiKlKf802WiRftTwpFnTBAHdrAD5rreU3/tZ3sVYjzRD4/ZmpXtuRPe84
	8ViIH1uxtXqT7qFDNHvCtmOJO9FhovXja572EXq89Qxc4A4Y5SKAndqVhMLmFqWSnIjKlY5MSqp
	KsFULsCVc5smXihTax871pSZJAoVVWhCQWxkQfbL9DZPUZ5lFbz1F5yXSEta3l52AZ2kpX8acl9
	UCUBI23/CqICv2sFRqncK7z4atFyJdGmVQtsy21/yqivMbhF1YgzqB+6mygkPhnlW9eDu1jTKLc
	nyvBkQAMIRSpSlSwJVFEt1eaZRfqw7F4eY9ASOt0xbQePs76cyRQP77mSXu6DPhRaG4CRUMxL6i
	aDJSk8vs1hZ11rFLKzTyt62rgNp/15nPwtxf/qcHq4uY6jXPMqauf1Ff8uS9fGwysd7SHIuZmfr
	FAphKaoEnaNBXvzVXqKgLjAstO8I9U3Ehm0Zw7xNWl26Xmvh+roomrSsbqfhsn6DaAiAivDsqxE
	BYUuE0W1pcXD81Posw4FbVnDmBumZPHlKsR8DEiktbuq/TvgWesLVSi4MuYy5S00RKOt4Bw0cB9
	+7tV5OO8nAkCrCP7pzFMUeJqn0bQkjKvMjljzdeLpU29WjIg6
X-Received: by 2002:a05:693c:41c2:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-3751eb8db6amr975022eec.9.1794267697349;
        Mon, 09 Nov 2026 15:41:37 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:36 -0800 (PST)
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
Subject: [PATCH v23 13/14] ALSA: virtio: prioritize staged capture period work
Date: Tue, 10 Nov 2026 08:40:48 +0900
Message-ID: <20261109234049.79534-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
