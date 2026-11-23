Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431771;
	b=yCJ5rpHHCnOH91Jyxl/CNDsRJUkMTP1F7nAEPqD/vjW9z4/Js3wn33XTPjh0GwppZcNI
	 BDRee9tkuOUzTDywL1zDr98Hgqvq5/OEef6J+9Tl4wm8d3H7VkdNDHuyob+zs42THTD3E
	 EEfer5WbhDQGOgsgRr872U/onu6d3TQ+3tPH0Fba1LNPeXAwx5oO7XEtCpprN41t/FEDg
	 biO4oO8P5p19D9bTpOi0kT/+7pL353cYYXkcVywVtziOFT3VrJqhEHTQeZkhguNN/gxBa
	 T66a2916sAzmXkj2po7zkRlVE8dQw5oZD4vlBc+rqYv+8mSbevXjsTba6zhgwnctT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
	b=V7RjDZEzNSfmnGyeiDRweoFZ6fHFZ2NZOrLa+6lgIYlqlRjyCJIzbkuhNRW2Uox2zKbj
	 UqO8H1xuot2464GEWPRT7QMS0RX/+YjrDobp8Luoma2/BjuBaacZSi0rGFSrJtJx9uK32
	 Tti14mJiq2/mAHXcNWvKOwfhiDM27sZ87W+75r9C3+Mdlbaaaq1TTxlVrIdaiDxytage6
	 9SKYZkumJGX2NuOYPH681XKeSss4YkuXPzb7VqMsTy/24aqy9fzF91b1Co+y+U8iq4Zgh
	 qKPDbOgB/Zfq1xr2J+NnnpuSHTU8uOvJsHLTeMobTLFLzOnX8oa+CJVnBNY84oBjC8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bnGBI/3s";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F9606A684
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A1F9606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bnGBI/3s
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb33b5c067so2355315ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431771; x=1796036571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=bnGBI/3s93l0mK4QnKx4pvfPIBFpxgTDKMAzHbQdPbvg18kYXGrEgJINcHjjfOqpCG
         WexBx+nQQSEOsW2ihkVh5iG+F7fIfoLPAZPSkTLCjyJ2BoSUm+swJvnjTP7hDRAP3R4G
         akoCYEwYH73mwrT0OBAhqe1zzC57lZoaQb3QxwNtHaczhradyIW2pzN+g1iolBZoTJui
         F0NErFx51URIR+o3rkILcW2fgZ8HgJVjEpwBCLtXQ6z1gf/vncxFBg4FZsr5EvAGXqjc
         95Ah/Mvpkf8caIHSBAsKtv1w0GdhY/IO7CEYC/fBWa4TQFvpOsY/btpfqaQt2XVGM62T
         +MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431771; x=1796036571;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0q8e2+fE6SC7LQWl0/+D1d8347EPh+sa3dzN6lIYVc=;
        b=BM72FklFOxPCAhm10uWiU11lGJYfdXG5uHPM9YMRh+N++1eBT7PCL71BIjOUDtvmBR
         Me+PCxOsd+nVHY91sB29edEcHv8PsmMZlYLNDAJXkIho6ceP+VjPfh567lJkPHBShVB8
         YVA/7IV3btETTfgS/DSZ94ksDbbSoWqAYu7kJ4Xrc8jMSBgoRpjvsuqC+TatkKCqrK/v
         dTFVOMEiIzs36Y8WtJlF3XXwVglEWoeB8ZoNW29LM1LaE5rB0RnhZ7dR9msKt6IYRwmz
         s/7BNUoO1ENaO3Ih7b3WxLsn59/32I+jAzz7upSpLd+x6xt+UkoaiKqrYr9PfSUA43kf
         APHg==
X-Forwarded-Encrypted: i=1; AL+hErFWAYJUuqpm3PMgTCZWU9iNke5/iJwt072BFw0+OUlOaMQsj/j/QMNwb9c3hOJBxedolO9mQBoRdds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lm72x9V/pdQOPzvKmZJDSTAPyLUMDND8x4XKhp/S0BSs/LDYE
	XknSCeV0jb0EM6l54fSNXgbMp05rNps/oJdjcJpgJp+92pxBhD+llpYS
X-Gm-Gg: AZFdTZdC+2LFlnv0m8uAOORwx3NKgy0TMt+vXTemQ2cGNEiY3dyvXovl2HEyzsZPX3S
	EXGOml0gHgKc1aihpkm8OoEv2Oid0Rj2Z0iamBR3nqUBMwqS2UcoYPg06hc/APpzKPeTApVyGzz
	qpjxyB54N1/ajErZLbYGj9S3DJZbNDWjAlPxMRDNjZp1OoBlhn9Dri7I3QO+Ks8nSnQc/J+azIJ
	LUN1Rh1w5Xcc2gEl2uBO9P2rs19aBtwidzU2DccBDKhlMdQrTwtzVDmH3NM3P2hbZWmQnVUMxXn
	BhN9zOe+JydI+gwj33CI8zTNm8Dw334pHFbA/S6hlhylsPHurwzUC3yxIAxooyZMn68Hhv+i9V3
	NFMk0geetq91aer74ZfJkrEjfLBGPysU2Q4jG39P6sJl+EZTaSa5ClIY2x7Mlry5fYV0BN9oKCd
	plTXfEL94lLvptT4CsOTu0i1IgqE32xLfEAWJFYBSk9WtXwcHp1IJxqNGlw6a/ICot4hjG1N8rq
	v0m6Fc5k61an1h1JXAsMV6VBpTxFNGWJuFdVzGdMruCmYZeN4pIiX6eLJOQGcLNe+9NU9Ssdx/c
	pnWkIsV21h68CVewLqlfTTh1JGEhOwlCnA1H877EFKUTYEBmV4BArKDe7DblfplAqdUbtWzl/66
	UokA3O4wH0R7FG43y0xarDVUQ
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr167023415ad.0.1795431770580;
        Mon, 23 Nov 2026 03:02:50 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:50 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 08/25] docs/zh_TW: process: sync code-of-conduct-interpretation.rst with the English original
Date: Mon, 23 Nov 2026 19:01:59 +0800
Message-ID: <20261123110217.170025-9-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
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

The previous update claimed to track
commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB role in
enforcement decisions"), but the conflict mediator contact was still the
one from before commit 5fddf8962b42 ("docs: update mediator contact
information in CoC doc") and commit 8bfdfa0d6b92 ("docs: update mediator
information in CoC docs").  Update it to Joanna Lee
<jlee@linuxfoundation.org>.

While at it, translate "file" in the Maintainers and Scope sections as
檔案 and keep the MAINTAINERS file name untranslated, matching the rest
of process/, and rewrap lines that exceeded 80 columns.

update to commit 04c4bb90ae6e ("Documentation/CoC: Spell out the TAB
role in enforcement decisions")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../process/code-of-conduct-interpretation.rst   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index 4fc568409198..6f87b104a96d 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -2,16 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
+:Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst
+           <code_of_conduct_interpretation>`
 
 .. _tw_code_of_conduct_interpretation:
 
 Linux核心貢獻者契約行為準則解釋
 ===============================
 
-:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套規則。
-每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心社群中
-如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要進行調整。
+:ref:`tw_code_of_conduct` 準則是一個通用文件，旨在為幾乎所有開源社群提供一套
+規則。每個開源社群都是獨一無二的，Linux核心也不例外。因此，本文描述了Linux核心
+社群中如何解釋它。我們也不希望這種解釋隨著時間的推移是靜態的，並將根據需要
+進行調整。
 
 與開發軟體的“傳統”方法相比，Linux核心開發工作是一個非常個人化的過程。你的貢獻
 和背後的想法將被仔細審查，往往導致批判和批評。審查將幾乎總是需要改進，材料才
@@ -23,7 +25,7 @@ Linux核心貢獻者契約行為準則解釋
 ------
 
 行為準則多次使用“維護者”一詞。在核心社群中，“維護者”是負責子系統、驅動程式或
-文件的任何人，並在核心原始程式碼樹的維護者文件中列出。
+檔案的任何人，並在核心原始程式碼樹的 MAINTAINERS 檔案中列出。
 
 責任
 ----
@@ -39,7 +41,7 @@ Linux核心貢獻者契約行為準則解釋
 維護人員應該願意在出現問題時提供幫助，並在需要時與社群中的其他人合作。如果您
 不確定如何處理出現的情況，請不要害怕聯繫技術諮詢委員會（TAB）或其他維護人員。
 除非您願意，否則不會將其視為違規報告。如果您不確定是否該聯繫TAB 或任何其他維
-護人員，請聯繫我們的衝突調解人 Mishi Choudhary <mishi@linux.com>。
+護人員，請聯繫我們的衝突調解人 Joanna Lee <jlee@linuxfoundation.org>。
 
 最後，“善待對方”才是每個人的最終目標。我們知道每個人都是人，有時我們都會失敗，
 但我們所有人的首要目標應該是努力友好地解決問題。執行行為準則將是最後的選擇。
@@ -64,7 +66,7 @@ Linux核心貢獻者契約行為準則解釋
 
 Linux核心社群主要在一組公共電子郵件列表上進行交互，這些列表分佈在由多個不同
 公司或個人控制的多個不同伺服器上。所有這些列表都在核心原始程式碼樹中的
-MAINTAINERS 文件中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
+MAINTAINERS 檔案中定義。發送到這些郵件列表的任何電子郵件都被視為包含在行為
 準則中。
 
 使用 kernel.org bugzilla和其他子系統bugzilla 或bug追蹤工具的開發人員應該遵循
-- 
2.43.0

