Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE674582D6
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 21:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671062; cv=none; b=nGwuOxJAGbQKDK1UUzVVWnrYHa/TSDagbT0is4CWDN5YRtwdjoB7ytgZAoXJ8XKxGLrcQhLFR1tNRa2R2wmWTQg9cDH6PMtVMJJ48AHI3UdUEUnH51n7bktM1MzMh7DtOyEgqviJ1YKuB+Sm22H+xOPwOFuIW+5ArbuIMOcgYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671062; c=relaxed/simple;
	bh=c87rZrraA0CKbcFctuk9GzzDWg6sfOS2ZA/rXtTvXpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+IA8cckAmJh4QX4d4JlwT2JOorYlZ56O90M6KqE4Kq0sE+XPCGHRm7GRYbCqkzQDMXD7Liq2Vsn4CNAXxeAd4u4XZhI8ONKGart4ex4iuH1s0sEhDPD9u8kT49m/EnnOBy+CT9aWbKg0wPt9+mSLu7QENxmPto+e+1lLz0pwcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcCn0787; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcCn0787"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf30af983aso8770735ad.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784671060; x=1785275860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WR0WQKNvtg6cROe49YNPNWkhmr3+pWinuDcZwn/Bjbs=;
        b=WcCn0787FJpwJe7RQQX6TtqwjSA4jY7lyjwmjSAf5djLAPaM2YStdSF99jbqq5X5SJ
         OjkRT3Sz4bXNmGrRGJtgLXg18NizbcEiqoXD6v5E0isxO8NyFBMbTggaOlCsAsd4PyBM
         zmOd9lUIs81Ihfp6sxuIobzcVt7yOCiWjlo2ttAda9sIZ3hCI+hZuMUQmkRovtyapemt
         2NXeh8xzKVe6KO31UTFnGMSFTo6AlOvAPgTFWkg7xcmpAeXlIBnyJ7dP2uOGAReiVvUz
         k/JZIMaUJrzyBXSFcRQA5lNcw/2o8bdsVdmWg7SYIxdPRf5VvcEVlIIoa1icjjAhvGLe
         TcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671060; x=1785275860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WR0WQKNvtg6cROe49YNPNWkhmr3+pWinuDcZwn/Bjbs=;
        b=Jv4R8xGNVHgmrd6Y8OclHXThOwhorDoNhc+2t+xol7F5vj2KGhoCb2EEy+qhKzeTg3
         Xh7wHo67z/4MD1LJ+1u6/yvg8Abyyaa4XxSytPYToiQlZr/UUCoLVzjI2jew+QF5KlkX
         TPNfO6Q9CRlgUEJ6OSuzzCPbBK/+fmZwQKq2cZIsHgGZNllNBVtIgsjSKpV77o25S0AN
         E1q3mWBWIQH8kOgGzNn1NatbVuooYT34LjR6hzF3F6e7pSxAeiT+toUQnYE7VppDVhJh
         SgW95CLySfWT7Fi4AAL715kmCiWTcg5vBeMuOLy4cH18EccjIl/QVbbftbVUI5US5Ipf
         0A2A==
X-Forwarded-Encrypted: i=1; AHgh+Rp2vPUN/nX96tgQdtFdVnQ944QGGu7fskc3J17h7eIPjF92sJkdbvIoOOh62u0ZVXByUoATpG+rn9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYkcrW6/QcC6ncKXWPMwfMtl6/oS77cWGNYg+DcImV7P8DgaYi
	mRsMgQPP0kbILZUVnE/ozBPQ6bVRvTZc+EbCsBEdA1T8boodl/0cQtP9
X-Gm-Gg: AR+sD11Q2pjkvf6KobzULBaNZnKJuR/Mt5VkGNn2osrGEe2o4KRUcHeCcg1QaFxaH0t
	UTVSCbRCCEAEaDSv9Y9n7KVOtUG7IoWTtN0jWsEvDjGywQKm2AqeRBT9ZlynIbKAWfgfwt165il
	ZdbzQeoWNrKNIMNXT0Hxo/DTAIrppsxI0MpcCsfgrw87JJyPC/uo2fmcW80P8Y3xhRodmWwSSh8
	lhce0kATBL6e26MOY9YPZBaFQUdEWbmVknjNuPsePCcYhH29RHtwERYJMersjoRBlzI49jwhW64
	Hh10XbE04Jfb8fDyDCuW9HRvo9xIbW2PuyhF7RzYqH9m0Xkif14R60LIoTHVjutvAdnGuQLhAaz
	S5y4Xeq9a4ojsrjOquQN3coJ6ZT2Abw1E4/Pdd1gT5cEtJtT9zlYlqSJngXSXc8Uk7QyA3YWlhP
	WhiAtOP6p71gtj3rIsLYnd8l+bZ20k7vpfTyiQr6pt6JxNl9zmGu2RPZma9yujZbNTCvL8hbdlo
	DQ9VuXrjGq1XpUPtElLQD3ZriW7iwpMl1dQPDjdX2b2AkwzEyY=
X-Received: by 2002:a17:902:da91:b0:2c9:fbde:ab68 with SMTP id d9443c01a7336-2cf90452562mr5506385ad.3.1784671060359;
        Tue, 21 Jul 2026 14:57:40 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm3697115ad.0.2026.07.21.14.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:57:39 -0700 (PDT)
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
Subject: [PATCH 16/16] docs/zh_TW: Add a glossary for Traditional Chinese translations
Date: Wed, 22 Jul 2026 05:55:42 +0800
Message-ID: <20260721215542.98435-17-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721215542.98435-1-chenyou910331@gmail.com>
References: <20260721215542.98435-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Documentation/translations/zh_TW/glossary.rst documenting the
Taiwanese Mandarin terminology used by the zh_TW translations, with
the corresponding zh_CN terms for cross reference, plus the character
conventions (為/裡/著/才/啟/只/發布). Hook it into the zh_TW index,
replacing the existing TODO entry.

This is the reference used by the terminology localization of the
zh_TW process/ documents in this series.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/translations/zh_TW/glossary.rst | 145 ++++++++++++++++++
 Documentation/translations/zh_TW/index.rst    |   5 +-
 2 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/glossary.rst

diff --git a/Documentation/translations/zh_TW/glossary.rst b/Documentation/translations/zh_TW/glossary.rst
new file mode 100644
index 000000000000..32cfbfaaef3c
--- /dev/null
+++ b/Documentation/translations/zh_TW/glossary.rst
@@ -0,0 +1,145 @@
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
+使用。
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
+build                     建置                        建置／构建
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
+account                   帳戶／帳號                  账户／账号
+tracking                  追蹤                        跟踪
+advanced                  進階                        高级
+free software             自由軟體                    自由软件／免费软件
+========================  ==========================  ====================
+
+用字慣例
+--------
+
+除術語之外，zh_TW翻譯採用臺灣標準用字，例如「為」（不用「爲」）、「裡」
+（不用「裏」）、「著」（不用「着」）、「才」（不用「纔」）、「啟」（不用
+「啓」）、「只」（不用「隻」）與「發布」（不用「發佈」）。
+
+標點符號沿用現有文件樹的全形標點。中英文之間的空白與原文的行寬（每行約
+75個半形字元寬）慣例，請參考現有翻譯。
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

