Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63661E0DBB;
	Wed, 29 Jan 2025 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738172365; cv=none; b=LteXLKJpZ/d9tCFGQ+Omk6t+eug/bKM0JIGhcd4BTjCvpslI5Hys61Je83CKcjvVSVStd/r1IxYDLIpmU2XIfcX+q1xMNaWfQlMocI0Xnyypcy/cisK7FgK7vt127OQa1AC8Gn6q4hZJNHUsqeMzW51kpeGW+jzdBlO3HT1b45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738172365; c=relaxed/simple;
	bh=Bf+Ggk8s+xK2k5MzAXCalrt+2SfIZ618nd+Uv3woYI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9k6A3SDqN+nHySKjSoMtQfHWCAu+8Iim8rySHF/JcFUJe0fe60QcAj9yq1xjMhs+oVbrgatF6AL6IRI0wD5a3CIEm9NlZE9lX1ZrF0rRwF//uXMj0wLid1vIMFeghYymg10ZhzqEyuczb5/5wW/OrF2sSnJNis0MFv0xIS5pek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikzlJ2rs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ikzlJ2rs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B46C4CED3;
	Wed, 29 Jan 2025 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738172365;
	bh=Bf+Ggk8s+xK2k5MzAXCalrt+2SfIZ618nd+Uv3woYI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikzlJ2rsHjfSBYSlm2K8x+TfqqtEA/XQnvpAAB5h8weSFtcNW8pc77Zl/IG+G4LVG
	 RqqDfQ8kVI83/BUFlOZ5UjK4ejFLsALKUIn35Ylx0oAAy+34U/BuRr/pPNwz9OMUTF
	 e+EqnDHbLOuuZb0HNqRZZ7ve+uGVpJb1b8BHCAEip51OHEhrRP7RUD0NUtt3TTo7oB
	 75orjCQP+Xq0V0xrDXjiDo0fdjN2WAYpkZ9nEB3MHq1SmRaDbmYhUoQDTXoVNs0rMb
	 7lTu48eRyCc9lpD4nJg4xJhf0NH/M3QNgwZStvSyGO+zn979INdM04UUHIIulHTNIY
	 kWFTArdEforHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdC26-00000004SdY-3lej;
	Wed, 29 Jan 2025 18:39:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Ian Abbott <abbotti@mev.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] comedi: convert_csv_to_c.py: use r-string for a regex expression
Date: Wed, 29 Jan 2025 18:39:08 +0100
Message-ID: <522019263c16fbee2df8ddbcad2f4d5294ce0122.1738171937.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738171937.git.mchehab+huawei@kernel.org>
References: <cover.1738171937.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Modern Python versions complain about usage of "\" inside normal
strings, as they should use r-string notation.

Change the annotations there to avoid such warnings:

	drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py:47: SyntaxWarning: invalid escape sequence '\('

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
index 90378fb50580..d19101fc2a94 100755
--- a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
+++ b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
@@ -44,7 +44,7 @@ def routedict_to_structinit_single(name, D, return_name=False):
 
     lines.append('\t\t[B({})] = {{'.format(D0_sig))
     for D1_sig, value in D1:
-      if not re.match('[VIU]\([^)]*\)', value):
+      if not re.match(r'[VIU]\([^)]*\)', value):
         sys.stderr.write('Invalid register format: {}\n'.format(repr(value)))
         sys.stderr.write(
           'Register values should be formatted with V(),I(),or U()\n')
-- 
2.48.1

