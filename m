Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40EC1917FB;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815087; cv=none; b=CEqCCN/IgXhG3pGAMWxa9tdUUw8vnUhM2BvGQRaXEOpuqRHkE8QPI3LXOBMFTzNu5qd0jNZmeqwzNVOOK20yKVecYQ+s16SP5Q4iWTlbi5GUnl9TBcF7WQCfm8QAGJDPL9cFH12Gnq6nIBJHckN6lQNHpyph0bgbfpWQwqOqUJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815087; c=relaxed/simple;
	bh=WiyWZu0I2v9Q5Kn5QLFrux4dYHtK/j2mUZCTGm3fUBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rh4XZYMzZ+kJU576jD+F4c0GY5BOdbXpMsLf1Kiz4cHBrMpfhfUucUgXCcpB0ODUcHpL8lpaBJq+hV+i0czV8/tgSE3EDZVPA8kxMeD4qALO3DALxRdsvyAf5TUaTytAuC9lN2u9gMXIWdvdSo2GouSFBj+HVoMc/AU/CZwKQmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieT0Jnaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieT0Jnaq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60902C4AF09;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763815087;
	bh=WiyWZu0I2v9Q5Kn5QLFrux4dYHtK/j2mUZCTGm3fUBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ieT0JnaqWS8DoG1VpQ9t+RlA54pENcJPFjYp/BQmF4tf09OY6hi11iOxiN6J0bKmk
	 OsQvS1rCoxlLEuz1oahcYyUEMHFDoxryfsewzEcl3fAPIeLpwqWhbgC41dj4Qy5liW
	 Kbb9gjhMJnWJxn1Slfucu2Fy29Z6yLE6/K2mg3Meh8MoOk60xmqt2iVR2OiMTFb1ne
	 2aVDAS7EJ7FAz8atmOHCMyMu5IH7FeofKew4MjpK273bnKZOreQmsXmFRtwmufEHbU
	 nuD5RXXtUq26FbkFPMMstLk0sXsmGSGf0m1mqtxbl7SFZAr45F2/bYOt8WzTVq09DK
	 wYkRMXZNr0L5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMmsP-00000004pmL-2SVK;
	Sat, 22 Nov 2025 13:38:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] docs: kernel-doc.rst: document the new "var" kernel-doc markup
Date: Sat, 22 Nov 2025 13:37:59 +0100
Message-ID: <9d7830a2c4a2c9cd4062af54227daeed7f842cc3.1763814816.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763814816.git.mchehab+huawei@kernel.org>
References: <cover.1763814816.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add a description containing the new syntax to document
variables within kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/kernel-doc.rst | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 2e18a810f98b..0de0e344e10d 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -342,6 +342,18 @@ Typedefs with function prototypes can also be documented::
    */
    typedef void (*type_name)(struct v4l2_ctrl *arg1, void *arg2);
 
+Variables documentation
+-----------------------
+
+The general format of a kernel-doc variable comment is::
+
+  /**
+   * var var_name - Brief description.
+   *
+   * Description of the var_name variable.
+   */
+   extern int var_name;
+
 Object-like macro documentation
 -------------------------------
 
@@ -463,14 +475,18 @@ through the following syntax::
 
 For further details, please refer to the `Sphinx C Domain`_ documentation.
 
+.. note::
+   Variables aren't automatically cross referenced. For those, you need to
+   explicitly add a C domain cross-reference.
+
 Overview documentation comments
 -------------------------------
 
 To facilitate having source code and comments close together, you can include
 kernel-doc documentation blocks that are free-form comments instead of being
-kernel-doc for functions, structures, unions, enums, or typedefs. This could be
-used for something like a theory of operation for a driver or library code, for
-example.
+kernel-doc for functions, structures, unions, enums, typedefs or variables.
+This could be used for something like a theory of operation for a driver or
+library code, for example.
 
 This is done by using a ``DOC:`` section keyword with a section title.
 
@@ -538,7 +554,8 @@ identifiers: *[ function/type ...]*
   Include documentation for each *function* and *type* in *source*.
   If no *function* is specified, the documentation for all functions
   and types in the *source* will be included.
-  *type* can be a ``struct``, ``union``, ``enum``, or ``typedef`` identifier.
+  *type* can be a ``struct``, ``union``, ``enum``, ``typedef`` or ``var``
+  identifier.
 
   Examples::
 
-- 
2.51.1

