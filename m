Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45143D7A
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789787; cv=none; b=Wvsj5yf7UMHYCzr/f45TiuMK34oc9Nb7IwqBdZf/NJGbeGKu75r2eP+q0dV7Tb1O1ef9Bo2up3O4gQeJXse8R/3xmTeqJgf6Fl/PxcUFxeMeodDZjwJkzM6EMTeYpZ5ginBMnGEzx0U2wrY8PmbP03aXZFFYJA4t5+oSMpLL/D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789787; c=relaxed/simple;
	bh=2UXJEGNlm0mU9rSlTBYshJ5VkB+CW2wjERGmqgh++tw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aY68bG/Kz8B9IBuB4os7VqzLGoDrxBy4oTs9SpmrFFFWoPcDgYS8NvJRAvpbcMVPp/3aPRnX01UxlqW1uKWA7rEYKuz7OyUZ/8nj0XTiMTP7WdUpYKa8diNm1SCm0tYk2F4hVzyh+Y50WVbEohTO2Pu2Brg9vEenUWhE1uEXTuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACC49339;
	Tue,  1 Oct 2024 06:36:54 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C0E3F64C;
	Tue,  1 Oct 2024 06:36:23 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	joey.gouly@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 0/2] POE fixes: kthreads and docs
Date: Tue,  1 Oct 2024 14:36:16 +0100
Message-Id: <20241001133618.1547996-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Two fixes/amendments for 6.12 for the POE series:
	- Set POR for kthreads, as discussed [1]
	- Add docs, as requested [2]

I have a (hacky) io_uring test, that I will try clean up and send out at
some point.

Thanks,
Joey

[1] https://lore.kernel.org/linux-arm-kernel/6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com/
[2] https://lore.kernel.org/linux-arm-kernel/20240913151459.GA24129@willie-the-truck/

Joey Gouly (2):
  arm64: set POR_EL0 for kernel threads
  Documentation/protection-keys: add AArch64 to documentation

 Documentation/core-api/protection-keys.rst | 38 +++++++++++++++++-----
 arch/arm64/kernel/process.c                |  3 ++
 2 files changed, 33 insertions(+), 8 deletions(-)

-- 
2.25.1

