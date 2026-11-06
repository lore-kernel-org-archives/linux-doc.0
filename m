Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964714;
	b=iyV0UX+HCSjsj8KXSXkeOMuSYqeNeaErOzpI18zJsHqrs0L8GE6FMz9/tybNgr/TNNha
	 ZJnYLPZhvcw41N+VbMekmgPc3sDMoppfWIjZiTdwFzAChyv1WL/WuvmH4dzoviV+/xz0B
	 hSWMSRcw1es6XyrWcvnqh0NlHnZeIwvO0PgTM9vKjTqIX0e/uBFNMWyfpiRdILvdIN3qg
	 ugBwDOyeyYUs7PvAgHLhrhqPjkBMATJFqDYcenlwKu2skVAqPI/fiXgbijT7nh81QFWTA
	 RDV9/DMZJ56ZhFgsavuvNTPGaxEO27PzX06SNFKo7mvrJvs6tw0BwzttZOCxye2h6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
	b=Qe0sBjJBsQnys8YmiY8ggO9fuDxVq96zxHTA0vfEUL9qGR336NTy4SlV9SvxErnAvv3Y
	 6+CtnkRt9+2sgVYtolef4PUZOg8kZrfgMAkiR9YxWwTBsAe6HIo/7UbsHBG/xIQPhJgpr
	 QLNbBcNeH4TSzIxMzC6SLfQujkTxzdN7uAovRPGZeC/hT7nARI2i9GGRdOW+KmOoPYZaU
	 G1U/E6pJA555IFuJ7Ej9/BVDX5hO4jgV2KLBFp0t+2a7mn9cT5HaGNb1Lzq9bVdAof2+o
	 NwL3gifgDqUoe7YVdFIXi86icWdPt8QdHAdwWJaRI6xezXQGrXLc7eksClI68/788vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMxbSN4y;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F4A606EE85
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5F4A606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMxbSN4y
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso106539a91.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964713; x=1794569513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
        b=YMxbSN4yuis0w6bzUjyGhaZ7WA3ji0+nInOXizSeeJC5RlLVcX6lmcPifuiclhhChy
         k57khVbLcjW+0GhY/NyI9LQxdROK19oSopUlu93wfM/Y9cN1ej8PVHiFX7NFnBw7Xoyf
         VhJjVdJfJAsUzc2H1ArcPSTjImYi92Obl8qYCs8sCmSHPL5eFKloUZmpuveN2F3VYvRr
         gv8Z8AlAqWW7pu/pZYIM9TFtrkNIaCy6Ku+D2cALmqfRjUX7ZCU87MZWCcmJ20oIKjai
         2H/fc0IYL0mDU2FQV5qDkkbsjEZQjB6ihU2HjOkoB40YMTzqoKfNqNQfGKQ+fNGa7Cm0
         E0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964713; x=1794569513;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KwdFJ0fFzeoyOnbWKF3lTSyNsRtow0OTFl3DyKZAgLk=;
        b=GB0kxiLqEU5bO/gnZ6E63C5Sh0R35Lmpefmp/f2iY+BkZahDfDtTidt4AhwFjpuiIX
         UE7xgybJIG215/TeaIFaI51SjIhoRBBRFer84XIrWhoynvaohcueFW3r2dQrDv089107
         N2Frqmo8zWll6UzzohER3z6XFepNR79AyVPHiiqFIF+qDvy2jV483zLkv+EMzk3A7l8x
         z1ciw5WQ1ADqtfEXGCMjP/9YVrxuQGQHDiZHPYRq/G7pL2v3f7rr0fcQcaxn4OL8X668
         s6IQFo47q6kUF3cPjHJch6C25dlJGumnsCfcECYz6w+/u6cIIfCvJw9Z5jeIcqmasGVX
         Wg3g==
X-Forwarded-Encrypted: i=1; AL+hErFxZohWagmzsc9UuUFFbNCB6kqov4COWmhG36uqiMjGItp71iOc+K2Yr1+cj0nJFfiGQnedPML9TLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sNaaf8aY9Ie2dLdHM0923oDB1eSvX6TWQaE+/vvjCxTZ+qolC
	Ic3Rz33sun9kbh7XWHvTd/lJBE9AFQ7z+ZQnC1fZNjy1vBijozKQXTnd
X-Gm-Gg: AYBFou1cTUlxb1HppKDRKFFufCbuKglDhShx0KeGi1/zFX2cf2w+b4Y1PIMDYIL49fN
	2bAYqdIAMyO19HzfZnRWwH6M8pr9UNQqXFYrEqO3ppSmI5gxEX0G379Ve7XfhqZluvLzwoUHIbH
	bjoxz97gz12suunLVWD/OlPX8s9vfqwodDT58j3E8M9goySy3nLtnj7GOfo/qieXsgTS2PWZ3sH
	5/O8dsp1c8MeryTzrRcRnZ3xoWQNcUqbwWnVDjT+udjMFgqZfVvCA0RqF77vVvPh5g6gxCE/Cfn
	bLbePzzJU+pCVTAW2s9Djkh8BJSuHzLUGKNH3sIm4AKxGjWjuhxHQOrRnxJ4s78lTLpRponrnjq
	DvK4j2IOFfX5sEbU7WkG+JJyZRdr4Tgor/Po/u871G8wuQXe8qUcpLukY1itw/WxhfSvZe1Qm3a
	bXXvlZnCJhLELm83VNlFqGJJLYweug4CEjk1FELBmtYCfUCGnk+vcvo1Nd+/l6YiHJvO/YHUwzj
	ckU5cbOYB7vwnNHTfRfzUOUSu28FaiWKPTd+xn7xYJ1peL3ewkvvuNmhhznZ9EkeIjeoYVjamzj
	hYn9Vo9RQ8iPdJ4bCxmP3au5Ini5YrUpdGOo33VOOYtytpdMXPuU8M/E+DjVVhvBKEeMuAj9E2n
	Kz9XzHQKOjNHx18iLLYbux3Eq8FWtaguqeX+qtc+buNqEoQ==
X-Received: by 2002:a17:90b:224e:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3b0db62ffb8mr3297042a91.2.1793964712998;
        Fri, 06 Nov 2026 03:31:52 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:31:52 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
Date: Fri,  6 Nov 2026 19:31:16 +0800
Message-ID: <20261106113142.706783-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
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

Re-check the whole translation against the current English text.  The
only English change since the last sync,
commit 4a0be1a25d98 ("Documentation: process: Capitalize Git, Quilt, and
Mercurial consistently"), capitalizes "Git", which the translation
already does.

While at it, fix a few translation errors:

 - "language" in "with, optionally, language allowing distribution
   under later versions of the GPL" means license wording, not a
   (natural) language; translate it as 條文.
 - "false economy" was translated literally as 在經濟上是錯誤的;
   use 因小失大 to convey the idiom.
 - Restructure the broken sentence about code that cannot be
   contributed.
 - Add the missing "too" (也) in the embedded systems paragraph.

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize
Git, Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../translations/zh_TW/process/1.Intro.rst       | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 65c5ae095504..d246de92bec9 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -95,8 +95,8 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 有些公司和開發人員偶爾會想，為什麼他們要費心學習如何與核心社群合作，並將程
 式碼放入主線核心（“主線”是由Linus Torvalds維護的核心，Linux發行商將其用作
 基礎）。在短期內，貢獻程式碼看起來像是一種可以避免的開銷；維護獨立程式碼並
-直接支援使用者似乎更容易。事實上，保持程式碼獨立（“樹外”）是在經濟上是錯誤
-的。
+直接支援使用者似乎更容易。事實上，保持程式碼獨立（「樹外」）看似省事，其實是
+因小失大。
 
 為了說明樹外程式碼成本，下面給出核心開發過程的一些相關方面；本文稍後將更詳細地
 討論其中的大部分內容。請考慮：
@@ -161,15 +161,15 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 尤其是嵌入式系統的製造商，可能會傾向於忽視本節中所說的大部分內容；因為他們
 相信自己正在商用一種使用凍結核心版本的獨立產品，在發布後不需要再進行開發。
 這個論點忽略了廣泛的程式碼審查的價值以及允許使用者向產品添加功能的價值。但這些
-產品的商業壽命有限，之後必須發布新版本的產品。在這一點上，程式碼在主線上並得到
-良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
+產品的商業壽命也是有限的，之後必須發布新版本的產品。在這一點上，程式碼在主線
+上並得到良好維護的供應商將能夠更好地佔位，以使新產品快速上市。
 
 許可
 ----
 
 程式碼是根據一些許可證提供給Linux核心的，但是所有程式碼都必須與GNU通用公共許可
 證（GPLv2）的版本2相容，該版本是覆蓋整個核心分發的許可證。在實踐中，這意味
-著所有程式碼貢獻都由GPLv2（可選地，語言允許在更高版本的GPL下分發）或3子句BSD
+著所有程式碼貢獻都由GPLv2（可選地附帶允許在更高版本的GPL下分發的條文）或3子句BSD
 許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
 被接受到核心中。
 
@@ -182,9 +182,9 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
 
 所有貢獻給核心的程式碼都必須是合法的自由軟體。因此，不接受身分不明或匿名的
 貢獻者的程式碼。所有貢獻者都需要在他們的程式碼上“sign off（簽發）”，聲明程
-式碼可以在GPL下與核心一起分發。無法提供未被其所有者許可為自由軟體的程式碼，
-或可能為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派
-生的程式碼）不能被接受。
+式碼可以在GPL下與核心一起分發。未被其所有者許可為自由軟體的程式碼，或可能
+為核心造成版權相關問題的程式碼（例如，由缺乏適當保護的反向工程工作派生的程
+式碼）都不能被貢獻。
 
 有關版權問題的提問在Linux開發郵件列表中很常見。這樣的問題通常會得到不少答
 案，但請記住，回答這些問題的人不是律師，不能提供法律諮詢。如果您有關於
-- 
2.43.0

