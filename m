Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047B4339875
	for <linux-doc@vger.kernel.org>; Sat, 29 Aug 2026 04:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787976970; cv=none; b=EO2lpaH5t/ti0r4SJ2Ie+yLHH6jksTMGVEPus06uUXHgO0NDRML9zHHui9PK5LRg+bPw64ry0mM+4IHJ+9N9SD9UDPkAc4cNbbYM4Ki3hSL+99AYdqNL3Lq2VIbj0+wGXT1HrVK1WY5QsLqSIi0Q/MyVryZ05anQO/v6IU0YjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787976970; c=relaxed/simple;
	bh=QW5UUzhuzhw5c+52JRaCsEpmET2Q0sNPefYvru0Pc7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PCZks/foXAHANnv7y226ChKlTqCnBY0o4Vc8Ha7E3/pjmCOQ7wxoC6qJSsKpWDd6tpN10qF0vVgb6N4+K/2QcFkcNcd2Y3msHTz0JlNr17bXJ9F3jt4k4JQGX+S5yVG1nFQ8IWUMsncDeQIx/i3rJCx2P/mIrV97kVlgSzFc30A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDIcY+5X; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDIcY+5X"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cc1d7f6f26aso737555a12.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 21:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787976963; x=1788581763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGT2M8YvEcErxicEiursvGC0O2RqQhubNLnE6l/5Ua8=;
        b=TDIcY+5XVcSN5zunxJUrrxwE4fSyjF01ktGqVYuIuuKEfbXM5klSbzd7SMCN0RwXH5
         2yXMVDniX++LM6bJA9TwiBDGuPQJ0gWXvwyY6fTpzMSYagUvjMjiiGGgVk79tIroNjyA
         9ySBKBSKN/5D6n9P6DLO6K4ZRl+OS6ybrMaGZNna6mwrFGvNSVfqSxNcpX/QerHe9J8e
         Ox7WKG9uQ+W/u4YAxVg4A5iFJ3QpAjY4Co2V0WRqOhm1kCGchkQDGtqltWXTb94/Lhhg
         d4/gsnOKz2TB/N7ihY5yO+Vrj3eiEfhphMzS8z6AOZbhsG411xU2mPmcu4fSudNfE+TY
         jUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787976963; x=1788581763;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGT2M8YvEcErxicEiursvGC0O2RqQhubNLnE6l/5Ua8=;
        b=LKoXvUxNcDQjTVDJ5e2e+OANAsluO4zcYV4lCgAUsIDnxfH7xcbKnORzZ1ZZhUJVC5
         sJSRngBcEj/x33ZGbceUnZ6dfm2DV1sBuzVPdQHDcOAujpm5KSermuYaiHV7MTZOJXs4
         mPoax9aSa5tauzVpDymABeNalbJrrZupROrf9rEwuif5xQry09hLHj995o0dLoEWyYA7
         JoXAGRoxDoDf5Kx6E7yiymeYiuNw2QqBgLb4qmGqmALBr+rCh7dCfUFQVLGob/QxHJIB
         1d9/1pJKah/jLP08Bp/y/g8BZpBAMvmOGf5kUZbxY5fMkcZ+V7hpViP8P5tN9MxbntZg
         Sd9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqecogvrq4WaSxbBTiLXhdPVGL79nUZLgACVm7V+ygvq2mgsxAbLA5mHKJNMmx5mexeOjnt2DNMFFw=@vger.kernel.org
X-Gm-Message-State: AFuF++mX6mqJpfr66pf5Aqd8rH+wNYQ7goS+cPzU6ssClLtzqNLDUgrH
	QgxhniLtLeKL0ORTbITPQzUB1+2zO1Rw9FE9v2+kEQSsNaJay5/Dhpdi
X-Gm-Gg: AR+sD12dlEvJ0lt7pxUd+e+4fA9WDnaf+m86oO9Duqd3UeeIAJjHUwDfWSIhvs0xawV
	ZitfAzilMa9HRNfX7HRXGyE65qWZ9ii9is3JgfrzFpCMEN3zDTiENpIT9eUXqFI0JtDl3HAx0AK
	pDHavc0LFa6gYjRN34vNfPKMeMYuAwmipnif76RKBE6bE0IdwrnGEhJQlVdH5e6gb0EbdflJ5NK
	HhNkIU1mYkpUnHRWe40N7+ofSWeLlNWk7YPKnPV1deNy+pzEo75h//64nu/F1vq/M4mcdl15D/E
	9zmQIqQV59jiEH2laPBu1ZPeMIH5P0MJBqXnEQ6OCw0+IXkwjCpyx+rHdwElMyWNvNfjnCCyWtI
	nEBfouvUImaQIVtrwBWxsp66bEENjQc9kbpLP18M6HXPtvQXFHnEZVYyGkLUPVWgbEzfvxtepL3
	aHUtjRq9RYoWJifGUqP//K7Lrc1KcduXsuiozSDKkEOkIvWG32WlJO/kk4bfWD62ECF1WWo2e8f
	w==
X-Received: by 2002:a05:6a00:7607:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-85772baffdfmr6218757b3a.26.1787976962683;
        Fri, 28 Aug 2026 21:16:02 -0700 (PDT)
Received: from HPPC-archlinux ([101.68.111.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f36aecb6sm1228673a12.18.2026.08.28.21.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 21:16:02 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yukai Wu <xiaoyewuz.Ruster@gmail.com>
Subject: [PATCH] docs/zh_CN: Update arch/riscv/vm-layout.rst translation
Date: Sat, 29 Aug 2026 12:15:10 +0800
Message-ID: <20260829041542.256360-1-xiaoyewuz.Ruster@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Documentation/arch/riscv/vm-layout.rst translation.

Update the translation through commit 954260ff5a46
("Revert "RISC-V: mm: Document mmap changes"")

Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
---
 .../zh_CN/arch/riscv/vm-layout.rst             | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
index 4b9f4dcf6c19..0d0ec8ea5d05 100644
--- a/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
+++ b/Documentation/translations/zh_CN/arch/riscv/vm-layout.rst
@@ -15,7 +15,7 @@ RISC-V Linux上的虚拟内存布局
 :作者: Alexandre Ghiti <alex@ghiti.fr>
 :日期: 12 February 2021
 
-这份文件描述了RISC-V Linux内核使用的虚拟内存布局。
+这份文件描述了 RISC-V Linux 内核使用的虚拟内存布局。
 
 32位 RISC-V Linux 内核
 ======================
@@ -28,9 +28,9 @@ TODO
 64位 RISC-V Linux 内核
 ======================
 
-RISC-V特权架构文档指出，64位地址 "必须使第63-48位值都等于第47位，否则将发生缺页异常。"：这将虚
-拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是RISC-V Linux
-内核所在的地方。
+RISC-V 特权架构文档指出，64 位地址“必须使第 63-48 位值都等于第 47 位，否则将发生缺页异常。”：
+这将虚拟地址空间分成两半，中间有一个非常大的洞，下半部分是用户空间所在的地方，上半部分是 RISC-V
+Linux 内核所在的地方。
 
 RISC-V Linux Kernel SV39
 ------------------------
@@ -52,11 +52,11 @@ RISC-V Linux Kernel SV39
                                                               | 内核空间的虚拟内存，在所有进程之间共享:
   ____________________________________________________________|___________________________________________________________
                     |            |                  |         |
-   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
-   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
-   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
-   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
-   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | 直接映射所有物理内存
+   ffffffc4fea00000 | -236    GB | ffffffc4feffffff |    6 MB | fixmap
+   ffffffc4ff000000 | -236    GB | ffffffc4ffffffff |   16 MB | PCI io
+   ffffffc500000000 | -236    GB | ffffffc5ffffffff |    4 GB | vmemmap
+   ffffffc600000000 | -232    GB | ffffffd5ffffffff |   64 GB | vmalloc/ioremap space
+   ffffffd600000000 | -168    GB | fffffff5ffffffff |  128 GB | 直接映射所有物理内存
    fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
   __________________|____________|__________________|_________|____________________________________________________________
                                                               |
-- 
2.55.0

