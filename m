Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9051DE3A4
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 22:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769639603; cv=none; b=sjQEJu3D+vB9oVEvdLsh0QnDs2zRYTWcH1hpbAVUM9+YjLcKkQNsqHvD4JgYGKhFePqcIyRe4BfSS2XxXMnpS4Yr09AznlHoKIb3x+L2NcRzk1uZr/9To4NquhKljaK59H16Zcwfi41NizUzGF5tVemXNko7pnCm7oOGQZt+4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769639603; c=relaxed/simple;
	bh=W0dpzkY31LWTDwRu4wDVYre+5cqJ/knXQKg0SbghrOs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dr1G4cTMIliXGuqGXqBb47kkVjS0QYliZgyUHt04vL1+6Q3/VLcGCnhWoTSfK0u1dquOhIpvNBAgaKUBHIFLgmviCZ5C2P0ccFkqhNeLWuALprEL8cEo949L1ZSBHRMplMKk1aiUINkp13c3uWRmc3mv7YBx/V/BTT0IoXTx5Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0A1RO+N; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0A1RO+N"
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c07bc2ad13so32092885a.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 14:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769639600; x=1770244400; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oThOkEs4Bt35iidNFvfsXAeU6jJXTeE+JreK8ol4aUk=;
        b=Y0A1RO+NwdBp5AD9YbXYbshQ6/ZpOfg1n8wyvNsiucbA9KNv8mPMlXgoNVovuGPd/S
         2+u9eNVxER3RNDcvDeC+INb1Ahe+3MFP09qyxylnKA3gRJhL3nPuMhuMdmlDYHIG2ydx
         +/k3WLkgfPTRY/ueW8w3afksohC2Fni/WXghXJQkF6Dehz8jN5ijFQMaZ2hHn0aZr1Xp
         7i6AhKWH6xmH6SLPYNgFT9zP5LirCeJebqvQ5fKdPXE2yt6+mSMYTu1HBRZ3Cdlx5AaL
         7LjKEURmATu5oSaIKpKWrn4hB1vngTcpOjbWv0gSYQdzHzDFE5xzOnMs4q2tgT1L1uFw
         WMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769639600; x=1770244400;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oThOkEs4Bt35iidNFvfsXAeU6jJXTeE+JreK8ol4aUk=;
        b=J2Ozn1jF3MZKXVlDPH+toScbqCM/yJEYjRPJVU9TgSAz3zo1LwVeupZg/pSU1Qc43L
         6Kv0LXvAUfHM31VXGz0/kS3J7hs7pt0Zxqod4vAEP+xGXZ9klhEpbau0BYsjPGmgNzrd
         qY81BSnjwsi9D7MVjY9oTaUmJ8wzLLzEZ8FseRjDBfu0tzU72/Q+fukXMA7z9rDLg6Ww
         J6DJzTPgFbtEdNo6Gdo7a5p7IBG3lRNtabr/wy8Qfo6u5jt4R4yUmId14Tsr35Ld7obv
         3aBSJGVOv8Kb7sa1mM74w23l8m4hBkO7BeyJqPO2xbsB0p2yqBHIHfYxSRze/SBprq5Q
         bUpg==
X-Forwarded-Encrypted: i=1; AJvYcCUrz0nZggrCTic2DghDfjkDVSXj+mkUYnz9bhIyjjt+29gnpUYHtiAcaI7Y7MUYdc2+WrMunxhdxuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE3EnrcM8U2SOFsbL1H1P6HSA56RSPY6nGm5IfwU32X1meICl2
	AKJJgVGm752QjZAEtJsRxv/vF2YBAwsB996SiDzsEmEwjZScVB8ysi1D
X-Gm-Gg: AZuq6aLFkA2fcDoZLWInOvoxVg6d9fdCjBgzBKvewpUGndf9RsJEKZuhXmhGvzughXX
	vZrY513OsQ7cuNTxD91OykzRFDMOVdfFWczZhm+PBN7BERjLoczKV10mMrG9SlC0ErXzc+yfXDe
	1VUm4UA8MFi41p6w/8JCZJgoabQI3GhpkmgEzMhDnpA0P1nhn2tNKVAU31aSK2/Z9X7MGpEDtpN
	644fQPFIsPnGYvnjUf/0h6sDjb23Ifwev0WjUN3nKPzEgI1SfIR89pnW5H3cqK6T21DYkdkz17G
	uPasNuJEX/lCwiOc+CxWIuBBytQoj9MmLC3lY+d3ZHOZpiRdk0F37vOyHcsoCQpU5B5xdWEbsfb
	XQlArvhPhOyeUhRNqKEAO9WyPlNFxuq3tA6RJ7EI94DrnxBFahvNA9MslaSNkNR9oDYZjeflJxG
	OD1vge54mZqON0laO3d2SV
X-Received: by 2002:a05:620a:408c:b0:8c0:e5ac:af12 with SMTP id af79cd13be357-8c70b856874mr825295385a.5.1769639600127;
        Wed, 28 Jan 2026 14:33:20 -0800 (PST)
Received: from [127.0.0.1] ([154.7.78.65])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8c711b95e4esm304528085a.15.2026.01.28.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:33:19 -0800 (PST)
From: Patrick Little <plittle@gmail.com>
Subject: [PATCH 0/2] Fix grammar and example code in Documentation.
Date: Wed, 28 Jan 2026 16:33:10 -0600
Message-Id: <20260128-documentation-fix-grammar-v1-0-39238dc471f9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqEMAxFryJZT6CtKOJVBhfBpppF65DqIIh3N
 7h8/PffBZVVuMLYXKD8lypbMfCfBuaVysIo0RiCC73zYcC4zUfmstNuJiY5cVHKmRTbFIaOkne
 pi2D/n7LNb/s73fcDn3/wSWsAAAA=
X-Change-ID: 20260128-documentation-fix-grammar-3f285af10f5d
To: Joseph Kogut <joseph.kogut@gmail.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Patrick Little <plittle@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=plittle@gmail.com;
 h=from:subject:message-id; bh=W0dpzkY31LWTDwRu4wDVYre+5cqJ/knXQKg0SbghrOs=;
 b=owGbwMvMwCW2/Ptzn70V3ucZT6slMWRW9a0qOSatYFTx4M78Zd6LdY5bMvH2zMnK5VeJjt3Sa
 XlaMnJ6RykLgxgXg6yYIstON7HCLOfpuTO9Vk+CmcPKBDKEgYtTACYS+ojhryznt8M3NkZc+mPT
 9YFjRcj7KLGaBpdNOQmX5n1vPfDT9Bcjw8RcNdN0n2uTeTWZLi3083oS4PjgSJDTjPNCXTHnTvg
 d4gUA
X-Developer-Key: i=plittle@gmail.com; a=openpgp;
 fpr=B94616716A43976D994AAB92A7F7E74CBD784BCF

I split these into:
  Text updates
  Example code updates

If it would be better split more or differently, I'm happy to do that.
These are strictly typo fixes, no clarification or rewording.

---
Patrick Little (2):
      Documentation: Fix typos
      Documentation: Fix bug in example code snippet

 Documentation/power/energy-model.rst     | 18 +++++++++---------
 Documentation/scheduler/sched-energy.rst |  8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-documentation-fix-grammar-3f285af10f5d

Best regards,
-- 
Patrick Little <plittle@gmail.com>

