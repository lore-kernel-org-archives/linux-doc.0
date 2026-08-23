Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB43C7689
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469346; cv=none; b=RZOZtto+EDMp63cMe9xlFodOD9w4NP57psstZq2BLAhEVDaBMhmlaIp1Qz+oaYPSCtUQKDd3uNcJSCN9LmTmtjJx5pWWbdQiwA6UiZFDZbWr7NMotm3JwF/lE1BxEm473YgRJ6X0kJmDp+AqPj+2DEvidd7LW4VM8Hukw+s2ppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469346; c=relaxed/simple;
	bh=47hHxqsLHgwrz7E8qdpY0bnAmDZvtZmAEIICCBjwN9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MM7SBT7VwnyjAS+thG2lEXnw5GI0BFjlUqYhzKcxBy3cX/2JHJPff/yt7cqM/frNjp1D2zdgf/Be136jG1vVjacwSlKQnM3uxWvjFCmN82oMRvd6ip/cSAYVksCGek8mz1chwytojzd7D2mpcaXRO01SI8mYaDZvAEca35+hS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=J8vzm7Zu; arc=none smtp.client-ip=91.218.175.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="J8vzm7Zu"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=47hHxqsLHgwrz7E8qdpY0bnAmDZvtZmAEIICCBjwN9I=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787469342; v=1; x=1788074142;
 b=J8vzm7ZuJrM1ETjemXBzk4Wb1ocNY++lhyDIH/Ckmkk/pMVOK1rywRmBRDmA2yVvCdL5oBsP
 0vzousxFgMGjyAqHPVNJW9ZN7LCm5tUuw70J5FdEy7HYV6hiWcVKhUPmxJy06RIFuyo+rbJ2ai+
 kf9AFcPT9s2FpHTTfD5Q8NFoUGbKYP+IavF/RHvUWu0JNee51lQ3vOxCk4l3ftXLFAYeJCiuGYf
 1dDSqfainRcXGaxdHKO625LOh8p2rKlXSOJdsrlRdB4fRvoaM4112GlXjz78GacC9aOYy+Wvq46
 k6a9xEyLwKX2OWCuYYySnqWkHwBRXCcs4sV3/+MYQO0Ag==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 49e833447113b149;
	Sun, 23 Aug 2026 07:15:42 +0000
X-Mizu-Trace-ID: 49e833447113b149
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sun, 23 Aug 2026 15:15:01 +0800
Subject: [PATCH v2 5/5] docs/zh_CN: remove empty proofreader field from
 maintainer PGP guide
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260823-maintainer-pgp-guide-v2-5-bea33b2ece54@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
In-Reply-To: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Remove the empty proofreader metadata field from the Chinese
translation of the maintainer PGP guide.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index 79f8de3c1f5e..4ed311cf7d8a 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -7,9 +7,6 @@
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
 
-:校译:
-
-
 ===================
 内核维护者 PGP 指南
 ===================

-- 
2.55.0.822.g20453c30eb

