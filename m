Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E98370ACA
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 05:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082036; cv=none; b=H+Y4f7sgMhknz7ReSBtdrk4Kip2Bcr7Ts+DIljwSkYv3XlBdueNxdTYJcfXK4RHx5jzv3Gpc6ptGXPmd/YnavZ+NeeEIba/iznGgMhw4XruEmU0TZyQ78K7wht/pfWuGM6nocD3n01TPRgZ8NhnFm8MOZ9W4kpgiBmFOiUdiDHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082036; c=relaxed/simple;
	bh=mIm3/TSl3Z9x0/3/YsqyzAxzxfClCHRAuHKtOR9ZBZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ND+8ZVCLjtcQB+fIv8dZwKLECiJBtcwvdpqri9fkzeyO62u5IRFcoZ3aZ+Xcdd8pHcrKSSzkzm9vO1AkHKHn5UOnn4h+qWqac7PDD4GyLT4a98cDPY+A+1lVvlqdfNgdJ6/i2G48vt4c/20FxuuCFVfuv3cKoWPepzOjLdwnMAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Joo5bIAu; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Joo5bIAu"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84eb072307dso467006b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 22:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786082033; x=1786686833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlxqSvZX94PDxurRjidjoD747ebEBRx04QdIMxBfV4Y=;
        b=Joo5bIAuriTnYWU7WbT2/dhPxQaYO2r45A0VYhrY7QX2uioNLAbeu7Z+ssN60My33A
         2jWjyKw3Wjkf3Oo2u/u6umvE7Ll03TmgJvuHxnZhbRgj3110UCYUjCMEA4N3d4KmZddu
         Xpb7Y8toLOffJnV1+97YB3A07Rnx7Su6j2A9frBrCWAUmnOjvYe3Z12oqo0nfMmHseom
         3/MaLwLiTtw2s/RftPIsgwTU9P4enSOuE+8lFpvf6fKamIW+8+YwAuAIpmAxkIUDj2qV
         F7vyqBcI/K9CAPxpgiNzAs+P3BKVD65vLQIRkbAk7zVbFmIamjn9Tsrysm3sfa1ZdFHa
         15Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082033; x=1786686833;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlxqSvZX94PDxurRjidjoD747ebEBRx04QdIMxBfV4Y=;
        b=ccZ4RVJxJGu4KX9LsYY65z5phZY8AjP7/alAL7+g8C+OP+7WhbkNapqFm0aT3zFk1t
         XGWRHcfRjQ3ik0O6cNn8v3WwZVzmExAteA1/AptCfk+d1JhTOwHUC6I4HXmb/Ym1hdBf
         Dhoeui6bZCnO0RMJehclWGfkG+J4Q9SfqCBPeR8tnrJyMU6u1Iy/O5hHqk8C9imdVd75
         BOMqsWBVdvfGhvWpyiuBBzcp+ztPGVZ4HWIFuZY8gG/1JoIBhiFB0XAYk9+ePKFNVTM2
         D7EZ5shelEvjQJDMh6/RF+yNiuVMxfmNib2xooXpC1YQUeSrxkxXH5u3IToSIbCQoHjk
         /LAw==
X-Forwarded-Encrypted: i=1; AHgh+RqvklpGH6j992+XX32zzKRJQ2WucieZByy1YBCST716b/ne+mAjj8FeeNve8lKzHhhmNpFwZjUH/YU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAASlPqShsvBUNqIObhM5jkZ0OBeVt4USuLhjoSGcCgk+TfIcN
	hiRtm3KfmJCd1pT74BnjcDdqnOudTtqLhJeSwmTZAi4lXbaVhGfBiovo
X-Gm-Gg: AR+sD11LLfObAxY6qYW/KrWafitwQQ0u0Hlzoy6FCr/OlxBHuhpaKTOAmUy99x5xgFH
	y6thdpO/uR7mzKLtrJ8tJeNKbei2pkxRZCKxeBY8D4RnsSUnHIp7AFtty42SxZzs95m9YlqDyIR
	qjRlA4yAVDUqa8PZDm7j8gCBb+F63zRLz1SJVTTPcVWrdozEH4tFUzceoAN8m/F88PnThCcVAbU
	jKb6VK6DFTvSwzn2I2ogkZqq4hC4SP+WoiC8CB1Yrbys0l/7RyDRTaOFAbp3hCCr8UnhgNosFDW
	w8uFlz8NbRk2tvqmCwa8yopg65sB7bLcNc5L+DC+BQcjYIlqLFeiCl+ZsaXBG1IxnDF7uTwWpnA
	wjibszslUd7GDFaSKT3CaYaQOlXACQ8a2lwj9T8XwrBziOvaJfea5wFXB4/GT0jixUIYQNj2T7J
	1NoG5uLkAOVbGbPo0EM4tFfVsgEXe37Jukq1lph2VHhw3mNmsXZTsV4CXdsorEAyxcBCET6w8fL
	ATAuW6Lrzkioj5Tu8ctcU5hvkFwcE50QXWESijvPOMSXXRIi8TdxJgvK84y
X-Received: by 2002:a05:6a00:3e0e:b0:848:6f63:8d48 with SMTP id d2e1a72fcca58-84f2e0c47abmr13933277b3a.3.1786082033485;
        Thu, 06 Aug 2026 22:53:53 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3d0d96sm419518b3a.18.2026.08.06.22.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:53:52 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Weijie Yuan <wy@wyuan.org>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations
Date: Fri,  7 Aug 2026 13:53:43 +0800
Message-ID: <20260807055343.72309-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806181949.65648-1-chenyou910331@gmail.com>
References: <20260806181949.65648-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Documentation/translations/zh_TW/glossary.rst documenting the
Taiwanese Mandarin terminology used by the zh_TW translations, with the
corresponding zh_CN terms for cross reference, the character conventions
(為/裡/著/才/啟/只/發布), and the convention of not putting a space
between CJK and ASCII, which is what the existing zh_TW tree
predominantly does.  Hook it into the zh_TW index, replacing the
existing TODO entry.

The zh_CN column is a cross-reference only; every term in it was checked
against the actual usage in Documentation/translations/zh_CN/ rather
than taken from an external glossary.

This is the reference used by the terminology localization of the zh_TW
process/ documents in this series.

Acked-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/glossary.rst | 168 ++++++++++++++++++
 Documentation/translations/zh_TW/index.rst    |   5 +-
 2 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/glossary.rst

diff --git a/Documentation/translations/zh_TW/glossary.rst b/Documentation/translations/zh_TW/glossary.rst
new file mode 100644
index 000000000000..15ed1be54416
--- /dev/null
+++ b/Documentation/translations/zh_TW/glossary.rst
@@ -0,0 +1,168 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _tw_glossary:
+
+術語表
+======
+
+:作者: 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
+
+本術語表列出Linux核心繁體中文（zh_TW）翻譯所使用的術語。zh_TW翻譯以臺灣
+慣用的資訊術語為準。新增或更新翻譯時，請依照本表選擇用詞，以維持整個
+zh_TW文件樹的一致性；若遇到本表未收錄的術語，歡迎提交補丁補充。
+
+下表同時列出常見的簡體中文（zh_CN）譯法，方便從zh_CN翻譯轉換或對照時
+使用。本表的zh_CN欄位為對照參考，其用詞經核對核心文件樹zh_CN譯文中的
+實際用法，非引用外部術語表。
+
+一般術語
+--------
+
+========================  ==========================  ====================
+英文                      zh_TW                       zh_CN（對照）
+========================  ==========================  ====================
+kernel                    核心                        内核
+user / user space         使用者／使用者空間          用户／用户空间
+software / hardware       軟體／硬體                  软件／硬件
+firmware                  韌體                        固件
+operating system          作業系統                    操作系统
+distribution              發行版                      发行版
+community                 社群                        社区
+project                   專案                        项目
+documentation             文件                        文档
+file                      檔案                        文件
+folder / directory        資料夾／目錄                文件夹／目录
+default                   預設                        默认／缺省
+support                   支援                        支持
+information               資訊                        信息
+message                   訊息                        消息
+data                      資料                        数据
+quality                   品質                        质量
+performance               效能                        性能
+network                   網路                        网络
+the Internet              網際網路                    因特网
+server                    伺服器                      服务器
+digital                   數位                        数字
+computer                  電腦                        计算机
+integrate                 整合                        集成
+create                    建立                        创建
+access                    存取                        访问
+via / through             透過                        通过
+========================  ==========================  ====================
+
+程式設計術語
+------------
+
+========================  ==========================  ====================
+英文                      zh_TW                       zh_CN（對照）
+========================  ==========================  ====================
+source code               原始程式碼／原始碼          源代码
+code                      程式碼                      代码
+program                   程式                        程序
+process                   行程                        进程
+thread                    執行緒                      线程
+scheduler / schedule      排程器／排程                调度器／调度
+queue                     佇列                        队列
+memory                    記憶體                      内存
+cache                     快取                        缓存
+interface                 介面                        接口
+port                      埠                          端口
+register                  暫存器                      寄存器
+stack                     堆疊                        堆栈
+function                  函式                        函数
+function call             呼叫                        调用
+callback                  回呼                        回调
+return value              回傳值                      返回值
+macro                     巨集                        宏
+enum                      列舉                        枚举
+variable                  變數                        变量
+pointer                   指標                        指针
+array                     陣列                        数组
+linked list               鏈結串列                    链表
+loop                      迴圈                        循环
+declaration               宣告                        声明
+identifier                識別字                      标识符
+character / string        字元／字串                  字符／字符串
+byte                      位元組                      字节
+boolean                   布林                        布尔
+binary                    二進位                      二进制
+object                    物件                        对象
+type                      型別／類型                  类型
+module                    模組                        模块
+component                 元件                        组件
+build                     建置                        构建
+compile / assembler       編譯／組譯器                编译／汇编器
+debug                     除錯                        调试
+optimize                  最佳化                      优化
+implement                 實作                        实现
+global / local            全域／區域                  全局／局部
+constant                  常數                        常量
+comment (in code)         註解                        注释
+indentation               縮排                        缩进
+inline                    行內                        内联
+generate                  產生                        生成
+load / loader             載入／載入器                加载／加载器
+export / import           匯出／匯入                  导出／导入
+link / linker             連結／連結器                链接／链接器
+repository                儲存庫                      存储库／仓库
+distributed               分散式                      分布式
+header file               標頭檔                      头文件
+configuration file        設定檔                      配置文件
+file system               檔案系統                    文件系统
+settings / configuration  設定                        设置／配置
+========================  ==========================  ====================
+
+介面與其他術語
+--------------
+
+========================  ==========================  ====================
+英文                      zh_TW                       zh_CN（對照）
+========================  ==========================  ====================
+menu                      選單                        菜单
+window                    視窗                        窗口
+toolbar                   工具列                      工具栏
+field                     欄位                        字段
+icon                      圖示                        图标
+mouse / cursor            滑鼠／游標                  鼠标／光标
+paste                     貼上                        粘贴
+print / printer           列印／印表機                打印／打印机
+disk (hard disk)          磁碟（硬碟）                磁盘（硬盘）
+text / plain text         文字／純文字                文本／纯文本
+mailbox                   信箱                        邮箱
+account                   帳戶／帳號                  帐户
+tracking                  追蹤                        跟踪
+advanced                  進階                        高级
+free software             自由軟體                    自由软件／免费软件
+========================  ==========================  ====================
+
+特定用語說明
+------------
+
+- **access 與 visit**：access（資料、記憶體、資源的存取）譯為「存取」；
+  visit（造訪網站、頁面或連結）譯為「造訪」。兩者在 zh_CN 皆作「訪問」，
+  zh_TW 依語意區分。
+
+- **Fellow**：現有翻譯將 Linux Foundation Fellow 譯為「院士」。「院士」在
+  臺灣多指中央研究院等學術機構的頭銜，「研究員」也不完全對等，實務上亦常
+  直接保留英文。此譯法尚在討論中，暫維持現有譯法，待社群取得共識後再統一。
+
+- **mailing list**：譯為「郵件列表」（zh_CN 亦作「邮件列表」）。
+
+- **-stable 與穩定版**：核心的 ``-stable`` 樹保留英文原名 ``-stable``；泛指
+  時譯為「穩定版核心」。既有翻譯中「穩定版」與 ``-stable`` 混用者不強制
+  統一，新增或更新的翻譯請套用此慣例。
+
+用字慣例
+--------
+
+除術語之外，zh_TW翻譯採用臺灣標準用字，例如「為」（不用「爲」）、「裡」
+（不用「裏」）、「著」（不用「着」）、「才」（不用「纔」）、「啟」（不用
+「啓」）、「只」（不用「隻」）與「發布」（不用「發佈」）。
+
+標點符號沿用現有文件樹的全形標點。每行寬度沿用原文慣例（每行約75個半形
+字元寬）。
+
+中文與英文、數字相鄰時不加空格，例如「Linux核心」而非「Linux 核心」；此為
+現有zh_TW文件樹的主要慣例。本規則適用於新增的翻譯與改寫過的段落，既有檔案
+不另行回頭修改。行內標記（``literal``、:ref: 等）前後仍依reStructuredText
+的需要保留必要的空白。
diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 660a74d2023c..95809012a9ef 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -119,9 +119,10 @@ TODOList:
 術語表
 ------
 
-TODOList:
+.. toctree::
+   :maxdepth: 1
 
-* glossary
+   glossary
 
 
 索引和表格
-- 
2.43.0

