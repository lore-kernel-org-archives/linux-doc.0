Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED173ED3CC
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012452; cv=none; b=SVWST70Ov8HwfDrTKPMqOIdu7Eq0PsSt9cTPgdIWyNf+olLhB1Z3G9ZKVOtQs3ky32cLWVT76QQcO2TpWKT9iDqgTVUWWmtRY9SQyYPurN8l/YngfA53hIc5G7bHzhUCurl26fykp3MmoQ62t3ASCShtsCY3xunkr9aO+6JaGtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012452; c=relaxed/simple;
	bh=wtd/G8SZLE2rcSj54d9QBTyTOdYS6uCj6SB5YCbnUV4=;
	h=Message-Id:Mime-Version:Cc:From:To:Date:Content-Type:Subject; b=ZgBz4jnGM7TGU5Xn0vG2lVu8x/m7ekRusQQnJhvlwsmCDHE8wjCYDYA1vtUhZ01ibyNPYMFXBliflYET7kz6S4mMW/4z3uQlX1V0f7pDQeQ0lHJDTNA87Atv713IsRIeRtEFsqC0V7mT9yV06WcM43KCEZxe9T8bUq1wXJm3v90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=a0BQBUX3; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="a0BQBUX3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784012439;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=O9Dgk6VjznzqXWv+r+xTW2tHWn7JBeoEd0Se5Pd1gXU=;
 b=a0BQBUX3toFjpMzAww/OycH2lu8os1wpWhAC8FLKlP5Qk0JvMmyYH7cHcddW2KB5zx+LnY
 N7Jyk5sl8N1jo4MGxc/S41DJ08M+U5TkzymRatCeXvwh0HEph3fcPW/doQt/+8f7wYLwE/
 K9yaSb5knwOdKvNvs6pJPeau8QyELQ5o52RDkw+2TSpXwIsXZZXCyZkWX69NavEJ8p5Xew
 Uf5UxHb6HDZ/aDc4wWgEOm09uyHnOrE6a68jWB9olqWslJvJrcpDyxvBCzuhGAThXpjgn4
 SSF4DRmWkNJHrjGBJ0IjBmd0/CezXGqY55p/la6IWrY4SDuSvo7UpNDDVhlfpw==
Message-Id: <cover.1784000217.git.ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
From: "Ben Guo" <ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a55de91+21ec74+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <siyanteng@loongson.cn>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 15:00:31 +0800
Date: Tue, 14 Jul 2026 15:00:07 +0800
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3 0/4] docs/zh_CN: update rust documentation translations

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- quick-start.rst: update distro-specific install instructions, Ubuntu
  package versions, openSUSE rust-src package, and remove GDB/Binutils note
- general-information.rst: add no_std section, rustdoc links, abstractions
  and bindings diagram, Bindings/Abstractions sections, and Kconfig example
- arch-support.rst: add s390 support note
- testing.rst: add Kconfig guidance for KUnit test suites

Changes in v3:
- Add Reviewed-by from Dongliang Mu
- Add spaces around "HTML" in general-information.rst

Changes in v2:
- Add Reviewed-by from Gary Guo
- Translate "sound" as "=E5=8F=AF=E9=9D=A0" in general-information.rst

Ben Guo (4):
  docs/zh_CN: Update rust/quick-start.rst translation
  docs/zh_CN: Update rust/general-information.rst translation
  docs/zh_CN: Update rust/arch-support.rst translation
  docs/zh_CN: Update rust/testing.rst translation

 .../translations/zh_CN/rust/arch-support.rst  |  1 +
 .../zh_CN/rust/general-information.rst        | 82 ++++++++++++++++++-
 .../translations/zh_CN/rust/quick-start.rst   | 48 +++++------
 .../translations/zh_CN/rust/testing.rst       |  4 +
 4 files changed, 103 insertions(+), 32 deletions(-)

--=20
2.53.0
