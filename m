Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252684;
	b=mIl1AT5Zdoh9hRqOZNzKfDRLDPJHkn573hGEmPzvLQgo+/rTdzue8R2V1LkfjmmGOHg/
	 bXxw3gjl67O2wB/vD+f3ndac6iLSgWqz0PS1DHOAwsiQiBnLntMEiRT6bzrsGQTviCRcJ
	 uPW8NmaucYzR7uHWV71EmTVSdMH+Z1o0PG97iAgZwaoPx/SldK50vsxpUNAPL5pgHGQAP
	 hi9anGIzxKSZ65KhYAV5Kkkjik7+eWnETkbYEY8twRsSC3JM+USsUR5ofReqLddWGBkMB
	 hdq4OE4ld5GcuQFYOr1D1hhvR4M/XZVh6DeueuWMAlIeS5CLLSyyxdhyjPIFZyf9hTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
	b=bBQnZzFYAIKnmaYBwBF+/BuEZBynk0kyG4i/ncz7G0mOdvvwxbNBjXO/Ue+Obe9Ti1MD
	 /CVNW1AP2c5QA2x7YZaswlTFhZQLYTIKrLJrJw2XSptdCprWvHcAhV+gZdrjXw+FcO5KN
	 x4T3YTz4eam9+PlnrtAMizh3tBgaB7Hs3IbSWhHX5FljS97Q+fvKP0fZp0HeXBVEVetmp
	 tj9+SbKR5OTmjRQ4EoWTEkXEQl1VY1/oDLYcyAler0KvBYd/gBus312NAtqoQT9e9wGn8
	 fUDfwYr5nIJ6jvtH0osnKCDRrN+nrYibOXLBuVt1WuSo/qMiBy05yqfrnF2BkV/jJlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F0E606A31E
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72F0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fciZAA34
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1249743a91.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252684; x=1793857484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=fciZAA34a4I1RZJs8RsFDiIMKniW/z3FeP9xw5Hks/lF5OLVsWVGwRkRKkQzPZoALB
         huE1gh6wMHvzQfgT7HkIK7px8J2gpVWDhIqVGh8INY8jhjoRbP1k2W+YohWAew97m0rU
         TnB7ZKfq66LaeBYudl/pyf13iUQqRrW+YQnmTOq2FADZREe3fQ4HsrSV5pqqwVIU+yCM
         UNG5KOujfexHJASwOJuE/MhOMWQfB4TsYq0oFrrnUZXgstswWIkqDoOOEJA+4dgCFUQI
         HCsqLIdmhcXgH829Ov2HtBOWZLhUTmV+HYRocbOiTrtNeRWwtvsJYud+v0cSgXVWG2L0
         1fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252684; x=1793857484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ec4/N7zw6HP65LFOCU/La2k3iDwpzO2wT9iw6qkE45M=;
        b=lLqKPYC2PeP8wW5IiHTe1AQwGKoTlILlf1x1YmKVQmoCxaHnDzMfv8cy2pV68BGi0i
         V/ctUW7PclZWjBpk5l6cjcPlUtGtRJSmLTUpTcTky6mtzThTkV+kLLwb376hvRu4biSg
         LR7hYHRcKFuUbr/A/4oKv0Beib90ETh2DjHsGgpx7HIjOTHnY5HqRXMBTl+2pTEXejM3
         SmoUusOUh6cZkq2Oky0rCwA8ZvTf8LrQpVk+fY241g02GWRqTA6TFRGNvteEsZ+FTTPW
         0SQntiCycUznLUyOdfKc1F+w836b7Y7gyHbxxpm9dSmcrtXYOm5ypOnBO2d9t6vvu11O
         Of7g==
X-Forwarded-Encrypted: i=1; AKwUvBwYqKyODlV1OOfsaoUwZ60M8ypA2t12B5f5wn7t4jUw4pLHh+96hTHB8ARl0YktDYDycx131F6JSAU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGNJNzIcmWBO0PI7ZFTTiQADZvlo8vL/lu7wBANC77u05Gf2l7
	3jjL4AdE9gC2mXpeNbB9FtfWkE36tfUPPTSSZQsLk4wu5rLGoj/9DOjM
X-Gm-Gg: AYBFou1X5ns0wIsoU/tEc5OZBOhaFDv/WHE6l3iSaz0rpuSwuHbIQOOABDE1bN037uG
	5Pq3kSwPxxrF2jz4QDH8YRxlNlbvxuFz3IJg6DX93gZluEyfoSfVY1R3GpK4VlAXoAuQzfAT6E1
	wbRceKyB7u2GrGXgB6Vwl0UDjBwXc+hvhqih1yNbdc5bw03rINrtRo+luD4JXCMNBpbXKhTCXTB
	IYp6ZpRAru0TC48NVV2LO71XdLR61LSSGAgRmM1d7OR83EK2j+YfCNc3Fy5QRWXH3F7reWNHbRs
	SFzdFmj1VFbTl9PrYvdtB95NAV9CLqdZrzIdKLNqsgwAO+FVJYOehJvMdQKVL+yvMIG+xBMGTDc
	nbO0YACcWeM5MjZEwVPwpQTs8viN4FClwtq8kiQGL3Scn+/iZBnGucVeWmPExuwldZAfclkXpao
	LQDhWg4VL9HWuiNPY9UAxYpvekvvkReqCgWJ44z8m2VosKphtT5O6EkFOX8OjwDaq+IVeYwuGui
	bVLDqc2Bq965Gg73r4vaF3kLxOoDoWpcByflvMEurD+YQmS/FwjtDFM7BhHQE1HqiHCsM8q4aVO
	UQY2lTWcXPzvb+wkYXwOjfuGUHQbuu2YALuZeUQGVAjoIIEs/DPkuTpFUZOo8R/CZsbNTwAuyUZ
	8wCIU3MqAgfbCLBBrZctunQxxY/tib/wkzDNaKixNByC4OjDWJPnwKlsTZc0m+d414IDG
X-Received: by 2002:a17:90a:d603:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae5823f4eemr2777102a91.63.1793252683601;
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:43 -0700 (PDT)
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
Subject: [PATCH v8 11/14] docs: describe virtio-sound capture options
Date: Thu, 29 Oct 2026 14:43:51 +0900
Message-ID: <20261029054354.2931-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Document the five opt-in capture module parameters introduced by this
series. All default to false. Describe the startup-empty, short-payload,
packed-status and pause-restart compatibility behavior alongside staging,
and require validation with the target device.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f..6c7b1b3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8328,6 +8328,36 @@ Kernel parameters
 			brightness level.
 			default: 1
 
+	virtio_snd.capture_allow_empty= [HW,SOUND]
+			Retry a bounded number of empty startup capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,SOUND]
+			Accept non-empty, frame-aligned short capture replies.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,SOUND]
+			Read status immediately after the returned capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,SOUND]
+			Release and reprepare capture streams across pause.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
+	virtio_snd.capture_staging= [HW,SOUND]
+			Use request-owned buffers for capture data.
+			Format: <bool>
+			Default: false. Compatibility option for devices that
+			require staged capture; validate with the target device.
+
 	virtio_mmio.device=
 			[VMMIO] Memory mapped virtio (platform) device.
 

