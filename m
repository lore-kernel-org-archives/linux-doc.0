Received: from mta1.migadu.com (out-166.mta1.migadu.com [95.215.58.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414453B19AA
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 06:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208235; cv=none; b=VI6Nl3r0cRxfquHGzXgqOWnERmqQde+4S/TWaA0OQGRG0rIvR2QUHmctRFbuyTSzDiM2PF5gdUhepJTa7SA4FBpDx849/GvNIiS2vpdydVZuHPWjGz0HhHNVXBJ53NlxSJ9EDGVXajXbB9d5ZscULSavVIkgQNZm61TE5WdXokU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208235; c=relaxed/simple;
	bh=40f9NaOqUlVQGjWOjtSlVsBKADds3FE6KsPKN5tgbZ4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Pm3JGOkL8XcOJGSGgFqWILUx9jG7QN4bx25tc4EVE7kRuUtv4Flqod/rkvPp691VYQ8DP137prcT8f90f+36LLgbcRbAfhWx6Q8xplRgUf4YRoqUNu8pr1QyzpDt3ffN3qMW87O32ZajHd/NDnEn7culmF3ovP8DhoandauUxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=wRjVbcuf; arc=none smtp.client-ip=95.215.58.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="wRjVbcuf"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=40f9NaOqUlVQGjWOjtSlVsBKADds3FE6KsPKN5tgbZ4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787208231; v=1; x=1787813031;
 b=wRjVbcuf1Whgr3u/Hzghxo8tQ7t+dvppZ235Ai3nKQlJmWPyXVu9P+MEKEptrl/GWwBQgOPt
 59oIUlaSy4WkU+3UKDy24DCxWDjSYvM9CsOLq2+xQMtbULbn1YTqmPGV7jlAOp1NXgC5W3m4eDC
 fm/zFMY2JevQFwWtcksKSBQszq5r8E1awvwE2d8uhEyXtUwnZOSzGzqdXrf2yRjEB/EDzyh6vVR
 bTIqLYxPz6VCT6mO8UA7y4upEhCQfh9RM3KhGW2OYm18aQBbc4RdPl3KOZxq0/ow4Q+2hSCXYSf
 UXztVoYXgwNICqyG23AwqKGvV3aaTUZ91kZoFSTmztJpA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 5c51ae7c37589f93;
	Thu, 20 Aug 2026 06:43:51 +0000
X-Mizu-Trace-ID: 5c51ae7c37589f93
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/5] docs/zh_CN: Add Softnet Driver Issues Chinese
 translation
From: Weijie Yuan <wy@wyuan.org>
To: Siwei Chen <anka@stu.cdut.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wy@wyuan.org, 
 Siwei Chen <businiaoanka@anka1.top>
In-Reply-To: <20260817021340.17318-4-anka@stu.cdut.edu.cn>
References: <20260817021340.17318-1-anka@stu.cdut.edu.cn>
 <20260817021340.17318-4-anka@stu.cdut.edu.cn>
Date: Thu, 20 Aug 2026 14:43:27 +0800
Message-Id: <178720820740.15514.6673190672007432287.b4-review@b4>
X-Mailer: b4 0.17-dev

On Mon, 17 Aug 2026 10:13:37 +0800, Siwei Chen <anka@stu.cdut.edu.cn> wrote:
> Translate .../networking/driver.rst into Chinese.
> 
> Update the translation through commit 96fbe161e402
> ("docs: networking: add guidance on what to push via extack")

Reviewed-by: Weijie Yuan <wy@wyuan.org>

-- 
Weijie Yuan

