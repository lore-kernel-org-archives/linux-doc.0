Received: from mail-m19731111.qiye.163.com (mail-m19731111.qiye.163.com [220.197.31.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9844C94
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 02:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738808825; cv=none; b=QD0g/X3NXTwbcvQEqa7hjSW8MranW0N/IDCs/fZIJQ3Szs/o/lEu4tCY0+CBFr2q+JDhBYAWdetOflm86aSfdKMA7p+IWISH8rfOuQPlIVYH8ygOxCDoRm2CdjYJ+KHDuDTEx0MkrpfmiFrq0eIK0x4KNJM+cvcO5u4em4Xj1Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738808825; c=relaxed/simple;
	bh=qp2/ztRcBHP8Hk3jVPelmLwKPSiTEnVWCn0wRCSpeUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qq+bmiZabQp8wp+EmZfIaqPCnGTJyVbXDZFxQwq3TDSRDN0baV8i4GW9vaaZoOU0Sgir1c2BzGVrEDI/EM7qgu+K+zI++5F3SXgOYRgIlMnreE1I2iu0HRtgwhjZBE4+VJhrxifOg77sVHkM12Ug71ZIuuGxGWccIwUNOnZ3skQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=crRawtTW; arc=none smtp.client-ip=220.197.31.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="crRawtTW"
Received: from localhost.localdomain (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a46ac7e7;
	Thu, 6 Feb 2025 10:26:56 +0800 (GMT+08:00)
From: zhangwei <zhangwei@cqsoftware.com.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: zhaoshuo@cqsoftware.com.cn,
	zhaoyuehui@cqsoftware.com.cn,
	maoyuxian@cqsoftware.com.cn,
	linux-doc@vger.kernel.org,
	zhangwei <zhangwei@cqsoftware.com.cn>
Subject: [PATCH 0/3] Translation self-protection.rst into chinese
Date: Thu,  6 Feb 2025 10:26:45 +0800
Message-ID: <cover.1738807847.git.zhangwei@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBlMVktKTUJNTU1ITEgdQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94d914f32a03abkunma46ac7e7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MU06Cyo4FzIVOAkpEA0NUTU2
	FDUwCk5VSlVKTEhDQ0tDQ0pMTUhNVTMWGhIXVQETGhUcDB4SOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBQ0hJNwY+
DKIM-Signature:a=rsa-sha256;
	b=crRawtTWiPdLYyPrynVtQnckW1wrFQc5dFuoPr3Lc8jpB2JisfBo9UpVOcWgWX+I8SPzsYn0zpep0Q++UPeo4oIkWfb2nTMGyKxsOXdQrsqZ/Lb7w6JGYby+JTLeFYdKAtymgUA81W2MIGFfxsM3OvYnqsbFVUiWVzFnQM47fjs=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=j4lhdAMNV8RE2lDEp2nGByvkoQxnOjqBB9tk13RyH6U=;
	h=date:mime-version:subject:message-id:from;

Translate self-protection.rst into Chinese
and add index.rst under keys and secrets

zhangwei (3):
  docs/zh_CN: Add self-protection index Chinese translation
  Translate .../security/keys/index.rst into Chinese
  Translate .../security/secrets/index.rst into Chinese

 .../translations/zh_CN/security/index.rst     |   2 +-
 .../zh_CN/security/keys/index.rst             |  24 ++
 .../zh_CN/security/secrets/index.rst          |  18 ++
 .../zh_CN/security/self-protection.rst        | 271 ++++++++++++++++++
 4 files changed, 314 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/security/keys/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/secrets/index.rst
 create mode 100644 Documentation/translations/zh_CN/security/self-protection.rst

-- 
2.47.1

