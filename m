Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737585;
	b=05cjsl4+hlu7pljvGY/q+NGqDX81ezfOyfbUoB18dCmtuuTBr8Ru57yuiqATWmbBemAB
	 lDayq4XPBOLKqxomXXTHDZ1gN5rNNUOtXU3Ag93YnlJiVLR5b0Gvd8KI9ldKI3L02EwiZ
	 7A28vkxYAwNRCeNaw9w8fRVzIcV7Sp6XQbwtnO0MuV4BI3bgfnl/LtYtTSPp2HClM384b
	 Qzjnzr3+povPPEu+zrytQ1xuQfKA4QINM6o0ullFS9M3ILbCZOl/4prXrpuDe5QAyz77I
	 3KoakIWtyisxkDDyxn5aX3e8yKeYsHksTWnvMQ7DJ3jKgQAhD/5IYcKxaXsoi1DxBHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
	b=CV3uAZYZVg3r9nDe9SHF4p3ncdzaR7M+uC+4hqJBzVP477sG9NtgP2hpPaO9FgLzKyxK
	 Uk4FmDgvln2ohDqDtqj7RSUSsd+qkbfTo1WNbXPFF0bECUPYCuIrn64w2QagBPqiuq6zZ
	 AzK/n9CfBWudm49HqxgJ4oOZ0FYcaZFA2Tb/jalx+ROtMGQhRe5lKjyyskFFbhgwxryOf
	 7DDvQ+jPL8NwmOim/95SiGjtjRQiLMdB60GE8Q2VVGKxN+1zidZKOy2HiHq7VR3DrlLRX
	 omWTsLNILAoLq3u5pdjOhKCNJU5COFhz5Q+Hgz4V9llZdTVppCmIVJDqeLBxIRfkgyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A31606A31D
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A31606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K5gmrOYj
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e00eee27dso280736f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=K5gmrOYj3tl5gpqCrSw9ozcnETPEC4k8tihxf6zDQDJzO6W1ugLAFbGbsv9Cz/MxUB
         quIUfAE6oCPFSLcX8P+JtzAwqC/EvVQVqVldkQtMgEtTOx+hyvg8NvWOS4XYCf7ud8/o
         Gzc0esoT6mvjMChNOgbAm9m7/Zm3rnihd7W0X1kADDuHzZZYih0caal6tQPHJOejfhVK
         K2BbjC/G+1p6cfFAnupiIBsCBTQOgMBNzgIf/8rwbqnvo+qua43tmcZ9lsB9uE0vJbXz
         TBLYu0YNtvQan1lTxqxqkmOEetHMR1uVhpgkfELL7ASKGJziVeEfwDGBOoqAdY7h9Fsl
         950g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=joXN+x1zqPQQyKSAinXWy8KZYdkDqdNtj8rJIDqH56cGCddASgeTOZ31UH7mPHWyhw
         wHMA4PsyvctpfLyzwDSk3q7PGpGkRjazYmlQzgtZuXVOnet7id1FRpnmC1THM60qGLLY
         UnOqGRzri00A7TQYAvy81HEhTjbtr3+sMxfaJwbSaLeWo0x69L4o4COGm28QyD035rAo
         qYlN5Ghl51GfZ3Vhyg7456Wm8if3EXexxyxHm8Kq71yA349ZBkNs2HAx2IEgGtpEK49U
         iI89HSNXPu2PA4XODFewIILsasKLI11g/cItr9nX8G9SmbTaay9gVMhKfvbF6iHAlQ8y
         TgZw==
X-Forwarded-Encrypted: i=1; AKwUvBxGz4mjbCjjRvDh5snnNAPtNitKBqX1a7k0HhPEot9Ay3PgPdfXsocHJMg7LsSsS9v1HLpHTrps52U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCG5VwF0PN9UXXyEDf16BX5A5b7qimXLS3h6mmOlOh6cOKLDj+
	cfd0lppdKcVsZ04yYuH7ybXE+G9bRmvU/TrUukqbd3TuWlmQw0sT4r5G
X-Gm-Gg: AYBFou1QNujL4i+EWnNH6K1jGhsKfDqU3vVwEJJZ5q4nqCywhTXwLDkPaOIclwMa3U6
	q/S/EzpOxAMqyyPwIMBbdy8jITFSFIcnN63H2q/jVPT7cgQhZEKhx7dtftaZ9NpyrnUZG6m0MME
	xFzC3ubD5SmEZKXScSQqDqOF91CvfaF3JWUnNOseQ0nrUHdwmS9bQoJ42qPv/G1pGi81ujMGida
	eS2w5Vssr0ZFl7NYojBV/TTFP0chUlIWsDJYq7BGL63KLq4gwHUEVdL+8qB2nH6J22uYDY6EBOd
	3D7XhRNCsdILiPyhbvas9xEx3Sl3JuH0UVsOz9G7sILlHPx4I/PzE0upCZkH5yn1W8JYdTYmdD0
	8j/Dt8Wd/rQj8HMuw7vfbfI/q7llE/fzV/Nb/9yr2ykigiQbRPAiNOKXOqTs/+pdyLYTDaYp57P
	rZjvh8RjpsaDgGZC+iPKiLzW9+6n5jo7HBdDUL7G29VM9ANfIYAn/l5tmomZQroS0smVEF3s6Wy
	vVS+JrkR10PksK+XsLfiY3bY9pwyKMXl8I/eb6K/VHvCVnchQkGFS516TL/4Od3mR09B1Q6Akz1
	47f4QNU0NUY7y+Td+954pMpaU0p+19bFp/hEycbtdH2FVY30miKIx9d4FwCfLCqspCxlSi7/e8X
	ApYU=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
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
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
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

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0

