Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF064175A74;
	Sat, 21 Mar 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774097359; cv=pass; b=JwaU4o6XRDtfKa4A80+5LD0xeO0+Np2RGYS/0qJ9BiHiPADv5Xc/yKbqvU/1FiBMjuo/5n4wpw7iYDLTlhkBsdVohxqHM1vjFbCKVJeFJA9yF1GiSX+tsmHgj7/D15O+lvrfEzFf7d9Nu3e7AO7yuoSyrG61Sbwv/nM4fQVi+8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774097359; c=relaxed/simple;
	bh=rQMeqwQ6Q/rgsp6qWm4ABtSz/dcIK/NRMtC7sx1sios=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zq8EgXwL+2hBy7hmoQ1P6f4qAWR93Nm63ha/M92UQG5DR+cXIVH5c4xGOgsUlylE1/znkWE4mG7XMVsu1w4xqzmeVbkUlwAbGI8Cwl+niJjo+u4TTS6YgD541F9GK8t0SDRVbHvpSd6JsFgdwi85GqEPgUA/Y0Az5pCfieu4sto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Nw1J85tx; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Nw1J85tx"
ARC-Seal: i=1; a=rsa-sha256; t=1774097355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CtQsju5y9l7wNyZjUg5lJLSuhQCVp/LTfFIk0ZYumKPszoCrm2CRC3K4hMe9/1OgrgNFCyvN+c8hFEUlPexmW97FuCOUdXQ5Mvar7T1V4qfrMMV+OKAcx5t6qOX/LLThD/LucenKteODyn8LqKHNmbDlM47p5cCST8Vq3HoW1fE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774097355; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y87EfhqD+eCvKO/NYNJCss8iK3umvmGajAYBr8sotwU=; 
	b=M1h+OpX8pWwNryk3s4zzJYcuAHsF9gouj4pMdLmgSvp3ixhvxwcNSCTWqjZ2gdMPhWyZ3YqMN69Vpv36lAl1KWGusOeqYzdT7T3iqQiBW/bJXuV630iAd3Se3wo/XjW+qRy06//MhXpDUo+HqZIWYCGL8mNLdpHVHFKKyKvEK00=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774097355;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=y87EfhqD+eCvKO/NYNJCss8iK3umvmGajAYBr8sotwU=;
	b=Nw1J85txujkst/nMjLyK1YrHgbBXs/dRyK6JdN9kbs7YrvXIyKeiiNPefAHMwwDC
	XvuAypQXVSV1KwO+lx83dLg8co6JaG24f+rIuQvXskJTfRmbXmdEO/ntRGTicbCP+XB
	2FenbAG6UJ1aFMIJ5or3gxy+U4RgIqhD5E2FkKvI=
Received: by mx.zohomail.com with SMTPS id 1774097352929711.6761207349692;
	Sat, 21 Mar 2026 05:49:12 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: set canonical base URL for HTML output
Date: Sat, 21 Mar 2026 08:49:07 -0400
Message-ID: <20260321124907.8524-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Set the published docs URL as html_baseurl so generated HTML pages
advertise the correct canonical URL metadata.

This helps search engines and other consumers treat docs.kernel.org as
the canonical location for published documentation pages.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..f517dfeaf 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -437,6 +437,9 @@ sys.stderr.write("Using %s theme\n" % html_theme)
 # so a file named "default.css" will overwrite the builtin "default.css".
 html_static_path = ["sphinx-static"]
 
+# Canonical base URL for generated HTML pages.
+html_baseurl = "https://docs.kernel.org/"
+
 # If true, Docutils "smart quotes" will be used to convert quotes and dashes
 # to typographically correct entities.  However, conversion of "--" to "—"
 # is not always what we want, so enable only quotes.
-- 
2.51.0

