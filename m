Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BDB367B63
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401024; cv=none; b=TzVxAraSVwbGU5mu3l1nRUuembBhmgV8RBnEmPO5dbajfJfak4ZYMKk6QAwhVaF1EMDNZkSdL3HIhliFpfwlGycpxB1ZvGD+iChgjctmptDxNThXHEtc6kIXOidmJGLV08goKVKTcVYyScNbVUN7m6Ve/yzTJn1742BdahS7ig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401024; c=relaxed/simple;
	bh=MkgF8sJYkXQMUSnvBLYjUs718iTtLzAZhEjW6mSSQrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tcV/l1IBeAmZcVFhYKDsFOX6vQVct/wawVgPNuk8hAKJJ3DpJVB+vbw4LvqA/K8dxVvOCKzX9vWN6WU3STwDwV6NBE8H4ySbSdfs0PGyYUKtkgYuWfagKJrFHl/Sg4/goFlHW6oDs94VeI5AlBGOzrMfMP0uekWXv6DwxzbUzzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4SAqvaq; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4SAqvaq"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so3498509a12.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401022; x=1788005822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FyktL5v23pmy2y7D+Amk5WqPXGUmXdq2zDMDrpclJw=;
        b=m4SAqvaq2NmlxwknXc0wwMNfqiQulIexrpSTQh6jSoHl0fpXLm0Oop2GZxkrhs6jGY
         NeIMgzJJiWQUgIyP27VwEVP/nHOHziAkhdl7ZgiIbpYcyHgfR6XGwIIiPmRJdptTamG7
         1obcvJ1egVAPdDxhR5NGl3mTGBPYHH8qaKL6T2MzJ0HyxcSmxWW2hPkJZliu4d8VvvNd
         6Jk/FKjtJl2vPVK2wJjR0ymLUwC82RStpW5bxCnottvVgcvFiQbDPTPylKDHgF4wyMhR
         HsFnuzrntXxr4kd1yPwNLJRXu5MikrayCGgHFFfCkgkvINWp79JpRZ8Aqp1CTGDVG4u5
         5KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401022; x=1788005822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FyktL5v23pmy2y7D+Amk5WqPXGUmXdq2zDMDrpclJw=;
        b=Re/w/iTxEjt11Z9bDI90sxr8w7NTqAZN2MfsNZULgZbljtPkVvr3F9Vp8TnVZvCOyb
         tD7Ieo/YWmPzfmPEL8WBOxBCLvdm0X5AmlSKNJpd80eVgZnB580/FE9724BkJ0+6fybf
         2AL8WsU9idu3xsYwfiW8YuyHQzPXrgNf9AP8gUKPP6IETgh12Chl4iCeJ24B4HSCTfg1
         57nnGMH0D0OCpYx1SCpK2CmSAt7xZmtyAdnL5BUmsnOXhERH4qaaxMkVK0ZNhHCbmzoT
         xlDKpQq3JF8McKdyvT5NRRIWTanygD3AiIO4pQhtFBJ14S8fdna9aPhx8IyaTCuV1/+T
         lbBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqny6DxuiBIXbllTsuzTEE7d1At6mnM9A7pmNarNtof5UtiGt8WIhU5Tag19CuBeV47cWgrL4VShOw=@vger.kernel.org
X-Gm-Message-State: AFuF++locexqWad8JbumMUYF6iRgR6LZ+IHDPQpic8ODliLVqjtHxgxB
	0sZuPC2LPJpwpD8ART6K9FWSTbs4ACKoV2AvnXRE306urfSOJn9XGmwL
X-Gm-Gg: AR+sD11S5Btk13y0E3So/CRlbeJnW3rb5E9RCClGprVyVq8MAxxZ873KtUge9tocISH
	QRWMvkAXxFV3QL5oEwI4mf4Z+oDr9z4wAjBdjMhM0w5/PKffnUAtYRkDqaXoBC/7FnXmQNRXrvn
	3ZdrN56jzOdGBB7kw77e21dV0VRuud048uTG2FozIKgoSoE3D56fXomc4TOqA5yrB1lXUcOEzpJ
	G6zlc+4MNqM68+CbcCE9Rx1Q07GRNrGqobtE/WZbfJ4Tv6T8Yq0jSS0bczHFDN6sN7QENv/78Lu
	Z+Mi6RQo+6icBkvP4cr03YF7F8NErW/KIX2x/Bvlx9ETJyBpjc6gdJ0iM1SXKzIkOeafltXZInG
	dsSFkT6dYVaPaM0cb8/Sv4rca3TWQYeL9mQS3PIqoNeolOE5Vrc9IZFW4PAiYp1EpuNJNLQaBJs
	tgv4R3/ViEgHDqG+4dlH5LPgYql53Cfked6TyeSCOO0m9+ZXpB7iqQ+FlCkrAMOHkqL7/u5XatK
	IJmQwNouAary+V4WdBbSkiSwnhXSkwmovjrz+jOB1WnwbZhQ08Gh9ICbP50MptfQj0OMyIutRqS
	SI3GiiD85iGy4xfvme7hv98wBm/LS2nQXV5GtuxJVE4T7UXq4KqtvcSz+SY5hyUNdNW0NQNFbab
	kvOY=
X-Received: by 2002:a05:6402:2491:b0:6a1:284f:7891 with SMTP id 4fb4d7f45d1cf-6a42f1c0568mr15979510a12.7.1787401021374;
        Sat, 22 Aug 2026 05:17:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] docs: cpu_hotplug: Fix multi-instance removal calls
Date: Sat, 22 Aug 2026 14:16:45 +0200
Message-Id: <20260822121651.1559-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is named cpuhp_state_remove_instance(), not
cpuhp_remove_instance().

Fixes: c9871c800f65 ("Documentation: core-api/cpuhotplug: Rewrite the API section")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/cpu_hotplug.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 6de26d1c6a9ad..f8b3f59a3d5f7 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -607,9 +607,9 @@ ONLINE section for notifications on online and offline operation::
    if (ret)
         return ret;
    ....
-   cpuhp_remove_instance(state, &inst1->node);
+   cpuhp_state_remove_instance(state, &inst1->node);
    ....
-   cpuhp_remove_instance(state, &inst2->node);
+   cpuhp_state_remove_instance(state, &inst2->node);
    ....
    cpuhp_remove_multi_state(state);
 
-- 
2.53.0

