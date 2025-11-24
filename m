Received: from mail-m15579.qiye.163.com (mail-m15579.qiye.163.com [101.71.155.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D9C3043A9
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988340; cv=none; b=fQEBbur+IInkPOP9vQr49eKZMKbGWf2rL1YGeevie0ofxrBGsiZrZimQKJmijYWFNUvdY4TOm7E3V+nCnvZ3SyyKNRI1SjcjpuOAVZLOR182ZQkSG5WdVEFGJJrsGvTN4K5rHEnjcsPnkCp2vi1CjJJf+Rfy+dXq7OOiAeoRS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988340; c=relaxed/simple;
	bh=D8d2AxiweX8gQ1VJCYyd1EHV62Udp9Q/5YMcfhTwrhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyyRGbrwavZpndjGn1/cLsyMY+9SkmK6SEhVely3UuIZIUa8rp96k3IhVNxssIXbSgARDLQ+s/p2YmfI+q5CeR5EodY6fm3npJCQBCRPTKByR4tLvs6d6lKwNyXWF+mZ6BYfCSRqrO+Yo2CxFWnMNmWDwh8aIgp4eManqqvezrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=IJOP+pOj; arc=none smtp.client-ip=101.71.155.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="IJOP+pOj"
Received: from server001 (unknown [222.130.22.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ab1b748b;
	Mon, 24 Nov 2025 20:45:31 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: seakeel@gmail.com
Cc: alexs@kernel.org,
	baikefan@leap-io-kernel.com,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	si.yanteng@linux.dev
Subject: Re: [PATCH v2 02/25] docs/zh_CN: Add acm.rst translation
Date: Mon, 24 Nov 2025 20:46:03 +0800
Message-ID: <20251124124603.33042-1-baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <9d08e5bb-7cbb-4117-a132-652072a68024@gmail.com>
References: <9d08e5bb-7cbb-4117-a132-652072a68024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab5e5dc0b09d5kunmd296af0136519d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUMfVk1DQ0JIS0geSBlCS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPT1lXWRYaDxIVHRRZQVlLVUtVS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=IJOP+pOj3duqtv/TASD4+o4zc4Bi0NlSiLKodY+03SbSkzhG5CreiRItnHI6uhZhXqsEPm7Mn6kS3hhXbeQpxPgBQZPD/p8RjArvQEXWH89UTf05sFP5LBzx7OXAgW/zmQM8t8seuEq/S6m3Q8nTVyIx1hdnnqiGKF4mko9A23+kKFTge3lFIE877D4Ba4m5Wx52P4F38M2hIQ+noG0bZLr2+GJnWHZ6/QuSTjxU4/uqxhoCxS4oX8b/p2sTuOg3niLz14HiwFBhsgJ4cK5ox1VZWCWMdRl3NBXDaIesN+zKu00upICFUXjxICOIH33Be5U0TYmO5zxX/oWI1dojXg==; c=relaxed/relaxed; s=default; d=leap-io-kernel.com; v=1;
	bh=D8d2AxiweX8gQ1VJCYyd1EHV62Udp9Q/5YMcfhTwrhM=;
	h=date:mime-version:subject:message-id:from;

Hi Alex,

Thanks for the review. The RST syntax issues have been fixed,
and the changes will be included in the v3 patch series.

Thanks,
BaiKefan
