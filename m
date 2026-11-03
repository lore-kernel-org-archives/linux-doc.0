Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693346;
	b=ON6fMMYcFgFFVJpZhPkAVkVVM54A6uJk875Ky0rJsL08YEzV3m5yKJbzFBBfeAS7CJBR
	 i1pVWEDBKkh8O8RS34jAvsN27fPEFvp2pCsd7vlT+PQ6KNlikIq+pgva1dZzDi6Er3MMO
	 yOzcfLfK8tm7RmwgIC6nv3sRP5tbLL71jmIjZjJUzLvpbFWn/zr25CaZ2MognU4TQJysN
	 2H3uo3vISqN1VgFKrdBWDnvDU4kb8Z1Ouqpmiy5GowbX/ghthtM56HiTFUWLA+mSTIt0q
	 Y7/Q+n7HkW2ImrU85I/zIZnvDJtqW3c7zY32VZtJUgrr8dF1fDp26b7dKv7Kw+l74Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
	b=IeWDhOgc0RFAj9b/x8HRPcdS72ilMcCYeHHvceQ0Og8jWks1Dm94O+xLWROqW1uJvSti
	 19f+5sc8SW7BAk8QU0ekY0XAU3Zx5YUbPF207drgM1Tdd1m5NsB9Erba+W5E1xRHjVslz
	 h/XLXhIqY+3EXc6K6PBIlHTkPCT5GUmgw0EBXaxoSwZj0HDfJuScS1I0aYpXtTd/dMzgp
	 cqfw3Gexw+dIlMPRgRWQR99SqyqE+rv7NOj++R6d54VjoGHz6TCE/bZgizib0HuoZDxaG
	 yY/8bDHvKG80WzJx04rz4p1ywj2GAjlWj1IekaXs7866jg0NkVEwuX0ep3sJ6Zna3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900E606D82A
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9900E606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmwxU6AA
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so5792454eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693345; x=1794298145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=NmwxU6AAIxAvJBSJQHxHHhgImf4+cVD/0tpmvK0JzfgVImiRCOpBerfqD50s4N+LGl
         kpADIbgxrbZUlJI+YXQKL3LpROpjYUyCsnN0tQigsjw+IHqpR8G7SJYwdA4tAM4GjlCN
         ox07vsYD2QVh37QBVT70Z0FP61h5+k5oaFLxQvs0nvr5u54bZhLdDBcfxyCeIIg2wQ/K
         wMA7V0d2F1MVO57lglsC/CWhmUmphaI/hBzywNWW91D/ZxNDzbArGko6pj2dslc60WRj
         h9BhiXGBtPOLbvUXk6P7/x6BzzSXp6oV1un04jo19KoMCB7jW+m5lzTIPMGM9FAPq9MI
         x3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693345; x=1794298145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvWnjCDmeIY5HYOU7QecIwh3VjwG9tp0eowU5uql+p4=;
        b=17xjHkVACosJsgFBkI1dm2Q4TnaZ5pv7x/yTQne5ZKZxdNTWNqbqWobuEYQnD0N0O+
         Lfqi74++Yno3Fdeu/LabzjWqBk2oyIvQcgzk7C0116NfEf2/QBAu9Tzujz5dgD7h3sBh
         29XVf+6po7xeWXQlyen2YNomNbsjHhX60B08t0Dudix0V9LlYEUrdROOJisoFsMzHFsM
         Z1hzs7cmjCBNbErrUIz2NYNxr1PbIJk2xna16GQVZN99ckhLb1qMpF7XOHHkUawr81zf
         kTMnFogsPN+q4bNP8TowZxINPv01hS7UFC9HmrfoewufctV7PpqDK4D9LQnBAzZvTWSF
         dfxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmmpLrBCRx50T40e+xhVHMM0wR9zhI75z0j2wtnNFsXkdGdYkBbxAKJg54+0lU8gREXhna/UdaH7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hiMSk4LgVZXebHB8t85y2lGYcavnSG9BeOHeKAb4HzZoA/EMk
	JoMT/76+HXWwEjV5u6a2xBBRBsQu9bTe5f4uscDlwCUrG8zGZNCWwsnh
X-Gm-Gg: AYBFou0snwptYgq0Mn1OW/AsI1G09hJpq39DVgDXbqn2+Rm0RsUCZ9KrWzBecAmQbLJ
	wRd0WRKCg8cJndtf7noY3eGNa0KU4DAQpXoaw+XU4GnIV20clXNL4Yyw7ZGz7xdaBdU8SUyzU8p
	pwZpeB5fu2Vhqy/C2KlnsPndyXsqnQUwo9x3uIsi5u47z+LxW4Y3I0aFcCx6kCKAJGrsK9AyEAb
	CriRPadvpBdjx0hg7jj+GP+rtNEA/QYaHwqKLVSpmmje6UNGLS8rlxL0aedk5BIdTbfMM7k1dfk
	skaX5Li5CVP0hjnQUN32i/V0+yU/7Woif+ddkGAW+lN12T6oRKOgfHTnmWRKdhFfoRD/NwetS3p
	utS0P1OtS7GnCv6nmp2V6Ibh+xAcmXs7dXVHu7+lNSg1wi9xDrYOVZPKndQRnx7vs+9nJD35h90
	84jDqhyi7mFLIXr9zflOeIEQbF1UL2mgpD5xdneCEnhPRov6nJhu3Yyy0IO+JN/FTX5R7eRT9tF
	16cpHAKpyfpe8Dntw+OF287aw00Rc12zOysPmL0aNZhVbjM3/MtqmBTUz/eNGmFGwi6gDazjOY/
	J/Cih1gcdQJEzy7TmNJH1Lnef35bdPUsumizbfN+U5llSGCAY0Te48/ZqFJsGRpOrhDxieOfA3b
	G7AMKKZQ/bPkMzVUi9aUMWm81NKTxo1p2iUxasyzqBtn4oYU=
X-Received: by 2002:a05:693c:20c2:10b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a4260db8cmr20091240eec.41.1793693344807;
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.09.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:09:04 -0800 (PST)
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
Subject: [PATCH v13 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 17:08:20 +0900
Message-ID: <20261103080821.16983-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
 
