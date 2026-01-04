Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8880288C30
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527957; cv=none; b=BIBNe+2qzF2ZCzzxMZ3pYKzvlSKIaUhBlwrqeEKM9b2l8e8O56Dn2lmA2DGF7M4KrowoqsqQZBdAIF4YQliEx5cdqWRMRzvENU/IMwV5KORmfWfSuR4V+hHBxJV3/MHqRporhrA+aAS9W9abs4iLxzu9CjnrAniKa0NSkLNaZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527957; c=relaxed/simple;
	bh=l8j5POt0VW8/d2GS5MH37iJ+1MmHsO4ohal6/PK0MWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=az+ObQg6Tq2kr586F8LX1LF3KTH0YTS/lwz02BQU8aCyiu7UYwxyCJEqZ3aQUpoMaB4y620PcR+AO6i9j0MCCnFUQCTgOL2pkKZ7nZe1MM6yKG1VdxrEwP2Ed9dyoillS/0EWglUqNi1VncLIYTMCazeLCjZ77uRxa7wESRB4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7wFvnmm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7wFvnmm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34abca71f9cso1368784a91.3
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 03:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767527955; x=1768132755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7MkoP9CtLBjm2hWQIWitcIKXgLoeMa4BPFQlOTaQLY=;
        b=V7wFvnmm9fvSkBQwK9EG9cB3ipQA/5YWAh6657iBvmCb/U48XgJXlUw6wom688/g+P
         LOLTSV9uhmFO0VruD/uRwc35hE4xGxcxPewaLFcmwM7GJnI/EG/WbLkdjCkoVnfnrIUb
         CfnkT2TGh7Pi8vwvtt+CDpfEPLw0+/BoJGIYTNQKpgxNc+WEvJwzvQQOiJs710R0o367
         yb1MxccPnKEXx6f+/CZHGMZJbbhwYNNvGD+er9GW+mYbTAR18Rb9N9+TGd9vOXkrHKYb
         YIpsQ6I1/mFpt8MXaEyke5OTbsukGZab/fxIguwBRr9W3hPbV5WFWFa3SmXCQXf29GSx
         DT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527955; x=1768132755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7MkoP9CtLBjm2hWQIWitcIKXgLoeMa4BPFQlOTaQLY=;
        b=L9N9OxyoZjz9nYLI4C3IxvO6kQAUwMUsqUfAN1wLAwWgzUjPplIgSvdMMiAwUUF3wv
         V8Tcf2jA1zhgpoIJDRkZvDDzY581Rh66y+XKUakPTGDHV99MgKzgjiWaA/YeDQgaI52Q
         ESSq3bCEQDNps095wm6RVrp5B7lJCHlLxeJMI0U5MmJgMqF+WYHhZm3cZn4/3DCh4lx4
         qkMe57s/P9+b8H3uv3TUAbAPbsj9k8OSuXYo7BCGNnsXdTF+yJxnVPKr4Dh2tGnfsUsC
         F/mhmAFN8agZmLl2uEVxUytTnUpdTnlScWwtOz7QhvehDLNROixxoRR999LkNvkfqYug
         aCzg==
X-Gm-Message-State: AOJu0Yy1memhMKwzUW1b102ysAu8nvQe0wOuoQsmNwZ7e9uGOHAg0T+5
	no70IwFKLbe565msvBouvc1R4lR95bwRfC8b6Q2A5BlkvhWZ1WmI9FAeB0KocJze
X-Gm-Gg: AY/fxX69qoOxd4RWP+Q8OV9C1MsMHPUxsFzQRETN+zizj9kI+PuJ2eCP0v3O7g7m2Uk
	tYywCPz0dzztZTHn273Vyo75KvrcZZIq/vLp7Nmlczou8kTksuw8jrt7n4qt84VaGI0fQADxB7Z
	L5GTlcmH663ncDcaxxbGglGpP2yg4ldhiLNj1NnyUjQ8VB1u8hdfgHuF/gxSgIdCLFolR7v+s68
	WIQORjXtWyNhPnUwR///GZjKaERyUvZ1QbeyPQ6+X6hDkYdstqniEv/jpqXAI//7Gxbcd4+sfyw
	c02KK0wHZvKoTWoNA0wC5Rp+dIeqxI7I1XevRhQczXuRNLqTAxNwVh9YjnlkTsPbBsd9Gu40ccb
	GF6zVWs3xErVYX0OdT7k+Ad3Z/LcGJ4kqF/9IRpA5LO3wKNs73rLojY6YIR+z+gNLyKU1+BeXb7
	WxShD8bz/xlii0/3hL4fQ=
X-Google-Smtp-Source: AGHT+IESdJf2KaDgModQpohILlDsssF8CRwAeDENIj9oZS6Y77YvBgDoxZpF7o5Vrr39zwbazKGUGQ==
X-Received: by 2002:a17:90a:dfce:b0:340:be2e:9884 with SMTP id 98e67ed59e1d1-34e9211d592mr30261531a91.1.1767527955185;
        Sun, 04 Jan 2026 03:59:15 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f47709616sm3621148a91.11.2026.01.04.03.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:59:14 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 04 Jan 2026 20:58:41 +0900
Subject: [PATCH v2 2/2] docs/ja_JP: fix translation of freestanding C
 environment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260104-ja-howto-v2-2-8cac525b3dfe@gmail.com>
References: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
In-Reply-To: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

The current Japanese translation incorrectly implies that the kernel is
independent of the C language.

Translate "freestanding C environment" accurately.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/translations/ja_JP/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index a47d7679364aa3da57b9802807a3571ca23b7122..8ab47fc710fc14da30edf75e9e415f88cb110734 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -49,7 +49,7 @@ Linux カーネル開発のやり方
 
 カーネルは GNU C と GNU ツールチェインを使って書かれています。カーネル
 は ISO C11 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
-います。カーネルは標準 C ライブラリに依存しない、C 言語非依存環境です。
+います。カーネルは標準 C ライブラリに依存しない、自立した C 環境です。
 そのため、C の標準の中で使えないものもあります。特に任意の long long
 の除算や浮動小数点は使えません。カーネルがツールチェインや C 言語拡張
 に置いている前提がどうなっているのかわかりにくいことが時々あり、また、

-- 
2.52.0

