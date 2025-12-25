Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD5321456;
	Thu, 25 Dec 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766666866; cv=none; b=DDgbVulnH0Qlmtkod1C4uCPHIeMaj19Wc41fez4zxLDv5jxnQib/uo1Nx1TBPKD+s7d5zgFO2fZnC7DKiQ/Jh59t7Yt5g1o4SK5VIj3lmVl194Foi5ukqeu6DLyxnSfyvPYu20CHb0oGl+4eEApSfW94B7LKCXXXdE2AImUAats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766666866; c=relaxed/simple;
	bh=DoB/m1OhIvv1qflXUXHbavl+iPRatPjDaXpMfugpylU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nilgN/pATXaDRPcEiXyBKDChTNN7nnzKa71w8A7n1MA2sxunl0+fcR+Et4Ub8uulUZ5spagCIQLYByddrLolDkMwAs7IFhPk8S3dleu+iNVXw+BC9iMCNsH5wfmXY7xFBdsVT7xIPaYt47lrXd6SJly6wYthwBcfFtxsrZTIHBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnk9Rcd0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnk9Rcd0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95734C4CEF1;
	Thu, 25 Dec 2025 12:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766666865;
	bh=DoB/m1OhIvv1qflXUXHbavl+iPRatPjDaXpMfugpylU=;
	h=From:Date:Subject:To:Cc:From;
	b=cnk9Rcd0Nbtbcy1V/P1OPxVjJ5zxstnZk6pChCjK9f8ptNy54het/NsqjB6MHfM04
	 D8vzawN2n8Yjq4QYoSiOXnhQSL/7AdxxgMCDT08DcuSsV+UIfYg7pqITtw2KUlLxNQ
	 6It0K12tRovnLyyGZB+jI/aapvUOKrWM3nvuP4ORx3c0HQEJLZOPoweDyBYKpuWWIC
	 tXAKEm2sRACPTpqNMNKfh3EVxwVRa9VqAok6yH+R8AqSHgLzQp0ZuqQHeMYWxa5w+q
	 SthrVGX8kBSgaDYf6xRESYQWvK2gV9+YSo2+MlGOvrQFxkmVDs+8eJP9rC2r+iNNdk
	 z7Pqavbwx3ALg==
From: Vincent Mailhol <mailhol@kernel.org>
Date: Thu, 25 Dec 2025 13:47:37 +0100
Subject: [PATCH] doc-guide: kernel-doc: specify that W=n does not check
 header files
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251225-doc-format-check-v1-1-dff637a4d275@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGgyTWkC/x3MTQqAIBBA4avErBtIQ/q5SrSQccohytCIQLp70
 vJbvJchcRROMFYZIt+SJBwFqq6AvD1WRnHFoBttlNYGXSBcQtztheSZNmxdZyyroaHeQcnOyIs
 8/3Ka3/cDiFDFvmIAAAA=
X-Change-ID: 20251225-doc-format-check-3d75ae190c8d
To: Jonathan Corbet <corbet@lwn.net>, 
 Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=DoB/m1OhIvv1qflXUXHbavl+iPRatPjDaXpMfugpylU=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJm+RjkGW52MWoUP166bd3+j2xvde9mhn6s4ly3P8FLQO
 LZswgTTjoksDGJcDJZiiizLyjm5FToKvcMO/bWEmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWATAYuTgGY6q3MjAzr0n0aeIWtdD2+nfZreptzN9f06sbA7eLXn9W43uz89KaWkeHu8maHt88
 vn53nq63MdONTF0PxqsmP628Zn3rRbHz/2QouAA==
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2

The documentation states that:

  make W=n

can be used to verify the documentation format. This is true for .c
files but not for headers [1].

Modify the documentation to specify that headers files are not covered
by make W=n and that these need to be checked separately with
scripts/kernel-doc.

[1] commit 3a025e1d1c2e ("Add optional check for bad kernel-doc comments")
Link: https://git.kernel.org/torvalds/c/3a025e1d1c2e

Fixes: 8fcce5803afd ("doc-guide: kernel-doc: add comment about formatting verification")
Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
This is a resend of a patch which I sent more than two years ago, on
which I got no answers and which I then forgot about.

Link: https://lore.kernel.org/all/20230531093951.358769-1-mailhol.vincent@wanadoo.fr/
---
 Documentation/doc-guide/kernel-doc.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index fd89a6d56ea9..9ebcb2da8606 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -56,11 +56,14 @@ documentation comments. For example::
 
 	scripts/kernel-doc -v -none drivers/foo/bar.c
 
-The documentation format is verified by the kernel build when it is
-requested to perform extra gcc checks::
+The documentation format of ``.c`` files is also verified by the kernel build
+when it is requested to perform extra gcc checks::
 
 	make W=n
 
+However, the above command does not verify header files. These should be checked
+separately using ``kernel-doc``.
+
 Function documentation
 ----------------------
 

---
base-commit: efc362716ef356f3bb2e9584be1f4d61dbb39eb6
change-id: 20251225-doc-format-check-3d75ae190c8d

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>

