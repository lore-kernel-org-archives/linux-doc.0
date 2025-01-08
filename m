Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32581DE895;
	Wed,  8 Jan 2025 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370225; cv=pass; b=s+0lobeuDfOy5Q0J8de2mRTLaF8WtpwnJ7BnjxbY673lwcVlW3reWep7Z6hBma6ZM2p2UO6loDmPNMwPz3XvLqygirrg07076Do4MoHH3R35UIBj0nLyVF+A4QFrIRW3dnSKFe9VwgwcIF8y4GQ5Vkcr7ZRV3b7WpLjkb780mwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370225; c=relaxed/simple;
	bh=zXnH9XBdRUOFnQdkDwSmHtIQYGmYZVv2cAFrc8S0RRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nSZK1DmCt6cSZuUuPCAv0sNucVH7oNNHaBCKckt/YuwTjYpNuLmMZ6iOned68l7EWXm2fbkHG4pYTFh78HqQOkgvxm2g7UqsC+lEkDQk7QsDPqN+a3oQUjvsvpFYWpkEWCnK+O/crooMWdBiuOenqqEpOaLEzJajj0wbWvGQ0tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=FAUc4oeB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="FAUc4oeB"
ARC-Seal: i=1; a=rsa-sha256; t=1736370207; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H8Jb2K4zs+88UpB5qz00vGVfFUbzy45RkhhnXTZjrXOuRmlDxBFqMcjnPhw/64stUUnqoL0strMRAOhKcA6/kTWgJOQqqqQmm8ILu5388pYFzT5Li18gnwSdmWVU4P4a3cU0TfiysYl14g3By+ealgt8w3mCR6nZz5INHIwfEVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736370207; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j02AXCvuCHibfUnBxBkuO49rQkRYm6/Ti75LjkepN2U=; 
	b=PcbLB+W4T40G4tIFW3FXIlXpBvRR/RkYlW1C1GuwO+IwkKdPPhDajgT6XmSFoYaZy0DWbxw2jhcsfb0fURAttL5D+kuOAtc4P3WJktFHCtYH8QceYRnnsU4eINShPa/pilD+o3dXDc+rs99Y5/SXWtmM3kSWRCb8oOn1BHRLqsg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370207;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j02AXCvuCHibfUnBxBkuO49rQkRYm6/Ti75LjkepN2U=;
	b=FAUc4oeBHp8DPo7bLj2RB423IhAgkROH3gUL8hPeJvR4fSLvaBgvDONXDJr46SlQ
	92QDrzCGOwb7L3RSmkOSyOKtJsjeVKsiXQtBVI0bSkHSQFOmVM8dECxEn1fPIgtZ2rF
	/8aL+Pl2UqR8u1TsJR+gejmJwR8SUaG67pEEN+vo=
Received: by mx.zohomail.com with SMTPS id 1736370206747493.3339975056514;
	Wed, 8 Jan 2025 13:03:26 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/4] Documentation/gpu: Clarify format of driver-specific fidnfo keys
Date: Wed,  8 Jan 2025 21:02:38 +0000
Message-ID: <20250108210259.647030-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108210259.647030-1-adrian.larumbe@collabora.com>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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

