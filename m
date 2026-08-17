Received: from mta1.migadu.com (out-42.mta1.migadu.com [95.215.58.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78C943CE4B
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975861; cv=none; b=cLW8RdN/Tqi/cAwCRvE/tVTbtdZIpiMfYGv+L28g582oA4kPAAzhmwmb/lFmurU4WqPyXotuxtxCJdMSQHTgA1y34ASbo+yA/7JceRpYMyK/PDnljO/PlNbOIXRXM2RD0R9fB5+Eb1OSAXCx4RIV9SI9L4xy5qLpUM85CQJHKPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975861; c=relaxed/simple;
	bh=XXqAGNjLvsvOgJzB27VxrmutubVrk0AeLLoW9ZYeXaE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fr4s+T+XFQxiY7BDtAi4KvtcZKwuAzytRXzQrZwdEunfoNpnsxnH9qXP69QDiNT3K35LOKkxOC+qCEfzAoGr4/7F4WKoZxTnIHNrj4nH+RO+NmdAzLNlopa3+4FbCjgPzzM6nQTGMrpmPBo65xq2NjnKxJ6jdFo+DEx5AOxB5+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=dw6F5SGH; arc=none smtp.client-ip=95.215.58.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="dw6F5SGH"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XXqAGNjLvsvOgJzB27VxrmutubVrk0AeLLoW9ZYeXaE=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786975857; v=1; x=1787580657;
 b=dw6F5SGHK8J5HFTT+V1zrdNH5S3QawPM70Kcb2CPjkenn4No9xr49TnRUra+oHsEWTnMj75+
 1bdfHnBucV9S9Z3ErMhepPpXsrCNSYy7XSTDD1816A9iJD9U8rwPIkfJi7LNnyU0IpmiNzTLU8r
 cMthyYfG7txsmuxFBkry0NA6MSCggUdYvPElpVSKRVv/dlhFY+D8bXFHAw3SIiGAiapwa7hmY0a
 mY5nEoIlpX8EuHG/tOODRkFwYNUfsNwb7FNAD75MDB7qVJyvDB0t0h9BqEKngoeQpN1Ml4hyA6w
 4unmxy3fn+tyO+bVSjz8LeGRoLaw0FHxOLZUcSbd/Ax8w==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from 1.0.0.127.in-addr.arpa (117.176.242.163)
	by smtp.migadu.com with ESMTPS id 79f62bfc3d0c8854;
	Mon, 17 Aug 2026 14:10:47 +0000
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH 0/2] docs/zh_TW: translate process/applying-patches.rst
 into Traditional Chinese
Date: Mon, 17 Aug 2026 22:09:56 +0800
Message-Id: <20260817-apply-patches-tw-v1-0-c182c1c425ba@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJB4MiVzEsShlkjIGmUwRCu
 DtFl2/x/wbKQVihyjYI/BWVcUigSwaut8OLUdpkyE1+MyXd0Xr/WdHb6HpWjDNS15Ipr+QeRQM
 p84E7WX7LZ/23Ts2bXTw/sO8HB+k6PXQAAAA=
X-Change-ID: 20260817-apply-patches-tw-1fd10831c95b
To: Chen-Yu Yeh <chenyou910331@gmail.com>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=wy@wyuan.org;
 h=from:subject:message-id; bh=XXqAGNjLvsvOgJzB27VxrmutubVrk0AeLLoW9ZYeXaE=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqxmsZB7guk/pt1Kz1zSsHzJnXsR8ta79iQUT952csUjn
 gMd2pFCHRNZGMS4GCzFFFkU855f4HIP2DttRcR5mDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKY6N5+R4UzvfaHlxrtW7uD60i1hYsdVr3VKofxwa2H+28P/zh3xlmJkmOBxV8j
 fT/PgjKarG1ZsY+aNytuRZt1c+Nlh7V6WV6Y1fAA=
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

This series adds a Traditional Chinese translation of
Documentation/process/applying-patches.rst.

The translation is current through commit fa04150b8ef7
("Documentation: describe how to apply incremental stable patches").

And updates the zh_TW process index and existing references to point
to the new local translation.

Link to corresponding patches for zh_CN:
https://lore.kernel.org/linux-doc/20260817-apply-patches-v3-0-45e3bd2b1ccc@wyuan.org/
(There're some RFC in it, please take a look if you haven't)

Thanks!

---
Weijie Yuan (2):
      docs/zh_TW: add process/applying-patches Traditional Chinese translation
      docs/zh_TW: link to Traditional Chinese applying-patches translation

 .../translations/zh_TW/admin-guide/README.rst      |   3 +-
 .../zh_TW/process/applying-patches.rst             | 377 +++++++++++++++++++++
 Documentation/translations/zh_TW/process/howto.rst |   5 +-
 Documentation/translations/zh_TW/process/index.rst |   1 +
 4 files changed, 381 insertions(+), 5 deletions(-)


---
base-commit: f579e7e851f13365d82f2caefde9ecd548da8518
change-id: 20260817-apply-patches-tw-1fd10831c95b

