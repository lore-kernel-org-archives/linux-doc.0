Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520318756A
	for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735671773; cv=none; b=sc6TY4RXAbAPhTmZSEfTXV869D6UxMbgStomcp/DepdkQYw83etw+LHDXlzIV0RlpV5kj2B4zxjUoggbKbkl2v8bxFdvX4rymCbpEMIDnRan5uc0oboeG+xLHJBJSRXNuaMEQUGfm/y/w20ssZfy0Q+hvPyvkGg2by5O2ZfyuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735671773; c=relaxed/simple;
	bh=MOTKA7KhvlK7ANhBLaIYCnqKUIYOb977FQQETKIX1l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PNzhmg/LkL0Zwc0YieuUoYl/7PxM4hdVgtv26CFUYGv5aceWBHaIZ6VO/YFcWjOSafJJQsTsYhYd30j6Zekwj9FrJPX/W3JhVAvMxrCVWgXJtXG/BZhHyN9oR5arY781Jyh3KnP37eyvhhu+ymkIg178g2Xmn1Ibqrxdq5plILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ALJDSVLN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ALJDSVLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735671770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=okeASLE8vk3Ufj/TgOmQx5myXL4xomNfxufjwEvEzbQ=;
	b=ALJDSVLNx5RyzQPRuz0+OYzTrQsrjJ/61jXA33NlymyNVJukP0Krpt9j0LlYZA9i2fQORd
	gPi/tfAxoLIHh+h8pimQt64V1OdLgbksy20HG1K5YIygo1qvMYyQ9NnLBjN5kCpS4GadUC
	hsXNdbJvXfY4FToBjrxLe96jQtKR/7A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-wbOCtYriPiWzha6DTgj5cw-1; Tue, 31 Dec 2024 14:02:49 -0500
X-MC-Unique: wbOCtYriPiWzha6DTgj5cw-1
X-Mimecast-MFC-AGG-ID: wbOCtYriPiWzha6DTgj5cw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso57403675e9.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 11:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735671768; x=1736276568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okeASLE8vk3Ufj/TgOmQx5myXL4xomNfxufjwEvEzbQ=;
        b=IZIZMAA+84VgFBaPptGyQSDcaGkUs5XorihXnmlMY5yTf52/985Um9E0GgS9nOV/ql
         FotwsUb5adSnPwc0Olo+vGiq77evwAl7KvYSdbBeJudBJszHBQVCqdI4aor3jRIpgkTo
         zXUy2q+mcaDj+n7B9tcbJDQL3sle0nb5Q2GLUvCqyoDGCjAzn298Lkn4u7K0WdWlBk9v
         dAlQUdMElXKacfwvh89drrSqlbX9eTEhAiAJb0Zg9BXGFsZ78nCWR1ED6xvDcWT+M8oA
         wzyw7Dvjht8w1NDILZzeWaNuOEhpbhRYrae27zUx3gxRl+0chSq8Ul8oyAHdcdoYnh4T
         cs7Q==
X-Gm-Message-State: AOJu0Yx/+DogjLfL18GusgieFNQwMzPkbIRW227MNpyk/KeWUTKo7caU
	1Ouxixp5fzrkWWiRFZzzrdnYLF25HFGkfu1/EejDjAnVjjhDq8zCQje2MPwIfDnFrSkMY9MhxtA
	vWIlY/ZFjecckXR0zaCrnw+vwDNdjcXL4i2mVWPPXiCAVAolVDBwCZVLRMaAmfJUTelOy
X-Gm-Gg: ASbGncsRK90H2HoB63qzUUpqAGUZg14nPh6wZeyJm/gH4EG50tl2fxx1bCZBRuDA5Z1
	TZ3jMA1E93UVXcvjfV1Y4M/N8l2LNHn1lRh7RRbgLtx9eq01M8kTE6oIg9wpCXtMcuJ9fj0gLKL
	C2Nwxz69JeviExPtBjdG2bywaq4CAhFw91VGTWFk40pK+E11RCnkyVhyZZeIAi+Ur48btHF/Dg4
	hnWI+Wk5Q9zYYz90W2n3Pg/HgDbl3sHqLi8qm4LoqiGe+33p5eY9LSb4NcKPEMOYR/fw9/tMcrW
X-Received: by 2002:a05:600c:4f84:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-43668643743mr334457075e9.14.1735671768174;
        Tue, 31 Dec 2024 11:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRQDxPR6j5HMi82SrF95l4C1ek9i7FjbS3HOz+gQsZLL67aNPlPWpSp/ZG5PJbRkaLYXNRMA==
X-Received: by 2002:a05:600c:4f84:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-43668643743mr334456925e9.14.1735671767853;
        Tue, 31 Dec 2024 11:02:47 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4364a376846sm408377945e9.0.2024.12.31.11.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:02:47 -0800 (PST)
From: Lubomir Rintel <lrintel@redhat.com>
X-Google-Original-From: Lubomir Rintel <lkundrak@v3.sk>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] Documentation/kernel-parameters: Fix a reference to vga-softcursor.rst
Date: Tue, 31 Dec 2024 20:02:40 +0100
Message-ID: <20241231190240.417446-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A very minor oversight that dates all the way back to rst migration in
commit 9d85025b0418 ("docs-rst: create an user's manual book").

Fixes: 9d85025b0418 ("docs-rst: create an user's manual book")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3872bc6ec49d..da19728b5bee 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7474,7 +7474,7 @@
 	vt.cur_default=	[VT] Default cursor shape.
 			Format: 0xCCBBAA, where AA, BB, and CC are the same as
 			the parameters of the <Esc>[?A;B;Cc escape sequence;
-			see VGA-softcursor.txt. Default: 2 = underline.
+			see vga-softcursor.rst. Default: 2 = underline.
 
 	vt.default_blu=	[VT]
 			Format: <blue0>,<blue1>,<blue2>,...,<blue15>
-- 
2.47.1

