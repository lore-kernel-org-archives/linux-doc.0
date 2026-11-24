Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538613;
	b=Wjzia6Nf1PrBcTEZcxVRofmojo5nGtzginM/h2kiTRh6F+kX3e482LGQCIHlOFI32a7t
	 qZAhTPNHJEaxFkzIX+aXjO+TtSTequc7RhqY0067NznqguwR7S+8PfVZCBHvl/pQ1N/+m
	 ek0Ng7TQFohnvLMsU0ozoVSdONEIHKEtkPHMhRS1c0fU2g/7LLFqvhhVQI3C6U2E0pg0l
	 2ffsCLKLt7/hSl947uvw23fV5X92dZVO35DpAla+VumcG8ACguNeV4XgjJElvt2OUSkAP
	 ArMnUD6A3TzeiSa/fEpq3aJA+J+BOM1zRARpOOEmQiRdGDatMf8DLiKGuGX3YXFD0Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538613;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=VawyBAYS49mZE+tLhGihQ2q9UYWN7C8vca8HSsuxFKQ=;
	b=AyzPlzooJLapPdlqxi2PySzIR2mTvXRYfiD4rsjdufuvOAVJ9ueei9vXWTOajd/UKKRC
	 YaI9wILvR4s8sx7Je/qym0CBCTJ5lONXDaHnn9RhxVeBI2rS8vF9caq9mrYADjuwB//Au
	 L7chEW26dALLD6/GZ/15DJJ4hpolmgCllYfEdBKT302d5neT9KhyJuRA1PIZDhjoIp87G
	 10v5ZCEbVbJm38N6Yh0ylG78f6P+a0PViHkRS4gpP8rKaAp352JGpaQGMqIRX87KS2mZu
	 I6hVZk7sgwLxXw/3ZG5cW97cNgiUaiu8wB6WoHoshns0HXodypubWM0N1WQBQ6asJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AVMWWSMe;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A7606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 16:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AVMWWSMe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795538612; x=1827074612;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Wex8W2SqXXpZeeH1lsm5Osq+xJ1+mTpxvrgaVi2dXyQ=;
  b=AVMWWSMe98K8eULZuBo/gh3l6uvxgIwYA8ll2m2PRHISgm1UWNdHuQhl
   B8wQQEtStg8kx4jcB/7U8JzCDzQP1xrVb+NKpyXbgK+g+fQtjDGGDcNmj
   JkmV7cqq22iFR8tO32SLfP25s67/qp/ev/VqFexkzwSw9vYBw2b80W0d/
   yLCCfzt6dWyFgh42Yl6RJTeclnDoUhaWMbafmc3cHCiiWllOW+dM4TCmn
   q1YaW8GMC91iQalAZEgtO5XGVDJcvvhR77O059TKJqkEZ0WEYo7U5TFKg
   lKFZYtk8SOdz+5X70D4mHYPbbBBeE2H4EvfdyOYuLJ57wlmWWs4zzMMnu
   w==;
X-CSE-ConnectionGUID: by9eH+ydSOG2YEugOceGUA==
X-CSE-MsgGUID: vQTf+vyLQhKrRx4mQMJ/ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4252446"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4252446"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:38:27 -0800
X-CSE-ConnectionGUID: 2GlGEuQFTWewHOHemn7T0A==
X-CSE-MsgGUID: WZy/zFj3SLCcrTxVLyRfDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11620532"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.215])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:38:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH] docs: conf.py: use master_doc instead of hardcoding index
Date: Tue, 24 Nov 2026 18:38:20 +0200
Message-ID: <20261124163820.1587424-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

The name of the root document is specified by the master_doc
configuration option. Use that instead of hardcoding "index" in conf.py.

It would be preferrable to use root_doc, but that was only introduced in
Sphinx 4.0. While at it, add a FIXME comment next to master_doc about
it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/conf.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..6c986f64f764 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -103,9 +103,8 @@ def config_init(app, config):
 
         # get index.rst, if it exists
         doc = os.path.basename(app.srcdir)
-        fname = "index"
-        if os.path.exists(os.path.join(app.srcdir, fname + ".rst")):
-            latex_documents.append((fname, doc + ".tex",
+        if os.path.exists(os.path.join(app.srcdir, master_doc + ".rst")):
+            latex_documents.append((master_doc, doc + ".tex",
                                     "Linux %s Documentation" % doc.capitalize(),
                                     "The kernel development community",
                                     "manual"))
@@ -114,7 +113,7 @@ def config_init(app, config):
     # When building all docs, or when a main index.rst doesn't exist, seek
     # for it on subdirectories
     for doc in os.listdir(app.srcdir):
-        fname = os.path.join(doc, "index")
+        fname = os.path.join(doc, master_doc)
         if not os.path.exists(os.path.join(app.srcdir, fname + ".rst")):
             continue
 
@@ -267,6 +266,7 @@ source_suffix = {
 # source_encoding = 'utf-8-sig'
 
 # The master toctree document.
+# FIXME: switch to root_doc when needs_sphinx gets bumped to >= 4.0.
 master_doc = "index"
 
 # General information about the project.
-- 
2.47.3

