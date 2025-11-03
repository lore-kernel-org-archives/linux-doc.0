Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0127E1DC
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 01:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762134667; cv=none; b=k0xnpQTYgC3YrmSX7HOKDBnsKEkvlKPQd3Zn7FV6K4QoqlTdk2Rc9K4OV/zkiIdef4PUM4DxzAsWX2HQknaTnVBH4YFeha7z9d1zOADxIdL6V6xteh5edFNLLMb4Q6OgJSksphZdkMxzdPs32S70I/0z2JnJL4YBE3xErLvTCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762134667; c=relaxed/simple;
	bh=IguGKpS5VQ/M3vLUdSUXAb+iSeTOTwLAIFBgATkkuRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=leUBUdi4jJCnaXMmb+9EEfA92o4J4BmljWRRaO5Y9sMqiSdziYyRymWByriaOU234Vm9IH5wJdqWDJMc/WFXyujsc1QCz653hsm83XhDNuOZFx0j6mefWVSxxJbh3pusGbfBZ5S7/s6OLQenCe9wNmCc3NWeol9KSv6o8UV1apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=en+CFps7; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="en+CFps7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so3593568b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Nov 2025 17:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762134665; x=1762739465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5TaO2MetV3N+eF97av/JpASJddKmaM/RwWRxYKGrZbs=;
        b=en+CFps7l+qeVjqc+IdUGzSA3/x66dr0QFUyiw5grxY6DydX1cYip4YFNshuURWdYe
         s/XeQbclH2zoIgWCluQ4uGS7tIdf1nUZ/zxJIcEfHguy8Wq4Td04gFYU8t+RG+8pIU42
         DeVO0axoH6wC2BFri/Aiqxe5rdlw4y4WtVXqLjbsAW6ZFf8HIyLspIRv5iYJYMIebsfu
         sR/waFqrxA6EeEibYdP0l70BZGF3EMzQCDjKkQJY7mxici5fkIO9iZV9j2joCJlz/Src
         bs3GJ+oqC8ehsl+DTOwyDSQv1DzFpVpOt8TW4FUuEX4plexuoacmvebqTHCHFjCJD1ld
         X1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762134665; x=1762739465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TaO2MetV3N+eF97av/JpASJddKmaM/RwWRxYKGrZbs=;
        b=Y4F93kOoudZk9AFAVdVUZ0YpVcBpMmWsUE1XVm5TbwEuK+iGtstyWQ0lKR0x6vHQxb
         Wyf9kZTFDWV3/ejbdMHy4mcFGmTmA3Ld3uG9EXisxRwdfUpOxllDgq7iq/BpusK4RnrK
         OaTX9/a/Qju3xM7u0q3dg3oqRsx+L+ar/oaRuRYzzdWBVwAABqc9R9P9GwdYli0fONQF
         xdV7n1P9tBru8GqbIyeQb2ZBjaEgonWur0RtjkEyjvAM+CcfrUhGwo439XG8s44jVUVY
         uk1dby2/2v8JcczIiqliwkCTpN+4nPymhq3ms2iLnlKn6A9sG2AoWUUOM5M2DdkfOef0
         hb9g==
X-Forwarded-Encrypted: i=1; AJvYcCUulzHDpG/HukULe+kgHigSfBySDxIr6hcytCZXPM0IU+DlhYbIFMpEdM+AW+C5pOvIw5zbcI2dVCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDvNgH+/aOoynXLNnWvLzGAa6HRwa5zs5DNQaLYbzL9MI1Ikf
	Cz++/3RWzUXSXhUsITR3ik//cWETfvSWA8jnitDGRpXgsgQq0MDUUnGd1DzvN2vSZDA=
X-Gm-Gg: ASbGncsPmkG+wrtcDJeLJJZ4aRlVvs8GqL+qQI+1Bx7Lk1anuRB6LdwMOQGbsRd9y1K
	gBlX1NAQ5dfn84jlPvdIsIeIMTEPI/Z60ll0Y1QY1cT4pcNIo1Cv0VI90OyuFcmQzzWaq55RNI6
	tL63RkA4saYNcbUhVVAxiWCSV7pdt1xJBufDxHeX6FPJfggNsYUuOSA68BE7JCV2RGcK74v+ouN
	DcsTxSOlnxXRH/8BRSuEmtQF8LXIifNO2tw1L8bDcExvGnLZnvAOab6HRERRXqYTLoBTk+i3fUh
	yaxiprujyK6CQnXI1JYZP5kxQYjdIXcUeY5KxNvNhwEyb3+fw9Lutkm+9OHVDQvBd8Xa+62I9C+
	7A6CW8r/v/LpADKuQaj9H/sJC83QAGksgrs6sJidUN5VA3Eb8UNGBIYy+Zrybxt3LM6IzupRPUK
	o055SBv6DGHiQ=
X-Google-Smtp-Source: AGHT+IEs7Cde5AmB0FeCkazQwwniG0looNw85gQe5dguOFC5BE6Nn3UEgWK/O7FmBthpdNB3HxhPqw==
X-Received: by 2002:a05:6a00:2191:b0:7aa:9e4d:b693 with SMTP id d2e1a72fcca58-7aa9e4db99dmr3454695b3a.17.1762134665009;
        Sun, 02 Nov 2025 17:51:05 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db86f0fesm9130423b3a.60.2025.11.02.17.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 17:51:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 99D6E42229A6; Mon, 03 Nov 2025 08:50:58 +0700 (WIB)
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
Subject: [PATCH net-next v3 0/9] xfrm docs update
Date: Mon,  3 Nov 2025 08:50:21 +0700
Message-ID: <20251103015029.17018-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851; i=bagasdotme@gmail.com; h=from:subject; bh=IguGKpS5VQ/M3vLUdSUXAb+iSeTOTwLAIFBgATkkuRE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJkcnMWqopF8Z+6ckT2upMNkX1+RNbn+0CrNtNPzGgu5b T6FNXzvKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwEQCljL8lRPKEb04lePDBVO+ xXGLJ9nv3nE6uU5tm81b7ktcJYfnPWZkOJQ7TUnyx25hh7+nNU4stDyocapPyu3T7fz0vtJHe11 /cgMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here are xfrm documentation patches. Patches [1-7/9] are formatting polishing;
[8/9] groups the docs and [9/9] adds MAINTAINERS entries for them.

Enjoy!

Changes since v2 [1]:

  - Also trim trailing colon in xfrm_sysctl section heading (Randy)

[1]: https://lore.kernel.org/linux-doc/20251101094744.46932-1-bagasdotme@gmail.com/

Bagas Sanjaya (9):
  Documentation: xfrm_device: Wrap iproute2 snippets in literal code
    block
  Documentation: xfrm_device: Use numbered list for offloading steps
  Documentation: xfrm_device: Separate hardware offload sublists
  Documentation: xfrm_sync: Properly reindent list text
  Documentation: xfrm_sync: Trim excess section heading characters
  Documentation: xfrm_sysctl: Trim trailing colon in section heading
  Documentation: xfrm_sync: Number the fifth section
  net: Move XFRM documentation into its own subdirectory
  MAINTAINERS: Add entry for XFRM documentation

 Documentation/networking/index.rst            |  5 +-
 Documentation/networking/xfrm/index.rst       | 13 +++
 .../networking/{ => xfrm}/xfrm_device.rst     | 20 ++--
 .../networking/{ => xfrm}/xfrm_proc.rst       |  0
 .../networking/{ => xfrm}/xfrm_sync.rst       | 97 ++++++++++---------
 .../networking/{ => xfrm}/xfrm_sysctl.rst     |  4 +-
 MAINTAINERS                                   |  1 +
 7 files changed, 79 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/networking/xfrm/index.rst
 rename Documentation/networking/{ => xfrm}/xfrm_device.rst (95%)
 rename Documentation/networking/{ => xfrm}/xfrm_proc.rst (100%)
 rename Documentation/networking/{ => xfrm}/xfrm_sync.rst (64%)
 rename Documentation/networking/{ => xfrm}/xfrm_sysctl.rst (68%)


base-commit: 01cc760632b875c4ad0d8fec0b0c01896b8a36d4
-- 
An old man doll... just what I always wanted! - Clara

