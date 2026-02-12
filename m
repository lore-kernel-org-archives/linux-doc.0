Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783D4A02
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 00:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855259; cv=none; b=VKb4kQzB5p80NS8iHxexX06HZ0U+00nIVChsOYjJMV8xSyCYnj+GymmV6aN4gXseXcC+GVpTyoEyjUI034IemJn+TpBWaMdW4tqndxvH4eW0RIGn1+zXvVxG7PN3bh8bYU7gebcpJgxcKnG3s6Wd/UEbc7C/aFHX40ZGubruQCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855259; c=relaxed/simple;
	bh=E1VF4T7M7c35q9Qypwa46ANAajyN9sx88/WRdouByGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBtGYlTj2XvSnHQCXFfMc19SKpvVjpGCnmdXZpHOPtU8i+BAQKo95DGpC7SXXlCkC50nSTaEq/WxbNm+/6q7zg1GlrcGopgoNrQ3dmfHLVCBgmj5orpVRCSUTQklWExlKJZIR+apOcZaFwQpYXg/C1xqzDPSpyhcjiZ4uk6E1jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhNgj7r1; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhNgj7r1"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45f126d4794so1551769b6e.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 16:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770855256; x=1771460056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=HhNgj7r1S1flo6H8v+BC2Iom9XxPIuVjS3iQg1eeGC3yntxM0B9ZVwzdMXUENwj0oH
         eA6v2CzpFKfbTndJYzBft30TaUdJa/PHZcLIsSewG8IH419KiULsvlVLmWwYRUypKnYm
         ojR99d8Zf77FPJ76nKEG7Ja1YwqlOtqGYH1NWlwbc0psHm/yDv5oZJRaKw2HTBRqbqJy
         l2EewW4UbZouj8uStzJvcVGx0nBVFlOs8LjWG16TRyuk/sO0DxDSUlM0eT8lOX4pAmcu
         jqpUAmxnfLKH83OgBN4GSDCX2wfNaAKZLOUvp0zEWDafFrB2M0QaxKzUUPEw7vrSF7Fs
         LrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770855256; x=1771460056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wIIBK2xLHmy9ZZczWpP2RzFmOx4bELZz7aMw+RGO2w=;
        b=rbLVMPMaTVbfqZ158siuWcAeCfsuqGK9w3oOCKWgywYnoxCEiLcNrG8UFycZvsmYnr
         bBCYivD512i115KJiDceMk2gcD+JkNcWXxlGdRC/QfJUows/WuCXIwApRJIVUcOAYg4W
         dud5kuq5j/9nCNrT3uFgjB+MRGGXcrmg4x1ptpBVSxkvUoMHjGhnYz1BKkM3X2G1iTOO
         gd7az75MkDS/XgkK1J8NLAItdeMMuQTaqBjjvm9otSD+NwdEJxPhNHBADRerRxtyge8o
         EfSt8M0m9Yq63SD6pQfXlVJyk9avLBsAkWsvNXDDXR67q7JUPXlFBD+aCuuFLQ8fKisS
         fRow==
X-Forwarded-Encrypted: i=1; AJvYcCXTdFlvn+dM7W8XbMaZtt2/Viqot5dn7x2yQtCWxMQxve7M84o6nZeXUH1nrQQn81pp64jbwJyS4GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPdFcuvHbIgrVNXrkdGnxmXsfs7keJCS4yXS2JetXtcO7Hx89+
	UiP1IlfYNZNJo9EEnnw24TBrJtoX/imDZhCmyh4a2y8FweLfHQa+98ko
X-Gm-Gg: AZuq6aKMgCTxgKo50nuqSCe7JN4epPogtbBhh9bmbJwptSH0BVSh8DL1lfDlbzjFPcC
	IRpfZbothfqSkGrdmGK0QAqpfuhmLwt/QVK5d5vF7gfQuyWBwK3Pn6GSDzDYuRIic8ZXTASrknp
	vodZ/RnWqhxIi4YEzYpFnWAS/RNtKN4yI9hs2eYMQsZ8TAjOVfdnrryvzyIvtOsScJPhtJN+5m7
	PRpE9H0emyWv3xe0X5CJfYBrM2RKp1kh85ZlQ3J/oCvQe41gHS0Qy/MzRfWuDtNxnGlT4f6pY6C
	jVvnVJITl2nTyWkPRqIF6alVCuwJzSifbqArLma5J5m8+3d12txg/8aXgOPj2P5U/tdJkNWv9JW
	73SyOITa2ffC1d94EpTyhUyr9MSL5RI7JR3/yM1jU0iotHeGbHTPWZC4aDdhPkBXIXw3DqsZMhq
	Y/r6Z0/NnofE6ZXNgkSGKiL0Hs1RlbaQxvjoRk7OvCt6AFmjXeirXS
X-Received: by 2002:a05:6808:c2f9:b0:463:4f2e:c50f with SMTP id 5614622812f47-4637faed46dmr324169b6e.24.1770855256667;
        Wed, 11 Feb 2026 16:14:16 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 16:14:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 05/61] docs/dyndbg: explain flags parse 1st
Date: Wed, 11 Feb 2026 17:13:00 -0700
Message-ID: <20260212001359.97296-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-5-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
 <20260212001359.97296-2-jim.cromie@gmail.com>
 <20260212001359.97296-3-jim.cromie@gmail.com>
 <20260212001359.97296-4-jim.cromie@gmail.com>
 <20260212001359.97296-5-jim.cromie@gmail.com>
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

