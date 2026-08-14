Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C453EB7F4
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743884; cv=none; b=ti4yEEU/B9IFXoqEzaHaLtwVf2W82W3VoGcwGFtvlzQVH4SsocC1W6BpQj3dSoeF9M/jPLplMSzaR4SjkJ/fee+Wtur9/LQ8dmPR9Qybw8yBkcntPtc+XZ1R7pJSoI+g3qaePUgnoQym7XdEbu0bVIr5QVH9d7p8P4ALT8TXh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743884; c=relaxed/simple;
	bh=Hhb4cef1MAEpu4PLBU4LkZ2I1C8LkMuNPL4aX8GslHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSOBsr6bQp2WZrCNiL/7rGrETepDKs4+AWAlfuJYoXcrf/guI/jsZ4drGsB+t7sxFapFuJRkTcMK3vGnf4o7AXn1QS7eHxad3JPGYgtGF/qgXf+yjxtQMjXvX8B1yBLAfkG1t3lOWQZSEzA7EbvN3WgDFkqcOVzaraMY8QFT0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS8PGTTu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS8PGTTu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace91f112so18982115ad.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743882; x=1787348682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6GZvfEAijGaqhtKPQUOnz0gSt4IZk38gRWPOnznvfc=;
        b=JS8PGTTucFlURb+Ts7KhpMEDCvdHioKbIyx9nSKpCGYlih95IuCBv8CON4K55gvccb
         V1phV4+Lj5abaevKSAi8zvw8sy0TWPvfpsJh7GsKLjOEFRzfbm9O+W9ygxb3Y/Z6eJ5r
         AtdVOe4V1MU4AhfkSTcqeyr6AnCrH63j5lk7PxYkkhad3nhHe0rsRUhMNlBZLaB2hDo8
         vXdiWjeZJ1ise3jRQVlGDyuHThf9RpVDOEuov+d/MMKogjcVrAF7o+5JpWf8FtU7Eh4I
         VCwkbHDNRGWKlCBsc6ZT/BCtcCxJCtOgetTF5J0t2Ue6fvLah5ON2J4IvHXuEkTZuLpL
         +x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743882; x=1787348682;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6GZvfEAijGaqhtKPQUOnz0gSt4IZk38gRWPOnznvfc=;
        b=iCVZISBABR2aqb+xzbl7jVS/td1MrbGYpJlqAuYHCKtNt/TSkTDnrQnaHPaZAjYHov
         20acN2NTsg5xpR8YBDywHW2JIfjlw06/06hWJOordD/KmRnGj8c3EmMNFf/LkzpRqzL3
         gRpQ0xwGbUa4NBxPrnlAxOLLMSMdjV3b10rJI0WEkRlPzwyZTqJqQxRl7W4jfeLGeGJP
         ehbTnwBJgEZjXH6UzwBndVUPYRiIfxQ+vAGscK7BNWdaNuG7E5ljeXIlJ1jXH9qm6nqX
         D231/5KPC5oA8RzqWsoGAR7OGNbpSTNm8vJZSK1nmIWk1VGxpzw4i0tCVbV7tPWkXxJB
         0HOw==
X-Gm-Message-State: AOJu0YyflO45GDocidlwaTyk61z07cEAVcbM6S93YYSCfXKuuYM+wxET
	Pu0trTjfgAIdOcBe3js4aAJ7x4Y3ys2EZdYI/tac/CUX1obYJaCKTLj0
X-Gm-Gg: AR+sD1353TrFRw+tVICM2vL6767HTFEs71cmn//Qxr2vJPySvAtsXZZ7jTqLeuRvBRS
	vJwrETSdVeBw78vVAu5iaWUzOSAbIxOTlk6d+UtjvqsobenJmbJfiT9xwqPrW7JsHGCxQfW61bu
	Jf3n1srgyVJ/5p7OVFeqIDX/Nr2Fn3X3MCviApJdaIr6LyeCsCIz0M4P5JbUgSVxFO8o1rmR4N/
	/iSCuLKI3N+oAovs3QzD2Tk7o3kbBr5o4P6pLvIsIUx3JWJdEQQFdDfyVoXzmlCXJNyhuKFFSBg
	6Goaf1udNmfvreifXYL5wMh6nuSjEX3VqjHokfcdrwgy1w6C6in535HvHshzvI+QMqwDczFUbXY
	L3p6kolhULHP5rFLm4ITUapNmtoDyMAAatW6752qXHVcG9C1xoKncXmkkvOfEDgkMLyR95M36Z7
	WUoJAYfc1OkTikDUf1KNaXUu05X2hR8BEXLZoOu2oqvznhRdpEJjimZ7kyg42JNR3sgbJEbrTiA
	YA=
X-Received: by 2002:a17:903:4b50:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3b0eec2e4mr109964725ad.13.1786743882137;
        Fri, 14 Aug 2026 14:44:42 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:41 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v4 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Date: Sat, 15 Aug 2026 05:44:17 +0800
Message-ID: <20260814214419.49925-6-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814214419.49925-1-chenmiao.ku@gmail.com>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate the macOS Sphinx dependency setup added to the English
documentation. Keep the translation in a separate patch so translation
status tooling can track the source change correctly.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
Acked-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_CN/doc-guide/sphinx.rst     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
index 3375c6f3a..e6d42d970 100644
--- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
+++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
@@ -110,6 +110,22 @@ PDF和LaTeX构建
 
 	使用Sphinx的系统打包，而不是Python虚拟环境。
 
+macOS 默认使用不区分文件名大小写的 APFS 卷，而内核源码树中存在仅大小写
+不同的文件。克隆源码前，请用 ``diskutil apfs list`` 找到 APFS 容器标识符，
+将下面的 ``diskX`` 替换为该标识符，并创建一个额外的大小写敏感卷::
+
+	diskutil apfs addVolume diskX APFSX Linux
+
+在 macOS 上，该脚本使用 Homebrew 安装系统依赖，输出的 Homebrew 命令不需要
+``sudo``。PDF 工具链由 ``mactex-no-gui`` cask 提供，所需的 DejaVu 和 Noto CJK
+字体则通过 Homebrew font cask 安装；如果只构建 HTML 文档，请使用 ``--no-pdf``。
+安装 MacTeX 后，请重新启动终端，或运行
+``eval "$(/usr/libexec/path_helper)"`` 使命令行工具可见。macOS 用户建议使用
+默认的 Python 虚拟环境，因为 PyYAML 会从
+``Documentation/sphinx/requirements.txt`` 安装，而不是通过 Homebrew 安装。
+该脚本还会检查 GNU Make 4.0 或更高版本；如果 Homebrew 将其安装为
+``gmake``，请使用 ``gmake htmldocs``，而不是 ``make htmldocs``。
+
 Sphinx构建
 ==========
 
@@ -409,4 +425,3 @@ Documentation/doc-guide/kernel-doc.rst 。
    <line x1="180" y1="370" x2="500" y2="50" stroke="black" stroke-width="15px"/>
    <polygon points="585 0 525 25 585 50" transform="rotate(135 525 25)"/>
    </svg>
-
-- 
2.50.1 (Apple Git-155)

