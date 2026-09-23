Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53586421231
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185657; cv=none; b=Pmm3G6oC0VVFJIusKug4x82NsRqmpMZdAik0da+HZeVNx6dEkBseMKQLvN16r+7WYBIGYrMbZGrQl2H0etkz/XyQvn9u3xeHpP7LQH2b4kDhMGlrv8IVl6QGUG+fDEHpo+GqtsCZ4rmyITE2Hjk/ai2zY7XCqv36oIWf6WPSHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185657; c=relaxed/simple;
	bh=yVrM8sJaHGXl26LeCM8G7k1yqbumhmWeqCmDq5/L7Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Za7uyTCqbprfjprzewjaMGS5koAxiG2WJWvbB5S7ZEpuBT7ESolilzQBNVnbdrL36b/B9nhY3/hNN9tnevydFNnC3Czn6+mnOgsOxkFo5HTgBDB0bxVEwwHJKSmW6HHXyZE+Yp90whMXw3/wktW5exN/TLBFm/eLGqyssrogbGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIWAqEv6; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIWAqEv6"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso671740a12.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185653; x=1790790453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAVRGQRwud/0zcQSf2CKVKNedLQyxLV6xXHev/2q8II=;
        b=WIWAqEv6u1l9XVKDQP1FMT2wvYLOp9REyDm5+m0uATBjDFDs1mJ+WJVSvNlpt0RtVL
         YuQW4QW8FfZCV8pM7pVDbmGhlg872Vyq/s+XoaAZwofyLs9W08rsyhnJOHZn1YqlH+Li
         641VuNvd8PMCR1OCBVNLrYPnCtcFPsNIbyrnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185653; x=1790790453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jAVRGQRwud/0zcQSf2CKVKNedLQyxLV6xXHev/2q8II=;
        b=e7MnjdKhZTx1RMPH1869i4ENKxpammPFmYpjCjVebI2PvfHZ/1ABjp38AY0aLVq4Km
         Iqp26iox9fBh8PxvdPkNnVwpHkufDSrJvX6XPJdmvAv112Ft9493Oe73aIBTcot6nXDR
         /Sz4ZNrQ+b5bPK/mba+vMLcmA7TeTh1hfCs/gQflg9yLmC9m9S4IfQtQjeUSQhvZf0UW
         ztxH0eRRaoPF1GCifDA6yOhoP0RsxqnGeQ1tHw0TXnueK4+2jv9Qni5MmZmsw00x3YTE
         aEpEH+WhipEbSiDYL03QjU8cFQqDR5LcV8yQgof6IQ2BoTzj1XiwXjJ3vu/alYOY5Uea
         gvTw==
X-Gm-Message-State: AFuF++lG662gcnl4IrQZCYFUCtxylBdnP3dqG0Qoscg++pa6vA7yFk8h
	ntexaLWOjyOfcCba0/qmy0Cnbjr87nJlpbmVBGvOgOx3FqzPSXN+5+t0O1ujLyxnGQ==
X-Gm-Gg: AYBFou1odqrokItukrabpCfIVYZG2b2mzx+4w72c9Ku7Ly5J3O3zVYB7raFoN9ghw/b
	/gWwwmQLxlu6eR8+hmln3p8cMDYeoTSkFpMmgQolOCu0Ar/ASF5q2M9jmPn4SdV4V9xvz8WUcwW
	XuM+VqrdUVoaTfflXh51vlKTp+8gQIOAYYHbZ5JYcf6iO/u25bUh4ZDRzxiL9RCWxNBaBjRXmND
	NujyVq54s7x9WgkqvAjwSaF5yk1BUHMUixOtNMQEgC5wuz35RpFbb1jT6w83w0iHzzHCpoTN0lJ
	ivjHTysWolsf3vl6hhTvXikFI1Hl+azG7CLrSzqYIl05q1XNVqOh5tZTH4S/4MWl6WqJUVd+K2E
	SJtBCKIFgEfsDOECEunQGS0vAJ0jg7dGzlc40ZaFekYfNSceNO6LT4Ikg6UJrS5kRb0NiLeE8vI
	bbKYtCazLoaOQTGDMNuvUQuWceuexmVMOOXGBMV1OPWFNfeWXEIv8iVNZqhYTSDalo166j1tc/M
	hisPBnKrO+XZ5HXCW5ZzVCiW0BiquceXOBfkg==
X-Received: by 2002:a17:90b:37c3:b0:3a0:4146:2954 with SMTP id 98e67ed59e1d1-3a07e6be0b0mr2933474a91.27.1790185653491;
        Wed, 23 Sep 2026 10:47:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a097663e1dsm158337a91.7.2026.09.23.10.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:32 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/8] PM: runtime: Correct pm_runtime_autosuspend_expiration() doc
Date: Wed, 23 Sep 2026 10:40:25 -0700
Message-ID: <20260923104031.v2.1.Ifc8b2d1742729cc82f46220d85c6382fdee1fc8b@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "adjusted to be nonzero" comment may be a relic from when this API
previously used jiffies, although I'm not quite sure about that either.
In any case, it doesn't seem correct today.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
* New in v2

 drivers/base/power/runtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index bb008dfe85a1..7e75f6d5df07 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -169,7 +169,7 @@ static void pm_runtime_cancel_pending(struct device *dev)
  * Compute the autosuspend-delay expiration time based on the device's
  * power.last_busy time.  If the delay has already expired or is disabled
  * (negative) or the power.use_autosuspend flag isn't set, return 0.
- * Otherwise return the expiration time in nanoseconds (adjusted to be nonzero).
+ * Otherwise return the expiration time in nanoseconds.
  *
  * This function may be called either with or without dev->power.lock held.
  * Either way it can be racy, since power.last_busy may be updated at any time.
-- 
2.56.0.rc1.310.g51773c2048-goog

