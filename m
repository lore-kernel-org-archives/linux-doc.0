Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AEF2F0C62
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497819; cv=none; b=NB6VbYPIkmdj4m0W9Vy16080DLMt2VyyvYZajcDwi0I7UouyvbDVlNR/jBHxJ6l8dRj4LuU7H2pAOX1WDScDnA8Pb3sKCWlG/0ouK+Y47oUE7xuphsa1lBNZd+LZcU0O1g5pv1Fl3mA2fTKjIr4h3uZetnrFRQBm0T48e1pzzOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497819; c=relaxed/simple;
	bh=mUKu6iaFo6a3CXPPygm6mszyYA3XUGGIY/VOgs7ytFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HN5i+Qhi/9yO5ZB3XuKEiZDvMCmuS+1wEYqyO4fjBeSLWOzwF5FLQIaIMZwqrqL0FV1hPGjhvYZlBcZ1oxl+sE8Y3XyDQNvBDdq5S8B2+pOY596cjegdgc7i7wjXKp/ozUdx069eB9dCntHGsnYLkqSxw5UBqn5e4wRz6LFGzV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cxhv+hux; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cxhv+hux"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-875d55217a5so225707385a.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759497817; x=1760102617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVLpi8gkovdhowq1w0/vej7n614rchYweWYGRZNN+Nw=;
        b=Cxhv+hux4dWvEdJAt5n2+FNVxZY7o/xPXeUpPY+rtO0E9ohATiR/jgSA6pV0uaWFfa
         rUDsboURqEvdN+uedsjgMXliAWomaDgTaIrNVt1wLE/8qXlXcaAA2UDC6KjJnIqARs4K
         zzB5Z/Ddkurxu4xXqr+/Z3eKr5FXklFPQ64sM2v626iUg4wwMOYRYOkXzqoyVPmxs7GL
         b9q2GfNvcXndbjzQP6YJxdNUm+98kGBeFdPpmhNQ6CrVdYURf919+/94F1kCFbPAYy7z
         maroODg701e3kX0GdHsJf6RM1fO/UZjtr7v83RRJj0Vx/X7llq+HeNOcqNIod7oMVfP1
         P9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759497817; x=1760102617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVLpi8gkovdhowq1w0/vej7n614rchYweWYGRZNN+Nw=;
        b=P1b4GuvrCtACzRhKbaSCkrri1RY6JQvQvM0oJl/I3TBgwkQxlDvZBwu+sX0kZVjFTW
         zPxuc0030Y9oily7FuewOp5d7k7o+xE4r6eauStqEixvVQDshMhWYTc3z6YXEwLy16XX
         qVCNXpr8Xz1ZdpEuRYrTcmhU3IX+/yyCsnJsajoEv7Pi0d9pKtOMtvv9ilVpPc/41EsA
         E55n16eiICeuox/6bkqHsQ0fykCjXivaaX3lQSMoU81dxRcAiEiY52EviPbg7ltg/4Pq
         ehU/iJaI3x8sTUEmqhWLzrMrhLHpmZMVUJGQeZuOniDnAEtFBIb4i8U3bzFD2JsDIM5N
         Gm5w==
X-Forwarded-Encrypted: i=1; AJvYcCWY2uoKBWHKu52sqfXws/oCWZuu5i2fZ2WRzoD0PQqWy4xUodiLGbcPl8NnHYgcoN4TmAVW8bnph7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMlM/g0ed4gXtCVY7CsHbKMow9v8ZYpz7GAtE2g++mcmeBj0fc
	dUdHQGc62SPXqQ6xce00RhfQSkl++xK6GLpxOixNTYFudmg6litAhs+U
X-Gm-Gg: ASbGncvbEdYqa8xGSkkyO2rXB2gJoKz5NO61ceWS6YPb4HTTD7kBZPWl4c86XdCYyj3
	489ozuWwRLuzLEBQJLo7kipCyAXuDOOCSZBZn3TsKtiy9e8QHl0afoec0tQny5xGgRfFs8sbw6z
	1Z/YnrWeaogssJf/SYIatWPC21GAtgex3EcsrKn26WKbbMYvRpYHMaLWmcU5S5BzgVdQPIAB47Y
	306t1Bex/3J/3w8S9Edl1HqnkZBCcLs5cSZMaILquLfHZNZncJSiuhLLa+vkBhgoOiHvn0g0OP0
	WvH/RIn1HwH3grrlCDyfwuHundZJm6ekyg2nLGLbzV+Gq0q4AMDKLwzuy9fX7qNb3Lwtxsk/Vwj
	8S3jSkCaRLaVB1gs0O1Eiau+Sv7j8y9n1h8BDf64jQcxqUbePhtJ+i+/G6keBLKuIum3LiwJUXL
	dzJoe2hEdsCFJob66Nk6JiEz0bJ0wHGEyfUZ4BDPHDg8K+pEMQuUBATybbAczMaMi7tTpZCEdYw
	PE=
X-Google-Smtp-Source: AGHT+IGhDylVij/2hFtWThbNacKt93dDCkbiRV1GswK9Qu5CPnTReRpxDkR2sjtI+NXbbfzvDtfG/A==
X-Received: by 2002:a05:620a:28d0:b0:829:62ed:50a9 with SMTP id af79cd13be357-87a3720d3dfmr435160585a.20.1759497816926;
        Fri, 03 Oct 2025 06:23:36 -0700 (PDT)
Received: from fuse-fed34-svr.evoforge.org (ec2-52-70-167-183.compute-1.amazonaws.com. [52.70.167.183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-877725550fcsm420727785a.21.2025.10.03.06.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:23:36 -0700 (PDT)
From: Stephen Smalley <stephen.smalley.work@gmail.com>
To: paul@paul-moore.com
Cc: linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	john.johansen@canonical.com,
	casey@schaufler-ca.com,
	serge@hallyn.com,
	corbet@lwn.net,
	jmorris@namei.org,
	linux-doc@vger.kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Subject: [PATCH] include/uapi/linux/lsm.h,Documentation/userspace-api/lsm.rst: introduce LSM_ATTR_UNSHARE
Date: Fri,  3 Oct 2025 09:20:01 -0400
Message-ID: <20251003131959.23057-3-stephen.smalley.work@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This defines a new LSM_ATTR_UNSHARE attribute for the
lsm_set_self_attr(2) and lsm_get_self_attr(2) system calls. When
passed to lsm_set_self_attr(2), the LSM-specific namespace for the
specified LSM id is immediately unshared in a similar manner to the
unshare(2) system call for other Linux namespaces. When passed to
lsm_get_self_attr(2), the return value is a boolean (0 or 1) that
indicates whether the LSM-specific namespace for the specified LSM id
has been unshared and not yet fully initialized (e.g. no policy yet
loaded).

Link: https://lore.kernel.org/selinux/20250918135904.9997-2-stephen.smalley.work@gmail.com/
Link: https://lore.kernel.org/selinux/CAHC9VhRGMmhxbajwQNfGFy+ZFF1uN=UEBjqQZQ4UBy7yds3eVQ@mail.gmail.com/

Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
---
 Documentation/userspace-api/lsm.rst | 9 +++++++++
 include/uapi/linux/lsm.h            | 1 +
 2 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/lsm.rst b/Documentation/userspace-api/lsm.rst
index a76da373841b..93638c1e275a 100644
--- a/Documentation/userspace-api/lsm.rst
+++ b/Documentation/userspace-api/lsm.rst
@@ -48,6 +48,15 @@ creating socket objects.
 The proc filesystem provides this value in ``/proc/self/attr/sockcreate``.
 This is supported by the SELinux security module.
 
+``LSM_ATTR_UNSHARE`` is used to unshare the LSM-specific namespace for
+the process. When passed to ``lsm_set_self_attr(2)``, the LSM-specific
+namespace for the specified LSM id is immediately unshared
+in a similar manner to the ``unshare(2)`` system call for other
+Linux namespaces. When passed to ``lsm_get_self_attr(2)``,
+the return value is a boolean (0 or 1) that indicates whether the
+LSM-specific namespace for the specified LSM id has been unshared
+and not yet fully initialized (e.g. no policy yet loaded).
+
 Kernel interface
 ================
 
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd5da..fb1b4a8aa639 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -83,6 +83,7 @@ struct lsm_ctx {
 #define LSM_ATTR_KEYCREATE	103
 #define LSM_ATTR_PREV		104
 #define LSM_ATTR_SOCKCREATE	105
+#define LSM_ATTR_UNSHARE	106
 
 /*
  * LSM_FLAG_XXX definitions identify special handling instructions
-- 
2.51.0

