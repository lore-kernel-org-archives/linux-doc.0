Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FE6262FC0
	for <linux-doc@vger.kernel.org>; Sat,  3 Jan 2026 17:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460816; cv=none; b=GFQ5rHPnllsgOX5XwGmMOx/AJI9mMVwY6C1e4bcpW480YLaY2U4wGIlgoe6EF+mTP0eAghtpqvss/j59Wp6ugUANTPXFWdDtXMb196hjI9VK9b6G8NTL6QBEAP2mgEoltSbZf1uR6Qka2ftlsT6e5rOwPduKbEgDywO07uVng28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460816; c=relaxed/simple;
	bh=4rwDJIcwsXgZ/Nb4WA99qEX2RR6wwwoEMbNxzZgi3B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ae21we+p5kQzc8S95dgvgeSdIlbs8iCuDeQ85naU4tvZV0oxeAnrcvvfqYQBJ7+NJcWoI2Oxnt19ZFAxeyVRSRZJWNWlAcgyTizIiLzXt3fpqqVvh5MsWPjBKjFyvgKrbMGvjNKGdpZomrnMtQMyfrNLuredaUMcXH38D0wV28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs47kaIQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs47kaIQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a097cc08d5so34002805ad.0
        for <linux-doc@vger.kernel.org>; Sat, 03 Jan 2026 09:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767460815; x=1768065615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fqlIo0o+N5RMkW3FOBTLYCEGwJ9vgdAYtoJcM7Y8JFo=;
        b=fs47kaIQHbcSXF2JuXROomEKcYaj1M2V9cnjrgxX++DQTYzMKfVYOwDHk4av0qtU9y
         GvT+Frf+8bpvzX+K5rFzjzElF61GOoNBTeO5Ndjs/fSFSb0aVDqFA84N4IcvcKXiRZTC
         OF7SmBJsVcE/kCM6z1DTXgJwqQNnwlBjLovpAQPkknGRkWDp+jL0Qj8n0okQLYXvw9vi
         tnrgGRSbyd2mTZYvTZ5mKxaPs0gMU/QEhIe3tw4VxP00/5q+O8DXogfh7/ES7DQ4jLFu
         arXfqX7p2h12Z8cCe2IZRR0ZfkfWV8kdfg+Tx+HHsSo98a4iiEDxuDzs9rYqpimFxR8d
         YVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767460815; x=1768065615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fqlIo0o+N5RMkW3FOBTLYCEGwJ9vgdAYtoJcM7Y8JFo=;
        b=DvOUmF1JdGWpnKm11Sz0v8lGQS4y+EgbjI0IpgVrolz2zf3PQH2pt+LIWFFp/jre2i
         u2PzV19Vs0Z2FehT40DqJV8S9o6rE+biWawizvRbRqoGsLF/2DvTixvwC34lEc2nmn+i
         sBZ10Nbdk4JL7Wxzbtw5TQk3CbmSmtduO1PNSAD53HrR9MyWGLN+7z8ZXPCDBOOVj/1t
         cFScu3ECgdjiRJNlPccdc0axRv3XmIVMyy9HW25YSwg6GebLP/CNMZ00qVwk/rH0r3PS
         m2s2b9ZcNAmFkSpZneeCM9NlVwU7bxDmFC1zPr+5XwehePftIewH02wPaOK1jH2dmBD0
         XxnA==
X-Gm-Message-State: AOJu0Yxd2BXLv1QvwubF2+NPwWDhqWkGh6QlL1yrb5+GJUx6hwkt/Y3+
	mvtxn+n7Gd99HvtIwNmGKmo+rMs9Ql2OOrde2bUWgbFx9WU7XokQY3M3
X-Gm-Gg: AY/fxX7JUboMosFz9QGaqS570nZEWmYux7WZVY/kFSEGEQBziOigXNSxHTpoEWamV94
	3drmYD3C+PO9PB2pBBwqehuw1oJwdkDbNmpXR+yoeW5u3GXkr82XDldLIvbNu4Uuexi0EenajsF
	iofMCKOagTYf+2JqOWoyE/OKMtC52DiYs2YvC9rax6XlvtUTI/6NwClAxutm2vawauo4XcsgvBQ
	hUMziFgSS0VtmiDHBkyc4efS6Q2sa39R92R9nVDe/bJRptL/0Xh3Lp1UCrTxi2C+P9B0q3OPqLm
	ley/mqJSwjsehrQe7uLWOV25wypCeMLJs75MXgdSM5lDpralxNmHxnOjR59tPPO+kv7qsqB1YvZ
	hwYLfMl+JRHqq43rCvjtS7FhS58fPmyic/m5e9+ehftwgzdOY5SjMeW084M7D0jqk4DCM5R7uMa
	exzD1WrIR9UOAIEHbCSqQ=
X-Google-Smtp-Source: AGHT+IHUpjCCItXVmJYykF0tKE8jxszvp1noMpH5mzUHC0QzxuxEVI3fY9qUA7gHQ0f2sCh6vKUA3Q==
X-Received: by 2002:a05:6a20:684a:b0:35d:3476:d255 with SMTP id adf61e73a8af0-376aa1fbed6mr30579852637.4.1767460814542;
        Sat, 03 Jan 2026 09:20:14 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c62637bsm38318087a12.30.2026.01.03.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 09:20:13 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 04 Jan 2026 02:19:39 +0900
Subject: [PATCH 2/2] docs/ja_JP: fix translation of freestanding C
 environment
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260104-ja-howto-v1-2-53e5564a47d9@gmail.com>
References: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
In-Reply-To: <20260104-ja-howto-v1-0-53e5564a47d9@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

The current Japanese translation incorrectly implies that the kernel is
independent of the C language.

Translate "freestanding C environment" accurately.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/translations/ja_JP/process/howto.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index a47d7679364aa3da57b9802807a3571ca23b7122..9a807901dd89a88cc0d34607fdc613e68ebdbb9a 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -49,7 +49,8 @@ Linux カーネル開発のやり方
 
 カーネルは GNU C と GNU ツールチェインを使って書かれています。カーネル
 は ISO C11 仕様に準拠して書く一方で、標準には無い言語拡張を多く使って
-います。カーネルは標準 C ライブラリに依存しない、C 言語非依存環境です。
+います。カーネルは標準 C ライブラリに依存しない、フリースタンディング
+な C 環境です。
 そのため、C の標準の中で使えないものもあります。特に任意の long long
 の除算や浮動小数点は使えません。カーネルがツールチェインや C 言語拡張
 に置いている前提がどうなっているのかわかりにくいことが時々あり、また、

-- 
2.52.0

