Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869F2BCFD
	for <linux-doc@vger.kernel.org>; Sat, 27 Jan 2024 18:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706381615; cv=none; b=LS61hZkM+96Je+wK5lgG+8MAqgdqptLpgtWKQbzDEBrl/eCa4ogjVMKOzwYb5aOs7c/VGs8sX6GHpURrAkTAKOa9ggjKAdmPzNU0zrUFlOMrCbYmjvpQrB2E6eVP5NhincwCTerO8v5bnl4fORO8DzyQLgXhYnacL6kEsznLIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706381615; c=relaxed/simple;
	bh=sZ4Wx24+yjxg8P2CrGY/r14DmspcB1MpiDfjRAodg+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mqp6vMLN33xBklvR/4FJMEXkd6VXyXXErK3KEucU0o4pF4bSt1JEhVa25SSoSMBpbAoIUqDua5UsIYU/nKSvGCKajy/YbOH9Y3ZpT5w46HiKJ4eapAPdrj7rSxD1y7Hd1A6i4/7Ed/XfXmJfchIyRrczUOAUJ3WdcBxjGiYgKbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9RwUDg1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9RwUDg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706381614; x=1737917614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sZ4Wx24+yjxg8P2CrGY/r14DmspcB1MpiDfjRAodg+Q=;
  b=d9RwUDg1ayBv2zbGJ+VnplaOBMUK+JG+NlL/k1lYzbaCtU//gkr68IFo
   mE3nAQo8PNz+BG/Hq12q6TE5g2ueYiVpiVKY0Mim9drpHllIzZR8eMZmB
   a5fFIi3BwFYoUNqugxE0W8dDaAN1gTyZZ07Jmfm3FdBWBZ70Tq7v0+O8X
   ir2VIoUvvsNyiNTaRHg0MeJuyXaTxW19O6lEjprESBhD7ofmQOAQ/zwe6
   UNOdLfKQCETvpWPJb44/KHsfvaSU9LJtpQJG4/orLHvv10ThGpfRY9/kh
   cY5oeBC7PonEBSMebjpjrcuCIpMLX0RoU/+4CAobGOuoTLw0FH8FAl0ZX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9357071"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9357071"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 10:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910650189"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910650189"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 10:53:24 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A61D311FB1F;
	Sat, 27 Jan 2024 20:53:21 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1rTnnt-001dxo-1v;
	Sat, 27 Jan 2024 20:53:21 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	"Bryan O \ 'Donoghue" <bryan.odonoghue@linaro.org>,
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
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-doc@vger.kernel.org
Subject: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
Date: Sat, 27 Jan 2024 20:53:11 +0200
Message-Id: <20240127185311.391940-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
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
---
Hi Ricardo,

I tried to ram it together with processing the rest but it seemed
to complicate processing the usual fields.

 scripts/kernel-doc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8aefd258a29..728b1ffc0478 100755
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

