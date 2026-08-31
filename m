Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E24E56EF
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186737; cv=none; b=KGUiGIjiGgzUEW5FGlYPy0ts+Z3aLrP0xTtMz+wg0++2vUDp1i26xDWfL4DeEAS5I26K5a3De9lxXHPdU0UmciYLFRkU8VE5LkRdjgT75X47vsrxFnBoG7/jQ6kc70f/QRGddpCT7vL0tTtWghnuSLebj0Dh8XWd/9nV56Qlj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186737; c=relaxed/simple;
	bh=OzOvqUUyFScK+c4Qm0JM+we4nmEqm3utvu0fjkr07bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hrQY6kkDwByUJhxhgYC2eMY6BTm9vTF6RH21+lsUl08hFAwytZNiwEVvqcelZYw43sEL+SM9vDh4niDt8l+Hq8iJpY+hUNmSY8Qt375sPSOCYmi6wsD3KDNo62vi/9/oq3Nl3j0shpzvz+mIshuXHlM7+ilPqHUr4ug08oMa51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuFS7zui; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuFS7zui"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so35245755e9.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186735; x=1788791535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=VuFS7zuikF7DdpJdHg+JELfjNSOvQUwUEw3P5IVqe7DRtCcJLMftwcQtBCnP+gt6lx
         yEh5yTx/M+zAQpdzg+YCt711JxkNRL1mxEFuTR1+aNOSspgLNmvMaLwOGmI53nOTFEBf
         fkhXxQBBRG9BvV06G/sBQX07n72zz88wZE7q7P+RNy2GstNo1zus+cYB/w2kdNVRpaQ/
         Wgm/Zqq4eAZ+2BUqzgCw35KbmrZSBehlT94UNAfNS0Pcja5DJyJbp9odSvEn7ydrRKDr
         mROJJlxTL8J2NBUQuhQAolKFmaGdN/ENDUrnTGZ9mgGm98/LSPMBZ0vPX0FYOq1w3WtK
         SLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186735; x=1788791535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=kGPTpbaev5GGh8Pr9cVlPxiAMmCpqeoHUiHeiLVpI0y170fts4qIuDKdqP/CBxuH+Z
         N103bLDprOYknaUwArpm20dVA2OvEewEVtofvKmYTLE0cw6AOusNjFECG2B4ibQC8wCn
         qu9GM/g52qfWcY63yBqD1U1YMmuwczv5G5rXIz3ucqlDkrGEqrHSSvZhjZOJugGqF8B0
         NTWIHPBm/RMgwLBXaNWBylrxPnjHo5S3MPJoMCIllW23LIrErIzdqrwG7RVRoao0d+1G
         NSKhANkL+wNiOd0T9ymeWbZM5tNgnC6OfrMmkmgw6IWaM9m50668oc8+77T2FzXglw6j
         sP5w==
X-Gm-Message-State: AFuF++lTew/FqYnmFTU6TQIfNn46gLzXlSNQgWM+tuWFEjET0j7a3HIf
	PF5ktIh23c14/ONYvnp5EKQCn1uAX6Bx592UPug0ZZCam56JsO62lbgF
X-Gm-Gg: AR+sD13mcCpk3IIzx03+w60OgPZliH5oXnzinNmtjCSpeAGYC0/LBERrET00fxWWTFy
	GLWBBiwPRUZtcX5RN6Ele24PtWBoqFJpZ6HmIULunb+d1OSyCxGzkykC69+YN3CNPWvmCAQZnEE
	5kfj3zVry7BDh/X9B6k0aRkSQFt/p1IWAqLToV5jqzsUlQQJKRy6qaMhYDzW152D8omzQgr1Ln2
	1fwGPk1uWECD5X0WlxEsvBPrhtCAvlEiOW5IPUgwFvatkbE7Lzv/tPShBZtuDCDoqT080iyZqtF
	8bd0aNk8sbRwMEd728L06B+GBDC5/ca09oAbXgEAdD6dIL/qVnYvVfu2qp/L/GlPSfrABwR26MY
	6dSIAIyVnE5+Hb7CqVZ16JbQV1OIGMw5VGODt2Go9orH3KWpo4UwGTczwWw7I4N3MagjUK+YCEF
	X5OBpdrs8LK8frkjnh9Ih0Nn4ki5FCWr8xBNZkIvvlTlRpwpTauN0aYN0X6YmYh3DE1c+n0NJoy
	HQvaphf9zWxFOe575rGxlkI
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr340102515e9.0.1788186734682;
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 3/7] docs: gpio: note lineinfo padding must be zero filled
Date: Mon, 31 Aug 2026 11:31:21 -0300
Message-ID: <20260831143125.151360-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL reject
non-zero lineinfo.padding with -EINVAL; align the uapi comment with
gpio_v2_line_request.padding.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df7..5515b718886e 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -218,7 +218,7 @@ struct gpio_v2_line_request {
  * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
  * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together
  * @attrs: the configuration attributes associated with the line
- * @padding: reserved for future use
+ * @padding: reserved for future use, must be zero filled
  */
 struct gpio_v2_line_info {
 	char name[GPIO_MAX_NAME_SIZE];
-- 
2.43.0

