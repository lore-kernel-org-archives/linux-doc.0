Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F021A683B;
	Sat, 18 Apr 2026 20:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776545403; cv=none; b=W0y2kZ38RhaTv/wKze5y2CCjMHT3R8kX2O54lI0nOiX56In2bdODY1w79yMQMKyfBvO+XWyVTwIZQtpmJWS0zNjCUGe6BR+zI8Z5n8ryDcI7H0jqiJZ1eT2kVLUiDIA66aMd4QuKJHBBVoTRP3DX0vieNtJxOnNnggV9xkbNBc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776545403; c=relaxed/simple;
	bh=7rRzjdaoHeUV1yvrxq1rjjB0hpgHM9ztOSPhIFTKh2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VCvIYVMWHqF4xirKBl8WW7ZhiYLvRLS43r39kp28bzgI7vIg3B7Hrr8dQSweU0Jl+xmhiXDOwAP1+Yy8+Yxev8kL3SzlicrUjg1q9xY05PUZoIA89Lkzj1fbhdzRls+n1vw5oupECicu0jL1FCGKBf7WlTa/wRPPIfMXSzgL/6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nLjjs5DH; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nLjjs5DH"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83585168F;
	Sat, 18 Apr 2026 13:49:48 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5822D3F7D8;
	Sat, 18 Apr 2026 13:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776545394; bh=7rRzjdaoHeUV1yvrxq1rjjB0hpgHM9ztOSPhIFTKh2s=;
	h=From:To:Cc:Subject:Date:From;
	b=nLjjs5DH0Ua5b8R4mdWyr+b4VFdGT+bybJ9kybsMGGoO5uryBV+PaoHv4UBcB887r
	 tY92Ya3mSHC4x01/6JDi9IuixEolf9Ky53ZV4xwkIYgVjnZmalKgqSWgXrS0EOmqjZ
	 bgQnB2/N2PRGUL/GBEVXDAFVKulDTTPT1Txz/cNY=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [RFC PATCH 0/2] Documentation: maple_tree: Improve statements on reserved values
Date: Sat, 18 Apr 2026 21:47:52 +0100
Message-ID: <20260418204754.120405-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

While using the maple tree and reading its documentation, I found a few
bits confusing, mainly about the reserved values. So here are some
changes hoping to make things clearer.

I am not familiar with the implementation, so I might be getting things
wrong, hence this being RFC.

While looking at the code I also found that although the doc claims the
normal API blocks reserved value stores, the code checks this using
xa_is_advanced(), which only blocks values up to 1026, not up to the max
maple tree reserved value 4094. For this part I am not sure whether the
code needs to be changed or we can also improve the doc.

Any feedback is appreciated, thanks!

Wei-Lin Chang (2):
  Documentation: maple_tree: Point out constraint when using xa_{mk,
    to}_value
  Documentation: maple_tree: Clarify behavior when using reserved values

 Documentation/core-api/maple_tree.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0

