Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3A613AD34
	for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 10:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348889; cv=none; b=seIXBLgC/S6YOpdDqgvPCC5l2araiwdLjZaX2P834VZf0CxnqIqeVBWkF8Ur+FEB/qw1eQNgzhsqep0EbrLTSJDVCpik7GRKeALh+iseUabwhmdJnqEHQl5J1S4iBxxy/XoRNy1c1PTZus7wMdWd8cAZyNKQ7nNgBKS5lxrQEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348889; c=relaxed/simple;
	bh=Nsjf4W046CIAEyOcmt/MlZoEUduqPetqmPDoVbBknjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsYDyFm3kiqlOF4gcERwPp1mWmVgGpkx8V4rAU6giw5umtbLLY39ZSi80Bx2VbVPBavixwaPcYRjSm4FO+6deqLnuFxAUxA/q3gkfqhFI4tmkRQEnrrAv98+ts8PzO/sN78typ3Wvuu0oCFWW2dlQt90hAJl7xwJp/pqHEhwkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWC1jbih; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWC1jbih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713348887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mfznY1Xt+1agp915j30/FccRLbon5LKlLd7NU6tQjbY=;
	b=VWC1jbihrlhykawVWWzGbX518hICl/ApFmJ8wEPiMoLVtISWkiuxpA/mfAAcCesWKYpW1R
	lNLjwpZCTGHWL2jfIZ7pXQKIlPrFPUiP99Ke85Ft1QnyyKDse99/WB52dbJxEoN3A0yIZO
	poSuG6mdm5Z0Ig9PLSfPiSHfYCHXFY8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-QBJrN9DZPGSjxAWA0l7euQ-1; Wed, 17 Apr 2024 06:14:46 -0400
X-MC-Unique: QBJrN9DZPGSjxAWA0l7euQ-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c5f63dfe8cso6591069b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 03:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348885; x=1713953685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfznY1Xt+1agp915j30/FccRLbon5LKlLd7NU6tQjbY=;
        b=ALn7TTYldHSdqM2j8jhXTwbx0flhaN5DIY0NffriieXU/RJf3hRkv/8HDS3I1E2cQC
         HQoiVL9GK6WeIMnQGHKy+Bs5MsCEe8Gcr25mchU3Xzd4QqKJXqwwfEnNYpyYnntj727r
         gFM9AOHIP8IdIIgiLY+nG+BCYf5k4tB+jBkwjFEhy/rs42jUTLNOR3o/8S4aA9qQi3be
         se1GXhgMGZJ3ffcoGmuvDthCT8uzV2bDForVVwvgxpLJjqL8MiFlcHD866+qEz+sF76S
         hRrln82ZolTVl/Rl2qlbR5HsczGpHnFF5fBZOoHOTdqIq+T6wqpu/5qC5Pjtzgq75NQF
         ghlg==
X-Forwarded-Encrypted: i=1; AJvYcCUrWf9I6QJcXYPBnQrbtGrAxIoHFqYTS7L0LHzdkE2Rw/LG+9FXVDl4kydPbhIYRXZAemue4oxSLCYC/Z5Z6HhLXE0KekeYfO2o
X-Gm-Message-State: AOJu0YzvDzIYtVWVrAb+HY6n9cbu7lSQdrlhjcQ6n/e7wFLA40joh+oT
	lYpOib2W8uBTzJJw+vQRYsx+iaU/qtzOSJpa5z5tbKL2GAQXo2HiumB52fvks8UpJBtQH6WoGzJ
	p3oIT7XFdjtts04DiGOvUkxSegEzb9cKL/7d8Vz5/3rnYEsPCsIgacHHzpQ==
X-Received: by 2002:a05:6808:6243:b0:3c7:13fd:d878 with SMTP id dt3-20020a056808624300b003c713fdd878mr7873814oib.9.1713348885377;
        Wed, 17 Apr 2024 03:14:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDz0OAbOJqHdNWrsnzh2Aggk3FP1TUtJ619gQjpyPq9dPplYtFuLf0MpY36myUuCQuf7T1/g==
X-Received: by 2002:a05:6808:6243:b0:3c7:13fd:d878 with SMTP id dt3-20020a056808624300b003c713fdd878mr7873788oib.9.1713348884914;
        Wed, 17 Apr 2024 03:14:44 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id js7-20020a05622a808700b0043781985244sm71939qtb.59.2024.04.17.03.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:14:44 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: repair file entry in DOCUMENTATION
Date: Wed, 17 Apr 2024 12:14:29 +0200
Message-ID: <20240417101429.240495-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 1e596d5eff3d ("docs: Detect variable fonts and suggest denylisting
them") adds the new script check-variable-fonts.sh and intends to refer to
it in the DOCUMENTATION section in MAINTAINERS. However, the file entry
refers to scripts/check-variable-font.sh. Note the missing "s".

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this new file entry in the DOCUMENTATION section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4356b28ce625..250c8f8caa08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6493,7 +6493,7 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
-F:	scripts/check-variable-font.sh
+F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
 F:	scripts/kernel-doc
 F:	scripts/sphinx-pre-install
-- 
2.44.0

