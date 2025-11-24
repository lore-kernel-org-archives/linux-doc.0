Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C42F7462;
	Mon, 24 Nov 2025 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978276; cv=none; b=ikHAyKTwS6FfDiVdQ5JZ/dyudRKQbfvf778h6VfPtpkz5zZte7yx39K4MYks3d3VVTJ0DT3mmEqWIUAIe8Kuo68RP0/Bils2X+g2ZPmJGI1WlqvjYyCi7Hp15SQH1RGmAd0J4MAQ4HvH5b9LmBJwJzACyG/CMOd5wnwHA1fRJn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978276; c=relaxed/simple;
	bh=G398QL1RFc7oMj9o4VEOCqV1JI6qx7V76XAbDiL7j8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sEkxsdw4YCcTcrmV3u//4DQ6nhM58Zfj6RHtXo6QbPrn5H+t3q8P5Oq5DMbgPb+59JZFpRTxexUzn1BrdQuqQCIMKo+e4UaHRnNnbanvuKRwfkeNLIoNEATvtq5OuEHPO4DFh9o254ZM5MsTIuiBw/1f8WQP3wFUSnIRKAMVzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dH1yXeHw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dH1yXeHw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECEAC116D0;
	Mon, 24 Nov 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978276;
	bh=G398QL1RFc7oMj9o4VEOCqV1JI6qx7V76XAbDiL7j8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dH1yXeHwCQHXnkl5FmSFjJoF8hf9KVUb1hs3vo9qUuF0mlN4w37L+T8/pWKpX6oit
	 +uKbjsiuS2MxIt2vtsx75Tb8d8Pc3RzdHShs7r4SAzOFGkXge+3bQBLm3K7lI0yJ/Z
	 mzfvSccl4OLRkOT6kZ5j0/sAG7CXRQxl8Wj1EY3y7JjmQUOICRuWInfyQnAxhBgesP
	 oc4+fttanMf0dfPkoUUeMsWVuOk19PAKC72mgzX93wugskUz56eawhei+Oj94K1zq4
	 0T7xsAc1IVzl0B7RulPe6DOsNvJ1SkWDlv2k71xsbsxwWHhX17AcAzHh26G31d2fbT
	 41c1TgQ7iHcAw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vNTKU-000000013cC-0reY;
	Mon, 24 Nov 2025 10:57:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] docs: kernel-doc.rst: don't let automarkup mangle with consts
Date: Mon, 24 Nov 2025 10:57:45 +0100
Message-ID: <03b92bb6a6a482d4e365f2da9011dda9a82a7249.1763978209.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763978209.git.mchehab+huawei@kernel.org>
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
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
2.51.1

