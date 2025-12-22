Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CBB19067C
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415636; cv=none; b=d5OD/FEZOQB7Y/XzSNsMjMnb5KEuyOPxEnoGP5kFizbcHe6KpzM8QDQm5kLRy3rSBZkFArcVWS/q9X1H3ygTYb2w02nuRXPUJ4COj+K3/w8/o4tR1lF3hoIwcb2RxSjMOHqduNsC4rJz5eMm6LNiaJSyt2iOzSYa9rmqHPfmdOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415636; c=relaxed/simple;
	bh=iUx/KzxTUqm5OvRtocF/z3yRrTFJTMONFUZOZ5wDo1Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lbVxbCcvazpApSsRQRU5UdtwsZIZ/cQZb4kqa52uvYG36AiiwaLwKQlFiuvcQvTfd3AVGnS4I345WjRXdlVOeiomTNoMk48Ksf0r63qUnMSGXp1pFcfAtDPWEM6GSiwf0vm3sMZpKPctW7gPoaiv/vBKSno//RN2BomzptN6pP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWiTdyOB; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWiTdyOB"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43009df5ab3so2306753f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 07:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766415633; x=1767020433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLecpNCzVXawwP8cx0xrGTVH2kk35JOIvedfHtD8OOw=;
        b=bWiTdyOBzFxFWE50RsjylX8A3WvRDdYC4UNHQYT+NU0bae+yDFt7Twd5Cpj76pzFtw
         SFquMiuRDXZLpjQ7YypYXYTd55E/wbeMBgV2HDjjmU62Xsfal/FcKvHz7MS1pwXueIDw
         uLWkuYdrMKTOz1KjGK3l5DRSUKKCcXl20TV0ugXsT9lKN+M4k8xIVxtp219K0x0GDkqW
         GaHjPl4EjbxH8iAmlTJ8WDYyfxS+Dda6CBr+DW79m/FVn6xUXR/GIYuoZXHht/OuThky
         77OvxkH8xXnPmsrWCuqYRx7Y8zA9omgx4th9uKMXBgcCGPv3+ZV7QAiABnnNozCqQdjG
         2Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415633; x=1767020433;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLecpNCzVXawwP8cx0xrGTVH2kk35JOIvedfHtD8OOw=;
        b=XyKaF/ohQlFFAP7XbwrpVUiIgxvmXAaQGZvS5OECDyj4RFUhRWchCfUBiBq4WDJRUj
         wFLArLPJaf0IzGgkt5bZREXo8WQHPwOp1raLaNxu7MxHXK+WgAOF8pXwQ+YuCvgeVj/B
         f4O5fRY2qTMk7cz/Rqi3JA6d2x0SdKg0q4es3I0pMh0MMI51NMD8QQQ45hOD5Y6E5dvd
         pEF/e6i6e0aN+GA+K2tdqCRHTEZgLJLn50U90/3yDB5L8Fq7G8ziejIrkajK2V+Ot+Fz
         0X2mijtgBVF9hRIBZ1kl2WUqbT9NPPK5I6vrQqxaqoxFoLD0tkz+9y6j+O03IdgmKJHn
         IhzA==
X-Forwarded-Encrypted: i=1; AJvYcCXD46gdv3nW279tIxWbzFl6Dv5Rbq98dXhLPBOmfhDgVx6gKy1MuwO6LhnBGpIo+rrsB9n9oAGrvYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6a1uDDQX/yQRG/4nxPfxRj6kM3vmLwolyxv1kj3RsVkWlCxBA
	0SLhBotxfaDApZ9rrrdnpTkyb5+COqwVqRa0rUkvUydcQ1Tz4YL3K86tVopGoCIF8ZLzHVqyq/L
	VNQ==
X-Google-Smtp-Source: AGHT+IGrVe5BwxTN1xBcqifymYkOlLo7MfVSee5M8PugpQUe7fIfSUpxJR3UYaitoT+KLjV38czMFVaTBA==
X-Received: from wmco23.prod.google.com ([2002:a05:600c:a317:b0:477:93dd:bbb1])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46c4:b0:477:7bd2:693f
 with SMTP id 5b1f17b1804b1-47d1953b80bmr128913385e9.6.1766415633343; Mon, 22
 Dec 2025 07:00:33 -0800 (PST)
Date: Mon, 22 Dec 2025 16:00:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.322.g1dd061c0dc-goog
Message-ID: <20251222150018.1349672-1-elver@google.com>
Subject: [PATCH] docs: kernel-parameters: add kfence parameters
From: Marco Elver <elver@google.com>
To: elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Add a brief summary for KFENCE's kernel command-line parameters in
admin-guide/kernel-parameters.

Signed-off-by: Marco Elver <elver@google.com>
---
 .../admin-guide/kernel-parameters.txt         | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..1058f2a6d6a8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2917,6 +2917,41 @@ Kernel parameters
 			for Movable pages.  "nn[KMGTPE]", "nn%", and "mirror"
 			are exclusive, so you cannot specify multiple forms.
 
+	kfence.burst=	[MM,KFENCE] The number of additional successive
+			allocations to be attempted through KFENCE for each
+			sample interval.
+			Format: <unsigned integer>
+			Default: 0
+
+	kfence.check_on_panic=
+			[MM,KFENCE] Whether to check all KFENCE-managed objects'
+			canaries on panic.
+			Format: <bool>
+			Default: false
+
+	kfence.deferrable=
+			[MM,KFENCE] Whether to use a deferrable timer to trigger
+			allocations. This avoids forcing CPU wake-ups if the
+			system is idle, at the risk of a less predictable
+			sample interval.
+			Format: <bool>
+			Default: CONFIG_KFENCE_DEFERRABLE
+
+	kfence.sample_interval=
+			[MM,KFENCE] KFENCE's sample interval in milliseconds.
+			Format: <unsigned integer>
+			 0 - Disable KFENCE.
+			>0 - Enabled KFENCE with given sample interval.
+			Default: CONFIG_KFENCE_SAMPLE_INTERVAL
+
+	kfence.skip_covered_thresh=
+			[MM,KFENCE] If pool utilization reaches this threshold
+			(pool usage%), KFENCE limits currently covered
+			allocations of the same source from further filling
+			up the pool.
+			Format: <unsigned integer>
+			Default: 75
+
 	kgdbdbgp=	[KGDB,HW,EARLY] kgdb over EHCI usb debug port.
 			Format: <Controller#>[,poll interval]
 			The controller # is the number of the ehci usb debug
-- 
2.52.0.322.g1dd061c0dc-goog
