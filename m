Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6863AA518
	for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 07:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200397; cv=none; b=T+36k3W7932rifx4dXHN4mqynBL7G4z2DTi0b/2/oDvtBqJGmWpP2tr33cikocKFmvWEJF9LUfqMKP/s2Yv0YJBqw5cpIidzMlcMRIlYNM8c6zGvAThi0xJf/eL8wxg1JhqWJXF6zq+VM3Osx5zSKw2VZXSWGXAuMDccJVGWqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200397; c=relaxed/simple;
	bh=qVn+rwb5KyFPeYz6xBY7beuHeGWfFjnKWRlO36M0ttE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WNWSpYYNO37BmF/pL3dXklZTdrpBMagnVheAPbjIyEQPCVrbq7octIyYURiFjYEAsrG8UtEqXfQfd7SVpU7EPGJH5zpm/DVNUkFuWgOha9qC0wHmtEAmhcOMSEc3FgRXtxyAbgwnPBucDPv2oONNSZ7Mkw1UF59ZrQC4gKsk5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top; spf=pass smtp.mailfrom=anka1.top; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anka1.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anka1.top
X-QQ-mid: zesmtpgz3t1782200375t2aa7772c
X-QQ-Originating-IP: jM8m0XFiHj1YTKMyEnZgroPrMPM/yp4QrqBLkkKKqgM=
Received: from anka-vmware20-1.localnet ( [124.161.135.51])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Jun 2026 15:39:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11745782095731486502
From: Siwei Chen <businiaoanka@anka1.top>
To: linux-doc@vger.kernel.org
Cc: si.yanteng@linux.dev, dzm91@hust.edu.cn, wy@wyuan.org
Subject: Issue cloning kernel-doc-zh from HUST mirror
Date: Tue, 23 Jun 2026 15:39:33 +0800
Message-ID: <4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:anka1.top:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nt9LS5Tya5fqqRPuYkO2oc1Q5p+3hHkEWHLhXko9Tg5sNZYedgnc//Rn
	ESxTSuTlL9628iCFjDdTRrZHDG9oUCUEQHWa53/cT46nmSMjzpyiCA3kztnn5gjgyJzsFah
	rhutaifHfNa+W+FRTUWitBaMj7Oa4wQPVCdm3eBbtgUKTd9Jdm6EyAtacWL4v7GLtZqBIvS
	IFScSEcFBY9s/IRo+jLlMpQ1jm1NWFbKochbhryXkDdTsg/Xks8TKrTzEjULehGvl8J6nc4
	nHSUJidgTSSe1yG2zqYvPtwWkwnP379Ynk0GFNwzmwQWqI9zmGMMtMkw6lJrqixVR2bHFg6
	hXlEO/pG9WgRMQZZP1pJC+EPk3Lb6BKi5H+AvTRU7I+aANfkag4raknK4LRosGJNaNv9+dk
	tH/pxzO9zKSBiUfRI2CjF9x4LAE6GfZ+6TARmtwgMEZprLOK+TyPAH6OWdy46AAXiIImX3n
	FCZ+Yi26lrTdJw/hqAOLeLTYG2NpQUnzrFL8Yw+t6tjutMS7nfI7CxnsEBGy6QVBEQUcO4v
	KuKXxDPECr1ArckiivD/795hw1zGJvE6PkJO4zrHB48oebs4eViKukqmMCdb6WnyEIhtO1s
	hYOV6FCP+Fl9x1v0SxuqPWXndmqQlPLQ1Pp9Wtu5eLZA1RpGB9h14+ZigdYn9vNlU3+pmqN
	cAL22p8kaYqVaAr9mH+DsGmZaTYGWi9Px4Gh6fVLTvj4CY4B5xuncXPxccy+Qt26eYF/9yh
	IZxc+oc7Gvf5A+YZsLNT95+84FP6gh4Xo8976eVmSNCMuTHg0mhzd7QKvb1XiJGJDQ86YQD
	+Ls2FnclahCvBylMmYBJcN8zxy/tSP/Z7590TFbjEcF9/HQo55mgg3mjW9ecpcJ5zFs04Ax
	WTpCS69SgDM186ke0ioYJSrRh2+0FrC/qF7EBThQVcg39gca4STls3Q+0hhuiqzxdfRj1kN
	dLxx19peThiqOs0J6buLWd/TufzE5iXJ4tr+11R0ZZNZvm4qikHyhVNkM7SfqvWljyyPp2E
	YCTY4+Q2VmKZKPE0R9kCwLBIJAdxv3ONyNprBP3Icah3m2ugKUaEXf5Pb1QdkRbn4Zl8usq
	A==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hello,

I am following the documentation at:

https://docs.kernel.org/translations/zh_CN/how-to.html#id3

When trying to clone the repository from the recommended mirror:

git clone https://mirrors.hust.edu.cn/git/kernel-doc-zh.git linux

I consistently get the following error:

error: RPC failed; curl 52 Empty reply from server
fatal: expected 'packfile'

My environment is:

Ubuntu 26.04
git version 2.53

I have verified that the URL is reachable from my network, but the clone 
operation still fails.

Could anyone help me understand whether this is a mirror-side issue, a Git 
compatibility issue, or something wrong with my setup?

Thank you for your time.

Best regards,
Siwei Chen


