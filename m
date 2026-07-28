Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120241E6D2
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785229908; cv=none; b=MvZDtqAXWm10tNW8jimNPO85q1epHlADTi5sQEqLzCQyYHR8iqWXfxi6lOWRp5t91Pw9HbugItMI8VYtY8jBvqfP0vXRA9q7u0dCPU5wmKICbk22WXfTW3BlzpEsQ66IzPqL/jpubg5DmE7ik20DRznB6mtgGrEtpOGEoXItjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785229908; c=relaxed/simple;
	bh=o13KPOeuLRQtWiHGrhOKzg82frjzFAr8aT/tQ6vveT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFV0h5OKmJBnMC2rNvP7zngwAcqpCNvabkiZAvastcf8qeQXlLRih8reuvsou5TpiOZ2i6JoPs28VCaRx7zm57s9dlN2xa3Yrcr+zMwE562RaplQFNtBTXmbX98aoWZG+LuhI6xsOHvqsxQ/6GxB/yGWcrE/KeS3SEGx0f6jyRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el5i/HIG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el5i/HIG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso362973b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785229906; x=1785834706; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPh3hrQrdN/mFZVip7AfGZA5uSCEVkQRtbhQHutG1Ao=;
        b=el5i/HIG+1VgEvxR6nkISfxMhQWlBgUPoNNHloaYt1vl/ARtxOvblPUvZDdhqucvNu
         YNNh6vxy7DjdVbKogWhTa8jMjroah54qz5UpQOzQlQuzyYMR9mreO2x/N9D81bp/6tR8
         06IUeL9uzR21GOTJSyF6H6kBL8hQHKlX3FDbEKB93DU+4Nc++odCOZzgI8RekzhvGjs+
         CMRtXZGQz12KKBBvFco4lqVNx2nnP7Xm9qa2m0ZdqgVCQ16Thp6IFgwMSsUamMFJ5RJx
         lr9b7XxzuAcFO8D17pLSCvzFoMSXfMRBGe5EILqguo5rryCDOnP11sD+4fA8JcJeSU5e
         zYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785229906; x=1785834706;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPh3hrQrdN/mFZVip7AfGZA5uSCEVkQRtbhQHutG1Ao=;
        b=I50816B+p+T9pFd2GvnlSBTdV5TdUIyxE7yB9XOmXdoZfKfcExsYRGS4XeVd/aAllp
         twAiON4CmgpR+bXwACP0HKhKckFRM1HXZPH/0F0kLA1WEcN3IDiNYavKM1/LsPU5tqul
         9VQAmEWRol0vc8PNVK2Weyrwmhi5U9n2mxzsMeLqQQVLF8WUdYSMG+qjd13mUunxreWa
         CWvLfUSKMWRQ9IkPJLX+iDT3HY1h/kJBKZ6M0P42TWoYh+wsN7rgyDE+q1RUVbT7jj1Y
         1SfCAtGLnMMbXZ15H87zlTmxAFKhxMB60DaCLTSoPRYn372ou7xRzrIQ7TJ8dB7YbSRA
         tK5A==
X-Forwarded-Encrypted: i=1; AHgh+Rqw7Qiho+nNOpAljA87OqcnkKqUx0Xf1rbFl0kjow0YfOBWRn39NUzq48QfI8yTVYpjD/AAC2mzFL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxosebl3dcMRDjlZGHW/wNCmjOtksEKMwdf2Vo5zvWX4fpTftFI
	KpbuHGqdUJU6/+0OvRzXiI2WW0Qy+/0ICs676PfMczMa7Gmvl1xp/XnE
X-Gm-Gg: AR+sD105TNN5itLqFgdLZnYTC8iGaDLecnq428t93ZGZ5OHFPjbw82+a7gTqlhpTOCq
	CEhmURjnYNsilFz1JZpj5yDk02vsDt7DPmuvqdibKECblsBGia0YjUeORjkFZgb4+S/6FYiRHE5
	aPlft1xs6X9V16sy4uFDcSvKOemmuV0oDzdvsDmkFPhvsuVJODfwgEiFQ+RbfjRY21FBylGsm1f
	qgzWm+uEzduAKxtFpqD2ZuEdGEpFfpcGjE7ODZq0ecqxCwLGCfyZ/LLuPUb/tQ49aiMO4xCYa4u
	hRlydQu9eF8e2O2XdNiiFl0p9I7e2JUV3cuZzmtNvavQor7RRumTis9YO+TRLGxs7lwzZVsfgYl
	mL/cDddBnRqTJmpaTfPki2OMIbipJrolWlpK3jnZb1fbKTSoZ/Enj5P0yCGacil2JyRh0FrgnoM
	I0hksjkl3UNRsyejeUTttLknsp5BsqBkcep1w8R2K9xpycAwhvBnymHF3KjFzh5uhUehenxYEJy
	FSvmIzXpPDWh8b3vcog6l2dFJCm0mXb1vEzVuzL
X-Received: by 2002:a05:6a00:8d8b:b0:842:5a18:9af0 with SMTP id d2e1a72fcca58-84e93046f5amr1244658b3a.0.1785229905926;
        Tue, 28 Jul 2026 02:11:45 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5328180dsm4099303b3a.23.2026.07.28.02.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:11:45 -0700 (PDT)
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
Subject: [PATCH v2 14/16] docs/zh_TW: process: localize terminology in 8.Conclusion.rst
Date: Tue, 28 Jul 2026 17:10:36 +0800
Message-ID: <20260728091038.171033-15-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728091038.171033-1-chenyou910331@gmail.com>
References: <20260728091038.171033-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Localize mainland terms to Taiwanese Mandarin (內核→核心, 代碼→程式碼,
軟件→軟體, ...), normalize character conventions (爲→為, 裏→裡, 啓→啟,
發佈→發布) to match the zh_TW glossary, fix the zh_CN cross-references
to zh_TW, and rephrase a few sentences for fluency.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---

Note for reviewers: this originally carried a Reviewed-by from Dongliang
Mu's standalone June review of the terminology localization. Since then
it also gained character-convention normalization, zh_TW cross-refs, an
RST blank-line fix before the LWN URL, the proofreader credit, and in
this v2 the updated LWN links and the Greg Kroah-Hartman hyphen fix.
Weijie Yuan reviewed the current version.
 .../zh_TW/process/8.Conclusion.rst            | 58 ++++++++++---------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..8f9b4ec6845f 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -11,45 +11,46 @@
 
  吳想成 Wu XiangCheng <bobwxc@email.cn>
  胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 葉宸佑 Chen-Yu Yeh <chenyou910331@gmail.com>
 
 .. _tw_development_conclusion:
 
-更多信息
+更多資訊
 ========
 
-關於Linux內核開發和相關主題的信息來源很多。首先是在內核源代碼分發中找到的
-文檔目錄。頂級
-:ref:`Documentation/translations/zh_CN/process/howto.rst <tw_process_howto>`
+關於Linux核心開發和相關主題的資訊來源很多。首先是在核心原始碼分發中找到的
+文件目錄。頂級
+:ref:`Documentation/translations/zh_TW/process/howto.rst <tw_process_howto>`
 文件是一個重要的起點；
-:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <tw_submittingpatches>`
-也是所有內核開發人員都應該閱讀的內容。許多內部內核API都是使用kerneldoc機制
-記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式生成這些文檔
-（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文檔）。
+:ref:`Documentation/translations/zh_TW/process/submitting-patches.rst <tw_submittingpatches>`
+也是所有核心開發人員都應該閱讀的內容。許多內部核心API都是使用kerneldoc機制
+記錄的；“make htmldocs”或“make pdfdocs”可用於以HTML或PDF格式產生這些文件
+（儘管某些發行版提供的tex版本會遇到內部限制，無法正確處理文件）。
 
-不同的網站在各個細節層次上討論內核開發。本文作者想謙虛地建議用 https://lwn.net/
-作爲來源；有關許多特定內核主題的信息可以通過以下網址的 LWN 內核索引找到：
+不同的網站在各個細節層次上討論核心開發。本文作者想謙虛地建議用 https://lwn.net/
+作為來源；有關許多特定核心主題的資訊可以透過以下網址的 LWN 核心索引找到：
 
-  http://lwn.net/kernel/index/
+  https://lwn.net/Kernel/Index/
 
-除此之外，內核開發人員的一個寶貴資源是：
+除此之外，核心開發人員的一個寶貴資源是：
 
   https://kernelnewbies.org/
 
-當然，也不應該忘記 https://kernel.org/ ，這是內核發佈信息的最終位置。
+當然，也不應該忘記 https://kernel.org/ ，這是核心發布資訊的最終位置。
 
-關於內核開發有很多書：
+關於核心開發有很多書：
 
-  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah Hartman）
-  線上版本在 http://lwn.net/kernel/ldd3/
+  《Linux設備驅動程序》第三版（Jonathan Corbet、Alessandro Rubini和Greg Kroah-Hartman）
+  線上版本在 https://lwn.net/Kernel/LDD3/
 
-  《Linux內核設計與實現》（Robert Love）
+  《Linux核心設計與實現》（Robert Love）
 
-  《深入理解Linux內核》(Daniel Bovet和Marco Cesati）
+  《深入理解Linux核心》(Daniel Bovet和Marco Cesati）
 
 然而，所有這些書都有一個共同的缺點：它們上架時就往往有些過時，而且已經上架
-一段時間了。不過，在那裏還是可以找到相當多的好信息。
+一段時間了。不過，在那裡還是可以找到相當多的好資訊。
 
-有關git的文檔，請訪問：
+有關git的文件，請造訪：
 
   https://www.kernel.org/pub/software/scm/git/docs/
 
@@ -58,16 +59,17 @@
 結論
 ====
 
-祝賀所有通過這篇冗長的文檔的人。希望它能夠幫助您理解Linux內核是如何開發的，
+祝賀所有通過這篇冗長的文件的人。希望它能夠幫助您理解Linux核心是如何開發的，
 以及您如何參與這個過程。
 
-最後，重要的是參與。任何開源軟件項目都不會超過其貢獻者投入其中的總和。Linux
-內核的發展速度和以前一樣快，因爲它得到了大量開發人員的幫助，他們都在努力使它
-變得更好。內核是一個最成功的例子，說明了當成千上萬的人爲了一個共同的目標一起
+最後，重要的是參與。任何開源軟體專案都不會超過其貢獻者投入其中的總和。Linux
+核心的發展速度和以前一樣快，因為它得到了大量開發人員的幫助，他們都在努力使它
+變得更好。核心是一個最成功的例子，說明了當成千上萬的人為了一個共同的目標一起
 工作時，可以做出什麼。
 
-不過，內核總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
-重要的是，Linux生態系統中的大多數其他參與者可以通過爲內核做出貢獻而受益。使
-代碼進入主線是提高代碼質量、降低維護和分發成本、提高對內核開發方向的影響程度
-等的關鍵。這是一種共贏的局面。啓動你的編輯器，來加入我們吧；你會非常受歡迎的。
+不過，核心總是可以從更大的開發人員基礎中獲益。總有更多的工作要做。但是同樣
+重要的是，Linux生態系統中的大多數其他參與者可以透過為核心做出貢獻而受益。
+使程式碼進入主線是提高程式碼品質、降低維護和分發成本、提高對核心開發方向的
+影響程度等的關鍵。這是一種共贏的局面。啟動你的編輯器，來加入我們吧；你會非
+常受歡迎的。
 
-- 
2.43.0

