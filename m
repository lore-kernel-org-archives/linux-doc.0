Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572923E1D10;
	Mon,  4 May 2026 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913898; cv=none; b=p7Rvd5JGXs/Vg0l9Jf9/tF2yH0UgcA4U5ieyXJsKvkFZuW+EtPOGNF5Bvf6J25o9K2SoWarnYZcoXGTImjUJPSjJJzkJJdGuNuidneDqXOWrWAF5aOWmHskJlxbPicGGe573v1wF9YG0x0iDypLty8ctFsmvd89GTpyhRyumzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913898; c=relaxed/simple;
	bh=a+4PKjMqx7aQq4f05NlDPBE0NjHeUJlR2h+ir9csRgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbpi1mHzqxgK4zXfa0RK8Z/wF4wPUATV0nCk+eRAimEdA/CZi4r5SyEBoSmgYCt2LJsUDmUbPhhLv5MKuWyZI57JPT+xaZDy5XRo3ET3cbba1PvYd7sj68/PY9HafPK5nnrXqWXbguH7BUGF7RxayyG5OMIt4dlCMZPwXYT0+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dc/401hD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dc/401hD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D1181BCB;
	Mon,  4 May 2026 09:58:11 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EF033F763;
	Mon,  4 May 2026 09:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913896; bh=a+4PKjMqx7aQq4f05NlDPBE0NjHeUJlR2h+ir9csRgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dc/401hDYBcdgANDQ/B4lM8MSaphxa36b/zEOkitn5yy4Y/BStmrn5wDU8wO6EsDK
	 2FSsVWLiywkNaplTFbiKFseOslc0COaOfYyOy37aMqfWpIeryS7TmBQsiTWzdlSS3f
	 dsH9+VfGxbevHprNboLCQX7IkvbJj0xpnU5YFIq0=
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
Subject: [PATCH 1/2] Documentation: maple_tree: Point out constraint when using xa_{mk, to}_value
Date: Mon,  4 May 2026 17:57:45 +0100
Message-ID: <20260504165746.1422057-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504165746.1422057-1-weilin.chang@arm.com>
References: <20260504165746.1422057-1-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using xa_{mk, to}_value when storing values loses the information of
the top bit from the left shift, point that out in the doc.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 Documentation/core-api/maple_tree.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index ccdd1615cf97..87020a30ba69 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -29,8 +29,9 @@ The Maple Tree can store values between ``0`` and ``ULONG_MAX``.  The Maple
 Tree reserves values with the bottom two bits set to '10' which are below 4096
 (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
 entries then the users can convert the entries using xa_mk_value() and convert
-them back by calling xa_to_value().  If the user needs to use a reserved
-value, then the user can convert the value when using the
+them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
+the given data, so the top bit will be lost.  If the user needs to use a
+reserved value, then the user can convert the value when using the
 :ref:`maple-tree-advanced-api`, but are blocked by the normal API.
 
 The Maple Tree can also be configured to support searching for a gap of a given
-- 
2.43.0

