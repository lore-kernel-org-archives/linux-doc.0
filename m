Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737582;
	b=Sz+b2wjRcjWbN6PzClubj1aRzZNIucDbbWFDP46KZdpm+WPkSNORxGW5yiwFjIXkjFbT
	 sOU+OwcjEMt2SCHX2HKBNv6KH4IF25eTJYsU/zPN6w2AsPVXGB74tXnCMUyOuB8WOzGSx
	 m0xhihli/OjrYUG0nEkVtgLubq8EMcvekJ0U0II3r27yD/7waFt99Z4bDFDWrzLtIRFd9
	 lUQYR06C1oPTDS+/DHEwls2Zc+7PTfXe78HveAHxnhS1fQxr3WhHbna8ZQcopwHMJix7s
	 C19Es8maJgzpuhkei65aK16MOWdM1TGA19o7gykjnsjiD+fM4iRLC7fan06bYeAw7uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
	b=cL6xZwN6TnBXosinuIIxFB+p2nZ5D2IlppCChxBMk2aLjbc5RCKCuEsxjUOjiRsVk8T7
	 /iYczTVd/BtLKaXXyVTDw73UZvRUUdussvZoqv0C7PPDQpQmzJ4EcMCt4y9ezn/QJjWa+
	 bSOkHNNRpLDuimn570ouEzBf39M/omHdoaqGv0YEq0UdZMBIfTh11q4YbyDaW1Rekl4OB
	 U1dNEiQtLt4W7rSriE5HdJjFV153UpS4Bt3TCpj6xS3MWB2wY86aFmX5oI/upNkCmUUdi
	 r8UwPsWntzLBM17sYCe5ryZyQVYX2u/Ymyz5yzD4JNYByKK1rbB2tPDBvusWJlmUZDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA86606A33A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFA86606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UQBmNYbY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so1902905e9.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737580; x=1793342380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=UQBmNYbYzunSxlqefzQwlfzStDGIZ+9O+P4YzFq567SYqEcPNcMq8eNnih7hPjpmBr
         L8WJT1AH4QjhoiQQMwDxZpUja1QV5Z9Ndg3UInkU3QqkE0YIp5iop6LEpyVEeZg4/YBl
         tXWfus1Qe7w0Sl4ZfuPeTnaMSaaqm+V6iO9niRnGMaxDhAClo/ysPfkoj5EZTd4LVDWa
         4gnW+muQvuA7dEkA0uG5vZtwvTfZqtrmbYW44dkV+3KdX/fyWsQlPG42WUq0sMmn6Zsn
         hDCsNHwA+T+Sd8M84FGeOgCphhp32Qe7uNCO/Tggh7L4eqFsqZvaJvekyhQhS0RrFsL6
         t3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737580; x=1793342380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9iXPCmoOhpVXWg91psYHS0PCZjsptq0x3nugAHkv9M=;
        b=Q+wt2MUHp1H7cH+QORTl5hECokurKZZeqYTuN3YM6I4VMAnFU6V7v8AbWeKRd99k5A
         p2UN6oEONppD+0ancK5eJIVUK3aDjX8Cc9LPoJkWWVcjcWpK39Ao1sIeOvOJ2LGd21YD
         yRtjm3gzFP3fXmjJSRF3GcpGYrer0S/vHcZTpkYegBYbdJgqxT7AQRYUwGTMvtkHTfzB
         wy9NOb9D93hsiADA2Wxe9muGpYE+4C51/9xn3iR7O5oRgzahSrXZoBOoC3i1U9Mqyvvn
         HD087WPX1L681jUjHqF5e+LQEpoMfXXK5tBpUQlz72Z1t09Whc/xMN4feDvPqmxE+5Ay
         cCvg==
X-Forwarded-Encrypted: i=1; AKwUvBxdbjojZRpqMcLJl4ZJPiYQ0dBVmZAkAJw7QeXTrIo0a5dkrcaIvskQ0QgN6mctiWlQz3e57+dbojw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyvJ6/spIZCEj/+HG5gjPdjJGuju22Z8KCRuK0M/nzeuhrwMWr
	xVF+5WaKaN2HbP3JciFd5OYEgQRKc4aR5fGU1+IGqvmWS5d6CAJ78Wxj
X-Gm-Gg: AYBFou0/sK6feQaK2BMTUPmEhFeFFCRWVqRDd2KLjQVBKXOguYne/wb9Grz8nYYdEc2
	1Ht6/VKIpkToNhQ7h7rwPMSIgY5/5W3XiZVbd4Aadg/D1zgaHW4dTRWng6LvEbFPk9dm6SjUKkE
	8WLucuuwOxKev4dBHMJEtbkDFHcr5Wsdftny4kUIZKAtv+2AgZv9sLGD6UvtHG935ahm1qAuV6e
	UJcFC4kGcSqczku7iC7ctmw9cnSn9RLXO7/WW0FwfNckvoKECLYTagCZix5o2kPbDFzGItMseZI
	aAmRM/3DWqLAZNXHmDzYu3VWgyH+KpqkUl9J+Z4vkyr6dwhgpX7x7arQaByWZED9VpTGYuQsN1x
	VCPIG+arwbmlZHcinetjVqlKdwIDr7SXi7pqbRXA94SK4it5UeWm24H3ZX/lZDBCd21fxjzWxgo
	Da7NuhNI8KgBiV64RxH+WxzDA2WUrMZFf73SHxqNYdMogMPydOKLeCO+Wcuut7CG3/1VwKK8pYv
	1aSQy+yqnLSKaMoIoQnrW7z6CRJgcbn6vAiwok6LQ/vTjpHTGz++OWHymVqJkbYJaER96/zaO3T
	1TUAsjWOVzJijrE6NCwoeVRgCl6Pz87O6JNjYXyjabRFIsv9SUZUCv7K1bB4ocxAjqvOLDtv3Hk
	4JkA=
X-Received: by 2002:a05:600c:a46:b0:4a1:db17:c7e6 with SMTP id 5b1f17b1804b1-4a211c50e30mr19135615e9.2.1792737580211;
        Thu, 22 Oct 2026 23:39:40 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:39 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:26 +0200
Subject: [PATCH v3 01/16] dt-bindings: remoteproc: k3-dsp: Add the L2
 auxiliary and DRU regions
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
Message-Id: <20261023-thames-v3-1-3ab40aa17157@tomeuvizoso.net>
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

Besides the existing L2 SRAM region, at least some C7x DSPs in K3 SoCs
have an additional region called in the documentation "AUX L2 SRAM".
This is just some more SRAM that is accessed separately.

Also add the memory region for the control registers of the DRU (Data
Routing Unit), which allow starting DMA transactions and polling for
their completion.

The two entries are optional, so existing device trees still validate,
and are allowed only for the ti,am62a-c7xv-dsp compatible, the C7x
generation that has them.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 8b1ed384ef22..278b88b7f906 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -122,11 +122,17 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 1
           items:
             - description: Address and Size of the L2 SRAM internal memory region
+            - description: Address and Size of the auxiliary L2 SRAM aperture
+            - description: Address and Size of the DRU real-time register page
         reg-names:
+          minItems: 1
           items:
             - const: l2sram
+            - const: l2aux
+            - const: dru
 
   - $ref: /schemas/arm/keystone/ti,k3-sci-common.yaml#
 

-- 
2.54.0

