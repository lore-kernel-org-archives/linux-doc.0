Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6222E40E
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 04:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762747220; cv=none; b=d5iurYyCBbW8WBihZ0rxuaX+WC4Sl35Ah9Yt1KrxIsfjUPu6e5kuAsgF/iLeUU7+b2BicPOyrhG7fSdPonGdNV3T7Fn9jG0PnHhBgRd2ZeA6QSdRkisszPXJmOCfF21OFQfhiZbCtkUsMGZ/42XSm6LbCWKaOSsVkpxGpfu/S+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762747220; c=relaxed/simple;
	bh=+YLA1pF2u5tBPkoi+r5JyGU4phxXNOGQYDiMD+cdBrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kmpKYjkHA9lQp6xKzjyrANjeLrTUh1zAOl60emBYBl1icF+EqFhJZMoiWD/G1iF1ul1SJSblp0EOMuP853g1V2jf+1QI4W/mDEdkt5kprF1xX7GHUee0MY2Br2vg7ZHnQ/VH7GrNMqYM1TPtao03xGfxz1Vj+ylHfr6IjQv1blM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSvIUDg8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSvIUDg8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3437ca434f4so1126710a91.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 20:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762747218; x=1763352018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMUfG6d8YJVoEPCuzvVWiCBdiIaGW3adtjAXZfiawOQ=;
        b=JSvIUDg8rQ3V0s/QpgDPUq737Jx3R8xpJ3SYe7SPnMaw1peTcli+FfgqGvcCWqKDah
         MEZHNxcHwaOtyqZrdRC6kRWesz92SK8C0gUWvHh+bpHc2jqxju3m3U7bD+jfWLfp9uHN
         RK82IenK4UDxS8vLZNV4BZ7Iu+GD5nKFfrun6TVUFaLwSkEhzkL9KD1+ZmOS5MHt+HRV
         rXg63rA6+DqMgMlod3wDt11GUUHGeXMycwQNa+3b0gwWq3QIEDzwFcSRbnRJHN/auy3d
         l3bIKbePqhjA4v029FKl8MuMiM8599sm2Rzh/1g39LpUEWcmnrlT+/1dQLHzStkwAF19
         h1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762747218; x=1763352018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMUfG6d8YJVoEPCuzvVWiCBdiIaGW3adtjAXZfiawOQ=;
        b=nrAX43zjwAaSB6X+ASgJ/TNi2yIbHQLS5sP1XgiSnqLRI3z7I56Mk48BISH+AvwcpN
         VEWb4/7elgIHMawGNSQASuNl9eqTSAeKbtl4BDf4ABy7XtGxFDAaSfhdTA1cJkD5P7qt
         S4eGvKgiLYce8hZcfFaj+1EDjhQqby5sbwj5A9np7NEjpjG+7V0jEpeMulIG+kkOpUYS
         KAoO4laXYKd4HA6caR94/42aFsKknUzqtaQKiJjC/GdWG7pMq2S6Dm9LlcEWYgqpLV1w
         gxdkZNoyDMLnhUvoMNgp08Z4ooIw5wVKxMcxRNRdf2tKiUZ+ikZbuRltCNJaJn94V5F1
         CDAw==
X-Forwarded-Encrypted: i=1; AJvYcCWA4MsIosGtX/lV6Vi7ROQwO93BfG/uYPGIFRz7Uapjpw91gVzS8nQhziWWkyla/uhyjn32czvOWHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4FEA5+wB+OBCRBkcPBvFIYtWBx44CbuAbgEp5lCEEViLS0g0a
	IRPOP1hMLudAS/mH4TY3eJvYbVyXMXY8UAch4UMKNc1Z3oGaWQenFNdO
X-Gm-Gg: ASbGncvlUOW8N5TqxLiFp5igS0ij4kJ7FSmvMqP8Kxb5CAOZ4mbpLZYRP1qtQxkQAOY
	qOFbcDDA9XYH/sNCP+Mo5ZMmucxdn2QqCGB8yKFFx8ZAyvi9IabT7Sh90UE0nGYH10JJoW9G3cs
	rtlgumcRx4GPJ2Qg1DjyBb1y2GGQ2e3ptso+tZHmn+t9pmYJoqTZ/iB9+1upgptUrAo26YqHOe7
	1Nxymi8YddFhrxX4EoH/89K1laXq3Xkc+OmrPNI2ziJSPbkR+s70W2V19yTOi4mdgsNmFzEyU8t
	TS7KjwiLC28kaOFeb69qJUH/hcZ4+qAk44d4P9j0+3Idx7MiYw5ujEcpcKZ6TvKey7JnzIRgZ7+
	CAI3fWyJ6cudkMu8aWwhtU9RUoPwlgtZ7AlPu1edfkF5x0rLJ6m3gOvys0sv27S065jIYTnitJw
	q16wlME/Q3/qw=
X-Google-Smtp-Source: AGHT+IGylS3DANSimRKsqAmshVHWUS6uHhBsurOh5pZoC5DU/3TeXp2D1eGJLyuUWjqFxc7R7ZxiJw==
X-Received: by 2002:a17:90b:5588:b0:343:60ab:ca8e with SMTP id 98e67ed59e1d1-3436ccf9da2mr10566796a91.17.1762747216926;
        Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3437221b329sm5519516a91.16.2025.11.09.20.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 20:00:16 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B7B4B41F3D47; Mon, 10 Nov 2025 11:00:13 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
	Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
	Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
	Aswin Venkatesan <aswivenk@qti.qualcomm.com>
Subject: [PATCH 0/2] accel/qaic documentation fixes
Date: Mon, 10 Nov 2025 10:59:51 +0700
Message-ID: <20251110035952.25778-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bagasdotme@gmail.com; h=from:subject; bh=+YLA1pF2u5tBPkoi+r5JyGU4phxXNOGQYDiMD+cdBrs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmCSfFXI9PM/p+54WFUsvFkzdomDv+PhZf0hNiuf5x+e YX0/Z2sHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIpxfDPwOD25v26U9xXiG9 6GKHacdzFTmGCRYnJPqjNNidFmq++svwP0i4nOsFx8qwC3+U1ijM3X1phaSvyUbbokzDizxrGYO eMAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are two documentation (indentation) fixes for accel/qaic as reported in
linux-next ([1], [2]).

Enjoy!

[1]: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
[2]: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/

Bagas Sanjaya (2):
  accel/qaic: Separate DBC_STATE_* definition list
  accel/qaic: Format DBC states table in sysfs ABI documentation

 Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
 Documentation/accel/qaic/aic100.rst        |  1 +
 2 files changed, 11 insertions(+), 7 deletions(-)


base-commit: a2b0c33e9423cd06133304e2f81c713849059b10
-- 
An old man doll... just what I always wanted! - Clara

