Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845953;
	b=MESAuEj9wiIBfizSZE2zfBwIGkk3/5gIAEgM+8dGBAtbSuFTRXv6zDnLm6SXlFv43MF7
	 DjksL87oCDFqSNhz5FW8N9307DA9gJuZ7H72EkppdTLYcCcirzhB9OrFDwHwoxxchthsy
	 z+YBbYMwftWNepPfSi54R79gWlUCrRlK5dblFOKrHMV4tt5OwIcakC2kadO1UfDEGktUg
	 Lp7AH8H/PnTcbUZQpAw/OaHSLBF1CMLyJjBTUBIQmBbFr3wFIbLkGhzuD9uU9pa9+yBlO
	 jKsh/nz8HwiN56/WH/cB38diiQ3ATtUoNPZQjF24JPRLKb+V6aZSXC6FS9OhqaYzA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=vI5+BYR0KquxWpKDxuD/ncSvKE//MwJOPHQPpCQud509yLZm3M/RarTSUjpGOjf9rX9a
	 kTTNFYFis/PYllN3d6jYHKWQLg9pvMmeQ653nVlWf4YbB/0C7gwJ4WsAtesfgV1RfI/KK
	 aRiRi4MquW+y0kjheVozOalHmbpPGhmqBKPmVMrK/08uhD/qoseY0mNzv6469X3bIdL4w
	 pNzZaNj5YlxZaG+MXosYP/Ul4z+hJEW3zbmsQtjiE5YVGEgXh1f2TTlQbLE3bGU4DbJZu
	 8eBAdDxdNj6qIfytn2mtwGJ4s3uHcsRqfbPrTrY20ru6MJlNFwr5Imcv9Q91fI3/T7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD4E606D818
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 02:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD4E606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoJAcVpJ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso611842a91.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 18:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845952; x=1794450752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=JoJAcVpJOhyXee/JWB/PoQB3MtMG0HfUat9AsQ6cBMlU8S6JPeIQJbDuYbmUVLqJ9C
         lrlXSOC65FYzLGRJTdED2xImiZt4SQ4+PC++D2eKebKZO0NNd1tmGVB2wfevoGPRKO8z
         n2M557KvKztmp/W7ss4S3PlJQNcyOdq8ED15D0y4eWpswzKooypvVGtAoB52ZavJFlv1
         H7QA+ft+doBXkTPMaN8gYdY5p2uASU8royawd534q1uV3Xxg6nB+1KpMWycSyDxi/jjz
         nT7HOWloATHa6lvV1xLxJNFIkmQzINNt3NMIc5OGGm/oUEmtSUIOtjhb0Y3I5nS8peHj
         CluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845952; x=1794450752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=gsYmscYMzmg0xXkct8pVJ2raiUPF0hWpfzjRt0mJK65dX6hbxJ8g4zHBV4ZdWSm3ky
         xptYmHxpJulz+VaK/A/YLwXkHzAzRpWqSi4juFD0EoRBaffElUlXovNkET8Pw2XjLCiX
         o4JYII4+Gd9Hj3LybazjTWkf89AJ7WfETrYd2tB5Oc8MLWYCPJ1ZVGqNNTrFOM81Uz85
         5B1hJRbYfsuu9VSThKyC2Qo5x190OIu5ci/BRlnPGu4TIvYB05qzaXtXsn7fvEkp0eVx
         TbZD87w62EQ4RMU445bNiNsfezh7gVrVSosHgK9qd2ylXb1MyxnPqiQKe/kjZBCZplPW
         l44Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9hBbVzWPYf3RuLbtQFNNPdfZNCmgRHjxEFgGNzpb618QFOlp18O/5twp/2n2j4XRIsJtvHlK2ndY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aT9nnpLDecIA42OKFGSfPEs7hdRtp1I3/pexnWW1wjgyyz/8R
	9++PUc9ingprh1M6ddDGpKhtNWhp7Mbp8dGmUfjlcZ0XxRYV0lRxyICQ
X-Gm-Gg: AYBFou0qiWucIuN3+siq5Oldnm32udh8Eon5NZ/umpFILDv5qIioho7TT8x3zA+Nj/M
	2ujIA6YutFbCMvENamNklWbIVIB5yMZk7axK/6Esm1+y/pqrjjRufm3YSYRcET/f3jnTHtHhVeu
	Tg28tvQ2KN+ISYTBM1/i8EzEvpTc/mh8O2zqv0oH3GroMBcaFU+X+hpAgxiLgFqLO2BXcGboCLy
	TJ135tM/xH2MaF3hgAIINhZ/68Unpbrz6dBLycL04E4JqKWSKQCj82zmEEek37IJUpSjENTgLpW
	siwmytNhDsbykv/dalHIO40q+RR+hjv1jyeIKKQWmcTSO6AjSEtHIMcwuFzXnPxBc0lkNTv9hRp
	EODnGP7XE+QNn/OLDA6eVpJVXuDWH7pjnZXSN1DSGYqkDs8nZ83BPZd1XgjqShxmTGsacHhA/Lk
	Jx3eP2DHJnVc1ScZ8UBMlz/dQQz9wcFCgLZosn2O3/9cFCD/5+4abjvvTPe3K6Egl5qDj70Y9Af
	hTi7y+IM20N9Q1ChdUHynvgbS59zkPdVyNiv/p8t+R66zFNUdM0w5M1KwUuNRf0ZBOr7i0r+s11
	26YmeN+a2Pu/KsrLtb100GU34z6M76bV/2HeugzKleqUs45HD3oG+hRXKusvNqdvvzVzw5Ea5er
	mW3v02fIZYuvE3x1mMTAewJCU34PH/1GsW3KlXY/ur9Qatxpr4NT3ro08+7tzxE2GeAMs
X-Received: by 2002:a17:90b:1845:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3ae8976dcfcmr14443930a91.43.1793845952031;
        Wed, 04 Nov 2026 18:32:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:31 -0800 (PST)
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
Subject: [PATCH v16 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 11:31:40 +0900
Message-ID: <20261105023140.18373-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
