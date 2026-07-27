Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.124.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030218C2C;
	Mon, 27 Jul 2026 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.132.124.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785114078; cv=none; b=KdIFNgy16MzU00+/dcI3ab0XgAAMQQcmwDvZXd4RbQJjCSpnIBBSiSpkdNvRcSv1PzNWgHtIrY9VExTs0PYOopzUwXd4JgMWGt/Qx8TDa6r8UgvgD4ph/M/tWZIXvLn2IdLUZW8IuDUmltf1MeB6QQUFyamwI2ph4RRBa8Dojkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785114078; c=relaxed/simple;
	bh=El7CpyBKBnAv94RLMeWoZ0HhO6+bYPYFOiH1b9N7Bd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sct4O+YSyyoK8ghOVBVkvjDiaqRlza96KKUzxvJuMqQf+RoKnbm5Pz21Je6NpaR8AuOOf01LbhYzOjuC4LJ8eYEPx0xN2OREWW5ObfYksrtgoSXhRRoXGpwxDnSkc4yIV/lF1MJGkv35H0KEuJ48mzgyGqR/BIIdtY5/2NYNIEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; arc=none smtp.client-ip=114.132.124.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
X-QQ-mid: esmtpsz20t1785114014t8dcf5f46
X-QQ-Originating-IP: sPknp0rBKMMI1vwaVXdXk6TG11xGLvX9xIwerMChUK8=
Received: from anka-20eya00ycd.localnet ( [182.139.167.230])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Jul 2026 09:00:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15942914350571320713
From: Siwei Chen <businiaoanka@anka1.top>
To: Weijie Yuan <wy@wyuan.org>
Cc: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 0/5] docs/zh_CN: Add Chinese translations for five networking
 documents
Date: Mon, 27 Jul 2026 09:00:12 +0800
Message-ID: <54B9FF7CF7DE776B+6294277.lOV4Wx5bFT@anka-20eya00ycd>
In-Reply-To: <amYgxGgd12VricV4@wyuan.org>
References:
 <cover.1784866896.git.businiaoanka@anka1.top> <amYgxGgd12VricV4@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NrdcSSbhenTUjo55adpgFRpP3Qj/owZB46nlM+jdw0278zVi2Zu15vu6
	820I/AxM8DkTu+9alkqYmI2J5BpYcjPgJrRdPEpSsa7OMl140uWNoSGegISPkQPAbKyHUeu
	JLgQKpqfJwr616pVgd/XpHEbbrJMoCuNxPuB5+UCTs/8GjI0vQ/KLlgB0H2SYImQRQIpYtN
	zuHhsBb0GmnhdWShbX07ABWdF0Ex0DwSqlQLE405LxSNZKzIawOR+6k4NUFAyvZZcwmNWHN
	p78nNrtCLqzMVmxgciGFTaZdEvx1WvS+gAtVGAqg5e61xADJ4gg72UKxZId4HbQAFhYW+50
	fVQnuV2hTtpf+KwVutQOXZLPe94H+Fgsknz0dLAObwyxbVnPSW87WYiba2cCrQy3I5eC/z/
	skQO8s9yKwVBavr/Ee70yMRUcXch3ivdx48onl/K9JjL8E3a9fOcwrD5bSAmI1QkVeBBpHf
	Vk4+UwDo5KLSsssTxtBRWoC5TSeB5PxfiDVpGys88R7AGAxaLF5aiSq95mSy04BQYwD9mF2
	ngLPuxRaBCH7pxillJeN+sQCrB0j7m1ao/WVCY3hDS5p2BeTI92vRJWUcuGGDiwhG0zrazh
	M4jb+MDDAmB48HcVsOej6PpOWe5GQLLJcCOWI7kq3eqnBAGmPZQCFbBF6YVAulPGnBPhApp
	nWuYiqjjlIBmaYrUOHNX+0IjMxahaO5vTuxc3IHzbQCFca7BRSKB3f0+nRoe0jrzRYmh3aF
	7C0fr9k8eQsmgmG9JTaw+BG6PxRtj5DshJYI0N+JEe1kw+wZPee7d8RkEXfXGOSxEunPgaD
	LBh/cRcUE8MpdVX3La7xbxUTMX5Z+LBIqxvh/FujYmSEFiEWPOSnk/Iq8+azl/BeGh03hce
	4nSmUFZd0RWIlR5KvYzV0/sVwkJ2im0xq+CWARQuIk/Cj9cwFHEkfQCiEwcZ5E9raqn2OF/
	aLKdjXujkPK/Bic1/AmzGEDOIOES410W8kgU/zhSubO7jUQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylWR1A4xI9juj8FskTeQJjw==
X-QQ-RECHKSPAM: 0

5ZyoIDIwMjblubQ35pyIMjbml6XmmJ/mnJ/ml6Ug5Lit5Zu95qCH5YeG5pe26Ze0IDIyOjU5OjE2
77yMV2VpamllIFl1YW4g5YaZ6YGT77yaCj4gSGkgU2l3ZWksCj4gCj4gT24gRnJpLCBKdWwgMjQs
IDIwMjYgYXQgMDE6MTM6MzZQTSArMDgwMCwgU2l3ZWkgQ2hlbiB3cm90ZToKPiAKPiBTaW5jZSB5
b3UgaGF2ZSB1cGRhdGVkIHRob3NlIGZpbGVzLCB5b3Ugc2hvdWxkIGFsc28gdXBkYXRlIHRoZSBp
bmRleAo+ICh0b2MpOgo+IAo+ICAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9uZXR3b3JraW5nL2lu
ZGV4LnJzdAo+IAo+IFRoYW5rcy4KClRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyLiBJIHdpbGwg
YWRkIHRoaXMgcGFydCBvZiB0aGUgcGF0Y2guCg==




