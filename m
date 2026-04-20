Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F3387566;
	Mon, 20 Apr 2026 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776719005; cv=none; b=n5niPRP6pHgc1wRg6UesTUX+89N9g2zqhUCe6Ze9wPJJEQzAHsG21Hu8HOD8tyhSBRG1vazqxwYej4NFEHjGc8JVPi6S4iyoxdlGBIeSs4qQFJMszt5C6KdbsPKbgt5PEPMhKvfezP75DXnlwwhpqRL6gADjTwVkgv6M8INJdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776719005; c=relaxed/simple;
	bh=VP9IrJ4l0SklCndrbkVfEFo0OIEf+svLpxw4cCq58sA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lKJtmdOOKO8834eobkohsPNqTcPetzlxyjzae/xiR5bDK1wYaqkndjTWtg4doBzWjV9xdB+bNtzVedK6WJfi4vRYCKopw3ZrxKPIpXb8N95Zo1SDFz8Or6DYbEuM7io5AxfPoPf4DUAqrx5KD4323bWXyZryHElrUdeQw6vkF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHYZkX4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHYZkX4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48236C19425;
	Mon, 20 Apr 2026 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776719005;
	bh=VP9IrJ4l0SklCndrbkVfEFo0OIEf+svLpxw4cCq58sA=;
	h=From:Date:Subject:To:Cc:From;
	b=ZHYZkX4X+t1uekxCCKt2BxvMYVS9JWkFL2KxK272j37gx7wlUlUc64FqXCYa9x0Y4
	 hcew88WEu5suzgwjNPRtPfGM0JilyidCIP01H9HXRc8PWzsqbMSjOIXklT/AcsuajF
	 aAqlfKA6bTBrfCN7WsMUAP0oswwQxcaROmjMUe8LETkWym2YrQ5+ZpbuoZ2J1qtpEk
	 lDSvWJK2AN7xuZgMWV6hkbb7sR7+tpPsg0TdXAMgjnq+CNnj+eLE1XWTAZdMykJQrk
	 +hjSknHB3Yedxsfbb1sM4Hov4RnUL70z1vBW0mLSooAaESBqDhEdu8qZgZXRSL4Mk0
	 +ooPvqhCL/xgw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Mon, 20 Apr 2026 23:03:16 +0200
Subject: [PATCH] docs/mm: clarify that we are not looking for LLM generated
 content
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-llmdoc-v1-1-47d2091177c4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJOU5mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMD3Zyc3JT8ZF0jw6Q007TElKQUszQloOKCotS0zAqwQdGxtbUAIqR
 GZVgAAAA=
To: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.13.0

Let's make it clear that we are not looking for LLM generated content
from contributors not familiar with the details of MM, as it shifts the
real work onto reviewers.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/index.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index 7aa2a8886908..13a79f5d092c 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -7,6 +7,19 @@ of Linux.  If you are looking for advice on simply allocating memory,
 see the :ref:`memory_allocation`.  For controlling and tuning guides,
 see the :doc:`admin guide <../admin-guide/mm/index>`.
 
+.. note::
+
+  Unfortunately, parts of this guide are still incomplete or missing.
+  While we appreciate contributions, documentation in this area is hard
+  to get right and requires a lot of attention to detail.  New contributors
+  should reach out to the relevant maintainers early.
+
+  This guide is expected to reflect reality, which requires contributors
+  to have a detailed understanding.  Documentation generated with LLMs
+  by contributors unfamiliar with these details shifts the real work onto
+  reviewers, which is why such contributions will be rejected without
+  further comment.
+
 .. toctree::
    :maxdepth: 1
 

---
base-commit: da6b5aae84beb0917ecb0c9fbc71169d145397ff
change-id: 20260420-llmdoc-21bf5fadbd6f

Best regards,
-- 
David Hildenbrand (Arm) <david@kernel.org>

