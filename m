Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180555;
	b=oojciv4qUH2LKd1iqDhGxUpdlC8veS2QlUXQRie0+6/ksKzHsSoFMBoQuOYablck4NW6
	 qOdnK3ZTfFwCYVrT2vrQMaJC0ie/zvaVol/tdTiV+SZkvJ0qXpjz3MBaOXK9LFuYKypKo
	 lUlMdQOdtRSgETcSxnj+x5RqTmO5Z1YD+TIW71+UOkG7cBvi/qXLg+dH8MskwD7LbYS53
	 2TipH/3+4BxZWBVN4oSTKZgwRROVuf7JJPr29hyr0Kh3ZF+liXzf7wtLblo1bB4w+WaOr
	 KxKUmkwsLfZOi4dc1ODVbR2cgiA1NTj/vMjm5Y4KRELyX73Mt3YrYNJdrV1MidR/L4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
	b=qM8AfmMSe3Z2HYlIL6WRrRBB0T2c7MeRsKORGGspizrmUtnb8oP3lHbUzgStBbLl+1Yk
	 wL1lWy/3YPUNgqqOwOFm/1mWLeyfMHueXR3pHJMewch+URymrx5S6V+FFTBjWiw09pl9z
	 OJOymcxUvUdaIj34UQGqjhmE1H6SB0AQFEd8qpRjlCp7Ptex1X2gpPw7p1GPo+UYZVc3L
	 uSOu/UX1e7Rij4lvpbsd4+qw+9T4kt3trxDi5NJMcYvGdrluicjAy8qKMKsNWHD4HvrS/
	 HvaQqcoSJzNmPMkPpDe0DaHMrkb6fxhKXi711m4Tbp8qVtturO0kYmBujNduSNlRLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78760A3803
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B78760A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B609Pss7
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so876359a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180555; x=1793785355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=B609Pss7x1M+vXFNl9WZoVkKNOL9Y1aSRCo2gJtMqpMlah2xfLBYh4elDb65a7RL7Z
         P8vmh2PA7ZXnjcXq1H4rsJWB+yidWlakk+e8CIsx0q7DuRBNsWgs0OSjVqeEBexp5tOR
         XJmiQTW+JPOcwiuVq2bgs1A9HTUNt8LlHf1hrmF6h0adr0PigdN46Ehotm06s0XzICg0
         qTxFG+zJB8WlH2BpWfgR3ODZcmkSI3FOihNdTb+nPhddmpmOnhipMj0HI+ce0WYesURu
         buZ1wfdxBjhbsoE0pNSAe8B9smDvD53IxCsCFyIZh+Lk6fvz9+Go8DBLA/j/ursNXZUg
         gWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180555; x=1793785355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ymp9DZsSdxidMhq6vpo6Pmh7FGUL13x09jBMfsRnJjE=;
        b=R3vPgl7D5Tj0YPXyet2/mqn4+y2R6WnKRYtErLD07STe/q8qijBoUWkUmwifcdf+Fu
         smunJzvbqU22RFKBryDLC8wNnjyVwf73870V4QEmMLYZ0o28DtF89Ps1klZQLYAdSW6u
         Fd9mwkv/Qry0pJw2ry50V2Qxatj9+5HyqHMO1oferhGPJePyIJHrSFm6DpE+nhWXAg41
         q5UP34w+WCqbYz7EBZuwEYOgCdSZ0GU6yJwJ+ooISEQRIImyGTyndZMQ4LrwcQgH4W/s
         iwQDcJmwjN0d8GNol19ikJcYSk5p8/gqFBk32kVIL6Q0sglvPA+xsQnlPfsi7EVEfkya
         Hv/g==
X-Forwarded-Encrypted: i=1; AKwUvBzOl4QslxJOpbB8QV0n54/xaPFyWI46htja2pX/lQQBapYjhjOaYpbOBRDzddYuMx4iZ86nGDnrxaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB+r7L7BOHUqFA69AXJKTTFpfHbQ+dgidb0NAoZcRPkdHMYGgh
	OYNCai5P+OffKTRRxWhsrXCVc302bEu30i4zvCBCoKk1us8YgVVIFibz
X-Gm-Gg: AYBFou0d6WCFL9IlMGSaqr0cGYsxBseP44te90fBfw3VU4dJudtC3e2Q3SrPAeolyG1
	2tpL1RJqXiDcxFmGdGuc/xhU6kafXWVNYNcH92Lkn8fr7FaLU1r34OsdLZ/Fytwh8tzJWn83Dhg
	jZhZmd+AoC0k3uf1RHMk6owWzb6TSzHYxbjV9iyZdhKHfryqZSdYFgvkDUS+T6JIeh77xStRXEV
	J/RH033ucdQ7Y++MNONFUv91fTeQURTze4ztIbrGeqslGtPjfetItQN5VM8NK7IWa/LAanSP9/M
	V7F2Cukh34lBEseKO0TNI8MSeTzavdX8n9rIS8A3Xnhk0XAwLl4t1PVlMliZkn/8HUByGQoFp6F
	Wl0Ip5lTSDbooTqjGbgFM0bDkcBLbH3MH0m1ZPkVl69eaeYIJOEktFXYpEtIHvoQag5GEgt8Nd2
	qkFa9o96CU+SkU3zGdBeEe6c40HwLVG0rA/5v2ZSebl5L5mv+96NQVp487b2mcBgq0WCP10Wxo5
	1LUrQHcxKBR/iq2tJk0UQOKNAVUQl2w7QNbyzOKKoslnoB02/jryDLDa+rcpzLUK46/1iN4k04Q
	fj1ZMtAT5VxkqkW3I6ymLLARFx2Xs3bw57YkeKsdO3LuoPOJgHZtKhwTFCjbO4zQtsO7beumOOr
	TvXiTgWP4GOL/Ih5uWnAD/9UI87jHVSMAUdu+FIp7g/Vch30TF+AFEv+85LXy/EsUjfOo
X-Received: by 2002:a17:90b:2587:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae5c86a185mr503200a91.23.1793180554903;
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:34 -0700 (PDT)
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
Subject: [PATCH v7 15/16] ALSA: pcm: synchronize stopped paused streams
Date: Wed, 28 Oct 2026 18:41:31 +0900
Message-ID: <20261028094132.20364-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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

A paused stream can still own DMA requests even though snd_pcm_running()
returns false. Stopping that stream without marking stop_operating lets
a subsequent prepare skip sync_stop and encounter outstanding requests.

Mark a paused stream for synchronous stop when snd_pcm_do_stop() handles
its actual stop transition. This also covers paused XRUN cleanup without
having the driver predict a stop from an intermediate ACK position.

The non-staged virtio-snd partial-read test previously failed its first
prepare with -EBADFD. With the companion driver changes it prepares and
captures 48000 frames. Playback pause/drop/prepare/write and reopen tests
also pass under ARM64 QEMU with KASAN and lockdep.

This changes the core stop path for paused PCM streams beyond virtio-snd.
Coverage does not extend to all PCM drivers.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a2ea44c..ac2e5c2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1611,6 +1611,9 @@ static int snd_pcm_do_stop(struct snd_pcm_substream *substream,
 		substream->ops->trigger(substream, SNDRV_PCM_TRIGGER_STOP);
 		substream->runtime->stop_operating = true;
 	}
+	/* Paused DMA can still own requests which sync_stop must drain. */
+	if (substream->runtime->state == SNDRV_PCM_STATE_PAUSED)
+		substream->runtime->stop_operating = true;
 	return 0; /* unconditionally stop all substreams */
 }
 
