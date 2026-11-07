Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062110;
	b=Kk81dEYQ5dZqQw4QbMYN7a7yCePYtn2KB6gvojB4K6VkaHZ+ysmwlYufqSOL+jtdy67X
	 zDLW1VUpxR/2v0LLsFLW7RUqnTNEJj8mofYY4dAJqxP+CeVjMbP0qof8Luuz6tJX4d51j
	 Em8HPgriPV6YYC11viNpKIQCkK346/OJ/cghuZGI3l/vApHCEfFSPCnCA71pvTNX1W/P2
	 hQz/v0Y3nOwIvBlBbrZwdNynktAkgnhR3Pq4akIar61IsY25EhjHI+v7C/puBK33+vCQP
	 48KV6szsg+2zRzkJouHWwnAtCrEoKk2/ASIilwaoOcgz+i3RpAjvt7KwXvFdvpVHrnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=Qmn9HnkobSfvX4paBzaTd8nKKekUSSozYZMfm2LtJcjnFCa2jMjw1pZKN3lDlMEhxmay
	 f2dgNbvTtNCPVEUfqOTBL2yttFxtRsY8O935YFrmBBXJSlT77UCSyWt+uqmtOBtL1zDjR
	 RmxS8NoS2nr0ewsW1CPAj6izrBhVFSq6RcH/p/O0FVLVnoVKq87UFKd9zsDWpNPbjThMd
	 IpsSt9TsvwkUUzx3w/TT9/OJ/QTUf29NmtJY0iebrrOkMgZgzDZXucJSk2+uHOnwpV+MZ
	 9Y8m0bREQ6DNNToxQNvMVnm9FNoI8js3IMy+JKmcJcG4SrFYXm+a81gzzCZgFNbvpoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0460A382F
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E0460A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+zWiibx
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so2578593eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062110; x=1794666910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=o+zWiibxlcf1e4Q3HKHmJB6FagtkHkcBWFoJcsvBox0/HYRtbyrR0rs0+PcKHa8RKY
         WkYD0B/eLRXTN2mrXft26PujZ/4+8zklSHs3wxdtYaaiwExmFb2RW5qkNWkEeSsAfSvt
         DISr34BEEG1jadyInKQQFzbTUOzT5/1V51+Ib8+EAll4z/7Qomu4RD6HSXV8kvd5sro9
         PMKfsP/P28cF0zCWziu835NaIH/WnJlII/2Fl3ZABlgUPLAE9GhbeY7Xle/dpli9mq1F
         utn2aHBDM6XT/BGvXmJW8Npx0pH91eYeSc3AwgPQeymRSMVyxtQiz/+WmOWWRSYoCzqr
         hzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062110; x=1794666910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=18bIUbG7Jg+lpZmL+xQft8dnrQ1szMjh8gea9/qbnH3m6b7d2y2ZN9hTv/EYZEd6Y8
         1VwViVgHW+JE7RbppzuXyJdwC8lJMMeHLveJAgqWWwM+J2X80pRNJ2KtYEfaq/Bsef9D
         UpddzDQNiAN1gGttSgSE8temDI337LTx7kkMPLglcPLu1FKXy/jWGsUnhipAatZhkmVH
         vt98X3Mf9jLhbTBh18SK5SohvIiksI6BwYJooB+TjwAOXLT68ZIopcEw6Tk64AyvLjxM
         JXIAT29ragxP9k70LIBKdJRiMqsSQ+3vOCfi9DHXtW8BG24CnL6KGG3xbY/8ceQ0639b
         jpSQ==
X-Forwarded-Encrypted: i=1; AL+hErHotK0D9rHmuHdFYO42JW6ao/dCtMNwFln/EnbT1XIIA0nad+qWxmUL5ma3YnOYaS4edW88MBqpEZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q8hfE7P7j/G61GtaXJ16cZy8PoiOn2ceBEvTspvUamGb9qtni
	Qe/1xgVNZ7DE/4PO/T7IGdesWbu4mrL31moaAf6rdxyvTJSxYjGvfye53sknG3+0
X-Gm-Gg: AYBFou0L1VrkRdR9o4jJr3b1t4KsiEn9d6/PaiVv0AFWHxpeFoO+FTzAURcS5IToawo
	WKtAD7luISUGbbUDTlnd4+24XxV/2GHmINGkVI6GNhnp/gNXpSnSrHen8nwmBKcN6VxYPYz1wJY
	l2EN2XkFO+Us8OteSuw4lqZwSRRU3h1FLTNRJfDsvO/rrHVBm/4oU1DTkRnEGlgR8ApDMWPRn4J
	2qwl+D9bW7lZ8Y5NVUSCHsB5N0srS6g2OBW5j5ktkUetyFjdpBVsEdpqaPHST8Z8pTDdhNWZ7Hm
	tpAHbktFAJ1eEjCUtdl5FgP2ADdtC4kG2oHjUSgz+sqE0giIq5GxxQEDTdXTw76CW/L7qjMAbpt
	vooOe8ZuzFT8ve0UIArNpgrUxJO66MaL3KKQ97ia2YDDCSmuV+4/GqSM0G1Tsp11cHub3PERiT0
	Gc4fKaO9TCBYbvY5whj21VIaL8xSFQfIN4pccng48MNeWe/fZCaorTnMext4bOZJqw8cjst2Ywn
	CP38g7zE7im1awFPh/37nalyek2ffL2Nz5APKO8o4pqGmOCXgKF3JIgLgJo/27n4gPDSlrdJinG
	b8xpn3bUKaWDm4qOLtJ+PYhSBIgCsLUMEUX0eWnFd6EnoMFZ+aPZ5HFl/CCpXTr/xGgy5jCyGsj
	LMtSeqhKJYNCcgmeRMMVj66lKFCIRoVsMPBj4wtL7mi18zQ==
X-Received: by 2002:a05:693c:6213:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-36f77ce5f6dmr8295810eec.31.1794062109556;
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:09 -0800 (PST)
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
Subject: [PATCH v20 12/12] docs: describe virtio-sound capture options
Date: Sat,  7 Nov 2026 23:34:22 +0900
Message-ID: <20261107143422.29319-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
