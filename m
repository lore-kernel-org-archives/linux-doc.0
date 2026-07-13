Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858F214883F
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783907225; cv=none; b=lNqveF3ltmuoFO2PV5Wm3Tl+e/mgqKRB73plol5Cb2PlyCwUFAlloVpORkzNfF8ju331KXCQC+gY6i6U/5aj5b/cApniEkPs8hL5wl0R/KmYPRhCRdnj7BhpT5GPpwG56GekCkJ/zLJKKjPlfx8/D3rqGKAiYPHv/nN/aQz5k0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783907225; c=relaxed/simple;
	bh=wBwlxYBx0GKBxroYaSDO/lJIxBVqsBd471WfKYvo6kk=;
	h=To:From:Subject:Date:Mime-Version:Content-Type:Message-Id:Cc; b=qngCeTk0B7leMI2Hj/FM1yeL2nbNZaaaQ3sO62vueg7TpJgSywiZsWHCOmYNW46/v6yW1ArUFEIrwHRzfvKK+BObwsMtQZWamPcq0WqIDyX6O5szghyKNj+wQBeTEuYN+0FLT8rfsZW+tPHWI9VlFbvOpdS8EeSjR0w0cKqvLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=gAKBM9yA; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="gAKBM9yA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783907206;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=zQGlQBNBo0N6dyO+w4K9O5xOVlJFBxz/pa3ZfOjvoPc=;
 b=gAKBM9yArKdPwYouQGKFpkEcFUIPpKwTsHdipPEcxRntqECvDcnWd3x5l5SRmUcz67bK0i
 aG3T/bt8aZVZiyL2t+zBBw2MTii/1klHNRInKxzjZzenNQcZUCwnZV7566W71mlZgu0Q2d
 ybqnrXv/Jm9oDtOB0nFKZ1UylA5sOdHmuLhEyvu0YBdIMOlsH5uj1ey7SIUTjnWsIKij1q
 lpqbzrlvX3VhFmnpl2lLTVU56yuM9XJTgQr80Cn+x+OKAHkAEz/vas0yPLGqMez8WsO4xK
 Im3Dn11vK2p3qsbjLeVU77tKMo5rYPtWL7Zv+2T65tMEGMLb8vrDmSDc5ZfFlQ==
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Subject: [PATCH v2 0/4] docs/zh_CN: update rust documentation translations
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 09:46:32 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Mon, 13 Jul 2026 09:46:43 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.53.0
Message-Id: <cover.1783905132.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a544384+b12f98+vger.kernel.org+ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- quick-start.rst: update distro-specific install instructions, Ubuntu
  package versions, openSUSE rust-src package, and remove GDB/Binutils note
- general-information.rst: add no_std section, rustdoc links, abstractions
  and bindings diagram, Bindings/Abstractions sections, and Kconfig example
- arch-support.rst: add s390 support note
- testing.rst: add Kconfig guidance for KUnit test suites

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
