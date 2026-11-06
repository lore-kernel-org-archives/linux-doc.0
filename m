Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964998;
	b=GnNQ67xd7cyaBXUmdydkfqCrgkJXmh9ElZCfXujSUUfDCobNr8ssFPZx35sRFDdckxx7
	 uicZSIjoL5aQRXhqzN0wayw7Yl4ilVgd5tMXYzuDFa7nK0hkGMe9aZB+Nzu98K8wYLsgy
	 reta9Q2u38E5DvUnTn/GQ0r+rgv782WwAsTBdh2jcy7+vIJOwHjnY2aTtkLXubbgjgIYk
	 okWi4EpN/rin7/fNhrOXqK0ZV6gOZyKEelDXaEUJcCzTkW68KBLkrr1c/omS8kMzXWq09
	 1RR8OzqnvEzw5DAtiaJAagEheZTqyo3jlu3itZ4blpR9Gi7RrE0y2rs9fNFIDkBgJkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xQODsOkIDRSvWfxGuy0N4uics1wQoO915imzXQQRNsE=;
	b=0s1IdmYgaPK4LgShSHq5Cbwb1huFaxMilqxauaxGFWSc+X7S5MrlIfxVao+F+f5NOMi3
	 PkJhsQId35U8bebQI3DaZX0a9qxqmrC6zn62tD7XKX6Na2nYq31WxSb61JlM9V3h/ZB2U
	 +rdW/ZymldNKAv5s+sNZZvCy+jdNKHjHbLuLlEjTQEybzKnO1SkhSmyP8tCXNTJvLH1lc
	 x0sHYrEdS5GRClHnOZC0jEXxg+6kUfzJmi5XLbTkfq70Z1yK0krCjNrahuSUOaS0Jr8DN
	 sA1nYlvkPWcBN0UrHwi6jjLZ2iCQhO3sLd6yOLOMJIg0/f1iZKlG6hdnIqhZ/SA36wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNq1Jw1K;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7437A606C7C1
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7437A606C7C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNq1Jw1K
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso107265a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964998; x=1794569798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQODsOkIDRSvWfxGuy0N4uics1wQoO915imzXQQRNsE=;
        b=YNq1Jw1KbGA95OxaugRAqsyPXulflXLJFddXHqF9E+G6Bt+vOyzm2Ql3uHFWpSlvgm
         71QjehAioepRnEd+xwrhwXdnhzjCsDyPBt/XHZf5dy1Xz7yiqm+MsWV80PqGeEn7lvqu
         Lw+Mg9eQlNSaXjEME6kjp617WzcZCXHfxc/ZR0fVZX9qeah6rGXz82doAlzs/OIsgCxE
         tgDhohXVasDvNGL4ovj/MI2vwQciWU6S0kuMd97zUyIwjNYdvPwiwTdzAK/gEFRrJVQC
         6etDQrKvt+sAiRo4emmh+KETY9Ao+bZ7gcomJB94u4DETFZIKrE4AKz3WqlsmeYXAjHM
         t1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964998; x=1794569798;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQODsOkIDRSvWfxGuy0N4uics1wQoO915imzXQQRNsE=;
        b=wmW4Ep+Y/WFqHO/KiweSovd7q9hUQMPYEKRhZtc65TbQZwMPMB9gWz6A+2gHKwp8Pf
         dFJTIaO5KoejfGynjFQkdgMBBgniRqmWjCmRw5XBip5/L4l1Jv8/HiEHBsbdgPQay5/j
         ERW+BlBE3mzbCTLSimD9AmZO2JIcZTlEXzPRpgefRJEBYU/0ZYFpZu/giHbvKc3lFuae
         kkomNaHO5YpsA0ZZuKa8xHoyZd05GPS+0jO4sbWLwKZPRmNG8yuvKr3xOcEhXCFUqnSx
         Bd5CPZMuyP5//UalTmTBzAsrlDO8amSHEh0LylXqOQFtbYxawyi5ECKk6xXe1gYO8Qhl
         oS7w==
X-Forwarded-Encrypted: i=1; AL+hErGDwdNN+DmzWj/Au6H9EaXr4UytyfdT/oUEMbY8QIXn5jrudVzkoeCvEj93eEa+vVP21O+/A7HUISQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P7HCeDjIlZ3CGTVOIgBymRjwdZcBbiSxLosG1TD+bvAF6NWBX
	i7NnlZ3tS8skcugM7eg9CgADAbICB5HxE59vaQVEHBuiXrR28yVG5Y/1
X-Gm-Gg: AYBFou1iE9oCL9t+fM9TM4HElYeH/VmI/N62hymm4Z74dLueFb33HnRfwWHmRefTrv2
	da4hbvY3CAkqQfwkEUHtKRsWigskY+1AqJI5kE/I4dLV/CIJMjQuTzBpUmJGil6+bKMDa69BHNK
	Jk1Nf3azvOVeS3Rwu6dH4wk6RAY/J6vwVjcLAtCzTYFKnJ3MqcOkdkFo0jqvC6rkPSLjIpFuB3p
	TLqZSkX934f6eL0RZRuN9JGuyOZR5bzc6nFYcSMNoxynfl29dOAb0MmO/NmRFopz7pG/tyXBHaR
	xucDnS6hXjvqQGxK8It+1gL31nMSzI4azdbcy7Z6nTP+wi/bjhKzp/zrcy/FdtuWkncupSN4B9S
	rK5sMOn53Zb17smWNjzxyqWpZJ48eP5WRkBqWw16msFdLZ3VEethJkH0uQq0CCdnM4b8cAT2ioD
	knF/UvAXa5fWrTrYJiDxmLNB1KmWb+byxn+C9GjSRadesIEq1dKjQHvPN74fYr8YfMRMmaOXeu/
	q1g3Hr1SiWF8bxxt3uFTKh0MKGz8eRI7BdA08nwFxNv9pY/9DR+G0m5xkO3OfKsxAukyDILZMAc
	Yb3h7/OtYOd3ygkstCm05dFndfRpRvwU7tZmDenXozgICUXBpaiWCPCHEhtXZetOkpR76yCPDLO
	u+lFjTqN8/6R4fgDlL4+PHyUN
X-Received: by 2002:a17:90b:2590:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b0db014274mr3353866a91.0.1793964997818;
        Fri, 06 Nov 2026 03:36:37 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b6507sm8343173a91.16.2026.11.06.03.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:36:37 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 12/13] docs/zh_TW: process: add threat-model.rst translation
Date: Fri,  6 Nov 2026 19:35:43 +0800
Message-ID: <20261106113545.708896-13-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113545.708896-1-chenyou910331@gmail.com>
References: <20261106113545.708896-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/process/threat-model.rst into Traditional
Chinese from the current English text.  There is no zh_CN translation
of this file to consult.

List the new file in the toctree of process/index.rst, after
security-bugs as in the English index, and drop it from the TODOList.

update to commit 60763c2f834d ("docs: threat-model: fix /dev/kmsg
reference")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/index.rst      |   5 +-
 .../zh_TW/process/threat-model.rst            | 187 ++++++++++++++++++
 2 files changed, 188 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst

diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index d9ac35e0660f..e5eb5a276fb1 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -91,13 +91,10 @@ TODOList:
    debugging/index
    handling-regressions
    security-bugs
+   threat-model
    cve
    embargoed-hardware-issues
 
-TODOList:
-
-* threat-model
-
 維護者資訊
 ----------
 
diff --git a/Documentation/translations/zh_TW/process/threat-model.rst b/Documentation/translations/zh_TW/process/threat-model.rst
new file mode 100644
index 000000000000..a28892de67ff
--- /dev/null
+++ b/Documentation/translations/zh_TW/process/threat-model.rst
@@ -0,0 +1,187 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/process/threat-model.rst
+
+Linux 核心威脅模型
+==================
+
+關於核心會防護、不會防護哪些東西，存在許多假設。這些假設常常讓缺陷報告產生混淆
+（:doc:`與安全相關的 <security-bugs>` 或 :doc:`與安全無關的
+<../admin-guide/reporting-issues>`），而且當某些邊界的責任在核心、發行版、管理員
+與使用者之間劃分不清時，也可能讓安全措施的落實變得複雜。
+
+本文件嘗試釐清核心在這個領域中的責任。
+
+核心的責任
+----------
+
+核心將對本地硬體資源及遠端系統的存取加以抽象化，讓多個本地使用者能夠公平分享
+授予他們的可用資源；並在底層硬體允許時，為他們的通訊以及他們正在處理或儲存的
+資料提供一定程度的機密性。
+
+核心假設底層硬體的行為符合其規格。這包括 CPU 指令集的完整性、分支預測單元與
+快取單元的透明性、記憶體管理單元（MMU）的一致性、具備 DMA 能力之周邊裝置的隔離
+（例如透過 IOMMU）、控制器中的狀態轉換、從暫存器讀取之數值的範圍、硬體已記載之
+限制的遵守等等。
+
+當硬體無法維持其規格所定的隔離時（例如 CPU 缺陷、旁路攻擊、硬體對非預期輸入的
+反應），核心通常會嘗試實作合理的緩解措施。這些措施是在硬體功能所及的範圍內盡力
+而為，目的是縮小攻擊面或提高攻擊成本；它們並不構成核心所提供的安全保證。
+
+使用者的一切活動，都在管理員的授權之下進行；管理員可以授予或拒絕各種權限，這些
+權限可能影響使用者如何使用可用資源，或其活動的機密性程度。管理員也可以將自己的
+全部或部分權限委派給某些使用者，特別是（但不限於）透過 capabilities。這一切都是
+透過設定來完成的（sysctl、檔案系統權限等）。
+
+Linux 核心套用了一組符合其威脅模型的預設設定。發行版有自己的威脅模型，並會附帶
+自己的預設設定組合，管理員可能需要加以調整（放寬或限制），以更符合自己的期望。
+
+在具備特權等級與記憶體管理單元的常見處理器上執行時，Linux 核心預設保證以下
+保護：
+
+* **以使用者為基礎的隔離**：無特權使用者可以限制在同一系統上執行的其他無特權
+  使用者存取自己的資料。這包括：
+
+  * 儲存的資料，透過檔案系統權限
+  * 記憶體中的資料（預設情況下，其他使用者無法存取這些分頁）
+  * 行程活動（不允許對其他使用者使用 ptrace）
+  * 行程間通訊（其他使用者無法觀察透過 UNIX domain socket 或其他 IPC 機制
+    交換的資料）。
+  * 同一系統內或與其他系統之間的網路通訊
+
+* **以 capability 為基礎的保護**：
+
+  * 不具備提升之 capabilities（包括但不限於 CAP_SYS_ADMIN）的使用者，不得變更
+    核心的設定、記憶體或狀態，不得變更其他使用者所見的檔案系統配置，不得授予
+    任何使用者自己所沒有的 capabilities，也不得影響系統的可用性（關機、重新
+    開機、panic、卡住，或因無上限地耗盡資源而使系統失去回應）。
+  * 不具備 ``CAP_NET_ADMIN`` capability 的使用者，不得變更網路設定，也不得攔截
+    或偽造來自其他使用者或其他系統的網路通訊。
+  * 不具備 ``CAP_SYS_PTRACE`` 的使用者，不得觀察其他使用者的行程活動。
+
+設定 ``CONFIG_USER_NS`` 時，核心也允許無特權使用者建立自己的使用者命名空間，並
+在其中擁有所有 capabilities，但會受到若干限制（不得執行會影響初始使用者命名空間
+的動作，例如變更時間、載入模組或掛載區塊裝置）。詳情請參閱
+``user_namespaces(7)``；使用者命名空間的各種可能性不在本文件的討論範圍內。
+
+核心也提供許多疑難排解與除錯功能，這些功能落入不當之人手中時，可能成為攻擊途徑。
+其中有些設計成可由一般本地使用者存取、風險較低（例如透過 ``/dev/kmsg`` 讀取的
+核心日誌）；有些則會暴露足夠的資訊，在大多數場合都構成風險，是否開放由管理員
+負責決定（perf events、traces）；還有一些則根本不是設計給無特權使用者存取的
+（例如 debugfs）。經管理員明確授予權限的使用者存取這些功能，並不構成安全侵害。
+
+能夠違反上述原則的缺陷，構成安全侵害。然而，必須在已經達成另一項違反之後才能
+造成違反的缺陷，只算是弱點。核心採用了若干自我保護措施，目的是在發現某些類別的
+缺陷時避免跨越安全邊界，但這些額外保護失效本身並不構成漏洞。
+
+哪些類別的問題不被視為漏洞
+--------------------------
+
+在 Linux 核心的威脅模型中，以下類別的問題 **不** 被視為 Linux 核心漏洞。不過，
+若認為核心可以做得更好，仍應回報這些問題，以便在合理可行的範圍內審查並修正，
+但它們會被當作一般缺陷處理：
+
+* **設定**：
+
+  * 過時的核心，特別是已終止維護（end-of-life）的分支，不在核心威脅模型的範圍
+    內：管理員有責任讓自己的系統保持在最新狀態。缺陷要被認定為漏洞，必須證明它
+    會影響仍在積極維護的版本。
+
+  * 建置層級：對核心設定的變更，且這些設定已明確記載為會降低安全等級（例如
+    ``CONFIG_NOMMU``），或僅供開發者使用。
+
+  * 作業系統層級：對命令列參數、sysctl、檔案系統權限、使用者 capabilities 的
+    變更，或特權介面的暴露，這些變更明確地增加了暴露程度，不論是向無特權使用者
+    提供非預設的存取，還是削弱核心落實某些保護或緩解措施的能力。例如：對 procfs
+    或 debugfs 的寫入權限。
+
+  * 只有在使用供開發或除錯用途的功能時才會觸發的問題（例如 LOCKDEP、KASAN、
+    FAULT_INJECTION）：這些功能已知會帶來額外負擔與潛在的不穩定，並非設計供
+    正式環境使用。
+
+  * 影響 CONFIG_STAGING 下所提供之驅動程式的問題，以及設定中標示為 EXPERIMENTAL
+    的功能。
+
+  * 載入明確標示為不安全／損壞／staging 的模組，以及一般而言使用任何標示為
+    實驗性或非供正式環境使用的子系統。
+
+  * 執行樹外（out-of-tree）模組或非官方的核心分支（fork）；這些問題應回報給
+    相關的供應商。
+
+* **初始權限過高**：
+
+  * 由已經擁有執行該動作或修改該狀態所需權限的使用者所執行的動作（例如
+    ``CAP_SYS_ADMIN``、``CAP_NET_ADMIN``、``CAP_SYS_RAWIO``、
+    ``CAP_SYS_MODULE``，且沒有進一步跨越任何邊界）。
+
+  * 在使用者命名空間中執行、且沒有繞過加諸初始使用者之限制的動作（例如 ptrace
+    的使用、訊號傳遞、資源使用、對 FS／裝置／sysctl／記憶體的存取、網路綁定、
+    系統／網路設定等）。
+
+  * root 使用者在初始命名空間中執行的任何動作（例如寫入特權裝置時發生的核心
+    oops）。
+
+* **脫離正式環境的使用情境**：
+
+  這涵蓋了仰賴系統雜訊為零之實驗室條件的理論性／機率性攻擊，或是需要不切實際
+  的嘗試次數（例如數十億次）、早在成功之前就會被標準系統監控偵測到的攻擊，例如：
+
+  * 只在完全安靜的環境中才有效的亂數預測（例如只能在實驗室中猜出的 IP ID、
+    TCP 連接埠或序號）。
+
+  * 以機率性方法為基礎的活動觀察與資訊洩漏，這類方法容易受到量測雜訊影響，
+    在正式環境的系統上實際上無法重現。
+
+  * 只能由大規模攻擊（例如暴力破解）觸發的問題，其對系統的影響使攻擊在成功之前
+    不太可能或不可能不被察覺（例如在成功之前就耗盡所有記憶體）。
+
+  * 只在開發用的模擬器（simulator）、模擬器（emulator），或回報當時實際系統上
+    並不存在的組合中才會出現的問題（涉及數千萬個執行緒、數萬顆 CPU、不切實際的
+    CPU 頻率、RAM 大小或磁碟容量、網路速度的問題）。
+
+  * 以及觸發成本比預期收益高出好幾個數量級的問題（例如做出功能完整的鍵盤模擬器，
+    只為了取得某個結構中 7 個未初始化的位元組；或是涉及數百萬次連線嘗試、只為了
+    猜出一個連接埠號碼的暴力破解方法）。
+
+* **強化措施失效**：
+
+  * 能夠繞過核心某些強化措施，但沒有可證明的利用途徑（例如繞過 ASLR、事件時序
+    或探測，但沒有可證明的後果）。這些只是弱點，不是漏洞。
+
+  * 缺少參數檢查，以及未回報某些錯誤，但沒有立即的後果。
+
+* **隨機的資訊洩漏**：
+
+  這指的是洩漏少量剛好存在於該處、無法由攻擊者選擇，或受到存取限制的資料片段：
+
+  * 由系統呼叫或其他介面回報的結構填充（padding）。
+
+  * 錯誤訊息中回報的識別碼、部分資料、未終止的字串。
+
+  * 核心記憶體位址／指標的洩漏並不構成可立即利用的途徑，因此不是漏洞，但仍必須
+    回報並修正。
+
+* **不符合規格的裝置與媒體**：
+
+  驅動程式是依照規格實作的。當裝置或儲存媒體違反其驅動程式所依據的規格時，
+  由此產生的異常行為屬於應修正的一般缺陷，而不是漏洞，除非該驅動程式明確記載
+  為已針對惡意輸入進行強化。因此，以下情況不被視為漏洞：
+
+  * 掛載損壞或經惡意構造的檔案系統映像檔所觸發的缺陷：掛載區塊裝置是特權操作
+    （見上文），管理員須對自己掛載的媒體負責。這包括在掛載前對映像檔執行檔案
+    系統一致性檢查（fsck）即可解決、緩解或偵測到的問題。
+
+  * 需要修改或模擬硬體才能重現的缺陷，包括偽裝成其他裝置的假 USB 裝置，或回報
+    超出其記載範圍之數值的裝置。
+
+* **實體存取**：
+
+  需要實體存取機器、修改硬體，或使用專門硬體（例如邏輯分析儀、透過
+  PCI-E／Thunderbolt 進行的 DMA 攻擊工具）的問題，不在範圍之內，除非系統已明確
+  設定了用來防禦這類攻擊的技術（例如 IOMMU）。
+
+* **功能與效能迴歸**：
+
+  任何可以透過設定適當權限與限制來緩解的問題，都不算是漏洞。
-- 
2.43.0

