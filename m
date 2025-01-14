Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33167232456;
	Tue, 14 Jan 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876108; cv=pass; b=o1EcPhPJ3/f+6zD2nBFd3fyrPR+tByeM1prai4yU5TAWbJt0lFXYSuUfP4spLScQgVXJ7Cry+/XGGBUnbKYw2dBD+faEHPQcjYU/6tQk8nGcldvuI6CJR+Js4OF2dchstWEcEddZez13hXxksWCb3xgrt3gYGVA+uEWqOPcdqAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876108; c=relaxed/simple;
	bh=1HAcPuBDpSLwG4zt1gIEj18I/4Inntxrv5UL7A4fAow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqu1i/+U9/N/MKW9+Uq9+EsPDWtKYJfPl7C+BJbRy+Va96VI4XzZBV8b7eCpHfxSy70OqfDmfAAZeDGHai8QnptdGG8f4UWzjhzSQx/YZLbKObnV2LejLvwTQzdZeZmcPZH9ILIPVRbR4kk7mHJ45/zS3ybLfi1HJ1TAl03Vma0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=EELpLggv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EELpLggv"
ARC-Seal: i=1; a=rsa-sha256; t=1736876081; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gRLiIm9gFhiGnSlRUahAk7xGqM/DJcdIyxqSamRZByMyhwlGeOFLOhnmzyKDZyF2PHpPJt8JoKi0v4U2ONCwl4W0IgOtvuI4UCrT1FVh+Xy5Ckhhzy5xrfDsG0vw6qPOzk1rqv7bDQcfi8MFPXQfxkkPXW8QUsmtHyRloncKxKw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736876081; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P7YSgOBT4ZEydHi6CBZLDANUBg1ODh9pUPQasV9rKe4=; 
	b=bZKbb4d792BI4QfLbUBzHQYU3LnkqG1/Vu8YRnjvpbdU+8ZidsJ37i4gdSn41sWbCpViY18PbevvXJnoZ0OIWNYaoiDEnBfXkPuOwp/2R2PJRN1sSy6eBxcXHXLNtMxCqLa4+LesAu/882Nl8sSGGNvyKeXDWs9JZC82SCTHiv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736876081;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=P7YSgOBT4ZEydHi6CBZLDANUBg1ODh9pUPQasV9rKe4=;
	b=EELpLggvJsj6gUSgahdGRa39ZwnSwo2uxZKSJbHw0M7afN85i+wFU40H8JWLAH9D
	xENNeVFJGdXZ7OtNTkoB7DWktNG8bfZID6xooELfDtNRHQwyP4N4figkzZzhIhztRqQ
	LZ+yJ3y03Lj30bGAqZa4H6oGQiQKYPvN12q4N8VA=
Received: by mx.zohomail.com with SMTPS id 1736876079266189.17953702620946;
	Tue, 14 Jan 2025 09:34:39 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/4] Documentation/gpu: Clarify format of driver-specific fidnfo keys
Date: Tue, 14 Jan 2025 17:34:00 +0000
Message-ID: <20250114173406.3060248-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This change reflects de facto usage by amdgpu, as exemplified by commit
d6530c33a978 ("drm/amdgpu: expose more memory stats in fdinfo").

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 Documentation/gpu/drm-usage-stats.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 2717cb2a597e..2b5393ed7692 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -21,7 +21,10 @@ File format specification
 
 - File shall contain one key value pair per one line of text.
 - Colon character (`:`) must be used to delimit keys and values.
-- All keys shall be prefixed with `drm-`.
+- All standardised keys shall be prefixed with `drm-`.
+- Driver-specific keys shall be prefixed with `driver_name-`, where
+  driver_name should ideally be the same as the `name` field in
+  `struct drm_driver`, although this is not mandatory.
 - Whitespace between the delimiter and first non-whitespace character shall be
   ignored when parsing.
 - Keys are not allowed to contain whitespace characters.
-- 
2.47.1

