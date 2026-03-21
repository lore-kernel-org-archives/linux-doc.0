Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9721D3D2;
	Sat, 21 Mar 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774097744; cv=pass; b=Tx3qrGPQ7vsvMRtoPSo43wxUWgafdd59PKd05vGkW9iWO7Su9o3mC/Tk50EAaGI7o+NvTlhHhXr1u0Q/TYpkzpkqFYMjKWWHBlDo1wElnTUiJo91Gvihvua3ucTRnhkOCCk7eGDJr/Yed/9jkvZEWWOR8U3nJshKrJJvSCfEGCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774097744; c=relaxed/simple;
	bh=3DCmSH+lnF7QboLsZ4jqXSovFWL/572b8sYJiJ9XUMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YvG3siVc3mYoHysevKp4llGLwO8cHBG/7wQsXyGERxm8FDhBvz54xlsN9P+sHR3tHkXhKJoMwbpgPce2a/T34UVqIQMi8ccGpIONd80eMwQnlt5b+Mr+nLFKI+BovUh6qDHmOWJVNYFtWDCuVemka3yP+Bc+QY0ufeJXh2Ho0/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=GXbYZEyB; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="GXbYZEyB"
ARC-Seal: i=1; a=rsa-sha256; t=1774097738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T/2JzyLRiJUW0IeR0mYVFNvzMEqIqpZNREY1fGX0VcZVz//agKtRCaAsZV4Q0GHADdHBdcmEKFLRPH29FzEQCURcH3QobLDXQTjveUgFMeBQ6JTYyqZrVS/fS/jYLH2cb0Vi9wtli44we5HzhF2AvqfnSYUqA111Wr1CGszpmrs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774097738; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UmdSciogW86NiZpraxaj8k8s3QoNtloqk0HmTS+PZ38=; 
	b=mG20/x6EvrV5z2Alew7IhISfYkAIVFlFT3sNWp/7yxDKgJuL/q3LGXDLv+1nSou46XBq2o986FT53ITPxqZCg5NMKagMtbei6uLJEjnUYQTlb0UWxkJ2IruQlTDs9z9tfurV/3PQLsZM05HKJVJonNWUJgYFBqqnP3EIKTSeL1I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774097738;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UmdSciogW86NiZpraxaj8k8s3QoNtloqk0HmTS+PZ38=;
	b=GXbYZEyBE3uPkZGD4M8hQBrc4MbP1ea5FA2PsmiNx9E7nBxLN9Xn9ULv2fVkBvZ/
	b3iutpzgdvBYi/cbK7m6Qf9BBiCPuFF9QszmufY1gEdi1SuEy2NbrRnae0u7bxg2DR4
	yW2QP435Z/JkidEV3EdgQ5TdRljnHLWheVEQLlS8=
Received: by mx.zohomail.com with SMTPS id 1774097735870793.4163569098663;
	Sat, 21 Mar 2026 05:55:35 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2] docs: use logo.svg as favicon
Date: Sat, 21 Mar 2026 08:55:32 -0400
Message-ID: <20260321125532.9568-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321111217.2404-1-rito@ritovision.com>
References: <20260321111217.2404-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Use the existing documentation logo as the HTML favicon.

This makes generated documentation pages use a matching browser tab
icon without introducing a separate favicon asset.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
v2: add commit message body and missing Signed-off-by

 Documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..9b822ab47 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -455,6 +455,7 @@ if html_theme == "alabaster":
 # The name of an image file (relative to this directory) to place at the top
 # of the sidebar.
 html_logo = "images/logo.svg"
+html_favicon = "images/logo.svg"
 
 # Output file base name for HTML help builder.
 htmlhelp_basename = "TheLinuxKerneldoc"
-- 
2.51.0

