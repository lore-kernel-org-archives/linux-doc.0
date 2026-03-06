Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F13EBF38;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=JHjcL9/pLfmoink+6x+SnqAAgZthd99rB3eXsVwidxkATzvfRZFOAXesHXDVh6H+GHOqXD4OEA5ODDgL6ST/AEOLC46vubfRzolHZVVyx3DBGkf5Gu3TjSsAuBBuGE+C26lRumXYMUNC9DRJRUUzc/g3NtYt5MUu01UP2qQ5a9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=eIvW6vOTsydL4ttyaabmt7sLOOgqDZhdhKgwjQj87GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmIE4zJg0N+pkDJvbjYQkBGCyRb3veAdlv5HpQNb2Dw6WOBuH/A9mBzbNp3c30lUzqqadUfr9ZxZrctsIRJJLeHmFUiIbfCLj/PkmamEP5Jnh9e+RwfbFAiVguEZDHIME/zBzHJfw/ZmLm9xVdbTqga61Lt9CSCLDP+XSVBbnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIE5diok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIE5diok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479A9C2BC87;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811959;
	bh=eIvW6vOTsydL4ttyaabmt7sLOOgqDZhdhKgwjQj87GA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CIE5diok0VnlYtuLDOnlqXnf97pQYgslTMUcN2P6k3tWeJnIhEF2ZwmCwiKuTC8sD
	 SmCCKgop+5Y877jW/jy98AaOkCcDYpiz23B9bITCvt+89kN9TGSj7b88jJGb7+/xBE
	 w2A+XwxNRxRR7rb79+UoBAlwTEq9UW1uvqAJdNZ7OQ70/btsiUxm6okdeFcSHIZLRG
	 qFxRtAkjDy3nYmU6jwSVyQETIu9+TjIzvoYvnlIBbLkPoLmiNoHWKI/ukyMU+ZFIcE
	 eDbTLVWSmTSBrhrIhKedGt1Alzi0SdcsiDTsBxrX+YjhQeMUeh62OwxOogb04Wz+GY
	 hOZPLFK0rePHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNF-00000007Ef0-2EeU;
	Fri, 06 Mar 2026 16:45:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/13] docs: kdoc_output: describe the class init parameters
Date: Fri,  6 Mar 2026 16:45:46 +0100
Message-ID: <7c57f26150aae11fced259f30898a980b96efb68.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As this class is part of the ABI used by both Sphinx kerneldoc
extension and docs/tools/kernel-doc, better describe what
parmeters are used to initialize ManOutput class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 29 +++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index cf834dbf2725..7a181b40810d 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -580,7 +580,34 @@ class RestFormat(OutputFormat):
 
 
 class ManFormat(OutputFormat):
-    """Consts and functions used by man pages output."""
+    """
+    Consts and functions used by man pages output.
+
+    This class has one mandatory parameter and some optional ones, which
+    are needed to define the title header contents:
+
+    ``modulename``
+        Defines the module name to be used at the troff ``.TH`` output.
+
+        This argument is mandatory.
+
+    ``section``
+        Usually a numeric value from 0 to 9, but man pages also accept
+        some strings like "p".
+
+        Defauls to ``9``
+
+    ``manual``
+        Defaults to ``Kernel API Manual``.
+
+    The above controls the output of teh corresponding fields on troff
+    title headers, which will be filled like this::
+
+        .TH "{name}" {section} "{date}" "{modulename}" "{manual}"
+
+    where ``name``` will match the API symbol name, and ``date`` will be
+    either the date where the Kernel was compiled or the current date
+    """
 
     highlights = (
         (type_constant, r"\1"),
-- 
2.52.0

