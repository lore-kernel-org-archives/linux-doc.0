Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6207192590;
	Sat, 21 Mar 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774103170; cv=pass; b=ZCYJeZv9j8tVrHjzK8x9zQmh7jYTxilPw6apLIcE708QqHSFway93NDPxubpVRDZcYuj6TU7UDSvMJlzTQydacIcwXYHBCLiCusUd2LpFZGpNf8pa35DCVo2OJ4zROlp6ZCCfFSZC2QQqPdjNibRMfSaNYz9SB3FuokTkMgkIEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774103170; c=relaxed/simple;
	bh=+MNG9jlGIAIV9Tn7hN6RXEm8Iwme0+cpep1M/vthQ5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K4+puKazPh5yGbueQ7ksy6njne6zKAzBAfV9NLFAgnuz2HweYVmooObD4GBK6Q4vMGYvjHm0S2fbEUM/5lt+tXNCJLQ5LlBeKXl4UC7Wo/dwkMJ9SJv49PZwIHwH6/X2w3ygJpExEMngHGCdsXrocD7jpQvqHP7O3zGW5z6xzUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=IgxUleyn; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="IgxUleyn"
ARC-Seal: i=1; a=rsa-sha256; t=1774103164; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aTRM0kwzgk5bNenkoxBfBsSYtSyZw2KBOa6wKFkWTp4MU8HDhZN1pVVrVPgq6D/nhxFuoe8EVSM1c1qz7Br2dn4OItwjXKfZWyzjRQruYuP396hsHj+rZLIOJowMS7rn2vRW1AxUTtXp8mzcP4A6uVvNuxtxXp0DQCVjbR4cT38=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774103164; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WQfrslJGZgFSspUQxm6HKLJLi5aE2hGZfBDUqOT4H9o=; 
	b=CgPUkV67j7SLRkK56OMrl0tPWkilPzNF1iQcHfqw7uaYgK0PHWYTAJZC3lsguvRd7tCbeT4ut4pplRyYHogZvQ6emooc2aUqH4123kse9Q+bfHCqp83pymONfHpd0boIQ9zxR48ibNsMKzeS+sivXQ/I5MWfODnyEr6rbQI5gpQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774103164;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WQfrslJGZgFSspUQxm6HKLJLi5aE2hGZfBDUqOT4H9o=;
	b=IgxUleyneTGjPFffhJE4cN19vnAyi+D/tQQs5J9gMRMpHxZla8suWgiE+hFQZRUy
	IPVa6H1MGA6yMc8gBxmNWjV7tVrxhYNLOZp2O9o5cmcbHajtpX/9jvfenpYV9ErQWQ+
	qbP5HNtzGcxkwUF4CQ5AGgxavDCRb8cmupTfWjWQ=
Received: by mx.zohomail.com with SMTPS id 1774103162712678.6700561722021;
	Sat, 21 Mar 2026 07:26:02 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/1] docs: examples of pages affected by C API signature overflow
Date: Sat, 21 Mar 2026 10:25:58 -0400
Message-ID: <20260321142559.26005-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
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
