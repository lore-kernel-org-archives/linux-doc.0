Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2603A7580
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551284; cv=none; b=figN5pkMuXU9MAx2TY5tKf0EXMhQoRd9yy0u9j7EuQnE0t+QLewWO0TSFKmV51uWs5QfY9wrkFVtH8R4Xh9SuOrExqlzCsNVOhDNmNer6giWUrW9TgnDXVRDj35Sh07CJT+RkOIxbHfLRucOG4IfBSHAbcyMAsE16j/ZswUpCsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551284; c=relaxed/simple;
	bh=E1VF4T7M7c35q9Qypwa46ANAajyN9sx88/WRdouByGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WE9uz/xXs4C6map0oc1h7GolmgKf4+Q1isjEtu+qQEJP1NEQ6vH1aAWdudVbHdXTpOwFtKqR/shGu6ZfVI7rJrHTU32pImsTTRAWJmxb5PCPXHgiNNoIpb9PUVG35deRTSmxBpiEfWMyF8hg9jstM4TXag7aiy9gWrMOo8dk86Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XD6MAfku; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XD6MAfku"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-66f3e7d9eccso778704eaf.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774551282; x=1775156082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=XD6MAfkuFGX+r6gi9KDzBjorR9+yatBNuBBp8//2Kl758ErMCwSme8Vw97j4m2J1TW
         VqSCbxkF5V7ejKQjEpmtmBsLsRc4elw1hoLYFI5G7b1WA9l0vtT5fiqqhCB600VifB+c
         68cBwFzzVBg1dgSLJqq3gsutZR2ogLIMPM0NZURgerBrdZPyLODUbKJM6HR0kX/tFO8c
         Jmfo99I60AtfhoxZrSCxTNkiFPCnHrsY/98+AWyCv9cimUPuMryG1n1Pi1+qYzzrYVf9
         N0hI7W67KBaaA2eg9iTSGZEH+334nJagp2Y2A4Gx4+BGMPi6d0xdVwuO3AZHTgq9g44g
         24Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551282; x=1775156082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=iCiE20oIChesb0liuRVfk32wjSVIdsomG7Zhzr6yDpjeExSE2gtHoWtgkcwY1VafO1
         1ZXmPPTrpv07/PjAeEswCFR/nBNEP8dxg2W0v3sUZ98eY7smQvefA/+C/XMo+1G3JgYA
         duJWTb71h6moCFc4h0z80mFiVOVrr6PD76jKlJE7yyyioOqBMnJR1BXXt4UwCxcg4eCc
         NzW5IIGsy7hyNd4IC7KzA7KYscpO9WkYed3PiwIv6H2j1aSt4jtzDRM/GzN9OuV8hfXe
         HoGSkxqa5uQYTAoAP+ip/BhPADfOINOYBXJjEXW4fJDnGRO6LYiYIuK7oMEoby+6kfYE
         neAw==
X-Forwarded-Encrypted: i=1; AJvYcCUB3VJ/5qV9dbH5mnqo9sThprwW5v/jJof3B4AnIjH0zF8nWewNjU7YC7ibG8jsRvVnwxNVLtiBdoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lgLZeD/rnn8U1/WRYNSE1pQ6bb16Hn3WyI8UVPEZYmMr3d1y
	nU/OBNr/NRX6ILaIsEoOWXIvwji2VnQSLQxLmmYtlJ6Nb/8WJSRrbdL2
X-Gm-Gg: ATEYQzzInX26yfJgfB/0/bVu+0RCm+5GUbOrX8oq8p+rGM50DV+uoyoCA2vo1d4PEzK
	8CaVSVWrt9HqDkiItQaf00ZeHHFeogCZefB5g43qjhibVMq7iLPTrH0pinckrYiZAjkpnmRWWa+
	8m3Md+lp/7bGW7W5DNdRW5+aXUbxTNUKALnRv6MDgHe8MtYzrnH4YAmawLvsMHc5Eq26SjMtNQU
	K78GXmfJRrtUYqCnmZ7xk7/5yhBnhLGEZ1SpmvBaxK7mcHWvc19gYeoDESedxOAGFmqqDKDhRDj
	bDB8N4wTitnbuBj+Ymfl8oSJB+BYNgPqgE9EjqRJyhDO6uBwgTAzTiGAqe2OVq67pRBkyATi6yx
	BJo3/HbPR0tn8+EuGeLsDIVSmdWHErwC/tQaoOqp8sd1CXAmB+d/G4q/jpK7f4W5qU4S9nflC49
	OY67SxTUTA6dqjFp+Om3uiir/y6ANKVRADdHm2Z76IzIfLdY1d
X-Received: by 2002:a05:6820:174b:b0:67c:2af2:a66a with SMTP id 006d021491bc7-67dff37caf7mr4976746eaf.11.1774551281759;
        Thu, 26 Mar 2026 11:54:41 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:54:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	skhan@linuxfoundation.org,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v12 08/69] docs/dyndbg: explain flags parse 1st
Date: Thu, 26 Mar 2026 12:53:12 -0600
Message-ID: <20260326185413.1205870-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4b14d9fd0300..9c2f096ed1d8 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.53.0

