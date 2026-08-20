Received: from mta0.migadu.com (out-52.mta0.migadu.com [91.218.175.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD047CA74
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246029; cv=none; b=ofbhbIwA9cyxVcRgIRoIhDZM7RwfGmTbrh168t5F2B3PgwsqfNekh+qj8SucPZpdvmFwGVs9+/Hn6tDs85eiDND7L7vOVQAWGlscZVTi/HjjtTU8vd3kZ93RR9zT68RU1qreZbETHNWON07n78kHyJ2RXUJAIacgzqthlivDrMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246029; c=relaxed/simple;
	bh=FmaaeFj19gNFUBzKxBnQmldMdUaWaNiKclImki509lc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DnXN/F7+56VRXBW9PlNjBtMKKVsTqczpIHrwf0qWVHC4qzFTuB+nj8m2jt/8v4un3yYRwemHztYf1+iF8z4rMAQzkzZG9aJVg9sF8n1ZnO03PI9I6QT9mm9jyDC4ithkSdQ93hneDvPJ5ysl65CqP+Nqx1EooXmzh3pnwby0jL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=HIon+nKq; arc=none smtp.client-ip=91.218.175.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="HIon+nKq"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FmaaeFj19gNFUBzKxBnQmldMdUaWaNiKclImki509lc=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787246024; v=1; x=1787850824;
 b=HIon+nKqC2+2KqnliRDEDCxaEt5iCNeyCY0kO0iM7ElJF0fCVb550rV845i5mGIh4kuBdUim
 kg8k6WXf4M5KrCIS9OBOaWVMAxQPkjZanbzaZK8X3gaqCHY8PSYvnNc2YDi6r79P/BXTHMHT8Tz
 zj/KTxIU2z6hcp1huZo6b1fBNYRTsOJ8MSydUhbVYChyHSCfEr2oc/U49o7jhWnRLbxqSjasX3w
 GiTqk3DWx5Tkwf3QaMk6IQRj7XvyQ0ABOe0gITjDrH0W0uxqkp1IDpHt/4GZs/h+dB6gktPDMhg
 97tJuSr9bUM0ECCt764G3G2wqNscS9V0oobGhQP/QSV7g==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 2f40f9169aff251c;
	Thu, 20 Aug 2026 17:13:43 +0000
X-Mizu-Trace-ID: 2f40f9169aff251c
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH 0/4] Update maintainer-pgp-guide.rst Chinese translation
Date: Fri, 21 Aug 2026 01:13:19 +0800
Message-Id: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBCF4auQWTsJEEOqVzEuKA44TYoEsDEx3
 r3ULt7iW7z/hEKZqcAoTsj04cJbbFCdALfaGAh5aQYttZEPLfFtOdY2yphCwrDzQuiVH4wyvfP
 WQrumTJ6POzvNf5f9+SJXfy24ri8bB9sheAAAAA==
X-Change-ID: 20260820-maintainer-pgp-guide-f1f96164cfaa
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=wy@wyuan.org;
 h=from:subject:message-id; bh=FmaaeFj19gNFUBzKxBnQmldMdUaWaNiKclImki509lc=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqx20z3H/K5sMTHN2VYqtPlMu446a3yC54yJM6/nnZSYL
 X+mf8OtjoksDGJcDJZiiiyKec8vcLkH7J22IuI8zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFP9VJ/hF9NJq9x17rZHxLfcej37Tuz7tK/HWM6yV5fM971yZ7J3xSqGfyrV3y+
 8+fk+WMO0K11tiY3jw4aVLVqce6ub5reEJHy+xgMA
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

The script says:

$ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
[1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
[1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
[1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
[1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
[1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
[1787244823.779522] 4 commits needs resolving in total

So I updated this document in chronological order, created four patches
based on these four outdated commits to make it easier for you to
review. Hence, you can freely squash them when applying them.

Tested with make htmldocs, no warning or error made by these patches.

ps. Jon, I have a little confusion regarding the license identifier.
Maybe you could take a look at it. Thanks. But that's not a big deal.

[+To: Konstantin, as he is the original author, thanks.]

---
Weijie Yuan (4):
      docs/zh_CN: update maintainer-pgp-guide translation
      docs/zh_CN: clarify free Nitrokey requirements
      docs/zh_CN: update maintainer-pgp-guide kernel.org link
      docs/zh_CN: add kernel.org trust repository reference

 .../zh_CN/process/maintainer-pgp-guide.rst         | 140 ++++++++++-----------
 1 file changed, 67 insertions(+), 73 deletions(-)


---
base-commit: ba839bfe38d0ac2d8cbdc1272e2408dc35dafa6a
change-id: 20260820-maintainer-pgp-guide-f1f96164cfaa

