Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841B32D641C;
	Tue, 16 Dec 2025 14:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765894780; cv=none; b=p7839BZMo9IldzzsmDHbXMRBEldT2aD7LTtThhhWOHCxgbzvQQcYEDJACsqm2GrW63ZTh1nfi4EqxJhNW1N3+l4/+8bF9c/Dsz85YdViplXJ3xW5pDTGdSv5Ic/HEdZpAd3XVWlklGpRlP8cjOvAlUcF0pW4t+I8tBMdy4YYXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765894780; c=relaxed/simple;
	bh=LW+my7+Nosv4HMVpRcedr9bi+/i8Tx3j1/Iz4nIDNOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0Ebe/G3942DkMYJc9ku1rqoz4QmkuSWphtIj5x8YveYQxns/prKN42/DlEd5zgOZPS8x33PZAY5Ha7P/UaaImpQ0jTDNTELqSagfkFSKYhuJkrVwYYbZND08LnsXR1WXx5ju7w4E4OjlgWH2027PvJat+chIEfX2Jfxzgwtvcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YButqyMy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YButqyMy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F31DC4CEF5;
	Tue, 16 Dec 2025 14:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765894780;
	bh=LW+my7+Nosv4HMVpRcedr9bi+/i8Tx3j1/Iz4nIDNOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YButqyMyojwZimpQsHmdp2sPviAv6ihgEij+xONl2KdTQqmvScYzRveRT98MpAycT
	 gs2kMZ+5vsefFRjwg42lY8aQHtdiNVJSYfEYdVg1FtI7g7ohWhQDdDzJXVK/RDhNeq
	 2kuMPdu8CD3ZIZy6bjODRZ/7SKs0kIFbBrndYu6TNhEGR0VxVrnOySygDCNAstzIKe
	 hL7qcK9X/A2vrt1MoXVuRDwaPPcyJ5/qRKAzCxiDJSjEfUxw7Zi4i9iz3NAOireMGk
	 jg5ZN2sF90pHLKgG97zhQFxxo10THJa/k60vxgMic+0bD7YW6hXUk1kZHk7YxID8sk
	 hHHuZJR4nChzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVVtq-00000000sVC-1NTW;
	Tue, 16 Dec 2025 15:19:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] docs: kernel-doc.rst: document the new "var" kernel-doc markup
Date: Tue, 16 Dec 2025 15:19:27 +0100
Message-ID: <1cddf44071c19fe3489e1db0b18bc779d2e8e212.1765894670.git.mchehab+huawei@kernel.org>
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
2.52.0

