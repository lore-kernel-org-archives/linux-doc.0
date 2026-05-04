Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EC13E3DA0;
	Mon,  4 May 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913900; cv=none; b=bi1UF3qiXOAa352ywZfiE/9/qtDvIl6MeJjM2HUqnDgEXI5YsKivN9Fmyll1ily8tE5yOwD+ky+tTapJse22E4OvyRMCje9UJC+MTgEpiojS200Qvr4FLlwqlrrcsdQd8JIQovNgoKgd/CsQ0B4z+hrCLilA+Cst2WpAJI53vDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913900; c=relaxed/simple;
	bh=BrNBR/Fa0ySYMqo0xErRxfDh/QEUbYZzwHot466ZjCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWwTQ3P25yvhQDszN9kQGfKu8Sme84RcaJq1fNnzaOyDfps4J89ybVHsX0YKRtJ1SxR3UtjOfh3qW+54/pgO/r2jNhIQ4UIMQ2ihSsS5anaRsQ5Iyuxqwu7TKpkzXsFMywIio/bfyvY/IMYmyWjLmcXZOuJ8latNF2IBX8yPrd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fACHE6mZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fACHE6mZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE22425E2;
	Mon,  4 May 2026 09:58:12 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EED0F3F763;
	Mon,  4 May 2026 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777913898; bh=BrNBR/Fa0ySYMqo0xErRxfDh/QEUbYZzwHot466ZjCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fACHE6mZnpqgjY69/LM+qwQ39TLkVqtrZ0UoUlv7A47vEIW8LTbLDAc57hymp9J6n
	 wPZsHiTVmvfjD7ZtzW+T1Ugk8FFAcT2b0tItBIwSxTSZ91X/ZSNtvsQ0GY9lzUPP8b
	 kEcKgoo6xM50fbWoiDX2/XFZtS9VosDNQCrx7WHQ=
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
Subject: [PATCH 2/2] Documentation: maple_tree: Clarify behavior when using reserved values
Date: Mon,  4 May 2026 17:57:46 +0100
Message-ID: <20260504165746.1422057-3-weilin.chang@arm.com>
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

It doesn't matter whether the normal or the advanced API is used if the
user uses xa_{mk, to}_value when storing and retrieving the values. Just
specify that the normal API blocks usages of reserved values while the
advanced API does not.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 Documentation/core-api/maple_tree.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/maple_tree.rst b/Documentation/core-api/maple_tree.rst
index 87020a30ba69..e5ccafb84804 100644
--- a/Documentation/core-api/maple_tree.rst
+++ b/Documentation/core-api/maple_tree.rst
@@ -30,9 +30,9 @@ Tree reserves values with the bottom two bits set to '10' which are below 4096
 (ie 2, 6, 10 .. 4094) for internal use.  If the entries may use reserved
 entries then the users can convert the entries using xa_mk_value() and convert
 them back by calling xa_to_value().  Note that xa_{mk, to}_value() bit shifts
-the given data, so the top bit will be lost.  If the user needs to use a
-reserved value, then the user can convert the value when using the
-:ref:`maple-tree-advanced-api`, but are blocked by the normal API.
+the given data, so the top bit will be lost.  Usage of reserved values is
+blocked by the normal API, and will cause undefined behavior if used with the
+:ref:`maple-tree-advanced-api`.
 
 The Maple Tree can also be configured to support searching for a gap of a given
 size (or larger).
-- 
2.43.0

