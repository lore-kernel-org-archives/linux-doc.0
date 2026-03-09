Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD93BED5F;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074886; cv=none; b=a4XclYHn6ppbtEZ+iRSrJyPMcbG8In4oNWl0T+2rmJCm4qz9OWkn5iMuntYGRwzGlLbWAKI4ITGjy32CkVm5o7PeK9h3PgcQMSVoKGTV/uHLTo2IHKD10t3mpJQv6wKUshiSqiPDSUmpBWhvVZAXiqCeM25cpIhnnUmOoV+c8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074886; c=relaxed/simple;
	bh=iR9cZEMBrhxbAljLc1W53eZP2bmd/b55ybR+IN+0RyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g4QRRa95AahatHbYZFRQUz6kPH87SuL8OCacXwDAMNsaxlbTj4I+hL+YjHx5klWki5SS5d232R4kwmmM7c6EGDayvGl/g9RSQHWawUx/vmAgepzbKhTE9DbibFDBURvN/vXXMEaNdjWRVZ2LZc3Zk8hq7v/VsQCIRlfsi5jAn7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvFjYCzy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvFjYCzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B320C2BCB1;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074886;
	bh=iR9cZEMBrhxbAljLc1W53eZP2bmd/b55ybR+IN+0RyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TvFjYCzye2aOkH4hWram9Eq8FP4qUiAKApgNOe1HTEtvR72dz42lSH599bcDMmUJO
	 Ac149IMP0jZ+mqDysTamGGDm6S8tZc6QHxWbhiz8rNvyCHP4JATQfVXfpX9f5wL0Z2
	 8oA5QkIW4m+5z59uFKtqSX063uifDl6vcci4/cTH/fYiOs6AFZW9mI+PjXp1RFxoge
	 1Fe/6yqSSA2rHHpHQZTCIAUiwjppjiSz9lbk+ksdV06rNo4Zi+y3eRDUA8+SFr7Id8
	 zgAsxw8edUifZOBP7QbbB426RLY8nZwEt6O2Zax5COtyIWRZLno/CMUcFpVggElaGS
	 I5Y+ZQc5M9mLA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdm0-0000000Bhbt-1BFg;
	Mon, 09 Mar 2026 17:48:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 4/8] docs: kdoc: properly handle empty enum arguments
Date: Mon,  9 Mar 2026 17:47:55 +0100
Message-ID: <4182bfb7e5f5b4bbaf05cee1bede691e56247eaf.1773074166.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773074166.git.mchehab+huawei@kernel.org>
References: <cover.1773074166.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Depending on how the enum proto is written, a comma at the end
may incorrectly make kernel-doc parse an arg like " ".

Strip spaces before checking if arg is empty.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 086579d00b5c..4b3c555e6c8e 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -810,9 +810,10 @@ class KernelDoc:
         member_set = set()
         members = KernRe(r'\([^;)]*\)').sub('', members)
         for arg in members.split(','):
-            if not arg:
-                continue
             arg = KernRe(r'^\s*(\w+).*').sub(r'\1', arg)
+            if not arg.strip():
+                continue
+
             self.entry.parameterlist.append(arg)
             if arg not in self.entry.parameterdescs:
                 self.entry.parameterdescs[arg] = self.undescribed
-- 
2.52.0

