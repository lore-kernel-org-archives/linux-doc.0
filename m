Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB02F0696
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032528; cv=none; b=sR5qCice2G3VACa8FDijDX/gDkIRwf2iyNaBU4fIzKuBJ0vlKNz9xUqkpRPSP9nOJxiIhtkGjousi87biRqMlV+Q9iP29WYT8uX3KMLPWXkdhkSU+/3V2JOYw/RbiRrWNzD90cwUfLns4eAsuu+WwfgpTfHEAzpbZ3DOWEFhh00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032528; c=relaxed/simple;
	bh=Wjd/ahogiecuD3R9OKIm36BoNSARgTSM43ONAw1Cw38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUfJK33yDuhHw7Yaht+cV9jH3tRBuie7PDTfn8a2t0k78pbP9cicER1oiGOxJG1nQ/RUkY5MjbEOUdK4LzaL4vmzIwYdR8CMOzu5LMk782/JPVVu5FoUNK2PwG2VS+twx+6LXjjkFK8x+KDDeIOhl35f2IDFZndeJ4SqSXQ1qL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyJ0e/OI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyJ0e/OI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24009eeb2a7so54942995ad.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032526; x=1755637326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUX7gcveClSIrdE0BJLw2amSV/HKqF0s6b1elSyy6f4=;
        b=WyJ0e/OIUPtiy9ReUKJSsvaE2Ak/a0xI0umXgPm4OWkKM4zis+dWQiibuUxAjIFk/S
         lPuagckbY78cTiI9SEbPZHqlFFFugAq1xsDxBV9gKm4y4UYw4gmAyMAvmAJ6Qmd49Lu9
         jYzD3WKrXA+ASUuN5RThHLctl/6cYah0dIqZtValZ0NAGOyLnW38qOzKe6ALpSSModch
         3FXtNhQeSA/Ek8FYFDOoVpHlYoP+vEBCYe/AeVFnFxAxeqISMS5xq+UbcGNpxaYpwhjN
         cK78zhqRgP31EtAhLshbCxXyZoJyRKkdneh5cQpm9KD/qPRFRn8twsUdZ0+zoN7JDIJ3
         otgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032526; x=1755637326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUX7gcveClSIrdE0BJLw2amSV/HKqF0s6b1elSyy6f4=;
        b=K9cfwTUwnNJTj5FkGmPJmmaGfBtdWBzrXUBW2lhT/GTbq7hfK9ndyj7sm9+9l8ZPlZ
         ZfChUlK6+WBNCMNkg4/ryKX0MSgxniAO8O8dR3ngaqTn79mgoNnzmUgvrqincT+21WCv
         Zo7e/jN9/PLqwsRsJtOXKvalL1MwxY8fvJ+tc6LgCrollVr065tDMQVGioOTtsJy+tgt
         GsGfGqE74PrYxryA4gjphFLue+3XpMR9OehTraOgqmSXvwTeXHFHgH1KfR4qcMAib6t+
         NKyr+F8AktAzW2LntNcPEuet394NhbqMWuzGeNjayvknvdpWsQVoMdJie2oxcYA60Y3x
         BZwg==
X-Gm-Message-State: AOJu0YwoUIHVcb32XH8HKddh+5o92aQjVfnWn4MULwL/NCO1XOL+8WUw
	IlkMJAxbF3umnriIelSGE/kp7jpPla7sSO7ANxMnp0DYuFxRxwefYwJnOqUnMyRIOn0=
X-Gm-Gg: ASbGncsUPI4iO+XNGXBA0jtpNFjVt1w/OGZVnepwqfrU4Jc0LnRKBs6WOxBAxZAHv6b
	uZDI8KBmBAVBQgkPig7mAE/r+9jcH6+i6iMiuCTTK0CnJeydyUrqwdg577HTheI/xjvDsrAlcjr
	E/WihXN7J9oCfqfkByPzmLE7zZiFUY1BuwLmjLe6eb2LhidESNHRaFcFiJ9yhQAO8KmTQTTwSeF
	TA+V4yKMwu+71nJr4eKXWMa6qZc3o5/NxHknw+9OTcrfmO0Zd0TAMnUsm+eyVOWUHyqYAk2SW7D
	rJyLY4e0AfHor7Gnln+vmR/9uDteTV4fIwDxWUEtKE2rAHJc5ocuLdKOs1Z3pIg5dBskEIxPpMw
	ZnDaOPzKLd/MZK4TtnjvOPY7UMilX+nw=
X-Google-Smtp-Source: AGHT+IG5HhRI1dJGdFhVyXJWTJMYfeHiiVoFocn9lDW/pZPQ1FY6QgBZ6fzb0uVeJ1TJa5I46J+X4A==
X-Received: by 2002:a17:903:1a6f:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-2430d23430bmr8457295ad.45.1755032526121;
        Tue, 12 Aug 2025 14:02:06 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef65d2sm308426255ad.31.2025.08.12.14.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:02:05 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 8/9] docs: admin-guide: tainted-kernels: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:31:50 +0530
Message-Id: <20250812210150.74095-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- userpace -> userspace

in `Documentation/admin-guide/tainted-kernels.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a0cc017e4424..ed1f8f1e86c5 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -186,6 +186,6 @@ More detailed explanation for tainting
 
  18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
 
- 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
+ 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
-- 
2.34.1

