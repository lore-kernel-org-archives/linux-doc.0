Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ED33019A4;
	Sat, 21 Mar 2026 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774102288; cv=pass; b=dt1p3PnohEowDS9Eqc8XRNwYy3IB63OsIkRlucRt64S0BrEucLQlvfLh45QCX7ZcPByLe9d1EWG5MBMEkdflsK5nif5xxFCMrg7p7DBtpwlSjBrwV6UlsfRD/85Q0FO9JF6195xlln2cyXxeUCO/aVs1cNqO0onEA2nFopmyDJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774102288; c=relaxed/simple;
	bh=7C7GFJJjkYtiWQFiUuK/Siw6KSenPOWY8mTOYMVJERI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5O5AsfsEcEwxhqd82mR9GsncmrAij4aW5SasjxRsHb5XTI5Rj3LjDZAZPFZeFfq9xl1ABsft0pkulBHA86Hv3awZMTg9UmzddA/J6bJ1HxAJ7JIOPO8mbztLi8UTz7x1Il0l5VknhCL0nxlnJBoyoxg5msx8uBE4t9goI3d0c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=adKkgc4D; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="adKkgc4D"
ARC-Seal: i=1; a=rsa-sha256; t=1774102283; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N2f2y4rYJoq45HY+NG1iJg8LpxLHj58PjBDCcX6hF0sDqfkLWi0js1d/dWaehArmSEjfstBoOdgzdi4RO0UF9TBraaZXlNc6hQbKzPj68dYjEhh2Eck+7ddLiEd3PqnTZ0l5w3IFrPBG3tZQ8pcDtZz+NPE8dJVtUHig8N8K0Nc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774102283; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tAFzpW7ocYPC0WMxoXJDGfOHtbVDEuv7XoX8QxZ7vA8=; 
	b=HGgXAAWE8JxaPJewQTCHuMhuEXgCeaUvhlwzSBAcO8Pl51tQ4GO/4xgVo78Nolgkj43k5gScBa5suwbzrKeFO7y0bRR9pb+6Tfd5/+8hxV6HOULdNxBTQGC+CcDYCL9lAbdmPtcFgadTLNlVpc873v3vIDIwevyM0ESHGsokTzc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774102283;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tAFzpW7ocYPC0WMxoXJDGfOHtbVDEuv7XoX8QxZ7vA8=;
	b=adKkgc4DvmLLWj7gXx7tHUpNVaKD5m9Kri+oKdY/v7jDvo3fW9XDGxWMwgbt7pHE
	SMzmLzXwu6Ww7zH464xEp6esJm18LawY1yjsbwFd/+2yMEt4O73aqlmrw0LfJq50Aqy
	KAYm5D8nV6j0sj+4XWA5ItDqRld+iw4UmdfUZ5C4=
Received: by mx.zohomail.com with SMTPS id 1774102282130992.3613459556254;
	Sat, 21 Mar 2026 07:11:22 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 0/1] docs: examples of pages affected by inline literal overflow
Date: Sat, 21 Mar 2026 10:11:17 -0400
Message-ID: <20260321141118.23828-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Examples of affected pages on docs.kernel.org this patch improves:
  userspace-api/futex2.html
  userspace-api/seccomp_filter.html
  hid/intel-ish-hid.html
  hid/hid-bpf.html
  userspace-api/media/v4l/ext-ctrls-codec.html
  core-api/dma-api-howto.html
  security/IMA-templates.html
  virt/kvm/arm/hypercalls.html
  hwmon/hp-wmi-sensors.html
  bpf/map_devmap.html

Rito Rhymes (1):
  docs: allow inline literals in paragraphs to wrap to prevent overflow

 Documentation/sphinx-static/custom.css | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.51.0
