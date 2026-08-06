Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183948C8DC
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040455; cv=none; b=cEWbdJZIWJL4RLXZ62vDKh2TEhMU9zI2VSI0pXQ0PtO8j4lEeK51X0m/qpQhVqYecvWDtlWRSbmyRzfw3ci4QlZlyDDRBlfrde7gydxLDf2T8meCJjKQqQ0UGLcm/CEUhLJMQgHnzynsH+OivRppynjD0aTT7IK9znYAv0WVz5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040455; c=relaxed/simple;
	bh=e7olFmno33eLymf5djyYFnYgKBalGIzBA7a0d5xJMs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVeFsGS2R7S6Sq/i1aRNUcyAW3Q18fNQ55JJ/QlZh7TlR4GsyB2jiGTU6LrT1hsRyQMqEYC//p5/c9N1FwIpoAx9cPbvPik8I434CRSTj8zRg7C1dIz1R9uXugPxK5ZIur+4Pz+6q/+/jfc7HVl0MRyTvOKcqO8AQdMGpbT4EpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQ2jweNy; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQ2jweNy"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so347027a91.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786040443; x=1786645243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nmFRJYO4gknAUemJ9caMojQXAtQk2hsmlbx1BL5xFIk=;
        b=BQ2jweNyFs2bFqRaxChAtcMUepoC9b+smTXsyk7B2Kvr0rfW3c6fdZQFZBIYK5QVtD
         C8PT5Z0qZJD7/Elyp3/Kt0OoWVNbCUG8kpOLiNaPfIJCVH+/AHsIybIO4njmVWoj7x1d
         yXemf3OilB7b+dE3w25GxjMsTXGqrn5An9Rb87SjTTf5UXVaJ67SEoBMgaPTH/7mBp0m
         DXq7RIcTD8GGerAmmEye3C8F738rxVsSxCA87z6Bo+CwPfIsNsgfGp7f8BFxsp/TascO
         PwCtDxqAKDfN6NbLM7FLRKT6TgejM/Pnx1M0xtmT49o95kDxb3IfpZbAbxo2qYrFA9FI
         2gXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040443; x=1786645243;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmFRJYO4gknAUemJ9caMojQXAtQk2hsmlbx1BL5xFIk=;
        b=JRpiZDqsHkMY0CgMCYfrnjnGOzS+lGBnWugtc+jPL1F36DhacQjwzFsmisIMJhEKSj
         ADf6IJr6HVgGhiun6TwW/bUKr2ysfYHjr2qBqjlS60F8mkOemyElMiNO4HBGi1d0Bpv+
         gNuMgzBjh+hHxbaeEWVY1XDMkwtjHbBsXYPnUDgsYrgEzQSG4RN36irzkPRmCcUQKSJ3
         EDqyyT4o1IQzxy9h6WuWN41yEocUXTcsqUaNDeB6rwuBDQbM/aF8V3UMTwTTsuM/UBIE
         qD5UnapH7hEnTNorTM+fxZ5EIRbme+Xp2ArzoHE320igt4Gkk4PKcraNNqKdFCuC89U/
         NodA==
X-Forwarded-Encrypted: i=1; AHgh+RpvWaWS4jeBvW1EP/K/GSTJ/xA5C6ISF94olPOxABJhSo3joIqXSztFXmLgy+Js1vl/hSXwPSjhFos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2f5pe/u86TGF8cpseFqrDuo5U1ZQZv7z3k97mIfKONXMUzecZ
	buWk0X1A8Fu1ukYMNaqAVVpIlAOVOnlEpO9LUDLce5ckx/T7Ghnkatt2
X-Gm-Gg: AR+sD11UJavL5lqGUp5Lo5BoT9V4z+AmlFAtWvjwxYCsqInV+BPlKXoIuRzgjCTcarJ
	N+lLDHwaosnhIKiYZ7SpcewdDW1OXoqxLG797Gl0aIWndfKqD8pKzdzAMnrdn2CNkQuwgmGJxyQ
	QZv+itfZkAKxAJXPqoIqArGRT5IUgZ4ZFO7dfyAAMayKUWCCYnKlHTXVrAZykBFbW5IPpMOZbDt
	srIomtNeq9q6KLhGYPNPxnGHnvQIaY5hM8t6rGfAvLWjBniByhyabECXdqrybmoNIA5JLZps5Xv
	1baY+IeNFlHK3L+hi80AwM2qWrIlVB0Ye2oLJAzlsPplvXR0EOn+5Zx7/LiNiCaw1Sx6ovaFwoN
	MD28W1RlDqAqYRba6f3IQ4vHUs6+M0vLhqTGhsigRVsxLg/+tk5H0SHK6CXP3+j7UL0EZsA2wVD
	ydUThRP+Mggbd+1wmWKpveJasVJTD6cwTwDQQS1P1baHGjxkUItuGS/iQoSdrBjuohWMbqUz2nU
	h+Acl2/TOYFUpm99SPyVFkPe4BjUp8pLT6yCTZdJG+RbtnICKsJu7oVNBmzFrRfz5Cl2NPfRNZd
	JIvdP4KIowGl6swSCQqbeOfP8VzNDSGJoA==
X-Received: by 2002:a17:90b:4410:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-3903c5bff9dmr11565866a91.1.1786040442391;
        Thu, 06 Aug 2026 11:20:42 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085f2b2easm2003356a91.11.2026.08.06.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 11:20:41 -0700 (PDT)
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
Subject: [PATCH v3 11/16] docs/zh_TW: process: localize terminology in howto.rst
Date: Fri,  7 Aug 2026 02:19:44 +0800
Message-ID: <20260806181949.65648-12-chenyou910331@gmail.com>
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

Localize mainland terms to Taiwanese Mandarin (內核→核心, 軟件→軟體,
社區→社群, ...) and sync with the English original: update the
man-pages maintainer address, the linux-next git URL (also dropping a
stray full-width question mark), and the mailing list links now
pointing at subspace.kernel.org and lore.kernel.org.

update to commit 413e775efaec ("Documentation: fix links to mailing list
services")

Reviewed-by: Weijie Yuan <wy@wyuan.org>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/howto.rst      | 344 +++++++++---------
 1 file changed, 173 insertions(+), 171 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 80c416483e73..8466f6af96cc 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -17,13 +17,14 @@
                    陳琦  Maggie Chen <chenqi@beyondsoft.com>
                    王聰  Wang Cong <xiyou.wangcong@gmail.com>
                    胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+                   葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
-如何參與Linux內核開發
+如何參與Linux核心開發
 =====================
 
-這是一篇將如何參與Linux內核開發的相關問題一網打盡的終極祕笈。它將指導你
-成爲一名Linux內核開發者，並且學會如何同Linux內核開發社區合作。它儘可能不
-包括任何關於內核編程的技術細節，但會給你指引一條獲得這些知識的正確途徑。
+這是一篇將如何參與Linux核心開發的相關問題一網打盡的終極祕笈。它將指導你
+成為一名Linux核心開發者，並且學會如何同Linux核心開發社群合作。它儘可能不
+包括任何關於核心程式設計的技術細節，但會給你指引一條獲得這些知識的正確途徑。
 
 如果這篇文章中的任何內容不再適用，請給文末列出的文件維護者發送補丁。
 
@@ -31,15 +32,15 @@
 入門
 ----
 
-你想了解如何成爲一名Linux內核開發者？或者老闆吩咐你「給這個設備寫個Linux
-驅動程序」？這篇文章的目的就是教會你達成這些目標的全部訣竅，它將描述你需
-要經過的流程以及給出如何同內核社區合作的一些提示。它還將試圖解釋內核社區
-爲何這樣運作。
+你想了解如何成為一名Linux核心開發者？或者老闆吩咐你「給這個設備寫個Linux
+驅動程式」？這篇文章的目的就是教會你達成這些目標的全部訣竅，它將描述你需
+要經過的流程以及給出如何同核心社群合作的一些提示。它還將試圖解釋核心社群
+為何這樣運作。
 
-Linux內核大部分是由C語言寫成的，一些體系結構相關的代碼用到了彙編語言。要
-參與內核開發，你必須精通C語言。除非你想爲某個架構開發底層代碼，否則你並
-不需要了解（任何體系結構的）彙編語言。下面列舉的書籍雖然不能替代紮實的C
-語言教育和多年的開發經驗，但如果需要的話，做爲參考還是不錯的：
+Linux核心大部分是由C語言寫成的，一些體系結構相關的程式碼用到了組譯語言。要
+參與核心開發，你必須精通C語言。除非你想為某個架構開發底層程式碼，否則你並
+不需要了解（任何體系結構的）組譯語言。下面列舉的書籍雖然不能替代紮實的C
+語言教育和多年的開發經驗，但如果需要的話，做為參考還是不錯的：
 
  - "The C Programming Language" by Kernighan and Ritchie [Prentice Hall]
    《C程序設計語言（第2版·新版）》（徐寶文 李志 譯）[機械工業出版社]
@@ -48,67 +49,67 @@ Linux內核大部分是由C語言寫成的，一些體系結構相關的代碼
  - "C:  A Reference Manual" by Harbison and Steele [Prentice Hall]
    《C語言參考手冊（原書第5版）》（邱仲潘 等譯）[機械工業出版社]
 
-Linux內核使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
-標準中沒有定義的擴展。內核是自給自足的C環境，不依賴於標準C庫的支持，所以
-並不支持C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
-使用。有時候確實很難弄清楚內核對工具鏈的要求和它所使用的擴展，不幸的是目
-前還沒有明確的參考資料可以解釋它們。請查閱gcc信息頁（使用「info gcc」命令
-顯示）獲得一些這方面信息。
+Linux核心使用GNU C和GNU工具鏈開發。雖然它遵循ISO C11標準，但也用到了一些
+標準中沒有定義的擴展。核心是自給自足的C環境，不依賴於標準C庫的支援，所以
+並不支援C標準中的部分定義。比如long long類型的大數除法和浮點運算就不允許
+使用。有時候確實很難弄清楚核心對工具鏈的要求和它所使用的擴展，不幸的是目
+前還沒有明確的參考資料可以解釋它們。請查閱gcc資訊頁（使用「info gcc」命令
+顯示）獲得一些這方面資訊。
 
-請記住你是在學習怎麼和已經存在的開發社區打交道。它由一羣形形色色的人組成，
-他們對代碼、風格和過程有著很高的標準。這些標準是在長期實踐中總結出來的，
+請記住你是在學習怎麼和已經存在的開發社群打交道。它由一羣形形色色的人組成，
+他們對程式碼、風格和過程有著很高的標準。這些標準是在長期實踐中總結出來的，
 適應於地理上分散的大型開發團隊。它們已經被很好得整理成檔，建議你在開發
-之前儘可能多的學習這些標準，而不要期望別人來適應你或者你公司的行爲方式。
+之前儘可能多的學習這些標準，而不要期望別人來適應你或者你公司的行為方式。
 
 
 法律問題
 --------
 
-Linux內核原始碼都是在GPL（通用公共許可證）的保護下發布的。要了解這種許可
-的細節請查看原始碼主目錄下的COPYING文件。Linux內核許可準則和如何使用
+Linux核心原始碼都是在GPL（通用公共許可證）的保護下發布的。要了解這種許可
+的細節請查看原始碼主目錄下的COPYING檔案。Linux核心許可準則和如何使用
 `SPDX <https://spdx.org/>` 標誌符說明在這個文件中
 :ref:`Documentation/translations/zh_TW/process/license-rules.rst <tw_kernel_licensing>`
-如果你對它還有更深入問題請聯繫律師，而不要在Linux內核郵件組上提問。因爲
+如果你對它還有更深入問題請聯繫律師，而不要在Linux核心郵件組上提問。因為
 郵件組裡的人並不是律師，不要期望他們的話有法律效力。
 
-對於GPL的常見問題和解答，請訪問以下連結：
+對於GPL的常見問題和解答，請造訪以下連結：
 	https://www.gnu.org/licenses/gpl-faq.html
 
 
-文檔
+文件
 ----
 
-Linux內核代碼中包含有大量的文檔。這些文檔對於學習如何與內核社區互動有著
-不可估量的價值。當一個新的功能被加入內核，最好把解釋如何使用這個功能的文
-檔也放進內核。當內核的改動導致面向用戶空間的接口發生變化時，最好將相關信
-息或手冊頁(manpages)的補丁發到mtk.manpages@gmail.com，以向手冊頁(manpages)
+Linux核心程式碼中包含有大量的文件。這些文件對於學習如何與核心社群互動有著
+不可估量的價值。當一個新的功能被加入核心，最好把解釋如何使用這個功能的文
+檔也放進核心。當核心的改動導致面向使用者空間的介面發生變化時，最好將相關信
+息或手冊頁(manpages)的補丁發到alx@kernel.org，以向手冊頁(manpages)
 的維護者解釋這些變化。
 
-以下是內核代碼中需要閱讀的文檔：
+以下是核心程式碼中需要閱讀的文件：
   :ref:`Documentation/admin-guide/README.rst <readme>`
-    文件簡要介紹了Linux內核的背景，並且描述了如何配置和編譯內核。內核的
-    新用戶應該從這裡開始。
+    文件簡要介紹了Linux核心的背景，並且描述了如何設定和編譯核心。核心的
+    新使用者應該從這裡開始。
 
 
   :ref:`Documentation/process/changes.rst <changes>`
-    文件給出了用來編譯和使用內核所需要的最小軟體包列表。
+    文件給出了用來編譯和使用核心所需要的最小軟體套件列表。
 
   :ref:`Documentation/translations/zh_TW/process/coding-style.rst <tw_codingstyle>`
-    描述Linux內核的代碼風格和理由。所有新代碼需要遵守這篇文檔中定義的規
+    描述Linux核心的程式碼風格和理由。所有新程式碼需要遵守這篇文件中定義的規
     范。大多數維護者只會接收符合規定的補丁，很多人也只會幫忙檢查符合風格
-    的代碼。
+    的程式碼。
 
   :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
 
-    這兩份文檔明確描述如何創建和發送補丁，其中包括（但不僅限於)：
+    這兩份文件明確描述如何建立和發送補丁，其中包括（但不僅限於)：
        - 郵件內容
        - 郵件格式
        - 選擇收件人
 
-    遵守這些規定並不能保證提交成功（因爲所有補丁需要通過嚴格的內容和風格
+    遵守這些規定並不能保證提交成功（因為所有補丁需要透過嚴格的內容和風格
     審查），但是忽視他們幾乎就意味著失敗。
 
-    其他關於如何正確地生成補丁的優秀文檔包括：
+    其他關於如何正確地產生補丁的優秀文件包括：
     "The Perfect Patch"
 
         https://www.ozlabs.org/~akpm/stuff/tpp.txt
@@ -118,78 +119,78 @@ Linux內核代碼中包含有大量的文檔。這些文檔對於學習如何與
         https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html
 
   :ref:`Documentation/translations/zh_TW/process/stable-api-nonsense.rst <tw_stable_api_nonsense>`
-    論證內核爲什麼特意不包括穩定的內核內部API，也就是說不包括像這樣的特
+    論證核心為什麼特意不包括穩定的核心內部API，也就是說不包括像這樣的特
     性：
 
-       - 子系統中間層（爲了兼容性？）
-       - 在不同作業系統間易於移植的驅動程序
-       - 減緩（甚至阻止）內核代碼的快速變化
+       - 子系統中間層（為了相容性？）
+       - 在不同作業系統間易於移植的驅動程式
+       - 減緩（甚至阻止）核心程式碼的快速變化
 
-    這篇文檔對於理解Linux的開發哲學至關重要。對於將開發平台從其他操作系
+    這篇文件對於理解Linux的開發哲學至關重要。對於將開發平台從其他操作系
     統轉移到Linux的人來說也很重要。
 
   :ref:`Documentation/process/security-bugs.rst <securitybugs>`
-    如果你認爲自己發現了Linux內核的安全性問題，請根據這篇文檔中的步驟來
-    提醒其他內核開發者並幫助解決這個問題。
+    如果你認為自己發現了Linux核心的安全性問題，請根據這篇文件中的步驟來
+    提醒其他核心開發者並幫助解決這個問題。
 
   :ref:`Documentation/translations/zh_TW/process/management-style.rst <tw_managementstyle>`
 
-    描述內核維護者的工作方法及其共有特點。這對於剛剛接觸內核開發（或者對
-    它感到好奇）的人來說很重要，因爲它解釋了很多對於內核維護者獨特行爲的
+    描述核心維護者的工作方法及其共有特點。這對於剛剛接觸核心開發（或者對
+    它感到好奇）的人來說很重要，因為它解釋了很多對於核心維護者獨特行為的
     普遍誤解與迷惑。
 
   :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
-    解釋了穩定版內核發布的規則，以及如何將改動放入這些版本的步驟。
+    解釋了穩定版核心發布的規則，以及如何將改動放入這些版本的步驟。
 
   :ref:`Documentation/process/kernel-docs.rst <kernel_docs>`
-    有助於內核開發的外部文檔列表。如果你在內核自帶的文檔中沒有找到你想找
-    的內容，可以查看這些文檔。
+    有助於核心開發的外部文件列表。如果你在核心自帶的文件中沒有找到你想找
+    的內容，可以查看這些文件。
 
   :ref:`Documentation/process/applying-patches.rst <applying_patches>`
-    關於補丁是什麼以及如何將它打在不同內核開發分支上的好介紹
+    關於補丁是什麼以及如何將它打在不同核心開發分支上的好介紹
 
-內核還擁有大量從代碼自動生成或者從 ReStructuredText(ReST) 標記生成的文檔，
-比如這個文檔，它包含內核內部API的全面介紹以及如何妥善處理加鎖的規則。所有
-這些文檔都可以通過運行以下命令從內核代碼中生成爲PDF或HTML文檔::
+核心還擁有大量從程式碼自動產生或者從 ReStructuredText(ReST) 標記產生的文件，
+比如這個文件，它包含核心內部API的全面介紹以及如何妥善處理加鎖的規則。所有
+這些文件都可以透過執行以下命令從核心程式碼中產生為PDF或HTML文件::
 
     make pdfdocs
     make htmldocs
 
-ReST格式的文檔會生成在 Documentation/output. 目錄中。
-它們也可以用下列命令生成 LaTeX 和 ePub 格式文檔::
+ReST格式的文件會產生在 Documentation/output. 目錄中。
+它們也可以用下列命令產生 LaTeX 和 ePub 格式文件::
 
     make latexdocs
     make epubdocs
 
-如何成爲內核開發者
+如何成為核心開發者
 ------------------
-如果你對Linux內核開發一無所知，你應該訪問「Linux內核新手」計劃：
+如果你對Linux核心開發一無所知，你應該造訪「Linux核心新手」計劃：
 
 	https://kernelnewbies.org
 
-它擁有一個可以問各種最基本的內核開發問題的郵件列表（在提問之前一定要記得
+它擁有一個可以問各種最基本的核心開發問題的郵件列表（在提問之前一定要記得
 查找已往的郵件，確認是否有人已經回答過相同的問題）。它還擁有一個可以獲得
-實時反饋的IRC聊天頻道，以及大量對於學習Linux內核開發相當有幫助的文檔。
+實時反饋的IRC聊天頻道，以及大量對於學習Linux核心開發相當有幫助的文件。
 
-網站簡要介紹了原始碼組織結構、子系統劃分以及目前正在進行的項目（包括內核
-中的和單獨維護的）。它還提供了一些基本的幫助信息，比如如何編譯內核和打補
-丁。
+網站簡要介紹了原始碼組織結構、子系統劃分以及目前正在進行的專案（包括核心
+中的和單獨維護的）。它還提供了一些基本的幫助資訊，比如如何編譯核心和打補丁
+。
 
-如果你想加入內核開發社區並協助完成一些任務，卻找不到從哪裡開始，可以訪問
-「Linux內核房管員」計劃：
+如果你想加入核心開發社群並協助完成一些任務，卻找不到從哪裡開始，可以造訪
+「Linux核心房管員」計劃：
 
 	https://kernelnewbies.org/KernelJanitors
 
-這是極佳的起點。它提供一個相對簡單的任務列表，列出內核代碼中需要被重新
-整理或者改正的地方。通過和負責這個計劃的開發者們一同工作，你會學到將補丁
-集成進內核的基本原理。如果還沒有決定下一步要做什麼的話，你還可能會得到方
+這是極佳的起點。它提供一個相對簡單的任務列表，列出核心程式碼中需要被重新
+整理或者改正的地方。透過和負責這個計劃的開發者們一同工作，你會學到將補丁
+整合進核心的基本原理。如果還沒有決定下一步要做什麼的話，你還可能會得到方
 向性的指點。
 
-在真正動手修改內核代碼之前，理解要修改的代碼如何運作是必需的。要達到這個
-目的，沒什麼辦法比直接讀代碼更有效了（大多數花招都會有相應的注釋），而且
-一些特製的工具還可以提供幫助。例如，「Linux代碼交叉引用」項目就是一個值得
+在真正動手修改核心程式碼之前，理解要修改的程式碼如何運作是必需的。要達到這個
+目的，沒什麼辦法比直接讀程式碼更有效了（大多數花招都會有相應的註解），而且
+一些特製的工具還可以提供幫助。例如，「Linux程式碼交叉引用」專案就是一個值得
 特別推薦的幫助工具，它將原始碼顯示在有編目和索引的網頁上。其中一個更新及
-時的內核源碼庫，可以通過以下地址訪問：
+時的核心源碼庫，可以透過以下地址造訪：
 
         https://elixir.bootlin.com/
 
@@ -197,158 +198,159 @@ ReST格式的文檔會生成在 Documentation/output. 目錄中。
 開發流程
 --------
 
-目前Linux內核開發流程包括幾個「主內核分支」和很多子系統相關的內核分支。這
+目前Linux核心開發流程包括幾個「主核心分支」和很多子系統相關的核心分支。這
 些分支包括：
 
-  - Linus 的內核源碼樹
-  - 多個主要版本的穩定版內核樹
-  - 子系統相關的內核樹
-  - linux-next 集成測試樹
+  - Linus 的核心源碼樹
+  - 多個主要版本的穩定版核心樹
+  - 子系統相關的核心樹
+  - linux-next 整合測試樹
 
 
 主線樹
 ------
-主線樹是由Linus Torvalds 維護的。你可以在https://kernel.org 網站或者代碼
+主線樹是由Linus Torvalds 維護的。你可以在https://kernel.org 網站或者程式碼
 庫中下找到它。它的開發遵循以下步驟：
 
-  - 每當一個新版本的內核被發布，爲期兩周的集成窗口將被打開。在這段時間裡
-    維護者可以向Linus提交大段的修改，通常這些修改已經被放到-mm內核中幾個
-    星期了。提交大量修改的首選方式是使用git工具（內核的代碼版本管理工具
-    ，更多的信息可以在 https://git-scm.com/ 獲取），不過使用普通補丁也是
+  - 每當一個新版本的核心被發布，為期兩周的整合視窗將被開啟。在這段時間裡
+    維護者可以向Linus提交大段的修改，通常這些修改已經被放到-mm核心中幾個
+    星期了。提交大量修改的首選方式是使用git工具（核心的程式碼版本管理工具
+    ，更多的資訊可以在 https://git-scm.com/ 獲取），不過使用普通補丁也是
     可以的。
-  - 兩個星期以後-rc1版本內核發布。之後只有不包含可能影響整個內核穩定性的
-    新功能的補丁才可能被接受。請注意一個全新的驅動程序（或者文件系統）有
-    可能在-rc1後被接受是因爲這樣的修改完全獨立，不會影響其他的代碼，所以
-    沒有造成內核退步的風險。在-rc1以後也可以用git向Linus提交補丁，不過所
+  - 兩個星期以後-rc1版本核心發布。之後只有不包含可能影響整個核心穩定性的
+    新功能的補丁才可能被接受。請注意一個全新的驅動程式（或者檔案系統）有
+    可能在-rc1後被接受是因為這樣的修改完全獨立，不會影響其他的程式碼，所以
+    沒有造成核心退步的風險。在-rc1以後也可以用git向Linus提交補丁，不過所
     有的補丁需要同時被發送到相應的公衆郵件列表以徵詢意見。
-  - 當Linus認爲當前的git源碼樹已經達到一個合理健全的狀態足以發布供人測試
+  - 當Linus認為當前的git源碼樹已經達到一個合理健全的狀態足以發布供人測試
     時，一個新的-rc版本就會被發布。計劃是每周都發布新的-rc版本。
-  - 這個過程一直持續下去直到內核被認爲達到足夠穩定的狀態，持續時間大概是
+  - 這個過程一直持續下去直到核心被認為達到足夠穩定的狀態，持續時間大概是
     6個星期。
 
-關於內核發布，值得一提的是Andrew Morton在linux-kernel郵件列表中如是說：
-	「沒有人知道新內核何時會被發布，因爲發布是根據已知bug的情況來決定
+關於核心發布，值得一提的是Andrew Morton在linux-kernel郵件列表中如是說：
+	「沒有人知道新核心何時會被發布，因為發布是根據已知bug的情況來決定
 	的，而不是根據一個事先制定好的時間表。」
 
 子系統特定樹
 ------------
 
-各種內核子系統的維護者——以及許多內核子系統開發人員——在原始碼庫中公開了他們
-當前的開發狀態。這樣，其他人就可以看到內核的不同區域發生了什麼。在開發速度
-很快的領域，可能會要求開發人員將提交的內容建立在這樣的子系統內核樹上，這樣
+各種核心子系統的維護者——以及許多核心子系統開發人員——在原始碼庫中公開了他們
+當前的開發狀態。這樣，其他人就可以看到核心的不同區域發生了什麼。在開發速度
+很快的領域，可能會要求開發人員將提交的內容建立在這樣的子系統核心樹上，這樣
 就避免了提交與其他已經進行的工作之間的衝突。
 
-這些存儲庫中的大多數都是Git樹，但是也有其他的scm在使用，或者補丁隊列被發布
-爲Quilt系列。這些子系統存儲庫的地址列在MAINTAINERS文件中。其中許多可以在
+這些儲存庫中的大多數都是Git樹，但是也有其他的scm在使用，或者補丁佇列被發布
+為Quilt系列。這些子系統儲存庫的地址列在MAINTAINERS檔案中。其中許多可以在
 https://git.kernel.org/上瀏覽。
 
 在將一個建議的補丁提交到這樣的子系統樹之前，需要對它進行審查，審查主要發生
-在郵件列表上（請參見下面相應的部分）。對於幾個內核子系統，這個審查過程是通
-過工具補丁跟蹤的。Patchwork提供了一個Web界面，顯示補丁發布、對補丁的任何評
-論或修訂，維護人員可以將補丁標記爲正在審查、接受或拒絕。大多數補丁網站都列
+在郵件列表上（請參見下面相應的部分）。對於幾個核心子系統，這個審查過程是通
+過工具補丁追蹤的。Patchwork提供了一個Web介面，顯示補丁發布、對補丁的任何評
+論或修訂，維護人員可以將補丁標記為正在審查、接受或拒絕。大多數補丁網站都列
 在 https://patchwork.kernel.org/
 
-Linux-next 集成測試樹
+Linux-next 整合測試樹
 ---------------------
 
-在將子系統樹的更新合併到主線樹之前，需要對它們進行集成測試。爲此，存在一個
-特殊的測試存儲庫，其中幾乎每天都會提取所有子系統樹：
+在將子系統樹的更新合併到主線樹之前，需要對它們進行整合測試。為此，存在一個
+特殊的測試儲存庫，其中幾乎每天都會提取所有子系統樹：
 
-        https://git.kernel.org/？p=linux/kernel/git/next/linux-next.git
+        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 
-通過這種方式，Linux-next 對下一個合併階段將進入主線內核的內容給出了一個概要
-展望。非常歡冒險的測試者運行測試Linux-next。
+透過這種方式，Linux-next 對下一個合併階段將進入主線核心的內容給出了一個概要
+展望。非常歡迎冒險的測試者對linux-next進行執行時測試。
 
-多個主要版本的穩定版內核樹
+多個主要版本的穩定版核心樹
 -----------------------------------
-由3個數字組成的內核版本號說明此內核是-stable版本。它們包含內核的相對較小且
-至關重要的修補，這些修補針對安全性問題或者嚴重的內核退步。
+由3個數字組成的核心版本號說明此核心是-stable版本。它們包含核心的相對較小且
+至關重要的修補，這些修補針對安全性問題或者嚴重的核心退步。
 
-這種版本的內核適用於那些期望獲得最新的穩定版內核並且不想參與測試開發版或
-者實驗版的用戶。
+這種版本的核心適用於那些期望獲得最新的穩定版核心並且不想參與測試開發版或
+者實驗版的使用者。
 
-穩定版內核樹版本由「穩定版」小組（郵件地址<stable@vger.kernel.org>）維護，一般
+穩定版核心樹版本由「穩定版」小組（郵件地址<stable@vger.kernel.org>）維護，一般
 隔周發布新版本。
 
-內核源碼中的 :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
-文件具體描述了可被穩定版內核接受的修改類型以及發布的流程。
+核心源碼中的
+:ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
+文件具體描述了可被穩定版核心接受的修改類型以及發布的流程。
 
 
 報告bug
 -------
 
-bugzilla.kernel.org是Linux內核開發者們用來跟蹤內核Bug的網站。我們鼓勵用
-戶在這個工具中報告找到的所有bug。如何使用內核bugzilla的細節請訪問：
+bugzilla.kernel.org是Linux核心開發者們用來追蹤核心Bug的網站。我們鼓勵用
+戶在這個工具中報告找到的所有bug。如何使用核心bugzilla的細節請造訪：
 
 	http://test.kernel.org/bugzilla/faq.html
 
-內核源碼主目錄中的:ref:`admin-guide/reporting-bugs.rst <reportingbugs>`
-文件里有一個很好的模板。它指導用戶如何報告可能的內核bug以及需要提供哪些信息
-來幫助內核開發者們找到問題的根源。
+核心源碼主目錄中的:ref:`admin-guide/reporting-bugs.rst <reportingbugs>`
+文件裡有一個很好的模板。它指導使用者如何報告可能的核心bug以及需要提供哪些資訊
+來幫助核心開發者們找到問題的根源。
 
 
 利用bug報告
 -----------
 
-練習內核開發技能的最好辦法就是修改其他人報告的bug。你不光可以幫助內核變
+練習核心開發技能的最好辦法就是修改其他人報告的bug。你不光可以幫助核心變
 得更加穩定，還可以學會如何解決實際問題從而提高自己的技能，並且讓其他開發
-者感受到你的存在。修改bug是贏得其他開發者讚譽的最好辦法，因爲並不是很多
+者感受到你的存在。修改bug是贏得其他開發者讚譽的最好辦法，因為並不是很多
 人都喜歡浪費時間去修改別人報告的bug。
 
-要嘗試修改已知的bug，請訪問 http://bugzilla.kernel.org 網址。
+要嘗試修改已知的bug，請造訪 http://bugzilla.kernel.org 網址。
 
 
 郵件列表
 --------
 
-正如上面的文檔所描述，大多數的骨幹內核開發者都加入了Linux Kernel郵件列
+正如上面的文件所描述，大多數的骨幹核心開發者都加入了Linux Kernel郵件列
 表。如何訂閱和退訂列表的細節可以在這裡找到：
 
-	http://vger.kernel.org/vger-lists.html#linux-kernel
+	https://subspace.kernel.org/subscribing.html
 
 網上很多地方都有這個郵件列表的存檔(archive)。可以使用搜尋引擎來找到這些
 存檔。比如：
 
-	https://lore.kernel.org/lkml/
+	https://lore.kernel.org/linux-kernel/
 
 在發信之前，我們強烈建議你先在存檔中搜索你想要討論的問題。很多已經被詳細
 討論過的問題只在郵件列表的存檔中可以找到。
 
-大多數內核子系統也有自己獨立的郵件列表來協調各自的開發工作。從
-MAINTAINERS文件中可以找到不同話題對應的郵件列表。
+大多數核心子系統也有自己獨立的郵件列表來協調各自的開發工作。從
+MAINTAINERS檔案中可以找到不同話題對應的郵件列表。
 
-很多郵件列表架設在kernel.org伺服器上。這些列表的信息可以在這裡找到：
+很多郵件列表架設在kernel.org伺服器上。這些列表的資訊可以在這裡找到：
 
-	http://vger.kernel.org/vger-lists.html
+	https://subspace.kernel.org
 
-在使用這些郵件列表時，請記住保持良好的行爲習慣。下面的連結提供了與這些列
+在使用這些郵件列表時，請記住保持良好的行為習慣。下面的連結提供了與這些列
 表（或任何其它郵件列表）交流的一些簡單規則，雖然內容有點濫竽充數。
 
-	http://www.albion.com/netiquette/
+	https://subspace.kernel.org/etiquette.html
 
 當有很多人回覆你的郵件時，郵件的抄送列表會變得很長。請不要將任何人從抄送
 列表中刪除，除非你有足夠的理由這麼做。也不要只回復到郵件列表。請習慣於同
-一封郵件接收兩次（一封來自發送者一封來自郵件列表），而不要試圖通過添加一
+一封郵件接收兩次（一封來自發送者一封來自郵件列表），而不要試圖透過添加一
 些奇特的郵件頭來解決這個問題，人們不會喜歡的。
 
 記住保留你所回復內容的上下文和源頭。在你回覆郵件的頂部保留「某某某說到……」
 這幾行。將你的評論加在被引用的段落之間而不要放在郵件的頂部。
 
-如果你在郵件中附帶補丁，請確認它們是可以直接閱讀的純文本（如
+如果你在郵件中附帶補丁，請確認它們是可以直接閱讀的純文字（如
 :ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
-文檔中所述）。內核開發者們不希望遇到附件或者被壓縮了的補丁。只有這樣才能
-保證他們可以直接評論你的每行代碼。請確保你使用的郵件發送程序不會修改空格
+文件中所述）。核心開發者們不希望遇到附件或者被壓縮了的補丁。只有這樣才能
+保證他們可以直接評論你的每行程式碼。請確保你使用的郵件發送程式不會修改空格
 和制表符。一個防範性的測試方法是先將郵件發送給自己，然後自己嘗試是否可以
-順利地打上收到的補丁。如果測試不成功，請調整或者更換你的郵件發送程序直到
-它正確工作爲止。
+順利地打上收到的補丁。如果測試不成功，請調整或者更換你的郵件發送程式直到
+它正確工作為止。
 
 總而言之，請尊重其他的郵件列表訂閱者。
 
 
-同內核社區合作
+同核心社群合作
 ----------------
 
-內核社區的目標就是提供盡善盡美的內核。所以當你提交補丁期望被接受進內核的
+核心社群的目標就是提供盡善盡美的核心。所以當你提交補丁期望被接受進核心的
 時候，它的技術價值以及其他方面都將被評審。那麼你可能會得到什麼呢？
 
   - 批評
@@ -357,9 +359,9 @@ MAINTAINERS文件中可以找到不同話題對應的郵件列表。
   - 要求證明修改的必要性
   - 沉默
 
-要記住，這些是把補丁放進內核的正常情況。你必須學會聽取對補丁的批評和評論，
+要記住，這些是把補丁放進核心的正常情況。你必須學會聽取對補丁的批評和評論，
 從技術層面評估它們，然後要麼重寫你的補丁要麼簡明扼要地論證修改是不必要
-的。如果你發的郵件沒有得到任何回應，請過幾天後再試一次，因爲有時信件會湮
+的。如果你發的郵件沒有得到任何回應，請過幾天後再試一次，因為有時信件會湮
 沒在茫茫信海中。
 
 你不應該做的事情：
@@ -369,8 +371,8 @@ MAINTAINERS文件中可以找到不同話題對應的郵件列表。
   - 忽略別人的評論
   - 沒有按照別人的要求做任何修改就重新提交
 
-在一個努力追尋最好技術方案的社區里，對於一個補丁有多少好處總會有不同的見
-解。你必須要抱著合作的態度，願意改變自己的觀點來適應內核的風格。或者至少
+在一個努力追尋最好技術方案的社群裡，對於一個補丁有多少好處總會有不同的見
+解。你必須要抱著合作的態度，願意改變自己的觀點來適應核心的風格。或者至少
 願意去證明你的想法是有價值的。記住，犯錯誤是允許的，只要你願意朝著正確的
 方案去努力。
 
@@ -378,36 +380,36 @@ MAINTAINERS文件中可以找到不同話題對應的郵件列表。
 不會被接受，也不意味著有人和你作對。你只需要改正所有提出的問題然後重新發
 送你的補丁。
 
-內核社區和公司文化的差異
+核心社群和公司文化的差異
 ------------------------
 
-內核社區的工作模式同大多數傳統公司開發隊伍的工作模式並不相同。下面這些例
+核心社群的工作模式同大多數傳統公司開發隊伍的工作模式並不相同。下面這些例
 子，可以幫助你避免某些可能發生問題：
 用這些話介紹你的修改提案會有好處：
 
     - 它同時解決了多個問題
-    - 它刪除了2000行代碼
+    - 它刪除了2000行程式碼
     - 這是補丁，它已經解釋了我想要說明的
     - 我在5種不同的體系結構上測試過它……
     - 這是一系列小補丁用來……
-    - 這個修改提高了普通機器的性能……
+    - 這個修改提高了普通機器的效能……
 
 應該避免如下的說法：
 
     - 我們在AIX/ptx/Solaris就是這麼做的，所以這麼做肯定是好的……
     - 我做這行已經20年了，所以……
-    - 爲了我們公司賺錢考慮必須這麼做
+    - 為了我們公司賺錢考慮必須這麼做
     - 這是我們的企業產品線所需要的
-    - 這裡是描述我觀點的1000頁設計文檔
+    - 這裡是描述我觀點的1000頁設計文件
     - 這是一個5000行的補丁用來……
-    - 我重寫了現在亂七八糟的代碼，這就是……
+    - 我重寫了現在亂七八糟的程式碼，這就是……
     - 我被規定了最後期限，所以這個補丁需要立刻被接受
 
-另外一個內核社區與大部分傳統公司的軟體開發隊伍不同的地方是無法面對面地交
-流。使用電子郵件和IRC聊天工具做爲主要溝通工具的一個好處是性別和種族歧視
-將會更少。Linux內核的工作環境更能接受婦女和少數族羣，因爲每個人在別人眼
-里只是一個郵件地址。國際化也幫助了公平的實現，因爲你無法通過姓名來判斷人
-的性別。男人有可能叫李麗，女人也有可能叫王剛。大多數在Linux內核上工作過
+另外一個核心社群與大部分傳統公司的軟體開發隊伍不同的地方是無法面對面地交
+流。使用電子郵件和IRC聊天工具做為主要溝通工具的一個好處是性別和種族歧視
+將會更少。Linux核心的工作環境更能接受婦女和少數族羣，因為每個人在別人眼
+里只是一個郵件地址。國際化也幫助了公平的實作，因為你無法透過姓名來判斷人
+的性別。男人有可能叫李麗，女人也有可能叫王剛。大多數在Linux核心上工作過
 並表達過看法的女性對在linux上工作的經歷都給出了正面的評價。
 
 對於一些不習慣使用英語的人來說，語言可能是一個引起問題的障礙。在郵件列表
@@ -418,61 +420,61 @@ MAINTAINERS文件中可以找到不同話題對應的郵件列表。
 拆分修改
 --------
 
-Linux內核社區並不喜歡一下接收大段的代碼。修改需要被恰當地介紹、討論並且
+Linux核心社群並不喜歡一下接收大段的程式碼。修改需要被恰當地介紹、討論並且
 拆分成獨立的小段。這幾乎完全和公司中的習慣背道而馳。你的想法應該在開發最
 開始的階段就讓大家知道，這樣你就可以及時獲得對你正在進行的開發的反饋。這
-樣也會讓社區覺得你是在和他們協作，而不是僅僅把他們當作傾銷新功能的對象。
+樣也會讓社群覺得你是在和他們協作，而不是僅僅把他們當作傾銷新功能的物件。
 無論如何，你不要一次性地向郵件列表發送50封信，你的補丁序列應該永遠用不到
 這麼多。
 
 將補丁拆開的原因如下：
 
-1) 小的補丁更有可能被接受，因爲它們不需要太多的時間和精力去驗證其正確性。
+1) 小的補丁更有可能被接受，因為它們不需要太多的時間和精力去驗證其正確性。
    一個5行的補丁，可能在維護者看了一眼以後就會被接受。而500行的補丁則
    需要數個小時來審查其正確性（所需時間隨補丁大小增加大約呈指數級增長）。
 
-   當出了問題的時候，小的補丁也會讓調試變得非常容易。一個一個補丁地回溯
+   當出了問題的時候，小的補丁也會讓除錯變得非常容易。一個一個補丁地回溯
    將會比仔細剖析一個被打上的大補丁（這個補丁破壞了其他東西）容易得多。
 
 2）不光發送小的補丁很重要，在提交之前重新編排、化簡（或者僅僅重新排列）
    補丁也是很重要的。
 
-這裡有內核開發者Al Viro打的一個比方：
-	「想像一個老師正在給學生批改數學作業。老師並不希望看到學生爲了得
+這裡有核心開發者Al Viro打的一個比方：
+	「想像一個老師正在給學生批改數學作業。老師並不希望看到學生為了得
 	到正確解法所進行的嘗試和產生的錯誤。他希望看到的是最乾淨最優雅的
 	解答。好學生了解這點，絕不會把最終解決之前的中間方案提交上去。」
 
-	內核開發也是這樣。維護者和評審者不希望看到一個人在解決問題時的思
+	核心開發也是這樣。維護者和評審者不希望看到一個人在解決問題時的思
 	考過程。他們只希望看到簡單和優雅的解決方案。
 
-直接給出一流的解決方案，和社區一起協作討論尚未完成的工作，這兩者之間似乎
+直接給出一流的解決方案，和社群一起協作討論尚未完成的工作，這兩者之間似乎
 很難找到一個平衡點。所以最好儘早開始收集有利於你進行改進的反饋；同時也要
-保證修改分成很多小塊，這樣在整個項目都準備好被包含進內核之前，其中的一部
+保證修改分成很多小塊，這樣在整個專案都準備好被包含進核心之前，其中的一部
 分可能會先被接收。
 
-必須了解這樣做是不可接受的：試圖將未完成的工作提交進內核，然後再找時間修
+必須了解這樣做是不可接受的：試圖將未完成的工作提交進核心，然後再找時間修
 復。
 
 
 證明修改的必要性
 ----------------
-除了將補丁拆成小塊，很重要的一點是讓Linux社區了解他們爲什麼需要這樣修改。
+除了將補丁拆成小塊，很重要的一點是讓Linux社群了解他們為什麼需要這樣修改。
 你必須證明新功能是有人需要的並且是有用的。
 
 
 記錄修改
 --------
 
-當你發送補丁的時候，需要特別留意郵件正文的內容。因爲這裡的信息將會做爲補
-丁的修改記錄(ChangeLog)，會被一直保留以備大家查閱。它需要完全地描述補丁，
+當你發送補丁的時候，需要特別留意郵件正文的內容。因為這裡的資訊將會做為補丁
+的修改記錄(ChangeLog)，會被一直保留以備大家查閱。它需要完全地描述補丁，
 包括：
 
-  - 爲什麼需要這個修改
+  - 為什麼需要這個修改
   - 補丁的總體設計
-  - 實現細節
+  - 實作細節
   - 測試結果
 
-想了解它具體應該看起來像什麼，請查閱以下文檔中的「ChangeLog」章節：
+想了解它具體應該看起來像什麼，請查閱以下文件中的「ChangeLog」章節：
   「The Perfect Patch」
   	 https://www.ozlabs.org/~akpm/stuff/tpp.txt
 
@@ -490,7 +492,7 @@ Dunlap和Gerrit Huizenga完善了應該說和不該說的列表。感謝Pat Moch
 Linder, Randy Dunlap, Kay Sievers, Vojtech Pavlik, Jan Kara, Josh Boyer,
 Kees Cook, Andrew Morton, Andi Kleen, Vadim Lobanov, Jesper Juhl, Adrian
 Bunk, Keri Harris, Frans Pop, David A. Wheeler, Junio Hamano, Michael
-Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文檔是不可
+Kerrisk和Alex Shepard的評審、建議和貢獻。沒有他們的幫助，這篇文件是不可
 能完成的。
 
 
-- 
2.43.0

