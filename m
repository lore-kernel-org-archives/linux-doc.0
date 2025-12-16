Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF2534D4DF;
	Tue, 16 Dec 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895186; cv=none; b=ByueVtS+LmR40yOtXdV00LT0kBvYIH0nZeoD6YerDVSh16KCuD3BwikGxagrphv9TZKs4ab6/mGab2tKDbyAixXoR7j1rUROdensFgZwEnnF7BnrOXRVmsGmWaZ7pXGgrZ24d6sV0Mz3DD8oNjN2sTrGZAIuyrGN7sFOoo30uaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895186; c=relaxed/simple;
	bh=UB2o82o87HHa9AtHwJBPazCyg8AVw8kzw99ZHsm4WaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHdbnLNYA9vlpx1naOtQ4rowu7KBazQ9vbem4X9WVkQxVZfNevm1P25G7qYgUd3iBp9By1/N3i0DgiL6UFkhyy+zTczsLCQg8M8iQQ/jgd9M8LOG5M5VsAMkHpndsk9RgTkVAuX44Fib/+ugKXS0H1HMTJpuRY9j0tfrX21/Ul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQvuOZLO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQvuOZLO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175CEC4CEF1;
	Tue, 16 Dec 2025 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895186;
	bh=UB2o82o87HHa9AtHwJBPazCyg8AVw8kzw99ZHsm4WaA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQvuOZLOVf0dwIK7B9/4YLGOxmwnJUn7rQPBfuJmMFEm4A0Sw3IsTNlhH7SXcmi40
	 LMxVUKNx9aXK1FM93IXwxBjdT3JPHczYiSg3MswSz8CZN3bAagtgZDCCWdhzz4Ebgn
	 8rpaZigDcGxiH/rfX3rJizYYRKpaFUfnXwB2bqg3G0zzUZNH9e9oImJRQXIhnKM7NP
	 rgQt/2ES9P8TPYzB2/BZNv8RoEtdyZZ6cA3Ne0Gd5MYD60BJOBUI1CIo1/L7pQiAqx
	 LNYXYFnFdFMEf5A9V9Qd96vCrfyJEFtC5zn/gA2dULMJnuAxhTVzKV0AmsMmJ0Tczp
	 E9yIsRxTu3BzQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0O-00000000swy-1Vqw;
	Tue, 16 Dec 2025 15:26:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] docs: kernel-doc.rst: document the new "var" kernel-doc markup
Date: Tue, 16 Dec 2025 15:26:16 +0100
Message-ID: <aa0e3abcd6882a62f3ab9c34033c60fca1c44604.1765894964.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894964.git.mchehab+huawei@kernel.org>
References: <cover.1765894964.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
2.52.0

