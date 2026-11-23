Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431749;
	b=1xRWJDGAwmFErrIsGHH/p0ds0cF2caU1kCqJY0lfMnzdH0gL2TGR/o9V2NaX+AmkCsgI
	 +DcdkXGutK2haHxTIhH0IPA2SOdmJo5oEbN8ppltk8zWcNQNcT0zlvKNzj2Z6UnbLZwUN
	 h6DhP40RgUGRwdTlWfhreYzF5YEijqwSanB9JI1TnEXrNy8FC5J/Rv+gGiACG9lAec6xS
	 yeXaec5TEp/rgQ0s+3i8EW0elKIP3TiN5Xsdn9EvTdLLbxdMJMJtIXojO5et5jMD/q8kn
	 /kzdWi8oHsy8Qi5q9rlHJ8MeS7+Hjfv50xmq5fOfAMJYa/c9zT1m97tqSFEHh5lkQWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
	b=j1sAYiXUukutV2KKYBA+cM5JJdNjNcbcKoUCveJYXYrlBNfU9hapTv60vyXl1Jvea+ZU
	 00eU3UNxjxMQEOSoT1c/LYxjf8FBG5O336pP/mBEqWJ1BBpTmGEw9eeu2AsxAY7eiu57U
	 0eHw0T+5UyuBLvVodLtSxsdza+o+bdcs8Je6bkU8UmcHL2X6Xg22hxOhcUt2e0nrT36xo
	 OVqlatORckXDnojVtrONoHg3pCcmfxAe3QV5rzK3eoKjcuB1HSVyQGmKGSbKvj5xUFksn
	 yDbsNqbT0Y21UUteMwWHNRImlqLU3Oag4MJvRFbAehGpIEbdoNyz8MvCE9gQJVsJ4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p8yPmJ/J";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF7606A327
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFCF7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8yPmJ/J
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so75697a91.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431748; x=1796036548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
        b=p8yPmJ/J8xWWYI5GwzDPD4Ye/raKwwrIt3d0oSePmZFEp4arpTmWLjQsGHWbNeBikv
         TEt1lE+zBfYNszCXgG/7abMFipZBMSWPoNAMwLVesvt8FuAiZocZl0Cnm4K8x+nkOIuU
         XGM8wrZ8Ip/QOszbGJdR77ZY90EBJJ6NClU84nmjAinvcbPOG9c2bSYCZQDgaik5bogD
         nU57S+3QXvoOkFYutiXbUAjKf3TFlejCURgwvWpqenWef0ygcz1w6EMAAanMvhiiFr19
         VOHQiNUBOc4HTEIZmEP8ROqXbQED5ACoXuXG7meU7VdNovPLtuw5+mm8vfRQ/cpSqJ+j
         MbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431748; x=1796036548;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dRvEKvMtMy8DOufQg+iuIpfqGC13XWJHeXFYO1A/GwI=;
        b=VrJcIx3CtWC6+upvIvMMlpmjbonK9d7Pl/GQPSO3Ipe5JAEnkGsEHhSgZsUQ/AjmyZ
         jZyWWDxfg3bovy7BotLT+8i1ZwF/3DAdtEYYi3n9j8pXcuLVmFT8Gr9l0UntwgB/UXvF
         YdTGr/U9tWnEOxpengY+7TlLNrecZn48wtG5ICr+6seZZidQlxWH9kVBwc3PkVMhLfmy
         6v8yWT0ZUm7xZ/HP84i2QIVrJqYsX0nfsEtKRpRkqHmuTEgfZ51yheGpRYHvqvRBI88v
         +pvvX1wdNh1q5q3e9bVwKtybM5NWraJ0rNEbPAkayUtK/wuDc8tau9i9t+hrkyBZUn1V
         qAIw==
X-Forwarded-Encrypted: i=1; AL+hErHtKLfyBms2hx89oCpE9s24+t/dl/V4pdJLSXM4sURrCz/ne4rO4BnF/57cJ908oclqezcxOGVHlO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GO6tgfwQM5Tffs1wo573kLoQ/U9R/tHLWeRS5wMWNOHrBCLFU
	pR8hZl6UCP8myFDZ19uJeaK2fA1Q8y+vKQMMclBYy2QLZYQIvP20q4tU
X-Gm-Gg: AZFdTZcidAgSFC2jJKLE6jJhXvSP0WXwXB7KKRlcwlZayxTRPJkEa39OlLKpcb9PTBS
	/cRjaVJxm6ReGEFVdG+7mguX/g6Uge4ExZNH/J4O/CL+3WwZ8nkS/ZD3fSfeU0qOeX78NzphsvW
	9PLxlaHwsHXFxH1JZvdxecHWqNNlOrBwRyOfXVfihWg0GG//L9uWWlbJoi9esRWfhvjbvU7O424
	yLXvvWpdv/shAQHLfHewMrNCX882OY7Hqeb/m6/k9C79bmwYW0Ct3OwxZ12iQewPlXWJ2KM3BzW
	3+Wqi9UVn59DmkC/Bg8cfH0Q1ZP/Ge9Q6JgNR3YM60ZVHj4bc2Zp7HBk63xNW7hLJxN6r+X9XGN
	jCyUZ+63ytO2ywq51hUQlz7Act7v8f4xp1DblG+khF51zm9oEZtMvbQJjOJvoH8SP8XJPboKyW0
	JzZp3g8Cw9lSUKs1sI8BBBOOnVNl8DOUYBWa/25rzGfViQF/EcgBWncunzwcBHFV7cIoS6GgW65
	/igkLM46AY6A5vS9STrA0uDGdep2DtzI4S0VRRE0lqPnUkYC6/cRyAoLdfsK2tmlN1V30En2Ur2
	OajVW0R02XJtxbAyoK539l3Bb/VuujruVxpl/6a4q2MJREIZ10CnDTS45rEN5M9dOpL4Tt+se85
	ZF0r4NiMxMWYWKJdD681aCCI4
X-Received: by 2002:a17:90a:c10e:b0:3b3:c92e:f523 with SMTP id 98e67ed59e1d1-3b41c917320mr17279965a91.3.1795431747784;
        Mon, 23 Nov 2026 03:02:27 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:27 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 01/25] docs/zh_TW: process: sync 1.Intro.rst with the English original
Date: Mon, 23 Nov 2026 19:01:52 +0800
Message-ID: <20261123110217.170025-2-chenyou910331@gmail.com>
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
 - "3-clause BSD" was carried over as 3子句BSD, which reads like a
   literal translation; use 三條款BSD授權條款.

update to commit 4a0be1a25d98 ("Documentation: process: Capitalize
Git, Quilt, and Mercurial consistently")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
 .../translations/zh_TW/process/1.Intro.rst     | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 65c5ae095504..55d0e08dc4a7 100644
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
@@ -161,16 +161,16 @@ Andrew Morton, Andrew Price, Tsugikazu Shibata 和 Jochen Voß 。
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
-許可（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
+著所有程式碼貢獻都由GPLv2（可選地附帶允許在更高版本的GPL下分發的條文）或三條款BSD
+授權條款（New BSD License，譯者注）覆蓋。任何不包含在相容許可證中的貢獻都不會
 被接受到核心中。
 
 貢獻給核心的程式碼不需要（或請求）版權分配。合併到主線核心中的所有程式碼都保留
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

