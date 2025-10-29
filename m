Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147A732E734
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726393; cv=none; b=VfMpRsEK3/OocLzVz41W2ZIQgCTFKoxbkd87W6D76ArZLUPRCunuhfAz4bNPWA42jj42dObobGCJLigEfek4zPzLKszI2lFUtDmC4KhpGC7N/QgkbLioRHBycGVuSkrLkmTC91zZl5wcrTsbRokHPHhSy8EwjMIZBwAouOD5af0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726393; c=relaxed/simple;
	bh=TSdqCvWTW91ah16HH+aiKsyB97s9GEE5xmypLgw9rrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQeSRl14yy7KUiiUNMp/dIphsnjYGV6slMYvaxx8JjkIOuKLJMVa49Oc5aUobfHX2q9mETBvuceKuCDPowlstX/5hSbnrrc6eutrZ/CoYuQhq0ysX58yCGs2ojKhZsOIgrGh/ul7IXQ7N0nvykFGs9AJI1Qo84+lobvvPPGvfCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKK4/puC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKK4/puC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-782e93932ffso5224390b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726391; x=1762331191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sudBY2RiWFsiu5y15PJlszzmNRDJVFNp8bjRqr+zwxs=;
        b=jKK4/puCGBcAevsO/FfE0HT3f4VP5VycYg7IUUROfPmdQ2UBUAw+7Fn7AV7KscVsiN
         3z9WhrOb6HeXbzktvrLtOqHqsyTyAISDQ7z3OZsgkZPTFryGou5JpSpNCPbtxk5vHKEr
         J6k6CjlptgZZjvQCwzS48W6mgMesGMXRMzfAvGz4vQ2xHFcceUg9gOOElzJ4tUahgAOO
         xxBm9LPwU+3y+hS6zkNmW92pMkHhHbmefC/0RvqX43GQBiKIWf72BhPeuXJysbLTjVHW
         +ysKiroV/xUROCHm+r/wUBT0BgQXTnEBacMpdgDB8X5l4H9g+rQV3ZL5LbWpxDIjVnuf
         6dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726391; x=1762331191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sudBY2RiWFsiu5y15PJlszzmNRDJVFNp8bjRqr+zwxs=;
        b=n8bbblM2TKZKN6Uyi55Ethwj7f5iyM79wXGPwt+a+UAEVYyTzce9oxjTDbpj1C725T
         lzW1FG2Tc9rqqoChQGG2xWwE76WvGlYrY8EQogJg/haUaFwC95zV7j3lilmp2uE28KRA
         rQ8Dv9QeBZWvxGKVjLC+hTi7+TZEN0ZA9zF1p2otUmcWqrmhlUACyLdpnjlXdxs3KBZO
         03f4C7fw24144GSHwt4LTEUpTbPWKhDJ/FUX/bmpj/z0U6vcdMSxhn9E8ix7grRljpIQ
         Hq8BKv2Ea/orn2R/qVcR6chXVsn7XhIfMWvQmRBQzrqnwGDxzw2zZ1EgW754YnKYbPAO
         berA==
X-Forwarded-Encrypted: i=1; AJvYcCVCtCEg3TXPRShEMtW8xxMcdNG8JT4gThYFECmBmy3wpPG0TCWee8lj/phSSYYheOVEPyDDmffo8f4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzczUpo7CwSSacRPlSamQ6wE5Eq1NNhwe9dbr08sX7hBgEuW4I4
	K8qCC+VWyCbl5k4qEtPtz1zKEvS6lNGbh3CCS6o56XpBUcCIvmah/Qoq
X-Gm-Gg: ASbGncsxdSLlBEtvhd9qgE+VF0Jn6nymITZJ+Ko8ObNNQGAxcbGhAnn7pZ7axqTDe2q
	ur6+//xcFrXBxk/id+q8flWODkuO+IAlR5C5xcS4lUrSAGWWZuwhagZokKf/dNmTgqTTZKtj/1t
	pV/zfF/Hu8oxiEe69imVgvNE+gdz93bgkHpzk3AgMnpUB7a4J5/RYEeVz+aqmGKOOKqnWqOpsfn
	9GIykZR+wVwzNZnsdnfPVstvEMd6lVO1St8HDkbaEKgmiNWTKcPn4DJhN4Bt8l7gsNI9XZFVQcd
	dKBQa/kXpddS8gS21N/MZvos+pEGoVFe6SGIGQXrAsYBwV98I6rSHBRcnvVcSQBV7gZIy9JJP/t
	5t/Ccl6cM2reVKFh6YFUeEONmizPakgo6ONY5BfVZaDcTB7TrSLCmVFWY9nCxkCgoOl83LfeYtn
	o/ElPYgtlNsd8=
X-Google-Smtp-Source: AGHT+IF0PkWaskgERMPwSh5sbmy7XRCCr5pEGKg0NaEs3tSvnGcQ3TbjA8agGFwfJCYIZIsLOPwfEA==
X-Received: by 2002:a17:90a:d64d:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-3403a302f52mr2369411a91.36.1761726391321;
        Wed, 29 Oct 2025 01:26:31 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7ffeab2617sm7527888a12.33.2025.10.29.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:26:29 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 25E284206925; Wed, 29 Oct 2025 15:26:19 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next 0/6] xfrm docs update
Date: Wed, 29 Oct 2025 15:26:08 +0700
Message-ID: <20251029082615.39518-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=bagasdotme@gmail.com; h=from:subject; bh=TSdqCvWTW91ah16HH+aiKsyB97s9GEE5xmypLgw9rrA=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmM55X/B/rYqRzZO2+edHLWY6YF3021jkR9WHFo19FO1 2dhfDFrO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARoasM/4OYtr5i+J2+WGLi LYXFcuonAyakn3n9Uyu8Ztd+nlkrXq5g+O/kFL9ot/tLZ11fg6ztygIVNqHyF20yvi+vXcCZnjB 1PiMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are xfrm documentation patches. Patches [1-4/6] are formatting polishing;
[5/6] groups the docs and [6/6] adds MAINTAINERS entries for them.

Enjoy!

Bagas Sanjaya (6):
  Documentation: xfrm_device: Wrap iproute2 snippets in literal code
    block
  Documentation: xfrm_device: Use numbered list for offloading steps
  Documentation: xfrm_device: Separate hardware offload sublists
  Documentation: xfrm_sync: Properly reindent list text
  net: Move XFRM documentation into its own subdirectory
  MAINTAINERS: Add entry for XFRM documentation

 Documentation/networking/index.rst            |  5 +-
 Documentation/networking/xfrm/index.rst       | 13 +++
 .../networking/{ => xfrm}/xfrm_device.rst     | 20 +++--
 .../networking/{ => xfrm}/xfrm_proc.rst       |  0
 .../networking/{ => xfrm}/xfrm_sync.rst       | 83 ++++++++++---------
 .../networking/{ => xfrm}/xfrm_sysctl.rst     |  0
 MAINTAINERS                                   |  1 +
 7 files changed, 70 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/networking/xfrm/index.rst
 rename Documentation/networking/{ => xfrm}/xfrm_device.rst (95%)
 rename Documentation/networking/{ => xfrm}/xfrm_proc.rst (100%)
 rename Documentation/networking/{ => xfrm}/xfrm_sync.rst (68%)
 rename Documentation/networking/{ => xfrm}/xfrm_sysctl.rst (100%)


base-commit: 61958b33ef0bab1c1874c933cd3910f495526782
-- 
An old man doll... just what I always wanted! - Clara

