Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629B9C14A;
	Sun, 22 Mar 2026 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208271; cv=pass; b=ICbZmk8I/oIMaZ4m7eu0ujfBf27hMt+kMQO1G3iJV89WU/HmudvdBam8cdUQHn5ucp1ESF6gAOVjoTXvDzxqxNvJlG3BxmE5x4+r2v67jU26nbNrsf4lRTHkGNS+dmVXQ71n8AbYB6gxF+WqzNsy7cBT5vVZzMgcEPjk/M1DdPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208271; c=relaxed/simple;
	bh=+MNG9jlGIAIV9Tn7hN6RXEm8Iwme0+cpep1M/vthQ5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbm9vLRWb9wMypblCF+WP6E663DhLLoR92ox4OnYAnw6z+l8RRlrqh+yGgOVfv09LT/eG8fc9cs9PbM3T6EOohmYuMn+QNF5zNCLmEOEVdVuH+BDSr6qZ83osj6tGL9aa9V0O4oRxc5suALF921b1OgiZRH1cE4d16eZn1pjYe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=OGpjLSnC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="OGpjLSnC"
ARC-Seal: i=1; a=rsa-sha256; t=1774208263; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bpZSBPqJLuvrFMxUqWt2TzVCof2YtLZDBHNCqWrMZNVNmFcLiJUjvlgli+B3hnvdCZnBB4HA6TjRyYnRx6F7n26V3hQKOVXzCU44x127c6pIYmDgyOv7G2lyPPD/MmeqjIHv8XwCxWj9Ji9T0GrWXL9YkiuicQj5hRSsu44Q+fw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774208263; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WQfrslJGZgFSspUQxm6HKLJLi5aE2hGZfBDUqOT4H9o=; 
	b=Du65MRVYxiTklGMw7xEeNzCOzXBtv5048K9PxZJTYtkp1agFh1YL4W6j3Qs/lf1Wl4/ysowZsbZV+CLStvT6RQJ2TIcynd9v0GFqVy8dkDqaemFqaRVlgk+PT0bEWbKWsaAopv84kHVbjfRs7ZZO6suiyTWfS/kn5DsgBlO/iYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774208263;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WQfrslJGZgFSspUQxm6HKLJLi5aE2hGZfBDUqOT4H9o=;
	b=OGpjLSnCQAr0hEJnANNh6X4tWC/jz/2n2k9SCZ/u8b6DR873Yvmx8ockeqGNHBvq
	rlhcn2RWdyTRsAKVf+HiyaEP+Th9Urg9Oe0MEd8mPCYpRXDtkP6qJkYR9/z0WEdSwvp
	6HI7A4WJ6CI1ReMTXiikKuZKjV+wA48X/MvO5ngg=
Received: by mx.zohomail.com with SMTPS id 1774208261551749.2992379150218;
	Sun, 22 Mar 2026 12:37:41 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 0/1] docs: examples of pages affected by C API signature overflow
Date: Sun, 22 Mar 2026 15:37:38 -0400
Message-ID: <20260322193740.68784-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321142559.26005-2-rito@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages on docs.kernel.org this patch improves:
  core-api/genalloc.html
  userspace-api/iommufd.html
  userspace-api/liveupdate.html
  core-api/liveupdate.html
  arch/sh/index.html
  arch/x86/sgx.html
  devicetree/kernel-api.html
  userspace-api/fwctl/fwctl-cxl.html
  driver-api/regulator.html
  driver-api/reset.html
  driver-api/s390-drivers.html
  driver-api/scsi.html
  driver-api/spi.html
  driver-api/target.html
  driver-api/wbrf.html
  driver-api/wmi.html

Rito Rhymes (1):
  docs: contain horizontal overflow in C API descriptions

 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.51.0
