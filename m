Received: from cdmsr2.hinet.net (210-65-1-144.hinet-ip.hinet.net [210.65.1.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39830433B3
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.65.1.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758429112; cv=none; b=mX3lMv9Y9kAlF1SZFKo+p1HWrouKB+SKBtPCRnGNkH4NcWYxeLkLQg3kprI/3BYGkry0KAPwxFWETJ3XB5mw5r5murUUkFMCu56W/RbEoEavUiQtmgBSYQRBO6oPuNsa2vvseQyXnIeGsIlCGn9iC8j/kEyZbvsqAiwL1v2RI/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758429112; c=relaxed/simple;
	bh=plcqq2DvXYkjzDxZO3TACzWk1K1BYwcZr+Qu7LRPo5A=;
	h=From:To:Subject:Message-ID:Date:MIME-Version:Content-Type; b=t2IsPM8j3+uLA0yI5nIF9bXjHZOI4XnQDbVMnP2DsW1GlD5Miu2mIEEqVPbKksXH8cxbAZz0M4laIi/77D5TIv3Vk+64rvg30KNN4+qxVF97wP32btxrLoBdzaPr6w+EtjmwqY7GRjWlx3CsgWcS8YGObTQ3R77FvhIhxHbr7sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net; spf=pass smtp.mailfrom=ms29.hinet.net; dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b=HwOUD1Cq; arc=none smtp.client-ip=210.65.1.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ms29.hinet.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ms29.hinet.net header.i=@ms29.hinet.net header.b="HwOUD1Cq"
Received: from cmsr5.hinet.net ([10.199.216.84])
	by cdmsr2.hinet.net (8.15.2/8.15.2) with ESMTPS id 58L4VkG4196540
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 12:31:48 +0800
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=ms29.hinet.net;
	s=default; t=1758429108; bh=jsrCQst/YC3OGEye7w9T06hmfXA=;
	h=From:To:Subject:Date;
	b=HwOUD1Cq8Iin/h4zj83KQ6gw+2l5D291JKYieokf+zVMOe/8AgcUKKac/i5AIITz1
	 l5zUq1RVxdZhzQg3bbi17zz+QWJ6HjL2KrqfBd345IiS5Humh07bgreqi4rgKdTPL0
	 2mYQJaIICYbtJzrpyjN9BGqoqAkcMY0B6bCN+j/I=
Received: from [127.0.0.1] (36-239-124-102.dynamic-ip.hinet.net [36.239.124.102])
	by cmsr5.hinet.net (8.15.2/8.15.2) with ESMTPS id 58L4Nd2C703088
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 12:25:46 +0800
From: "Info - Albinayah 303" <Linux-doc@ms29.hinet.net>
To: linux-doc@vger.kernel.org
Reply-To: "Info - Albinayah." <europe-sales@albinayah-group.com>
Subject: =?UTF-8?B?TmV3IFNlcHRlbWJlciBPcmRlci4gNDc3MjcgU3VuZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMjUgYXQgMDY6MjU6NDQgQU0=?=
Message-ID: <e03c6b13-d497-011b-d54f-abe235a44798@ms29.hinet.net>
Content-Transfer-Encoding: 7bit
Date: Sun, 21 Sep 2025 04:25:45 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-HiNet-Brightmail: Spam
X-CMAE-Score: 100
X-CMAE-Analysis: v=2.4 cv=X8PxK3Te c=0 sm=1 tr=0 ts=68cf7e4b
	p=OrFXhexWvejrBOeqCD4A:9 a=uOCXUd7ZQqfqfYBohqtHNA==:117 a=IkcTkHD0fZMA:10
	a=5KLPUuaC_9wA:10

Hi Linux-doc,

Please provide a quote for your products:

Include:
1.Pricing (per unit)
2.Delivery cost & timeline
3.Quote expiry date

Deadline: September

Thanks!

Kamal Prasad

Albinayah Trading
