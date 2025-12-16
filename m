Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049B42D1F7C;
	Tue, 16 Dec 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894780; cv=none; b=qfWe4c8Uchv+MSeLCHY8qKQCt9k7G6/FpzD57XMZeHex+FDuknuiYoKSwIoRr8vD3BbmRDmZL8zaJ1HuVwPw3OTE6tQ/wcIze+q9bGMl9QKq19HrSf0ixnOrT/woZbNJrChP0Thx0W8+FOui6tfkuOmhJ4QVy0P6FsA64y86lnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894780; c=relaxed/simple;
	bh=rnTwv2cFqokhQ8w4FIjECmjXqxObhLiO6X9QzGmpU3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+b45AjSsJ+LZDgXWupw7iIgPJkuQChFmWHTxiV80C35qS2RI/ah1tVnoEk/395+i8vyAb2WTC85kX/NM8bir4v3x15IXPM56oS3/Ne+JycjMsep07B4yDRrOpj096Su45mq79Rj8nYDTljQI0xMyxneby7fbEScTKwRZ7gQRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9afdder; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9afdder"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43B5C4CEF5;
	Tue, 16 Dec 2025 14:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894779;
	bh=rnTwv2cFqokhQ8w4FIjECmjXqxObhLiO6X9QzGmpU3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M9afdder3fSOdXdjr2c9t7YxQJZ5TICfdh0RhOvvgpL0aSANK1ViUb/umhlIaSWG8
	 DyVQrG9OChPZZqCCVFeLnphx0UFsBMFXoJYjRJxfx3Pk8Obdryy5sN2sx/SL8xp1tF
	 S/pFDg4kbuIazgAaGos//8tv0kfSgPTDG2DBBjEJDL5RDetpU6vWhISRw8jBmoZ45b
	 Ov5gbHOtvspiJwIVABz0cA5uRimhxEppBXR9D97/NQH7ic69CxsYYIFPSeSoptYxk9
	 OkVxLmaCK84xxS14D2X3s94DJdl0Y05tGJs8dG/vScHC8VOTpxl2JdOoNOB+QfyJAQ
	 rg89bf8CkgAfg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVtp-00000000sU1-45r2;
	Tue, 16 Dec 2025 15:19:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/6] docs: kernel-doc.rst: don't let automarkup mangle with consts
Date: Tue, 16 Dec 2025 15:19:26 +0100
Message-ID: <a6adfa3d775c1dccc9f80a7b82be003cbc0051d2.1765894670.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894670.git.mchehab+huawei@kernel.org>
References: <cover.1765894670.git.mchehab+huawei@kernel.org>
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
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
2.52.0

