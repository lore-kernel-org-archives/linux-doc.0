Received: from va-2-33.ptr.blmpb.com (va-2-33.ptr.blmpb.com [209.127.231.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593421CC60
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 02:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942558; cv=none; b=GV8ziQwA3CR7aCDVa5oVfQnaGRiaHAVqvnAV+nq/Hil7TGToTIkVQB01cBiz2x4Mdg2Cj0TaMtXWXGl4DhL7VcpR6UtdHA2DSHLa/2/c3fypxZWU32CJ2RnFKr+MPifzLeNC1TX8ZMpfGA1FIkHS/zc/mhsHBwFGMuD5jUfP/r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942558; c=relaxed/simple;
	bh=/FIv3JfwCTsgLMPpk25ySSykFyldkMsSwUGwVIDe9TY=;
	h=Cc:Subject:To:From:Message-Id:Content-Type:Date:Mime-Version; b=MPJnDV+CAtlapx/Nz8X0UcXHX4X7zyziWx8HiuOPPgSe/xmX1lCgUZvl576uwizeOw1KRkEJ0cY7C51AamNHLrHq7yZz+Kh7SJaZsFSLhW6am4TDcFwAATnI6wCPYkBpBP9v9SVcWB9tw4+Wx1JVFKPf0jFxClIgmeCxQBIMzbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=CUlMyFVG; arc=none smtp.client-ip=209.127.231.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="CUlMyFVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1751942508;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=/FIv3JfwCTsgLMPpk25ySSykFyldkMsSwUGwVIDe9TY=;
 b=CUlMyFVG8XktNihvU+o+5cjuRedYm7gfnxYA9FQjR6uvC7q0a/BPqueTXLUiUA/j4fOE5B
 LdVDSQjA18EatgbEOpSYFlrY5AEebzCt93EKlJaL/08X1jrgYPk3vZFFu++xvAotVtOfB+
 ubYmKkALx4CC/NBN+JNhwT9v50DCyXYSZTmUfwIDenEAc3Y2XsqV7C/VVJ347SEaeeyEVO
 rN+CnhOjI0HAyTSfqKCzy9CHmuBCyzei1iFh5oqKLjb+lKCDtDFHnSOGxVGlr+N+H15J9f
 N8NeTWyReQYs4YQSAr1QwU1M8CnHDPMgNiiLvMn0yh65LyzdYLWrVF/Pv23D0Q==
Received: from localhost.localdomain ([210.12.5.226]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 10:41:45 +0800
Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: [PATCH 3/7] docs/zh_CN: add link_power_management_policy.rst translation
Content-Transfer-Encoding: base64
X-Mailer: git-send-email 2.25.1
To: <alexs@kernel.org>, <si.yanteng@linux.dev>
From: "haodongdong" <doubled@leap-io.com>
Message-Id: <20250708024139.848025-4-doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue,  8 Jul 2025 10:41:35 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: haodongdong <doubled@leap-io.com>
X-Lms-Return-Path: <lba+2686c856a+392bef+vger.kernel.org+doubled@leap-io.com>

VHJhbnNsYXRlIC4uLi9zY3NpL2xpbmtfcG93ZXJfbWFuYWdlbWVudF9wb2xpY3kucnN0IGludG8g
Q2hpbmVzZS4NCkFkZCBsaW5rX3Bvd2VyX21hbmFnZW1lbnRfcG9saWN5IGludG8gLi4uL3Njc2kv
aW5kZXgucnN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBoYW9kb25nZG9uZyA8ZG91YmxlZEBsZWFwLWlv
LmNvbT4NCi0tLQ0KIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vc2NzaS9pbmRleC5yc3QgICAgICAg
ICB8ICAzICstDQogLi4uL3Njc2kvbGlua19wb3dlcl9tYW5hZ2VtZW50X3BvbGljeS5yc3QgICAg
IHwgMzIgKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi9zY3NpL2xpbmtfcG93ZXJfbWFuYWdlbWVudF9wb2xpY3kucnN0DQoN
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4
LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvaW5kZXgucnN0DQpp
bmRleCA0ZTk1NzdmMmM5YzYuLjE1N2Y4ZTc1MjJiNiAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvaW5kZXgucnN0DQorKysgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2luZGV4LnJzdA0KQEAgLTQzLDEwICs0MywxMSBAQCBT
Q1NJ6amx5Yqo5Y+C5pWwDQogLi4gdG9jdHJlZTo6DQogICAgOm1heGRlcHRoOiAxDQogDQorICAg
bGlua19wb3dlcl9tYW5hZ2VtZW50X3BvbGljeQ0KKw0KIFRvZG9saXN0Og0KIA0KICogc2NzaS1w
YXJhbWV0ZXJzDQotKiBsaW5rX3Bvd2VyX21hbmFnZW1lbnRfcG9saWN5DQogDQogU0NTSeS4u+ac
uumAgumFjeWZqOmpseWKqA0KID09PT09PT09PT09PT09PT09PQ0KZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvbGlua19wb3dlcl9tYW5hZ2VtZW50X3Bv
bGljeS5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9zY3NpL2xpbmtfcG93
ZXJfbWFuYWdlbWVudF9wb2xpY3kucnN0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi42NzM4MmE2YTliNWYNCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3Njc2kvbGlua19wb3dlcl9tYW5hZ2VtZW50X3BvbGljeS5y
c3QNCkBAIC0wLDAgKzEsMzIgQEANCisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KKw0KKzpPcmlnaW5hbDog
RG9jdW1lbnRhdGlvbi9zY3NpL2xpbmtfcG93ZXJfbWFuYWdlbWVudF9wb2xpY3kucnN0DQorDQor
Oue/u+ivkToNCisNCisg6YOd5qCL5qCLIERvbmdkb25nIEhhbyA8ZG91YmxlZEBsZWFwLWlvLmNv
bT4NCisNCis65qCh6K+ROg0KKw0KKw0KKw0KKz09PT09PT09PT09PT09PT0NCivpk77ot6/nlLXm
upDnrqHnkIbnrZbnlaUNCis9PT09PT09PT09PT09PT09DQorDQor6K+l5Y+C5pWw5YWB6K6455So
5oi36K6+572u6ZO+6Lev77yI5o6l5Y+j77yJ55qE55S15rqQ566h55CG5qih5byP44CCDQor5YWx
6K6h5LiJ57G75Y+v6YCJ6aG577yaDQorDQorPT09PT09PT09PT09PT09PT09PT09ICAgPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCivpgInpobkJ
CQnkvZznlKgNCis9PT09PT09PT09PT09PT09PT09PT0gICA9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KK21pbl9wb3dlcgkJ5oyH56S65o6n5Yi2
5Zmo5Zyo5Y+v6IO955qE5oOF5Ya15LiL5bC96YeP5L2/6ZO+6Lev5aSE5LqO5pyA5L2O5Yqf6ICX
44CCDQorCQkJ6L+Z5Y+v6IO95Lya54m654my5LiA5a6a55qE5oCn6IO977yM5Zug5Li65LuO5L2O
5Yqf6ICX54q25oCB5oGi5aSN5pe25Lya5aKe5Yqg5bu26L+f44CCDQorDQorbWF4X3BlcmZvcm1h
bmNlCQnpgJrluLjvvIzov5nmhI/lkbPnnYDkuI3ov5vooYznlLXmupDnrqHnkIbjgILmjIfnpLoN
CisJCQnmjqfliLblmajkvJjlhYjogIPomZHmgKfog73ogIzpnZ7nlLXmupDnrqHnkIbjgIINCisN
CittZWRpdW1fcG93ZXIJCeaMh+ekuuaOp+WItuWZqOWcqOWPr+iDveeahOaDheWGteS4i+i/m+WF
pei+g+S9juWKn+iAl+eKtuaAge+8jA0KKwkJCeiAjOmdnuacgOS9juWKn+iAl+eKtuaAge+8jOS7
juiAjOaUueWWhG1pbl9wb3dlcuaooeW8j+S4i+eahOW7tui/n+OAgg0KKz09PT09PT09PT09PT09
PT09PT09PSAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUNCi0tIA0KMi4yNS4x
