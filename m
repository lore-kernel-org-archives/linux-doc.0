Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C265380F
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707917385; cv=none; b=PcdyWtv0k45R/E5UDCIGQ7s6ySqG0Yc3iu481cgcwFgxzY+XoXzYGrolX3oxNQQ8B+t3CAkuR2T7ZP+EC9ADwcwHDzVGdD7y4MZYvodwcLAJkfmrOxOUBJtxdEJYmpVI6zM0bsrGlR7981eM6DsOSe6LSY4nlNEtUtdNmam3c1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707917385; c=relaxed/simple;
	bh=i3KDxYDEmcCMcolAFMI0LBAO/oLM2NZtgMXinj81b2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYK9g2f6KK2xtU5128rBdNORrCvpA0lBfWdaCIpMNeSK5i20GIwA1r/MaMvV5KEqLd6u5qOQ+D7GnmUwb9wWO+GK5v1YHpIRQOsjufMMh2G9SINlX5jsiniv3ZEc+s8vdwz4UpxczXC3pnIlm/Zz+rXahdmzZ5y9cTLU9VgVxiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=b1UAL9EP; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="b1UAL9EP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=pHkCbkg6+bjPOnMMgkbiYJ3imlUHWVxGwX9eIQrm52k=; t=1707917383; x=1709126983; 
	b=b1UAL9EPYjD9QdOYrmRVqyWazMfaUqe5qPESTbJouSbdE58FvTNswWjmV83jbXrAJZsbhm8TEfV
	VjIVhfRWKyC7VygTbq2TkdFiAEZiRfZ3kMgeb62d0nLyhkk+MrOeG5J5IlKx4L0Gndvx+rmIYS37N
	frOV5/IrsBLE/MGReFf5CnUdRQlBe5epGD2rU3qMrpqOzr1GGr0NLtj244fmI4mX2dltHyyVkmvs7
	t6ZCyGNjuL+YybpJNGy91GfN28cIKD/PoFfFaB6cTSiO3+35CujEzQ+ZFLTuA588yfG0XUDwA3OmT
	eoN1hAG+ncF6yjfjw1ZDzHerrF69+qrIv1nA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1raFKW-000000098Cc-1kiT;
	Wed, 14 Feb 2024 14:29:40 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH] kernel-doc: handle #if in enums as well
Date: Wed, 14 Feb 2024 14:29:38 +0100
Message-ID: <20240214142937.80ee86a3beae.Ibcc5bd97a20cd10a792663e4b254cd46c7e8b520@changeid>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Johannes Berg <johannes.berg@intel.com>

In addition to #ifdef, #define and #endif, also handle
any #if since we may be using e.g. #if IS_ENABLED(...).

I didn't find any instances of this in the kernel now,
there are enums with such ifs inside, but I didn't find
any with kernel-doc as well. However, it came up as we
were adding such a construct in our driver and warnings
from kernel-doc were the result.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index e8aefd258a29..152b42181662 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1330,7 +1330,7 @@ sub dump_enum($$) {
 
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
     # strip #define macros inside enums
-    $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
+    $x =~ s@#\s*((define|ifdef|if)\s+|endif)[^;]*;@@gos;
 
     if ($x =~ /typedef\s+enum\s*\{(.*)\}\s*(\w*)\s*;/) {
 	$declaration_name = $2;
-- 
2.43.0

