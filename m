Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD9629FE
	for <linux-doc@vger.kernel.org>; Wed, 31 Jan 2024 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706691419; cv=none; b=MPL/QoRm1TxYdZIS62iJ656tGu2VST4L2BxLP2hJXAfjd6CtwYUjQOei1iMx1fY4ta0PQFVXvmWbec480h3Fl3njECa/KzqM5JEplRw4QjA2WAwXuzRnKnynGgi4//kj6QXYbL4u2nAR/cpss++Cx2tDnyJlNrSvklMUgLhxp/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706691419; c=relaxed/simple;
	bh=Mg2Fm0IZoJpIMheKQLc2Gf2GfKsLWjAgnLpo4ykoG2k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mc30J9GDE8kMJLIrB3rzbVxjmJ1NuZhSAzlBemxIVXqbAbi8WCdfBHg9PVvzA/VwPa06JJzpbz9PVGoigL4tlV2dzMAvTc8ZusRbZH8mYHB1q8k7F7S2WD6EAbNDSiXcqb88vec0+uDlscW80rFy6tvZV1CD6uN9i0kCqj/7qzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Svf5RO8/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Svf5RO8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706691417; x=1738227417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mg2Fm0IZoJpIMheKQLc2Gf2GfKsLWjAgnLpo4ykoG2k=;
  b=Svf5RO8/i921OD1vuOHsGFADfIFRM0lx4w6YWVR174vvhXn1HP2vxm3z
   HsON8hLxIeQe7UtRViZQUtWIuD6tEcgRxF7Zokj03HhDNmAb4NO+Ug79o
   OwEEH2bwxbT+F5AuuZabyyYsJiNbHTjy6/ht5eJP2+sjQm9HYRbGOrxHW
   AkB/OYTKo6IiXOl4MSrVQFD/kBYcF30ynSVFA1lWyN/BPH4T9nfDZP/my
   vSfoP5ofn/BJ1lQOPXfXrgmhTqvRapTLbdTVYA1+Vl4szT8uV0SRrAhnk
   NSw9Icy2H3X0zzhpzFQCnRnTJOdJ1WTixUiNtr4QGMAIWH2yl4iuQPssY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10175942"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="10175942"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:56:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907809256"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="907809256"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:56:48 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9D85511F86A;
	Wed, 31 Jan 2024 10:49:34 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] kernel-doc: Support arrays of pointers struct fields
Date: Wed, 31 Jan 2024 10:49:34 +0200
Message-Id: <20240131084934.191226-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a rather unusual arrangement in include/media/v4l2-vp9.h struct
v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
pointer to an array, which is what's usually done.

Add support for such arrays of pointers to kernel-doc.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
---
No change since the RFC, just added the acks.

 scripts/kernel-doc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8aefd258a29..23c91b11585a 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
 	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
 	    save_struct_actual($param);
 	    push_parameter($param, $type, $arg, $file, $declaration_name);
+	} elsif ($arg =~ m/\(.+\)\s*\[/) {
+	    # array-of-pointers
+	    $arg =~ tr/#/,/;
+	    $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
+	    $param = $1;
+	    $type = $arg;
+	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
+	    save_struct_actual($param);
+	    push_parameter($param, $type, $arg, $file, $declaration_name);
 	} elsif ($arg) {
 	    $arg =~ s/\s*:\s*/:/g;
 	    $arg =~ s/\s*\[/\[/g;
-- 
2.39.2

