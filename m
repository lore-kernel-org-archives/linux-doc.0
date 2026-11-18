Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035998;
	b=w2Jx1hgKk8IhPIe1Vy6/KzraDugyHoOBHE/GI/MhZrYINFegylQPpW1popjNX4Sazir0
	 Bc1LyZeyaDWvpf34vFTMG+GuLc0dHSjwQk6DaX4RnMtPHkbByFKQxq8bDaD7yDMIQ87NG
	 ilFNnGWdIZetCV2h3Ug1GDKPZe1Xry94o2XsAoUQdQKYTfSxhN7c0GqgIVyaOnHzDqyI9
	 tvvhZHjqLCRF+Qp4gGavGNL/cGM158FyXRMWV9Prxp4P9EYS7MQ8wyBnb4INBI3jQ7twA
	 4fMIEP2+SDf6GR1cMjgG+nCRbIVALSrSQGVj5imcpSp3ZFdf4DwvS1rSLNcxaH3EZZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zlhxU/IjuHZnLKyF2LofuHX2YCyUNZOF30jdbALkrJs=;
	b=BN6N9ajw5BNeGh9tJKEXpGphL/XduhTOFmYmWkwaFLaywc8uSimPrZHeh5WcbehCPern
	 y8Kqzji+WQ0KX8KVGvO80EOlSFN1JCevBJh9Mty3dcrx3442daz13TqzRFMp7bwiR7bLa
	 XZGS710Llc0bQ34jDi4dmBmvWmPGRpAj3QCbe8FbFRB+cHdtXGiVHNDqLCch3icqyGXWm
	 WK306zrbwfoG8EJ32jjG2Cx7E6L6iWUfrbryOpYWVQFXMpcpE/xnzwI1rBlGZz123nYjb
	 zB75LBqubYWB7Y/fvlb0+dwSb0ZcIRra76pLk2l+wSDjXOHz0Ku9EivHO7WTEgV72hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl46mGz6;
	arc=none smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77E606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C77E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sl46mGz6
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so560120137.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035997; x=1795640797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zlhxU/IjuHZnLKyF2LofuHX2YCyUNZOF30jdbALkrJs=;
        b=sl46mGz6bIJovOyc4hlHO5aIxS3M1mx8E8emIh9Vxr3zHYbG7I+XNY5IuFEh4a5E43
         8dkq2hfJi9club++3NRgM+2wqTZsbImlgVNCD7f1ZqA0osayzegLOhM1isXA+PXpdQbm
         Dj4JuQBtbacRj8FjGNO0gmlwoAT8QEuxB7UHYzIFRvgjakcxCoI9/LcAg1ky2rl/rM9S
         11/jd1uLBxSE5IuMW4kqpYSHMfAC5T0UiXuo9IApEx8AUkmxLbed51VfDN3MABrLZhE4
         CxrhXQTKFbmLNXAkzbsOnHUZ3DZn/sCsjexLtbaIwZWTTwn5OmvjDjWeGat46xX5a3cg
         KldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035997; x=1795640797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlhxU/IjuHZnLKyF2LofuHX2YCyUNZOF30jdbALkrJs=;
        b=UtJ2hsu62f0LFqbSQySNv4ZATE+4gzDsptfVdAWroRCIWbCTWnzjS5+4BwSEj1Bem7
         vvGn/lH2OekGJ26XtTATnDOnJnZKJmH2o3KknHKNQnKoVVDIOC93PfiQMzwKvwoIDK0c
         Yu/x3z+VOKWj/ASMb3r3iFL+4DGFaLd04zu7y1uLkb+/1uY/x7eQ20WUC0hhixCe/VPK
         mtYMBLe12YU7z0H4G2O6w0Joeq9TDpubkDED/FWkp1YvJn642iHy3dhXA3PEpM0T+HVx
         bHsLNohddEXWy2LccFAgreg3/Y4mJ+eCjslhV+Hk9ysctPJjBzGEdwUuA4/IHj0cHdLk
         vtIg==
X-Forwarded-Encrypted: i=1; AL+hErFhSDp91wbBNkqOVZrzWlXsXTwgWFnT+8WgZJokGzLmQnIhF0rf1tqvmxRAKVi9/5+pp4yBJivcAPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eHbeDjhBghwu3qBO1T+szxEcqYlW7+fvlyhOrCHVPSLiwxXTQ
	tygLLh1mAfWTmRQZ3qQ/E2sGY+ySiLgceQN1VRhdgsJp2Yll/vNWkt7xtZEGFdAVYrRKeA==
X-Gm-Gg: AYBFou16OyYbJwSszmNyQFbzFbAopwfiqjqwT3JoRIgEe0JPuYx8unBI6XQ9Pmj1Aae
	bYnlJpv9kwPJg1+3lG5Nl2Kpmy5hfz+pUXvofE0iA+K8FFUzaWPw+PiNbhuyFjwS+YM6OK24c2w
	dcOe27hNKpZcKkQYOnZ0XrrOv2JViucEkWcBj6dcaVkFN63Qh8HB6TtcgvrxXHnsfPNrZriv4v3
	EgikktINR3+0UN9k6ZEMwrizvrHwOfcaAu5nsqvPju06katby1xNO6bZr6DJ715w0iRVHPKlYtj
	YZDpbh8U0ziGEyT070P/QnfnNlD9Er8q1cDA2JQksVdJVN3+1jhNJbHHqnIXBan/7aLKw46Uozp
	rdZZ6L36yGB1ac6F/ILzdXNw5XyN7ZEzzPnkgyL+4LIEGU7iQi5UuSWB8RHvR3eVw91KjLr1FWO
	hTgcUxtNtMZfMZS1zrExEEqmSQ5TixBRVjV2opOpNgV4nEnEQQM/337T49GwGt4NBIor8Mufy0z
	vFvj9RAuVVsIYvIRXeErw4kankU2onX1tVxdpovchcS6PO5cJaH0tH2YGnx6cGatxzHi/rNRpSZ
	jBHZFkNxsyMAXhwR3tgoIAcOdt4qxohwDYMQQkAvymtTlezRXB9cr1R2sPQ5/EXYppxqXSaYVn7
	+xe+/QS30E2XbL8Qt49P3OyKD8t5tgB2Xy2CXnMB0Gg2P7mhH+oLwfor9Ryh36qhhbD11VA==
X-Received: by 2002:a67:e7c9:0:b0:7d2:7266:2c71 with SMTP id ada2fe7eead31-7d6b9ee5d50mr1581564137.0.1795035997168;
        Wed, 18 Nov 2026 13:06:37 -0800 (PST)
Received: from nixos ([2804:14c:a8:965f:176b:a846:d400:c7cc])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1c34cesm2985855241.4.2026.11.18.13.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:36 -0800 (PST)
From: Igor Giamoniano <igorgphotoarte@gmail.com>
To: danielmaraboo@gmail.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Igor Giamoniano <igorgphotoarte@gmail.com>
Subject: [PATCH v2 0/2] docs: pt_BR: translate driver development debugging guide
Date: Wed, 18 Nov 2026 18:06:21 -0300
Message-ID: <20261118210623.111428-1-igorgphotoarte@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series translates the driver development debugging guide into
Brazilian Portuguese.

Patch 1 adds the translation and links it from the pt_BR debugging
index. The kernel-doc directives at the end of the original were
replaced by a pointer to the English document, since including them in
the translation causes duplicate C declaration warnings and the
generated API text would remain in English anyway.

Patch 2 updates the existing references in the pt_BR debugging index
and in the userspace debugging guide so they point to the translated
document instead of the English original.

Changes in v2:
- Add a cover letter. No changes to the patches themselves.

v1: https://lore.kernel.org/linux-doc/20261117223335.111220-1-igorgphotoarte@gmail.com/

Igor Giamoniano (2):
  docs: pt_BR: process: translate driver development debugging guide
  docs: pt_BR: process: debugging: point references to translated driver
    guide

 .../driver_development_debugging_guide.rst    | 250 ++++++++++++++++++
 .../pt_BR/process/debugging/index.rst         |   4 +-
 .../debugging/userspace_debugging_guide.rst   |   4 +-
 3 files changed, 254 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/pt_BR/process/debugging/driver_development_debugging_guide.rst

-- 
2.54.0

