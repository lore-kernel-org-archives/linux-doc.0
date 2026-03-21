Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20563B9;
	Sat, 21 Mar 2026 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774091562; cv=pass; b=hPWW+oFQZIxiPFS2Wo2Ny4EVg2369DceiGaUX3hhjrdsov5mMD4HeL8KUxFbTesUgzF93JSS2pbFnBIS1UebW6i7f4KPBwUOLoSvpAvq/bS/GKculpsZWo2iCYLJYQDRdn45pJGFPY+ubrTb8q0kpgi/rNPX2RY6BBH+8DvJFDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774091562; c=relaxed/simple;
	bh=xEAwUtGgOhUpKZlXUo9OoPTXvsChP5ZPff4UWSJ1hy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCZ3gJ4My8HXyLzikjgApzahLRi1W7A13J9lNuIQZr5I/FrdLqdGtBSt3VnM2MIpT5ZsVYhlKez1pJ9AubLODdO9apXUc/NGSRJTaogNxYNNsIaJ95pPOD6LisG8gyeaqf7+7VPz3t3TxmOX+Qd03Ov69+vrXgrVygSH8Q0zDYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ZkJzVNa/; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ZkJzVNa/"
ARC-Seal: i=1; a=rsa-sha256; t=1774091555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kTOiXeC66uX+ZFtiyZHzfm7MUVjO/errr33pd+v9wlKNOC/DfrOovr5MHB7sDOw6Uf8YMC1BQLXLtICTod+X57VezJdbgTHzFDNELcDUoqjWMyn33ZGSw4LrHG2vTZwy010PnIuJTbNdIn2g/BVUMGEXtIQ80BtX2N4A+I2gxrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774091555; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lg/Zc5p2Qb1UkiWPVxDJ1ZFfbQn7l/RpXbLctbWIjIc=; 
	b=W2KMZmvx3sbP4NbMuQvoWyfaXXZflehd1ilA9EySHPIs/sdb/NvOhOR6G6F/mvlrFUugL8GsJ8QeUhwjQXHnYCVBchbPPxcEE8T0QBGyGvPTAUDynyAkNtLsaCCeyHtvHWg3yVWz8yZOyEJIFgLVDRwd8klGC386lf7wIvQYiuk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774091549;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lg/Zc5p2Qb1UkiWPVxDJ1ZFfbQn7l/RpXbLctbWIjIc=;
	b=ZkJzVNa/R2R3sasMICqw7ZWs6OG98B5T4Ovwgb2ZmOk5UEMmeHs1X8MCktcGmgfh
	WHQ+PN0XIWBDT1leDEeGvbOvXpfIPJ3AaqBzA7WjDnNoRWhXkIsnyylK8SuNtVdFHk0
	o2ILT4LpoQ/cYklj+EiCfubPwxfSDgzA5mJPG60I=
Received: by mx.zohomail.com with SMTPS id 1774091547493585.6130472792196;
	Sat, 21 Mar 2026 04:12:27 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: use logo.svg as favicon
Date: Sat, 21 Mar 2026 07:12:17 -0400
Message-ID: <20260321111217.2404-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

---
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

