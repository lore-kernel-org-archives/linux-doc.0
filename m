Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862576;
	b=P1K9rCBnBvtpfjxlbniKuOe6E2cJqMoIftipc6/KwG+k02CS0NHhKGYDLEwJoNK/N/X0
	 GkXPGdsR2u2f/q6Qbh536iQcR3yTTc6DltEFu30RdiiH7QPlDM4oQwzqko7HVRZziVri4
	 sfCSVRb+Aanvq8b2SkTf7DWGsehyTcVQY/3qWeUmLe9Ez8VznsPpmRqkTNIpRIX0YBIX/
	 hAD1v4LkfyOCml0QXXbx2k2DgoTC5Z0VPCg22iJQ3SIS9VgB31R+xmT0kPW2BE5rW5HiM
	 DXB+FihN+1eTVJ8cyBfW/uJGo6H+2l4GJ6IMtSkZZaWQlsAFKOzdkXcmS93tJsaw3JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=w/aQG0oNTLfPnZ/2xyOU83dCbHOP6ybaJ6yPXlXG+4H0SBgQsLHy6oQ36MTW9qVxlwTD
	 4AKUbDyyZ2qFm4sBMp5gcSkg7wY7gzRFZSbXeghzXhBn4zcitAVRbh5uO+wPpWGPwWlh7
	 jpsJFgn+d1/AlVEOmOKjCRyZmynww5zqSpfyjog2kUURrbM0fpbRkkCtbfCHH9sa7Wk2r
	 86JXd1y2zEsN6kW+vseeslPAxWYK2jt1kFlGRiK1PjAWGJxu/mRQie6A7x9QQq4o7/uey
	 aocs3yVuqTPeLd8NkOXSCBN3e05VFyF1ZgoK346Ga75siBLvFnUhHxZ2hpUFjWjXeFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AB606D80D
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71AB606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiLL7rug
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so2050106eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862575; x=1794467375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=oiLL7rugBCu6/0+7veAcixdoVtJ8+dAaB0jZJzRuCWtcEAPPSjYnfxnEzQ8gsNHgmB
         LPMSs3udVmjZERUq/VzByNWXLljwOB1vQrmh2xLniv9yIVdZAebzRizSfgRVUJ46XqYV
         6aeo+d1hXqwCi0LruTYRGL32tLAoCQJqpZNv3jFPAsFXGjA7pJq9YFxfS3m0fk2yTRpx
         hamAOQxmK5H8FaKrMjR06/FHvZbYyN3cZz2hd5XBSYHlwWRMxHOXiwoHzsNDa1AOP6Yr
         xlPqMHdqcPnvohGQEhaqFr6YmBpEm50z+LOyYoPk080MbW9bhWbmnLSjG7hv4HHmWPXk
         QvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862575; x=1794467375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=EtXu6EnmUVso6i4412DLNhL88bMxC3hZOChwTcuzFg5b43MtnA0T6hu4TMa0PH+hy+
         GyYFs2AD/yDdfD9uZFp+EVtk8DXsJXmI0l6Tv7ttEAiraSZketbYfcuPNEoT5NRr2Q72
         BgMk7u8lkjvYX/DhdCqcjGTLfeC8VswOwJQgaqpKOCpMPcrgrK5Mr4yDI+kJ4FGb22gc
         x5v6DcEXoS4cwuK5C2CXqDNLorA0Dwk1uj7QbcNn24oYfS5uaOxcMOB2k4oR0VT0yVYX
         eIyJs6XT5v2UPZJk3PUNYL4gGtnEpX3uYtEpjJInoiz0aQBqm6c0kBrZkaGKQUYZRpAe
         FQTg==
X-Forwarded-Encrypted: i=1; AKwUvBxSC+VYYK/K4cAr/NoH11rbRIBwmeETLHfmC7AE5KJTM5b5//ozMR7azPzSgb1uH3m2+eXNxdysYrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rcW+HXyzA7PfvgLwG6gmk0K4YhOn889YJY959+UcUirVugWPL
	ZC0TJcGEnjsaB9+wkl8o2PaJIvLpL1RZf6WvZN69SY4Wk1IZMlWfWLGG
X-Gm-Gg: AYBFou1SS0CLYwZkdALBw0a2vEKgYR7lwSvzWnwda5teTq/oBwIZ3OoAp75gQmrzxWe
	aGNwx5GSHeuZ4kioIDnYxRpDZbaBdHex8m2c3J7vmYJNqo3Re31oCdI4ZBB7O4W0S2OWzTgWX30
	1ZpHn1xkMEwVm2wuVLjaYxl8WatOyH5i2kHFszcaZWG+/4Iv68P+F3nBUTsmGZBoM9pHG4+d8LP
	1RuZ4/ZtxXZazzqjDj325HB8q0JPiwrdxkqMgI1Uy9N2kv48F7IYq+ln1mUy/uZv34TpYomqWwD
	skU/FIddLX25qycM67VI+gLoY0a+8YGBxzcbEs9NUqnlPB9lR7JUA8JQgqHhQbUJmYDuWjfBpIz
	O+Fvbqc9YnMmaten5SlHKAGGqefJM0jshPV0Aec5c1qEn5STHaLYzsjJK/nfKjT1Tzw9elipQvq
	KQ5dTMn+bFTTAo//TurGxgLNAnfSyVNhcrFH27w/z2XKdQSIfiVUatuMgP2YFUAnzFzQTwOUaZY
	g3lC/1HjE87FQxbPdWoS6UpuiskJDgeXY99iIcjNT08/iiQznJPq7Rp/NorSbkp3BjrN+SQB4A8
	3+BzzG3idyC/SwXb19WsJOsNq2MfBtjgC3hgmqs5Gm+28CgWniOkdU6RBtzcsAMIVzFWNqVXHIt
	AP/Ipt6wCGYE0ZjtME0TII9grH8gkFouNsZQqVxtBmVG/uK8=
X-Received: by 2002:a05:7300:d80c:b0:36b:c491:93dd with SMTP id 5a478bee46e88-36bc491a788mr11101969eec.18.1793862574798;
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:34 -0800 (PST)
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
Subject: [PATCH v17 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 16:08:45 +0900
Message-ID: <20261105070845.6449-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
