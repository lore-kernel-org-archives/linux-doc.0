Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1418D658
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773589297; cv=none; b=Tedqklo+bvWJjJmocg39qI6oLpAp0yElYKlZW3p1Di2GCQlJ1fAN894kkaafMQwVzr8IQK4RNvxklm7fwlih0IsEk4uUgfe7iwQUnW69nJn4TelPDpVxLj7gt96dIJ9ijP48FUnnmVrk3td1Q0II0MO3dW/7098PS1suNREGpmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773589297; c=relaxed/simple;
	bh=uQgrLjlV2nQAusn8CpmOc71pyH71/1dDAXlSHzS/PdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vtu7eqkRgUhTl+JHcHMzjMiCkOki4aCItfQY+kkoXvTQXBsRDqqY6lk0VtmfMzvJlzoJ9KTqE0xeXe+/Tx9bg0vzdCE7ObjCDK1UkqNQHQXViYZYAaAOrrNRs3PmYrxWjfa4aLmjVpBXy1J2k86jG/vtl30IGZbad2VlHwCr1iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2+CpNat; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2+CpNat"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4422947f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773589294; x=1774194094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1cePK7HC/zi5PzRHxWnjp//6s7AeL8dKDbflFMK4Zs=;
        b=a2+CpNatXGfeZlzBQqG8bHmhhXuEvQ2MT2iveSbGPE/KhoAJR04pYWRVOE3LhqxLJf
         CzIZ8Xx8Ps6yH+ZI5w/3biA863wGdyl4yHYpIFnEjEySzPfksfvYBGwRVC3KSRbYLet0
         aybdZlnA6eSrV2wu904ZupMKa+8hbLushpNTaTDB6a7VGlwMBdIzqOiOuZHALhxb1Ldf
         kBmAt2401jarcYgMURUBj7JHMVewpIc8XDRvRnroGq9R+b99cCK7shT7Xq7TEB5E0lxT
         j9aHNhlAWyJoqMQ5Klo+gnkIJiUqHVvFdLlzHLR+nEQMiJBGLF/MIlilHPiamojDcPBx
         RwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773589294; x=1774194094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1cePK7HC/zi5PzRHxWnjp//6s7AeL8dKDbflFMK4Zs=;
        b=gc30v2aTvqujc4IjnsXZ0E7xxFhdz0DTNh0s2EotCzpxbFRxJ+t1fGDxR54FVuaLje
         OIamGQTi/vBeYtmmeXpMYpJcBL2JSO6SzRrxug6etg7DABU80EqFFxpMREK73yLhJ5Vu
         hAdOoNsSWmtwOa5c+sPc8SK4NYEX4mV0lJ9BIbHgdh1me8KlO2cxb2aB1OtwY865Lppk
         ABNYg2dAiiNBGa6ipHhEHhExuGppdR8DqSc2UIuybgZVto6nfFcni2UQKNR3yheCTA2V
         HBdzEvu08h2tAVBTS0OeQUK4r5oT1ZUFBhBWQaInYyOEdwUzpzrx++R5PBxInmSWdzgv
         2n5g==
X-Forwarded-Encrypted: i=1; AJvYcCXUimJonjwgrvU818ytYRvOwCF0f/YGPF8JjxTsEefa2DSh3cjIH1Rt+31/TK2oJUw5ZMr+GS4YZak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+TF4yqFNq7M58FfY4li2CXXOZ8S8HQM1tqTf+4ase+PgvQuA
	i1z2OW4Vy/hOLI2ge3H5vuiWM/KkjL5aGvHdYEg7+fWCWGmZPUyCNERf
X-Gm-Gg: ATEYQzwZC78b0A/V5E2F/1QjiZLsITDimJH8+wSdSh/OXq/pRR5KqW2+JxOh0Ij/kv/
	pjW3J5gPCYz9NUsPgDfP8/1k8C8nB02c8X2GKa1WFIhr6Dimm5QSAsYJGnHhwNp/k1FB7oEhmmp
	jASkWiWyDQ2mEaBcn6GReGaKKDBFz1SHx6eCQqQP69q6CzmWfFNLEU29MqderdjcAnjm0Hn8aXL
	skYaEl8HEthkpVdhHMzN1kZIMQsJ9RRIkM6JNhjg1jLO+brpXHvc5EzPo+F6EWZ7ooJUOuwDmZr
	q3GSPw5zhD5PA1xcLY09s705LfQRiQ153jrwTKMW7XUGLJ+wFIdknv03V9zIzGEdZvCdCLLNS2t
	iC2ECeiJVQwvvm1rZgGTf/i4piJGeNDtAUbshmoVuaP1XHGiolE/G0Y759gpc5s6dS16iEktbxA
	DzSsPSNCGrrqieJTaFt8GHttMsUlnGhdxQ/793IIeWbfw7ZcLsDYTWNzml/+2WsOcG/KbS7Ybe5
	ElETqhekOiEL41cAd0QK4TJVaea4g==
X-Received: by 2002:a5d:64c4:0:b0:439:b652:af34 with SMTP id ffacd0b85a97d-43a04d1b82cmr18625539f8f.0.1773589294224;
        Sun, 15 Mar 2026 08:41:34 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm31481883f8f.14.2026.03.15.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:41:33 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH 1/3] docs: kernel-doc: fix stale intel_audio.c path in examples
Date: Sun, 15 Mar 2026 16:41:24 +0100
Message-ID: <20260315154124.49834-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

intel_audio.c was moved from drivers/gpu/drm/i915/ to
drivers/gpu/drm/i915/display/. Update the example paths in the
kernel-doc guide and its Chinese and Italian translations.

Assisted-by: Claude <noreply@anthropic.com>
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/doc-guide/kernel-doc.rst                    | 4 ++--
 Documentation/translations/it_IT/doc-guide/kernel-doc.rst | 4 ++--
 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 8d2c09fb36e4..8b579b06ba33 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -550,7 +550,7 @@ internal: *[source-pattern ...]*
 
   Example::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -588,7 +588,7 @@ doc: *title*
 
   Example::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 Without options, the kernel-doc directive includes all documentation comments
diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
index bac959b8b7b9..cd8bb579d5a2 100644
--- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
@@ -558,7 +558,7 @@ internal: *[source-pattern ...]*
 
   Esempio::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -587,7 +587,7 @@ doc: *title*
 
   Esempio::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 Senza alcuna opzione, la direttiva kernel-doc include tutti i commenti di
diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index fb2bbaaa85c1..b35f2582cd96 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -434,7 +434,7 @@ internal: *[source-pattern ...]*
 
   例子::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :internal:
 
 identifiers: *[ function/type ...]*
@@ -467,7 +467,7 @@ doc: *title*
 
   例子::
 
-    .. kernel-doc:: drivers/gpu/drm/i915/intel_audio.c
+    .. kernel-doc:: drivers/gpu/drm/i915/display/intel_audio.c
        :doc: High Definition Audio over HDMI and Display Port
 
 如果没有选项，kernel-doc指令将包含源文件中的所有文档注释。
-- 
2.53.0

