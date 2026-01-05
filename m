Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9E13090CC;
	Mon,  5 Jan 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632333; cv=none; b=QTHZlg3dFqCSg/80qNMQ7J3W90CLiLN6N9dNO+tcYG8Ev5Fo3wGa8y+jKM7BPS7mS7emHIYZO3FhDhUbKnb9uNYCVqVdehE1RDqjI/2LujRtArd4v2Esz5yYKbnuFrHVAVgglhEYQ13tTgKr5qEN2HXJUAGo3Kf/jjmPxWpO6js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632333; c=relaxed/simple;
	bh=YLscpyQU8GuaEXJSiTDfKmikNlUhxBYvvwRwG0MmlKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJLlO1bcJX966npGRQN9xQGBwwfrrm2ef44hjlSo69+wHAMH2CheZD7/vXicjwEbJTOsP7OD+lYQkDKK5PwajWkIr+rgQ49s/UBvTJuANX8WObhYHb7SjuugaKqfOz1bYSaCd0zJwVWBBxrqFwjZyqRYke5jE05isqFrbKWBGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTjPzASm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTjPzASm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0300C19422;
	Mon,  5 Jan 2026 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767632332;
	bh=YLscpyQU8GuaEXJSiTDfKmikNlUhxBYvvwRwG0MmlKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTjPzASm/+SxsMK/4cdlJp5wMwOcjzLhry0vYrO7oo8nmmQbKe6vtidLorCIDj0XP
	 jvjkjfDzKc2sumECtl8YMH/QWq5/4/OgSK6L7LAAcpMwWM2TltyYa+xiiv7pbh2G5c
	 +k3Ib2OYQ2BsKcI+K4WMGg3+0XWR6cDbIDzea2Q3nh0QgciFy16dP31NXHFZ9C4tiV
	 iUUg0RXmxz6umgW2Psmy1ja5JCvwSfkqsZSUH1yjWFNbA7DBS7QZhQlDbVlRtiNRco
	 M/8IZZ3mjrlpq0XlYhvJuvT0jpIDpcFmXING8tRX1bHhPEtErNESHsudsN8b1MXe07
	 wBL3GGOFJihNQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>,
	Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/6] kho/abi: memfd: make generated documentation more coherent
Date: Mon,  5 Jan 2026 18:58:35 +0200
Message-ID: <20260105165839.285270-3-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105165839.285270-1-rppt@kernel.org>
References: <20260105165839.285270-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

memfd preservation ABI description starts with "This header defines"
which is fine in the header but reads weird in the generated html
documentation.

Update it to make the generated documentation coherent.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/kho/abi/memfd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index da7d063474a1..c211c31334a3 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -17,8 +17,8 @@
 /**
  * DOC: memfd Live Update ABI
  *
- * This header defines the ABI for preserving the state of a memfd across a
- * kexec reboot using the LUO.
+ * memfd uses the ABI defined below for preserving its state across a kexec
+ * reboot using the LUO.
  *
  * The state is serialized into a packed structure `struct memfd_luo_ser`
  * which is handed over to the next kernel via the KHO mechanism.
-- 
2.51.0

