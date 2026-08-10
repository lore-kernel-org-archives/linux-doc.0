Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B603F86E7
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372413; cv=none; b=QEEKSXlBXNzhozIIy81l47Re8OgP8JP3+QeH8u83VZ78L2ATlRl3Eq0mdEo4L5imardd5rhDMAOQZwTTd0lwSaF245GhnrWbxn6b0sqUP4z90KiwiJXdx6jHA8KwZX+uh+ojBM3hG6kCxch2Izy8+TAIM6GVzibxThD4E+RalMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372413; c=relaxed/simple;
	bh=vAS3XXy80kygIF9Q312sEQcYcNWCvzeW4fKWAXXwzmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovfJUvipWRy36Blu6IdJ9RODgr/+gYC+UvY1Pjs2U2XApBaomfkKHRwqasdBfEz0OpaJgmXFGX88it0HrrDiwb69TGm8w3PfVFnpiS4+HE1oMFzK2ukrGJQb6tdFXDUbADfchjLEA8Mxb8edrkMaV7LdsSOJfo6zqOXmykYCF8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cet86NRS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cet86NRS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84867f07d63so2258701b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372412; x=1786977212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rY7zCmLlC8EX8bVm77K2UlgL+HheFi3M6EBapeAXM2A=;
        b=Cet86NRSfWzecA6rjkoYXiXxVRDjFeSeQkbCvLoPwTpJ9EXWpnUOkiXpyUPLUF4DP4
         ou7slsWcpfniWgnI+YTJE0p9t0E0egawCHNNJhq3TUhx3X79zhHaYMSUpImKdYfJYIM8
         e8fWvV9Z1NWZMFN1ET2YVEDAAMtSq5TGd2Aj7qhtcLXBCzEKfEL/gIRwIsM2XD2LguTQ
         n3vL5K+EbQNkhKflFs3Laxg0+n4UW51MWccd++XSHCuBc4UeV796Z+fexZAU7bO/9dOj
         /mLC1kf8uNeQTELKN895vkD0mWoLYjKzj58zrX7ZSZvWU9Wdx+nTGTH/4CqF15H4ZmjW
         42bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372412; x=1786977212;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rY7zCmLlC8EX8bVm77K2UlgL+HheFi3M6EBapeAXM2A=;
        b=ExVBMyufZwERMh7myeY7XdLfJnDWQwRpwcs/oF5udk+LCQbe9I+Oa55zXpfCOGkrb/
         e5n06UmKTKgBN4dibV2b1Pw8eVn8/KdXgx6OnFp8XwBrQjBIPb6sXt2gvvbPxrlbVy66
         6cThxkoaDXpkkbV2Z79MhTM93F1r46gVLQN/7IXkcCeSjy/FEnyrBEi61/HGErhfPJSc
         fOjyBic4gFPSTGGkQdY8O9AKhA9S8Zt8KLiFrUszgqwTp5HBEQeaphZlssBOLzo5y/Pk
         gUEwYa1voB2Kgig0qlym0jknR+qyrzKzt7fBbow36/qzocOdJwn6fix99MNG7o9JTUCA
         3ZIA==
X-Gm-Message-State: AOJu0Ywr8nXRXp+9Zr5jm6dVmchD+RPFmB/OxNuzqTTp4Nyn2QbXbiPp
	L70r0Ok0teZABEO2wXXszCGJr68GV9gruAqaf/505FiAgAjqx725VZY3
X-Gm-Gg: AR+sD10RqrD10y2Qr8foF6c8JLi93l4PsLPsIMRCV/opu1be8iv6/Z8eX5T89W7CNlh
	GcYV1KwkZq/1XA5aK3zWFD8UZ27Ia4ZEOO8aiRFtKfxuh1H7M7SzTV2jM4FlVeZlPaqGiEJ6jd0
	mKPUVOlFLuGfexHzWkrxCwcE5Fo4dYhb4PoG4hpGCNswR1iGQ99VmbInYZECedAcs74M3xY9CfL
	UeL0I22VRSQZZJH12R63Qh2wUJtW/An3DLHW0MPIuO+qPUmzFxnYzNNd3HnSMDowJ1HtMvAFoWH
	dsUekdkAQWMvsIxbBniwvlyi6fwub451sL6hiEyKZAC77xYdRpRpgP/Jv+FSEmpLbjgUVgFnYN+
	uk1O9YhCk4Ck/OHKfC4sFzT33/MECya38ivzOWk6pCUaa1mUeYDpoO3xyWwQ+g4PqJfllfG1H22
	TDRPQnw7n9gctIHt/Gtbt6nuN1I6pKz/wo087ULzCNUwZU6/XG+L4bFsw1j4s8dzen3c5IRKTVZ
	f+v3KY+mekwyg==
X-Received: by 2002:a05:6a20:e211:b0:3c8:e140:63a8 with SMTP id adf61e73a8af0-3cc1a315881mr2311626637.23.1786372411945;
        Mon, 10 Aug 2026 07:33:31 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410cc132c1sm22197001c88.8.2026.08.10.07.33.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Aug 2026 07:33:31 -0700 (PDT)
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
Subject: [PATCH v2 4/5] docs/zh_CN: doc-guide: document macOS Sphinx setup
Date: Mon, 10 Aug 2026 22:33:08 +0800
Message-ID: <20260810143311.57775-5-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260810143311.57775-1-chenmiao.ku@gmail.com>
References: <20260810143311.57775-1-chenmiao.ku@gmail.com>
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

