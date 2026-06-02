Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D633BBBD
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780369938; cv=none; b=T30AgbbTOrm97v8MWiRDP5LsZ/oFvuRTrlTjT9iYacPfjT37olI7NO7PdgBHjikhmDzsy21W8fe6QdyPNCYHc6NL/1fVPAlE134rjKONz/iLzbvEygA9016/A0qspZEZzP1kI0fe1PH6NaD6mo7eYF0PsMWiXXRkRBwJldrb/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780369938; c=relaxed/simple;
	bh=6MGQSajH/OFnvX+n2HHxrJIuB048d2AdiirGhdfKFtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uunMrJyD4O8v+AjyyEFP4PhZasSxVqrpaoIhjFEyvqwaWUp9UI1BCtF6ZBncMHBdX9GxS5s8Wnen23A+YBAtTMLj01qmm1bToIN7oSy5tdpHUFf6khTUZ6u8+fc7ULBFNbbR2XMYAWBuJhCyHxsFnnuZYs+CDjuAi7yJrmI5qnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kWD9rCZs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kWD9rCZs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I4gGLAdNf52WPFFAYkC6rriPGKuD0scRD8vqOYbdLQc=; b=kWD9rCZsI9ykxKpUQbSM5exlqD
	c9Is3RG5x/xo6zEVXgsfJdgEAtw4754gR0HOPzyG71eC9E00/HXmVcpW+VxVIL1r3Vm2LkQOEUr90
	XwI7gASIVM6BHh4+BuYza+GZt8h755WUttSHiXuDAO3c7E48kfoZiKh0m969A7DuF49eV0pner7Zc
	e+EJ86FpIqeD34Ct4THRPF2UAV3tLZ93dKtHCcU8Moa7P061higGUbuiWOH4gCOARzzh/Y0Z3CEjQ
	3fB8NT8re6jbXbA1pMnOChw5FTrSkQ1FfcLzIhS510jTHcKO6z0tFu/K9PF4ffIrAyqOMAOb6jKJd
	cgLkgtOA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFY8-0000000CD2c-2YA2;
	Tue, 02 Jun 2026 03:12:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Dan Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] kdoc: xforms: ignore special static/inline macros
Date: Mon,  1 Jun 2026 20:12:13 -0700
Message-ID: <20260602031214.2817411-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c contains 7 (for
now) functions that use STATIC_IFN_KUNIT or INLINE_IFN_KUNIT macros for
function qualifiers (static or not, inline or not).

These cause parse warnings from kernel-doc:
Invalid C declaration: Expected identifier in nested name, got keyword:
  struct [error at 29]
STATIC_IFN_KUNIT const struct drm_color_lut * __extract_blob_lut (const
  struct drm_property_blob *blob, uint32_t *size)

Handle these in kernel-doc to prevent multiple warnings.

Fixes: 647d1fd04652 ("drm/amd/display: Add KUnit test for color helpers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Ivan Lipski <ivan.lipski@amd.com>
Cc: Dan Wheeler <daniel.wheeler@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org

 tools/lib/python/kdoc/xforms_lists.py |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20260601.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linux-next-20260601/tools/lib/python/kdoc/xforms_lists.py
@@ -104,6 +104,8 @@ class CTransforms:
         (CMatch("__context_unsafe"), ""),
         (CMatch("__attribute_const__"), ""),
         (CMatch("__attribute__"), ""),
+        (CMatch("STATIC_IFN_KUNIT"), ""),
+        (CMatch("INLINE_IFN_KUNIT"), ""),
 
         #
         # HACK: this is similar to process_export() hack. It is meant to
