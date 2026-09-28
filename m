Received: from mta1.migadu.com (out-66.mta1.migadu.com [95.215.58.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504104E535C
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609166; cv=none; b=bZO2YF2tJAmxlWckHTNqDJDU/NnSOp9E8GwyqlptgyXN76PrVu8EUUHsdgmY0Y68O6Uzon60BAxRgUPEqC3TWpgjn6Oq8Js0xxePQgYWm9pMTsM8wVX6w53nEENzXjVAEVQ8SlWNXnRQE5V92qhlePovu884I7u7bJNSelS83wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609166; c=relaxed/simple;
	bh=TZTf+tvw3LUL1bGKJNCtbY5lbMJJlJLgbm/WT+dWO1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYqCkZknXuhS1u4cqMYhBZ8phzwraCQUNpVfJRynAKYsVtkInq4G37GPfYLrfSoqpGgXKn2S9bqOXY4FGXWDXH5doF2Hdd64yOzKh/p/CBURy+hje6jFKQsEVtqE+fvsi5HEbXvCBy12bNh2hR6oi7i6aiLt3ylCXpJw8gVN+3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j39hHouN; arc=none smtp.client-ip=95.215.58.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j39hHouN"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TZTf+tvw3LUL1bGKJNCtbY5lbMJJlJLgbm/WT+dWO1Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609158; v=1; x=1791213958;
 b=j39hHouNIEU2yuKOVqgJ/b5WTHD3VCn2N/TV7RiFcgKtAwxZQYx6UaMbz6W6l1DDgAH7c45E
 pRb4USg6MeAVAi9xr8LrFMmnOgo6tz4EmtnetlhS3x4L/SHK4JI1iuZN1rPi6QDpxxUye20dhfT
 wP9tY0bNqKn4BKlryWHQGatE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5cf54109416d45bb;
	Mon, 28 Sep 2026 15:25:57 +0000
X-Mizu-Trace-ID: 5cf54109416d45bb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] Documentation: KVM: Fix the name of KVM_ARM_SET_COUNTER_OFFSET
Date: Mon, 28 Sep 2026 16:25:04 +0100
Message-Id: <20260928152507.2116110-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM_ARM_SET_COUNTER_OFFSET section of api.rst names the ioctl
KVM_ARM_SET_CNT_OFFSET, which doesn't exist.

Fixes: 1935d34afaebe ("KVM: arm64: Document KVM_ARM_SET_CNT_OFFSETS and co")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fabb1d4bf8f8d..e5efdc56f3d29 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6265,7 +6265,7 @@ set to 0s by userspace.
 
 This capability indicates that userspace is able to apply a single VM-wide
 offset to both the virtual and physical counters as viewed by the guest
-using the KVM_ARM_SET_CNT_OFFSET ioctl and the following data structure:
+using the KVM_ARM_SET_COUNTER_OFFSET ioctl and the following data structure:
 
 ::
 
-- 
2.39.5

