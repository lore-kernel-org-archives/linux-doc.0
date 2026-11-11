Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365876;
	b=AKTghfGJZP5lLz+OAbndYIPM6MvYM/jRFoDT66KUrBrUxuXuC3N5uwegJ99krfBTs8zE
	 bTm5Y5GXl9QPcXJHMVDVzb9owiytfL8gPDK+G/VL4UOIOFRXhqOZ8FvjxnsFoeQa9FK8n
	 WN1GQH0CzanPxyRsY+MyfLP2fIcRco6Qj0/BnfVgKzvAC1NhlK2jFQd8jUw7NBjSxYQCr
	 WbYNaqTWZiNKWIG8uHuouOlcS5d+GI7U+TRYrP16TVThptSlD2VWIwVhQvnSIZ78ciHcY
	 MoiOjA4v8SwAMC9QUX2NMGvkOlwd5/iSqd1cyO3IfVgOYmbQ1Z/eo3brPJE/2latjPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
	b=k9QIOqzJ6UCmIbAsmJVa12WVWq8ub6k3q+R90FdnMaA1EtYk5CoFTLeLcRKbFdq6D5RB
	 nrbYYEyU1C1fkwzH7TngrJoTsdneissUvTwAqlF2abqyMiWXwnS7YUCwbOQenPGfaiEHd
	 m8CQmXUs0sbPVyut6VQ9JmIwxZAAp4HtzEw5GnjiZ+uIJudScqx84OFGR9vrXZaGvtrbZ
	 w8Chg+ekbEVqZmsZVVh6KqOhiEIejq2qmUGqBBar0324GMD8l76D29rNg3HUSiNMMfj2z
	 pb3jkeb3T9Ad11idcLcTNZcVJcUHaYzca2mWo0TpltAd1tUQIy77qmveMwZ1MNhYjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B560A383E
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464B560A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aY5mR8ip
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-372bdb942dbso3508723eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365874; x=1794970674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=aY5mR8ip11gGyYZQJiGIXv6qMAE+YdqQbCLxqehubKBHVVjhCC0iPEJyLfFmzj43qu
         YR+L/OwmelHL/MTC8TAE8Q/C5SgbLkwljBcQrcDsC71/hoTjVPjoyOtAzm62cWweK7UC
         /G+HXLCvgfLOZeZfNtoGuUiwNBTP5mtx2bomH2Icmwn6tiI7aj1mDixcYRNsv2LnS/Sk
         zek89M2vSCIMoB4eWVAVzWjWjsIm+IEd5kfbfQNBS1VBidQyjzuHzAzUb71W5pb2oMYK
         Y6dbhHknDUBC6jkg17PlmY1KJ6qNlowvkkpcqq3fKs+cNLBYxaf3ZCMOMkq0V27ILh8x
         2cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365874; x=1794970674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cedV0+mBiOhhOlmQFuEFj3GrQxb4hXlX2OGeB7wX9RQ=;
        b=HmwTsqE2vyh5W4ImM4FlXOnu9DDwWjnhNMiwySIRpM5KY3LghC8/T5lZvXuK7Poubg
         ac8Yr9smSH7pL7a3eJDq/C051RioKXWwXV7s75zCzc06HaXhmNuJwEixezEkEIfNc5C+
         Lq9j01cScGfIUG6wGGig3zlNdURkOFmjZsFQTrNBEg3vNoE1r5OcIExeFX3/JsS5qsQh
         rbsnxzTrWzajgx2g1jR4oYwtqK9/gCG2O2umuhzWMeljq1deP6TqnK4YbnvmICU2FKLl
         C0+NxA+dP6z7Q5zRzGnAvZlfnIc2GpjzExxV7obV/g/vhJ+rFR7qnu3m7lingFyidvYr
         TH3Q==
X-Forwarded-Encrypted: i=1; AL+hErEq4QVbol2AooYC4eDCczuDkKcm7vB3EXANXnjiOUvnamFNNCKVMLceYDqjr3y6JklYtnITs6FVEWY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u4Gyjdva8avNhpQdSu3UNWTawi1whS8qPEOQAxW57UxpV7HWU
	rVqvLJ9ov1sLs+ecDzBohqeygOgxvvUI9oVxAMsrTi8VXU0qprNqJ6xg
X-Gm-Gg: AYBFou3GlSnCqyxl2jqlscAnNmo3EGFVM/kuAhNIXadgpexae2fBqFvNtnGGvs8wYzw
	iAM2wa1V/R5tKerEUW0w/JGRPTCNFxP4myK128e7nsFKP6Yf79BMzdaq0fzjsSTdJm6f1cd26pQ
	MKKycGnRddVZXuVOctCb5oeclNxPT80X+FiCOwjXkWjIXy/mmfv/GpUATzwbfJAreQU6Lqy9FqI
	3KQViqAyV5iMO+6d15zyx/EGfSVQPBD0hQYIg9SNJqUp1Vxuww/LBS6iEYh3busbAMuM+cvcvJc
	2jLoKbdbnWRHaMvJ/2vvd9BOPyGibGVSGIqiS0EsRLbJFBN/22rN+t+kstwaiUS0zrCU6NO02Vi
	tqHk7slHG2hXpHBchqTg76bc57ZVZS3dTKRk3sBl61T4TqgkVzIjAL4QkneYQ1Dh+IcW9G1NPG4
	BN++r1Cpzr7QSUwLXC8Ddq0xt/rQ9p6+YUQ+TjsmOicEN+B75Kqy3LdWpCzlzwyi7B+RQm+i6CZ
	YgUyru6u6Tc7NFLydD6JUvujL4K23sdWpeWTINVIoR4AOF5qQREZcIJrcsIubKIkTBjthTSw9X5
	zME7cRjdO6OZh4+lBaLM9MydbK60XHX9PAU8IJW75WZV/c6VXs1E+/kY8o2ESapjC/k2wJyIZwt
	xJlNqZY4C2Dj9aEFEDCfS7bSPxGeNjRmrfw/aVz4SQ88sLFw=
X-Received: by 2002:a05:7301:dd98:b0:369:d486:457f with SMTP id 5a478bee46e88-37683861625mr1886638eec.2.1794365874080;
        Tue, 10 Nov 2026 18:57:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:53 -0800 (PST)
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
Subject: [PATCH v25 15/16] ALSA: virtio: reject invalid playback completions
Date: Wed, 11 Nov 2026 11:56:54 +0900
Message-ID: <20261111025655.63951-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
@@ -980,6 +980,17 @@
 
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
