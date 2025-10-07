Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B7257825
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 23:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759879681; cv=none; b=ZZASHPB+aLq3LG7kx5xyK1TInZbsbAsZ/Kv7IKTZvXsDG4UjZ9b3mfO5g4o16jG4fQjONGR0OHDETnuVPktdU6hgUn7dM32c+eNKlRkGUxpcCFLmjrrsLr4gvqUlozvZKX7DCf+V4n3ePLLBSY6OPHN7/ulbpFpf66kRIS5auBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759879681; c=relaxed/simple;
	bh=sPUfeSm5BrFc1JGDfQfBW2rqApZnuuum7JmLHXwQcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KEjwgkgqvDePdOvdGi1+IoVIEOyFEtF/kE5xFkydB0/G82rkT3I3lLckO30LZjd/HwkcdhlTL6eRunj4Hib1BtGC7dm8xP/GtT36ce+HM2u8NGrLM0gmnG+uSbu2i8GnyvrPkaG8oPEby7HyMRp6N5AvoznUfK23g6cEOYofxEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vks7Jz28; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vks7Jz28"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-9399ddb3ffeso476735039f.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759879679; x=1760484479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
        b=Vks7Jz28NIGsO7yGpusn/NB4+smKsCtpaLW5W/NMQddF60lP9gjX7HwC/fs7GjEMr/
         T5lo9XcO+cY8zMn4ODqYyXfXf7j0nc3OaeGT8QmVR/VqKqxv1PnEbqfC5kz3Mhpvdgy8
         WxT2qGkPR5EnMLZKn1Mi33IyKmLXN1JWj44EbzY/63whaWMUIerUjwkIRm3llybP2yfG
         v1FzzFeW9/I0IlWltAxBvi0RfACcPYKbVcSnSV27QVAfgisA/1tgWbTZT6NkwHaiBp2C
         eccTvMNei2vrxOLh+i+4RF5fvWc1u5ZxY+W1Nb+hEFHIolsugVuQgVdGF49BWEtruvyU
         jg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759879679; x=1760484479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upmZ+84nb0PGLfZ0odEvQVtU0YnnK5GejiW4j5Z157Q=;
        b=TomvlUvjIZ1zSbeTa/8LDgS+Ilq+M3C7ewOx4oea3eB0TUUI/kmjq69V2a09f32zrO
         fnnx9mS7QKGsnZyykrbL9NbvrGnoeOCh/ilgyQ787+rPkHG+GVrszcUFe05u8Wk5VfxY
         WHdjSflSgwBsqn0d4HA2ILNVqT3ogwlg7Ky0kA6bK3x4SuR52yNpy3FYz5rhFJOUI7yg
         Jud0maTvydgrItb51sofcO6PhQcwXOL8ESSq2Ehw8BikKGO8Fm5aDjNql5zQCVPVqksj
         aQpBcijbWVu4mkA6o3KrjRZpbK4fA3owV5lNMRhTRuoCewFSqV5TCHxZdD/8xiBXND9Y
         04vQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0OWNzBMlsHbI34zUGWZIdzy1W5WqUyAg2rEDXnrOfKyHYH5z6GuMapOsQSB9svxR5uKliNGr1Fng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX3NhQAar6+SLMqimc/+X94hIHxWh8+ZACHVgL8pl7QbjRz/rA
	E+g2fv0+8HWrv7rfV5GCXgf6V8W9RGuxUC1i8fxBB6wKWfbVOdID/a5w
X-Gm-Gg: ASbGncuFb77Uv6KVt2PTVq+uv2iSHiZSmqECBfVgL+TdpmZ5cTG62uJAFH6buhZWK20
	FALP7mCPaVczwXWz7KSBVSRcGMbdde/X4dbyjzud9+yUWA/eRMZJ1R6THs7sEc26jzttMqSva23
	VUHFQSF2HThnMRIQV5DZ6qs2CME7gsoR5mwvjqCzFsqoOIX026oeLwApuR/avSHe+1V2qpte7eN
	9WXKfORaalSihucnhh8a8a3Iqa3wfvxHhxO5CVzhfx5We1zEzo08OVP+Yqu95Wj2jhNa6SU/6nS
	b+7SKcHUJMGTzHvy76sRW9X8/OaTkOrkijfu7yuR9ATNDKkEfce+FwkT/WbLlvwkC7+ZihddSj7
	G65fMfvRPm74tweWI3P/93qwp64FZmdE4EzDukYPvzGdotJlu/OOv2Ef/hSCdFsUUm7jcV4CJW0
	ew3xWkiCCLtxTstL1YuhjQWgYHntM=
X-Google-Smtp-Source: AGHT+IHh8x4nSVxgjyuPLu3cdUtB5H5CglS9HOgcbvpYEHJu2EQasZ0C5xMYoMv468/IsNOnQmIHSg==
X-Received: by 2002:a05:6e02:3c05:b0:42d:8a3f:ec9a with SMTP id e9e14a558f8ab-42f87346dfemr12890635ab.4.1759879679404;
        Tue, 07 Oct 2025 16:27:59 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net (c-73-14-87-86.hsd1.co.comcast.net. [73.14.87.86])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-57b5ea31448sm6582069173.29.2025.10.07.16.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:27:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 02/57] docs/dyndbg: explain flags parse 1st
Date: Tue,  7 Oct 2025 17:26:47 -0600
Message-ID: <20251007232742.886062-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007232742.886062-1-jim.cromie@gmail.com>
References: <20251007232742.886062-1-jim.cromie@gmail.com>
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
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..63a511f2337b 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,9 +109,18 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
+Note: because the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword values.  Flag errs will hide keyword errs:
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
 keywords are:::
 
   match-spec ::= 'func' string |
-- 
2.51.0

