Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1E524F;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763815087; cv=none; b=MeULWbBqhxrZqVS6D44mkBHoNbGFm+23e28lBUjX5oylHQoYG0/duVjmcZuRxUTxpS1nSMDhv/aRu/MWDyHb1iVaiiZJpV8DJbInZr1cEqqObsKx05OKL8Vrv7y4TuEC4mNxXL4xoYgXPkR6lnd07EE+FpGDbKRHHf4Jjvde3Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763815087; c=relaxed/simple;
	bh=kXa4ys6hkQ4doBFd9i3ExpWBNpug/g4Cc9eJw3PZgxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO++Xfob2MDpd1F/uO9btSM5A0d1Jah474VSmGqysxgpOYnevL8NrrGpxr796G4PdQOw5hlJ2IEs96QjPo6JYWbbq1W3WfsHheJ6rfSseEsBeEjMtrnVxo5YIiD+XZYf1sSCEoHNq9zw9O/1caovLAtVBOHndRzBSMu9ar+anY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fw5EGh13; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fw5EGh13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B108C4CEF5;
	Sat, 22 Nov 2025 12:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763815087;
	bh=kXa4ys6hkQ4doBFd9i3ExpWBNpug/g4Cc9eJw3PZgxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fw5EGh13VoZNtWor06/2MTtPYpgs+oqs2V7zpupNtAtQpfu/oJrTB4WoIabde7W/D
	 ynVJxX9j43wdl+FzJ54M/wQHvrml2vagXj40wqrJru5OAmrEDlcv5GAjhhZlnFX5sS
	 2oWLHLehD91oDR4klUfZjdeawL55+kwKFVqzhROKot2rvqX8MqADXxCmrpv5VEr1Fa
	 WPs0kAz2gVqPUhp9hIkZPI+GIzEJX8JwJhwXregMLRgy22XZaTI69/51G1ugeMgUeG
	 SLrCAieUG+7mlZbZlz9udR2eNhUn/H38PqVlzY6h+D09FPpycfocBL0+hkkSMl3ZG6
	 Aa8VhJ2JUSghw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vMmsP-00000004pmH-2Lsf;
	Sat, 22 Nov 2025 13:38:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] docs: kernel-doc.rst: don't let automarkup mangle with consts
Date: Sat, 22 Nov 2025 13:37:58 +0100
Message-ID: <f68f2da2a5eb1508c4c56b8f59719773b84b146b.1763814816.git.mchehab+huawei@kernel.org>
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

This document contains several words that tricks automarkup.

Ensure that all of them will be inside a ``const`` markup,
avoiding automarkup to touch them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/doc-guide/kernel-doc.rst | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index fd89a6d56ea9..2e18a810f98b 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -174,7 +174,8 @@ named ``Return`` (or ``Returns``).
 Structure, union, and enumeration documentation
 -----------------------------------------------
 
-The general format of a struct, union, and enum kernel-doc comment is::
+The general format of a ``struct``, ``union``, and ``enum`` kernel-doc
+comment is::
 
   /**
    * struct struct_name - Brief description.
@@ -187,8 +188,8 @@ The general format of a struct, union, and enum kernel-doc comment is::
    */
 
 You can replace the ``struct`` in the above example with ``union`` or
-``enum``  to describe unions or enums. ``member`` is used to mean struct
-and union member names as well as enumerations in an enum.
+``enum``  to describe unions or enums. ``member`` is used to mean ``struct``
+and ``union`` member names as well as enumerations in an ``enum``.
 
 The brief description following the structure name may span multiple
 lines, and ends with a member description, a blank comment line, or the
@@ -201,7 +202,7 @@ Members of structs, unions and enums should be documented the same way
 as function parameters; they immediately succeed the short description
 and may be multi-line.
 
-Inside a struct or union description, you can use the ``private:`` and
+Inside a ``struct`` or ``union`` description, you can use the ``private:`` and
 ``public:`` comment tags. Structure fields that are inside a ``private:``
 area are not listed in the generated output documentation.
 
@@ -273,11 +274,11 @@ It is possible to document nested structs and unions, like::
 
 .. note::
 
-   #) When documenting nested structs or unions, if the struct/union ``foo``
-      is named, the member ``bar`` inside it should be documented as
+   #) When documenting nested structs or unions, if the ``struct``/``union``
+      ``foo`` is named, the member ``bar`` inside it should be documented as
       ``@foo.bar:``
-   #) When the nested struct/union is anonymous, the member ``bar`` in it
-      should be documented as ``@bar:``
+   #) When the nested ``struct``/``union`` is anonymous, the member ``bar`` in
+      it should be documented as ``@bar:``
 
 In-line member documentation comments
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -319,7 +320,7 @@ on a line of their own, like all other kernel-doc comments::
 Typedef documentation
 ---------------------
 
-The general format of a typedef kernel-doc comment is::
+The general format of a ``typedef`` kernel-doc comment is::
 
   /**
    * typedef type_name - Brief description.
@@ -432,8 +433,8 @@ Domain`_ references.
   Typedef reference.
 
 ``&struct_name->member`` or ``&struct_name.member``
-  Structure or union member reference. The cross-reference will be to the struct
-  or union definition, not the member directly.
+  ``struct`` or ``union`` member reference. The cross-reference will be to the
+  ``struct`` or ``union`` definition, not the member directly.
 
 ``&name``
   A generic type reference. Prefer using the full reference described above
@@ -537,7 +538,7 @@ identifiers: *[ function/type ...]*
   Include documentation for each *function* and *type* in *source*.
   If no *function* is specified, the documentation for all functions
   and types in the *source* will be included.
-  *type* can be a struct, union, enum, or typedef identifier.
+  *type* can be a ``struct``, ``union``, ``enum``, or ``typedef`` identifier.
 
   Examples::
 
-- 
2.51.1

