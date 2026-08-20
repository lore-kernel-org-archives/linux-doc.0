Received: from mta1.migadu.com (out-117.mta1.migadu.com [95.215.58.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74B388390
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201054; cv=none; b=ZYlzliQDZi/WScdPxeZ3a8QAALyJC+b7TAABAEgEUdS0A5sDbqQFxL1TmFNzbDSAD+agfTqRVulRC9R9ibccuLS32wjcHToB+fkDuW1wvvLDnVKkVnbf8mA4H+65vsXY6w3RiNr3P2Aq+YNqXJng9V42izKTlnvcck1k9ndaChw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201054; c=relaxed/simple;
	bh=UQnbIZdf1Ghn24z1NPxJ+bAqswWWo8J/90pyGrl0wX4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=tHhYO5wpgwauD5AhJVXuOjOl+bGCzsfbTPQS1eNfuSMwD26tG1eCrbGk1whKb436N4youNfHRt/pPaZu5dsLb2yEX7UmfRSPPsZwfTw4md7aHE/Xlwwb1FuFsE8DcAwncx+uI6AQstd3gPNtkf3bVrXEXChu/YWy612EgBlG/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Hh80cxve; arc=none smtp.client-ip=95.215.58.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="Hh80cxve"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UQnbIZdf1Ghn24z1NPxJ+bAqswWWo8J/90pyGrl0wX4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787201051; v=1; x=1787805851;
 b=Hh80cxveHyczmdbhXxItY9exF8C7AWymxhlw6eWhyGAP2HI+1vJKR9qcO68N+JFnlE7b4dJ6
 4O38xHsemA3N0Sj5fnoO3vnEh2FeUdIkYlWgPk5iv4sVVZRWgOtxeodsZHW1Z1dx42YJI0xB/py
 v8ElVx9B1GLNUDumGPf1kZjAiUk1aMBufwqp3klCeiefXLwBnzxtVkeB+05kEPwx1QiD2icp3n9
 lFH3bnaPNQ/ReDUcioR0De5W3ahqlwz95YIeVSZIWWluj1hLHTjeWzuYwWf3Xv6gabKIrjnCgY5
 BDd+e5bb+Av/snXQdcTtc3wzwLryE8SAmY7Vw5Moo8AUQ==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id c0f41b47eaf62241;
	Thu, 20 Aug 2026 04:44:11 +0000
X-Mizu-Trace-ID: c0f41b47eaf62241
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/7] docs/zh_TW: filesystems: remove maintainer contact
 information
From: Weijie Yuan <wy@wyuan.org>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Weijie Yuan <wy@wyuan.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260819145808.291567-6-chenyou910331@gmail.com>
References: <20260819145808.291567-1-chenyou910331@gmail.com>
 <20260819145808.291567-6-chenyou910331@gmail.com>
Date: Thu, 20 Aug 2026 12:43:39 +0800
Message-Id: <178720101976.15514.10873442252760640318.b4-review@b4>
X-Mailer: b4 0.17-dev

> diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
> index cda7d0e18b9b..17e12fc57400 100644
> --- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
> +++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst

> diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
> index 88f0e632bfe2..87307a291c8e 100644
> --- a/Documentation/translations/zh_TW/filesystems/index.rst
> +++ b/Documentation/translations/zh_TW/filesystems/index.rst

> diff --git a/Documentation/translations/zh_TW/filesystems/sysfs.txt b/Documentation/translations/zh_TW/filesystems/sysfs.txt
> index d1cee02ef1de..8509776dc3cc 100644
> --- a/Documentation/translations/zh_TW/filesystems/sysfs.txt
> +++ b/Documentation/translations/zh_TW/filesystems/sysfs.txt

> diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
> index 704a0ee44fd2..f3a682094266 100644
> --- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
> +++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst

The translations for filesystems/ are actually *very* out of date, and
miss almost all the files. So, actually unreadable.

Since this subdirectory will not be our main focus in the near future, I
think it doesn't matter whether we change it or not.

Thanks.

-- 
Weijie Yuan

