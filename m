Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9A3484257
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559032; cv=none; b=eJ0TidiMjdUNq8IEp+ar+H5u0MQXjoUc9jOZn7PUVMBnNKAoWH7Nqup/lgnP+LoqNfFq2QYZ4GABNk+WhCUdvvsXsozTVBtK8EDnXXXFJ3vJF7C/mDQxdeHmFSUxK1fuQrdbHN98eZdSbOLuI/LmFtdEILPWb0M+3/wzIKgbcyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559032; c=relaxed/simple;
	bh=vAS3XXy80kygIF9Q312sEQcYcNWCvzeW4fKWAXXwzmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=brFce0Vf5GBve4Fx+2jOqNbk0n3TXaO4pzyfyY0ZQmr01pPuu9ce7X8o52R3TSwM+fmaN+PDSee6kQ1LCIpBRHdi11cB/ePURyO7rypIMNrdKnuhd3nwvtp32kbrrRJG64jlnbLvruKNWypN8Fds35pNOwhQXE2Pla7+agdQygw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tKYaS0rv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tKYaS0rv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbeea240819so584757a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559031; x=1787163831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rY7zCmLlC8EX8bVm77K2UlgL+HheFi3M6EBapeAXM2A=;
        b=tKYaS0rv1BiAfxJx+OrWw1ONyi54SowPkfsPw/LKYAuRY4aZWtNS6XjgGGbJVfbFAv
         WDguOBbcZAptgat2vAeNrcVtMVZP2ZPwDRqBlmfraik/ZSUostJEz21/FyIaPGjbfWZ/
         w3LntFUcWdlXKNFyp4MFEMU9bQdZ5Qr+qYKH4XjgW2pjVXyqQITTxP0vmBMgfPCoGlJY
         Ft5CLxAwaQQUY6iv+sXWKhZ4EOUG4YIQzhQn6zBsQj3ND5HaC7sFyblHkuhGh03OG8Fe
         UxztVcxLfZ7L/lEmSi2piBI7bDjHaz9KyS5AEp0DhXvm8yRDDf4rg2USWo38rzxmQ03E
         m1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559031; x=1787163831;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rY7zCmLlC8EX8bVm77K2UlgL+HheFi3M6EBapeAXM2A=;
        b=fbHDdNT86VLQR76ef7o6DlxTtUjAhP8lXqnFae+OO0p0dISK8C7HiRdQ2s2aIQr3WB
         Igkt6yyefVXqabQ/ElfR2kEuPGaZGUkhF8LYXjELHic2WrVek5HXxnZmk7Akgi6w13T/
         6xENGALi7Uc4vhoh1RdTzQMaPQq7ipU9/sPVwYcPBlb94+b6HpYfetCBaJVzXxaTg8kx
         Sdw24GcN/chrRLfwHMKVG9TIh4XFUcK9lg2djVyp22IKgHjLDxF7j1/EhCk1PIChd6MP
         3vbTScUeU07mlTqXQID9E6g6Fpo1BEl+n4WDAHxmnjfloQkPmm98+8D6stSg3AdHdFew
         XEuQ==
X-Gm-Message-State: AOJu0YzT7ncNTPtB2iOzxFNY8XZo1kfRrMk22wUv/NlZaiLhV5l7NlfE
	fEOYRzzptqODxpquF6GjNJaJJkHOiwykbHcJmHiIhHxbH9kkg5Djzv5x
X-Gm-Gg: AR+sD13RBz6s1wdO2M2JTusZKrdNYoj7wFs6xC8f0ANXG8Q+UtESRRDkFmvRwtGN32j
	KGJnDDAiNE0UNQADFbaeWZ8sqY2u6MzhQZ5JSvtEe29o4irmQnjdWwultyvbZ5KIbbQird/3vG5
	keitCEVPSzJYxalHHtHbg3rY+qQCNnj6zo73iP0hiETzuWqrg8sALMNiqHMnvEpn4rdU6wcXvuA
	/BNbIl+sB86tILOfezGzOxKoAi6sQT2q5A8I3Z/Cc7zW6pKN5xyw8XSnAGHGHKyw2APEqrf7Lra
	nxPQdrNNrBoO54mCWesSbrg+j8Hg9ztz1ow6ytu/0Xg+4GlJzebmO048kM8RHJbgO/eN6e73q/Q
	PeshO+YvjXJ1JN3JRo51E9zanivq4kkPxb+Swnu/KPeSiD6OmpzDLT5jU+9SekbUtX3WCx/gUX2
	aMzdPD+3kncicdsXIP4ZQxAdgpqAjrYk79/b7gqTbZzCjzJs/OfFXSFa6DvSXTGvT4CAWHoUZ0u
	Q0=
X-Received: by 2002:a05:6a21:4c0f:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3cc55345736mr451536637.37.1786559030503;
        Wed, 12 Aug 2026 11:23:50 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:50 -0700 (PDT)
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
Subject: [PATCH v3 5/6] docs/zh_CN: doc-guide: document macOS Sphinx setup
Date: Thu, 13 Aug 2026 02:23:22 +0800
Message-ID: <20260812182327.53694-6-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812182327.53694-1-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
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

