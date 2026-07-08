Received: from va-2-41.ptr.blmpb.com (va-2-41.ptr.blmpb.com [209.127.231.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75243403E9
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 03:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480423; cv=none; b=OxHSdMh7xm2zZrQugRy6Z2XRvS6u5QnIIEjbS57hg/xU0U8rwG9nQfsoKuDwoyUfbqPzk+Pys4k/uC4sHRmWdkCC9XgjDrZU462AQEq5BeX2kOkE2ABt76CgfTpkxMh3qBYnlTYtk6YYg006/wZnbCVb283S0gkHSyNatgreOyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480423; c=relaxed/simple;
	bh=TzqJB5VPpSM2SH4f/rPpyRwCAR9BsRgXrjPHkyTuJyc=;
	h=To:Subject:From:Mime-Version:Date:Message-Id:Content-Type:Cc; b=Jt5yckyQxbZiAQ7Ew+TNsq4eZ2TIsOgQ7AHZpSn4t70dkeqwl3IVcyVINtMq1l1IWhPSOmIAWyA7J9dCzz1knxnH58pAOK9/hVYNQBjt2fp2IzMXomflGJy5586ETR0PNlaKKSu4fpD3qXDBwilzKpfVO6GHbWy0dr5KAqARFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=m0iSEtns; arc=none smtp.client-ip=209.127.231.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="m0iSEtns"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783480411;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=caIsI/uyAgt2mTj66sO2s2AYc35ZN9vqlIpVgHrSkCc=;
 b=m0iSEtnsj/CM3rkm8B8h9QxgUlP3FANTMqywCvtB+8TLe+cyVD0KOkr36FkVWi7ttLzj/3
 zR2R81uezvE5vg3dlpbk7W0ZUm1WdnV8sxbs/Mjw2Mkh7pPWOpi8CKfsQfbOSYcjIfofs7
 TtmGZFyMgVCveLQBuI3YskSQZy8x+w8iLgvil26dUspJmtKKKGOSd71Ef/CENpl9D7rxEW
 wjXULvtKvAWMRGF4iU/lkaMYAZyu4TFyXHVHpZqMM4Dzn3DpEQy6NGYKtGp62CjCf+d7to
 bZfId00lebhUfpISQD301IXMK4EQw/oq1jWc8OqZm8bt5AwQDs/qVtoh6nBNxA==
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Subject: [PATCH 0/4] docs/zh_CN: update rust documentation translations
X-Mailer: git-send-email 2.53.0
From: "Ben Guo" <ben.guo@openatom.club>
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26a4dc059+90d575+vger.kernel.org+ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed,  8 Jul 2026 11:13:21 +0800
Message-Id: <cover.1783480076.git.ben.guo@openatom.club>
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Jul 2026 11:13:28 +0800
Content-Type: text/plain; charset=UTF-8
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>

Update Chinese translations for the Rust subsystem documentation,
syncing with the latest upstream changes.

- quick-start.rst: update distro-specific install instructions, Ubuntu
  package versions, openSUSE rust-src package, and remove GDB/Binutils note
- general-information.rst: add no_std section, rustdoc links, abstractions
  and bindings diagram, Bindings/Abstractions sections, and Kconfig example
- arch-support.rst: add s390 support note
- testing.rst: add Kconfig guidance for KUnit test suites

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

-- 
2.53.0
