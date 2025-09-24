Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7A21FF44
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 02:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758679607; cv=none; b=SIFUUQeps0d37ZLvmUtmG6qGnM0arTvGQP+4IWhQxUXVCDt9W2/jMZtNT+vhdd/X67qyThbhVCOhTBnnywbJZyWyL3uTj+zmy7PiV2HwDl8rwRhewiEi5xUqCqH5jyUiaN5M+hEXobcUSuL3StPtdLo4VOoS//aDf+j3YmL3ioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758679607; c=relaxed/simple;
	bh=SJbHWlbvJA/01zIZ7Y6v2IHBI9WiHdTgUa7T2tMLDKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ft4FitmEwU+8kyC9t/Ebcan4BoWOKN/g00k2R5NnRR0fA3Az7z7Tenb1hVUm6Djhn+I7tdnFxqKkftouj4zTmS3+gxC0+/qk8aVb6h2Fq3mfacMAkWpzTreGogjDWRtv7Z9ucUEsats1l2FS/b43ntFfdKPEnM4H5FxCPZ7bDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiJlzNFd; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiJlzNFd"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f7da24397so107896b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758679605; x=1759284405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwTsINYgLAubnrIc+zvaDxzMOPdaYgdoD6PMu3OyE78=;
        b=iiJlzNFd2QsQmb/jor3WwzljFOU87pfqPEsmInV/maWE06nzxORVxnpD/tKKE8cj8T
         2azvzeax6Z/E+r6Le8SvUF51WznvOTSXPKAtxXX5rdGfIw5zfeSmIjqf+iJ4NyfEu8sk
         OUqTJa0fv2UxK0PFNGcqdNM8dZpg9F/nSdYJscQrPbXAfswyhjiCeOyf2OIJpTe+M4Om
         hrK31jY55ejDqgnimzMJZVfNlj6i+Toz5OO5Nwm54pmo17I1LZ3GEWiPLAUDlG0Yth16
         CGYxiJVuRMSK5jlBjw1BL6qeqBo7duJgpaNJRCatrRkmk7ueyVfhVSuFapNfxUkoUw2Z
         1L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758679605; x=1759284405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dwTsINYgLAubnrIc+zvaDxzMOPdaYgdoD6PMu3OyE78=;
        b=Z9bd9QcN+fp3HzlK7iTN8fWqeFlhPucoV2EZlWKnyjcMpMnJqzrO/wTd92uNR1Diua
         /Fj8wnRpN2G7Druzv7U1ZjcefIPVAHioNix/HkxmQwQjV12rdzJ3rdZKEmCzHGD+skbD
         l++3FqNzl8TI56UqSCyPKa1xzs10UiA+zNbQ073MQb6vN/e6G7tkZejrLwtLhM9NBQg7
         2L0sFXjfQMy6g8FBvHdUMFB3eerokR+yhcpN/ajNvk7ewHS1iBk2wiMUs0btrYj2Oi3s
         0JmzhuAMbR7vhYx+gajOxl0o0TR7fba8aG5j3F0isZZ3SxSfCsceosPrSVkGs8D0L6a4
         yTMw==
X-Forwarded-Encrypted: i=1; AJvYcCV+S/1tlZZM4kWb9HYjftuGh0lsrNOzxQRfKPIB6XcghLy9IOuzMHlg9nmr2Y2FhASuImNbk8CLQMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytILCVgfSBAvJxNIHaLfkhhjHZLg4PJ9Mq16Vej9naP2AM2kjj
	/de9YntTRJ4E/mBo85i7UmIfGKilfX0GBqQ/+zJAn7fi56N88B1bvYpe
X-Gm-Gg: ASbGncsmdZ79JxaAl1O5FDdPwRJIyAJea58AD7/cl9U+PkovJW0IzH4iTKpZt8PHcOQ
	3ZsHv+uoA9H7G+hHYHJfpTkIhfzGN9wsnvt1FFL1sesVGqjH7wRlyH98I6+2quHOl5+jxOmmbbW
	LoEw0+T0FnUPEOOMlFRGGAeC7i9g32LBHCeGdGQ2AFKqUv5uhwqp/QgjR5kESq8Xp7442lf+/XF
	G3lNnf9r9A7+gENIfPw77pnCx67DD1lkR8GwH4viR0xZpL9wlhna7ioJEHYG0+rmK/eAONqvZUM
	Rtt9Z3G/MXsxs0FcYa5rlxbsU2MD5X7/ojPeOP2ozGQLulYYkZQI9//uiHp79Q8OZYpTaFMBGpn
	0FS2B0buOyAnJt3qSr2QgI+eEjEfek/aR
X-Google-Smtp-Source: AGHT+IGkf78YC2sKEM7cbsmrqX1hFpvzRBYNzQq7EPVRv+Rq2UBgzLYX+YUWp3EP4vlgaXWZwiW4JQ==
X-Received: by 2002:a05:6a20:3c90:b0:23d:ab68:1b7c with SMTP id adf61e73a8af0-2cff9a39f41mr6933117637.46.1758679605150;
        Tue, 23 Sep 2025 19:06:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77dbc8e7cc4sm15316561b3a.29.2025.09.23.19.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 19:06:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7AD49424C03C; Wed, 24 Sep 2025 09:06:39 +0700 (WIB)
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
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next v2 1/3] net: dns_resolver: Use reST bullet list for features list
Date: Wed, 24 Sep 2025 09:06:23 +0700
Message-ID: <20250924020626.17073-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924020626.17073-1-bagasdotme@gmail.com>
References: <20250924020626.17073-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1267; i=bagasdotme@gmail.com; h=from:subject; bh=SJbHWlbvJA/01zIZ7Y6v2IHBI9WiHdTgUa7T2tMLDKg=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBmXA9N6vq/JfJ2+ySTG72ZEsG6Q87+q2xOCluT8TX5nc eMiq7BLRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACby/xvDf8+9L7eVcr/33af5 TGhFt+LhmKVCCvtSrnu/erI2ff7huD+MDLf2rblYmXD1TNSJVTK7H31rWuMmlHZli9q7N6L7F/k KmzEBAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Features overview list uses an asterisk in parentheses (``(*)``)
as bullet list marker, which isn't supported by Sphinx as proper
bullet. Replace it with just asterisk.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/dns_resolver.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/dns_resolver.rst b/Documentation/networking/dns_resolver.rst
index c0364f7070af84..5cec37bedf9950 100644
--- a/Documentation/networking/dns_resolver.rst
+++ b/Documentation/networking/dns_resolver.rst
@@ -25,11 +25,11 @@ These routines must be supported by userspace tools dns.upcall, cifs.upcall and
 request-key.  It is under development and does not yet provide the full feature
 set.  The features it does support include:
 
- (*) Implements the dns_resolver key_type to contact userspace.
+ * Implements the dns_resolver key_type to contact userspace.
 
 It does not yet support the following AFS features:
 
- (*) Dns query support for AFSDB resource record.
+ * DNS query support for AFSDB resource record.
 
 This code is extracted from the CIFS filesystem.
 
-- 
An old man doll... just what I always wanted! - Clara

