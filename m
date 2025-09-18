Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E9305E08;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=KPnDfIYtSVr11BeR8VrGG6JpU6SdG2r7a6KRgh/XRY518YY2Ng9wyZWjWK/dmj55lyUPJr1Vkmd4GioEgCVymUVqg+NFyvBaKiA/BRNkCYDIcHPonGxXaldVgWy9awa8v68aBYKQ88ajXklFc6rQZXb54L0lWF7PBRnrasE+lXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=4Yu1gA5/uZ+OPBNEREkXam+9wN35SUbcDazI/2U7I9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qahrFpndzZUsQE7vkSUWu+vMCM9lLsNXhKsGbJafq57ZCuGZSu9M9SRLRhJ5rp+jTKC1pDhO6cVxyI/WAXgxYjXwtRCS+rufE/zU7dfCspv6DndRgP4ltSKYHxu8kMAEf8M0/YDP4jTfhEQFcztAY1vzxIzGzL8FCO54P6Hgft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quE5BdD1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quE5BdD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A7DC4CEFD;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196507;
	bh=4Yu1gA5/uZ+OPBNEREkXam+9wN35SUbcDazI/2U7I9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=quE5BdD1RvB/1PFWlnVLrgB3LtNghauPk5RqZOdlhWs3TfKznk5lR7KK65kso/aKz
	 7I/jmClNvTT55OtMiKQNVwjrNLrm6FgiaztDkGvL1UtPq33zS4j0idnRm/LpQGMFHa
	 fOYqRlJ6cWs1DLbjbBtVHTpZiERIjtLQN9VbLkTef/7nw36FikiJQYDAVNtQEK2nml
	 jrKib3SQaJ+zc+UkeU6doqis7KEQvPLNs/vLubjq8I/zf+UYEgVY8sgQZ0NiZW0aB7
	 NYSfIR4WKm/bzXX1QYMhpgeVjGXI9oJTNZ6BC1wzlAAHehSFRbrDFPg1TPLZR5H6yS
	 vWrSc+hZrI2AA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000CrtZ-1fyX;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 21/24] scripts: kdoc_parser.py: warn about Python version only once
Date: Thu, 18 Sep 2025 13:54:55 +0200
Message-ID: <68e54cf8b1201d1f683aad9bc710a99421910356.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When running kernel-doc over multiple documents, it emits
one error message per file with is not what we want:

	$ python3.6 scripts/kernel-doc.py . --none
	...
	Warning: ./include/trace/events/swiotlb.h:0 Python 3.7 or later is required for correct results
	Warning: ./include/trace/events/iommu.h:0 Python 3.7 or later is required for correct results
	Warning: ./include/trace/events/sock.h:0 Python 3.7 or later is required for correct results
	...

Change the logic to warn it only once at the library:

	$ python3.6 scripts/kernel-doc.py . --none
	Warning: Python 3.7 or later is required for correct results
	Warning: ./include/cxl/features.h:0 Python 3.7 or later is required for correct results

When running from command line, it warns twice, but that sounds
ok.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_parser.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index a560546c1867..574972e1f741 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -314,6 +314,7 @@ class KernelEntry:
             self.section = SECTION_DEFAULT
             self._contents = []
 
+python_warning = False
 
 class KernelDoc:
     """
@@ -347,9 +348,13 @@ class KernelDoc:
         # We need Python 3.7 for its "dicts remember the insertion
         # order" guarantee
         #
-        if sys.version_info.major == 3 and sys.version_info.minor < 7:
+        global python_warning
+        if (not python_warning and
+            sys.version_info.major == 3 and sys.version_info.minor < 7):
+
             self.emit_msg(0,
                           'Python 3.7 or later is required for correct results')
+            python_warning = True
 
     def emit_msg(self, ln, msg, warning=True):
         """Emit a message"""
-- 
2.51.0

