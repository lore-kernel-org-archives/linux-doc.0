Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67065327C0D;
	Sat, 18 Apr 2026 20:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776545406; cv=none; b=HCQjFqK72/EcFxfKxzsSAmUesfCu0Z+LTyfGHShVur1EP0Fy4SXLjraMAKX11L+kmSKA9+Sp+vWDUhRw9B/KSmTEsM2dmnKgAtGmq5qXX6z5sxil5d54NkZSnbb6auKRVUZoo0P1zcPbvH7GOGdesG0SFO6diF0Z+lWS4YoSeBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776545406; c=relaxed/simple;
	bh=xqilpVqLK6IYITkPGi7y1Vzf8kCa1LEGL+36lgbutug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF0wHE6QTGQPTN4c5qDy1PaaUaFNJeHRpA0RjW274fytNWSsp9OZ4luqMkT11xrYjkMGu8OqIX3vRslvd/K2z7G0vvTjNwcNPNSIjbs7WyJjVyfSPjfiZJLv7nDXKyQrm8Z56uFyEQ83t6Fs8W4Lq2Yzl8SmxZYj7qcwQLMhxgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tjzsURev; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tjzsURev"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2B79176B;
	Sat, 18 Apr 2026 13:49:52 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D2F53F7D8;
	Sat, 18 Apr 2026 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776545398; bh=xqilpVqLK6IYITkPGi7y1Vzf8kCa1LEGL+36lgbutug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjzsURevw38siKINXzxI6ayboyU46S4o5GYu4Gdp8Qa1/s3JyBj3jx8Tg3SjTjpRp
	 Rsu3emwxCXROn8BnmKVPkvBOteW77h5brADlX8INLFE08/8RpwdOOTQnJjRtrAm7nS
	 wUnRjdb0HUb5JEgl7+4KCcnosumWyA3LO9ldXFgI=
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
Subject: [RFC PATCH 2/2] Documentation: maple_tree: Clarify behavior when using reserved values
Date: Sat, 18 Apr 2026 21:47:54 +0100
Message-ID: <20260418204754.120405-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418204754.120405-1-weilin.chang@arm.com>
References: <20260418204754.120405-1-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It doesn't matter whether the normal or the advanced API is used if the
user uses xa_{mk, to}_value when storing and retrieving the values. Just
specify that the normal API blocks usages of reserved values while the
advanced API does not.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 Documentation/core-api/maple_tree.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 15eda6742af8..54ea99c7bca7 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -30,9 +30,8 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
 (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
 entries under the condition that their top bits are never 1, then the user can
 convert the entries using xa_mk_value() and convert them back by calling
-xa_to_value().  If the user needs to use a reserved value, then the user can
-convert the value when using the :ref:`maple-tree-advanced-api`, but are blocked
-by the normal API.
+xa_to_value().  Usage of reserved values is blocked by the normal API, and will
+cause undefined behavior if used with the :ref:`maple-tree-advanced-api`.
 
 The Maple Tree can also be configured to support searching for a gap of a given
 size (or larger).
-- 
2.43.0

