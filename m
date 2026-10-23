Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737588;
	b=Fsq9kjBywXjssmIE5gLd+ABoxIINFTL3bNQj9lfmgMYCl5+9yLZPoKXqPePwHbjtq7CZ
	 JKbg0R2WrUWt6rxQKz8nVL6d9kGl1QKcWsoAEFsLPyqfIquSHZqf7VP/5Xrc3Fy/I1gKX
	 ww66ktyTJ5Z1dqjPZ/p7n4e4isRvnEVg+J2r0deV/hkF8JrA8s1ZmrHv6BqL/Qy80pzW0
	 oZWI1hFysUyzuNWxd1nyf2etm/LejxLM82W2oHTg6TcU2cZPVamYE/hrWgbYugUj9RprK
	 dwoEkecK+9xEJF7/1RY3IrKSuGRIWruVCVKuhdgJ4yPK0S+2xUTnINFfOEv96g294wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
	b=RKAs7yWXcFks9U9o4oIOs+3G3EVJO/dvcKf5AO4Oy+/Ji19STZwwtbm/GnzjxtkRE/2d
	 NiuvAaqa7H6P8N1Y/f/qJ+h21tjnZp2Xoe6m7+ppuqpYd5JB10oU2QMGZb+b5g4DmO/Ji
	 kM5j/P0e8LSi11shx+IPQSaeOX+RzCMUvI0IHRwBmPgWHZnlMSEeqzhkyNH0ZDLyGYEaZ
	 spwazgdppjyFGkknUjGOptSF46sMHl5FwEc+spPS0Y6lxzsgrGvCECzWCKTSif8PNMMQ+
	 M4HwfAhkmGrU94V2mSdPyslq0bsjbWEWHdWnY41RytPL7n0LBzkBqHAuTfMzUxG0AFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116E606A32A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5116E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dTYQCezJ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so254790f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737587; x=1793342387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=dTYQCezJmgcg9GGfQwV8y0d2iLfg6yCWGHqDKMyjsr8yZxOhyUsBMSf/ZNFgwODWF7
         Ca65GerJrzoQMUWzaApQ6FsH021ecFKPP84Vo4xTo6/rpTav2Td2W5SPBRlg3hXGl1px
         xP9Z4zO5uXlxiArcnHL2bAJmJPkPMjMl648DPWqdP90u701pWOiEyM5G/1muxUzPFpq2
         GELahv1hSqryhdLHy5UgrSQvCjuip2O+DMxqQdyrDLqCzm8Xny5XxFUUYZp9tLCW119v
         aS17giMu5xehA1z1L3jBEqcI0NZSj+ukea/DASddTVYuvZWF7/0CR1CzHU/29htSAxpq
         Vazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737587; x=1793342387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zM6qRbp5A9CbBlh2Bu/tmcTR/0lPEgQHJG0kewWnWN4=;
        b=JPYl1wNWO+igEZyen0a2gAZ2fINq+s74D0rawR/+atc8VS8rFG29kp9Zs9ene2r894
         cDEZmcm/mtEeDFbG4hhoLKaAHpy+VZaqe4QIfOs1vf2AU1H1vH6+FlCOZYxWNjp2Y8Td
         kL8ABBp9H8n6rcq+NekNxiXcyhR20YlnjlBYNpSwU9haneUX3mZoRupBhgtujjgnYet+
         TxMfTUDxS9yIoYBjF7U+rjyC95PCkeam9JrCN79X68R+2v+8xI9PL3aQLRKSg2/Smh50
         aiJTvQkOHT/v7KDBt/A4Dd/xB2eTUnp1dBidYuS3/h/L6ZeLfn26xPkdtVYCJ3OvzElD
         XUQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4sCgMHS7uw3/epb2dD4A1zVrHhsWZU8cJY2Bzbgz0KNpwt2n1EAmmn2U/nec9FhGUlywAyJzWJOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVWwzqSTxqoiRlpFBYW7hwuuF9EeTOD48QpMt/U0ym3yvHQm68
	J/0JzxKWfCXSSYKNS8pOjsCjdRDSlcf0vPbreSWGHep23N73zZoR0sFd
X-Gm-Gg: AYBFou217JLycLLn82qmvRLYYrsMh7vDshZyMxHswSacHiXFjEWepxqjJKzGyyoivJ5
	mLnKSKJAux5bcI+cYLNMEVARsXS4OaaWPR94C2v41ywsUqSXQswNbJYs9dayG0OwFERQFB3KlPM
	YcBaz7ok12aFgEcmfFQHKfDSj7MUZqUNQY9Tpg3lQfkI1/vZBh4tDcJXcq7ZCRkYDF5F97kOmL/
	TcjQR7k37ozwQUb7o/1nPDpz7LJrODuA42/KHI+AVGbq6FtgxiIWsvK+IKFNUGZQZJOGMX0RfDD
	DEKh9FZlgC7p5oY+ppan69gC/FhkVAaUs63ejQfgBHIoWtNYZ/fm/bUtGUCufyCslTyHXlwcP9q
	QTxGfXVvwEzgobCeJjlOxOXRYVL7kIVLcR7ydZ0ktukE0FGTH+6BqwnbUoUYXb0BwNgfAy0iQao
	SwsocvmZJYlMvtrhngS7d+LFe9XgXRL8t3eslHq3Xi0H0RpJsUqZxP6Diq6+we2nyUwJ/inyJ5B
	iSHPbw0pl8AtXrSbf/mvW/4yZ9r9nwDVxOlUCQ/MYMirtck9nL7JGnEv+RqWagP1v6OP0aKgN7p
	js4D5c3WTQdWLT4xsnfJYLZj5nsvAkpby1dh9VpXXrPFBIjTMIizkynoSaDnZ4jAvIua83gFkRa
	Y8lY=
X-Received: by 2002:a05:6000:41c9:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e384e4205mr1725429f8f.0.1792737586551;
        Thu, 22 Oct 2026 23:39:46 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:28 +0200
Subject: [PATCH v3 03/16] dt-bindings: remoteproc: k3-dsp: Allow
 referencing the timers' power domains
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-3-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

A firmware may drive the core's timers, which need their power domains
held; the remoteproc driver does not hold them, so let the DSP node
reference them for a driver that attaches to the running core to hold.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index d6319c8e96f8..80eaef0a19b8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -76,6 +76,23 @@ properties:
 # Optional properties:
 # --------------------
 
+  power-domains:
+    description: |
+      Power domains of the SoC timers the running firmware ticks on and
+      times its work out with. The firmware programs these timers itself
+      and makes no power request for them, and the timers' own nodes are
+      reserved for it, so nothing else requests their power; a client
+      driver of the firmware holds them on while it drives the processor.
+      The processor's own power is managed through ti,sci-dev-id, not here.
+    items:
+      - description: power domain of the first timer
+      - description: power domain of the second timer
+
+  power-domain-names:
+    items:
+      - const: timer1
+      - const: timer2
+
   sram:
     minItems: 1
     maxItems: 4

-- 
2.54.0

