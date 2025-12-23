Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732A119C556
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 03:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766461995; cv=none; b=GbDv/8ZZoSrfOFlt5tHFS8u9MLMcUSsEcE4I1Wtzh7XeivYj5lm+EGwvJnFaMaXxkmwhzJcDlXKeZ0If/PtGSRELBVmp/0zn9IIU670ke2uX9yk9V0E1IpDx4W1ZYK3/xoXoiUwlqRlULS/t3tiZuZsU95xO5nsa8jMvEedR8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766461995; c=relaxed/simple;
	bh=Z8S325YSGyy2PYGufR+TSkk/SxXRq02XTKI01RJgIqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUk0dpqoxp0oyU4Y8/gm6gUQuznKORA27cvi9pht5wRQKz7oAYGaN0eKXBncB8R7AWcIuwSlFvU0kk31Kd0cRnNaF1u7qK06+Q0I6WmUDSJ3oHEepHjJNYzw4Vnz+c9JgL/yCD38OrIcD7tGXdtZnnrLasN1miNXcFg2zbSQw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kl0dIbdh; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kl0dIbdh"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-34c9edf63a7so4843815a91.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 19:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766461993; x=1767066793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJv9l4/AWT1VU/BvU60pSYc7O+5uRquusb30DTmVBdM=;
        b=Kl0dIbdh+lq51SQgbkSIYDGOjT/35uHDJP39W8Od5/A3MbJ8NndShTk3u+4Yq1XA0F
         VMDibzZ2GZG0wYDVHqGYFIgueWlSnUxFBw28uXLFuD5SVO/nCtEF3whWX7zXSITdJmhk
         MCAKpoO5AkORsrEjzBaMXf46PCYrf4PPvDCZzqZo0m2FMs+WvQZCHepwH67Xb9Q37Tp4
         5csujdzkNNkXJHvtovCRA/TxaIFUqtlGb61NC33nijV9VDzApe4D8lPG0W19nPT4qg6P
         gxoAnqsuH832ML1FTTkjWApxUZBOgGb1ooQ+EW4bCz0TL3TZETaL1Xi1eN8yJR7fbD0t
         DQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766461993; x=1767066793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJv9l4/AWT1VU/BvU60pSYc7O+5uRquusb30DTmVBdM=;
        b=lM56flYmaLdTm6sXqLan7UkwPn1HCj2yWleNhzQ2NRfR/bHgd3DGkZSGRMrBviWwMT
         tvXcPWHT0v2Ot2Kr2Bi7IxnN4dFDuzJCW02xpZ5qDBfSQxhGuUrhG48VDorxLH/w4K5i
         S/t7Im9aWax3dHhkalxMd684JaxiD8o5+iCW9ZxRlFlSduV28aYhMfdqgF7/uUd7BtYc
         EO48XzriYcrrNm2D+pUK4iBez+o8FO21HgH203E91WXP8LxUdHIQ6Cx87IXizUp3kK6h
         GCe32au4AATzcn9nJlbH59SlQhg14TjrVeTqnIAmIjCx3JV7eTBO2DhRoAjliUS6F/d0
         Vyew==
X-Forwarded-Encrypted: i=1; AJvYcCW3rm8VD4p/Fivsv1FlzDiyxMxgWiOEYSrcuKIbs4nQPMa14OlAyxfwbc0b/lVSdwKIsJhQW/msMQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuej5hTugIeH6Y568sgyZV9f6NIYPmChXX1krKclF6Rj3Mu1j+
	iZ6heo9H3jAgBGo95Va0iH/E0xfbMDqHu0XO08zfyCR8dxDbX2vYUhHD
X-Gm-Gg: AY/fxX73lL1/zm0xY1zKjB4n7MFKjKw7S1CLkpPl+Vm7hOzjVrd6SkbC4xnv91jwEIB
	QWp3MZT9wbyjo/ciV3a2RygUFehIuAl3Vxv5FuGJQa5aRhgmGZ7nvo5q0wmuw98naNXHl0coXb5
	zBkvQ3gJxTBPvCq3UHLH7Jt6qjLoo5XrsYkWJtfhK4NMzWfJBgKisGRVmPQ5QUak8629H1kaRi/
	yZx7SyiAMFRIVzIJTOL3yBtnD3o39zI3btd3Q3qBI9S0K5anArnWLPZuuNOePbjphvg5JKnuThU
	kmbPyc+XO8qZ7QNw0/DK40YFrGx/TRnMsLZy6reLmijYKhA+12AOOpFKw0MBTMk+fVhPRy3YGrT
	1ug/if2GspaGwmpgn2WqG8t2PGbBsESwduA4WYz5U7K8OAl/EMxSI690vH1ab1rmG7GYTZEFhDO
	+zBslkHImra4E=
X-Google-Smtp-Source: AGHT+IGaHUhug/yM7Wre4n5D6rxDsuUpO2x5TOlCoS3GqPi0UQ+QWs/u0Lp74kF4B7sDmTQnoNwJoQ==
X-Received: by 2002:a05:6a20:1590:b0:35c:e441:e6d2 with SMTP id adf61e73a8af0-376a81dc13emr13606923637.7.1766461992693;
        Mon, 22 Dec 2025 19:53:12 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223ae29sm11259416a91.16.2025.12.22.19.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 19:53:11 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 427A240AF86B; Tue, 23 Dec 2025 10:53:07 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 2/3] Documentation: kernel-hacking: Do not italicize EXPORT_SYMBOL{,_GPL}() references
Date: Tue, 23 Dec 2025 10:52:52 +0700
Message-ID: <20251223035254.22894-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223035254.22894-1-bagasdotme@gmail.com>
References: <20251223035254.22894-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=bagasdotme@gmail.com; s=Zp7juWIhw0R1; h=from:subject; bh=Z8S325YSGyy2PYGufR+TSkk/SxXRq02XTKI01RJgIqc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJlegp78wZ9vH1Z25L2Z2lS3aPnTfguRuu5I5onyyzlkx C/y5NzrKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESc2xgZ3vzlYXdLVOlKm9+5 rkb61ONSg3tiUr4W0jXruXN2rFlhz/BP/+vtZ7kfdC/ozD+m/vNxmbGl6sTVa42Ctde1nLmeWe7 EBgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Do not italicize EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL() references in
EXPORT_SYMBOL_NS() and EXPORT_SYMBOL_NS_GPL() subsections.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index a5f7a1df7fb97d..1d120ff80f956c 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -597,7 +597,7 @@ EXPORT_SYMBOL_NS()
 
 Defined in ``include/linux/export.h``
 
-This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
+This is the variant of EXPORT_SYMBOL() that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
 Documentation/core-api/symbol-namespaces.rst
 
@@ -606,7 +606,7 @@ EXPORT_SYMBOL_NS_GPL()
 
 Defined in ``include/linux/export.h``
 
-This is the variant of `EXPORT_SYMBOL_GPL()` that allows specifying a symbol
+This is the variant of EXPORT_SYMBOL_GPL() that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
 Documentation/core-api/symbol-namespaces.rst
 
-- 
An old man doll... just what I always wanted! - Clara

