Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FD2352020
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 06:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048602; cv=none; b=o4aENEJh8sETtdE6+SDQZN2Ab87ewJLLwVtRG7+ZD5cgfIHQWXIuKr/T8TRnZzpCkolrrPBDqSdJFdQ38vkneb4fXltbbfUnpYc/jGXqKsWtf+IQfxOkYFssXJN7fH3umvKo7JFSbl7wJFfGcLZaeICaqsUeSczx7WQSB8OSDGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048602; c=relaxed/simple;
	bh=6UQgj25rOqQpEbBmaFceK1CGYS2lEc0iSUTNN/taQt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t09CVqo3/fZO1tcUrckCJ0opdQHAY1kw0L62UyMdUzCLMesbuZ3ug/Ap12bJlLYB2+57wIh0fEVwr+9iShG4JZN+d8bLgmopQyw4ddOkG/iP7DuNaIFDSjByAmxGt3CVaFjz0fjQFz808FIVjpX8rceV/RpikQgLHEKyEO8ggLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fihVIJAC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fihVIJAC"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cca0c5799eso15738995ad.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785048600; x=1785653400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oXKZuqXZPFT6RtDlpNjweetaCAhSBmOlQMYloUj0H9M=;
        b=fihVIJACAaj3fcFVBhZIVWs4tCHFZ1D+Z/rbUw6uk7xdyRLirFAQSbWjCqaTBevDtM
         dm7LpQHLh9TPXqci8sxvYF8A/VuL0IolRx5SNR4npGiEIvBjfGL1Gx3JB6w3388GvnN0
         a2jaskejqvjhbirhhE2rke/nmmlW1JoXEIiGPjpG0ScngNXGYaS7WqiJEVn7OKUrmpRr
         zHs/wjkDzW1TeggChM6tRCEfwUTPoxVWGWYthVXF0/tMynomF6bGt6e9f1yq97I5otZ5
         pXsoDvEBgRmHq3GJxQY9i0ATjjzjKYCd/bylx5bN+pUT6n0ZTws41/grAdZuOhSZyd8C
         OsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785048600; x=1785653400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXKZuqXZPFT6RtDlpNjweetaCAhSBmOlQMYloUj0H9M=;
        b=o0mVE5WMQprtH53+G9V7oL1NOOaHxFhuD3v+LCeOVIZlnbj80FRVSzyPcPr6JmG8vn
         2Gyv5HHP/4KJGqf1UqTbEMilH158+yZancsIl7Ks/9xuPrevqX7ENULNi9YLFRpTAZTY
         Ns6QT363y/STigxtbTqukcMIqaOYBKc4H0Hc4eZDCSagd5So0AiWOGJInT4OpuLyFwsA
         lfpYf0Lps6I/Bewd0CD8Bgm08pYzQgXUO8YHZZ0PEPx6kSwSKDaWPdG5RKNtxGpUOJXt
         8pM81j/TLpYFLxxkR6PMzb6ni0yMxLrEkFdCt/WOTFWnsuB8Qoh5l7l4KqKWcz4uatzS
         6UXA==
X-Gm-Message-State: AOJu0YwPvA/wuQWXWQC97ORcItyCAftgjTbiFaV0ufiX6NIS76Bdeptp
	baIlV1cY2wsW1p1OUFjWnsueNLuTaaK2I+DMwhnBVydyWPcucMQ235Xs
X-Gm-Gg: AR+sD13vDEXXL7KFna1yROUhZm1gqv0cVRBQ4uDXbC2mQ+pQjxp+gzOadiuZ5nFd7WO
	9hAuLU1DOUzwydGcpGwcKTA9/eN/RlULmtFzpolGP+IigFPT1i5kvLlwaoLIW9geq/H4vb2qVVM
	1e1cAN9NDxXYpu8wZoiQS1tJev7cPkGSvPSxvsA9Saxwv7shLiN51PpFw+tT0mxnqJU9ak+yU2c
	P1gbuE2hX81k30gK6rBlbE+f4sW3bswEpU9GUTeJw+WE/qYbMkbNcaVexcMBGq+4BQ9p88bsAB/
	w7mtXuq5e/jUfePgEkTQeGGBi9kD7LdkPJgQOAAgvpkfi8tmL13LXTPCV4ukasuroq7UDvFrj20
	X1z6zR6NqHqMBVqCGNNVEtgUd9YgIxFkYW+4N3mPrFBT332lg5QuuWenpD4/xqRC9JWmMCxbf5u
	UKZamwdUhZZfgAp3kXsKKMx7YfyXeE1aA=
X-Received: by 2002:a17:903:2446:b0:2cf:4505:6bcf with SMTP id d9443c01a7336-2cfde83038amr38745675ad.29.1785048600071;
        Sat, 25 Jul 2026 23:50:00 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d5297sm17370115ad.56.2026.07.25.23.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:49:59 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: filesystems: vfat: fix 'whic' spelling
Date: Sun, 26 Jul 2026 12:19:48 +0530
Message-ID: <20260726064948.20557-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell: whic -> which.
No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/filesystems/vfat.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesystems/vfat.rst
index b289c4449cd0..f408699ce50f 100644
--- a/Documentation/filesystems/vfat.rst
+++ b/Documentation/filesystems/vfat.rst
@@ -361,7 +361,7 @@ the following:
 
                 <proceeding files...>
                 <slot #3, id = 0x43, characters = "h is long">
-                <slot #2, id = 0x02, characters = "xtension whic">
+                <slot #2, id = 0x02, characters = "xtension which">
                 <slot #1, id = 0x01, characters = "My Big File.E">
                 <directory entry, name = "MYBIGFIL.EXT">
 
-- 
2.43.0

