Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965432E6B9
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726401; cv=none; b=Cl8kJzLH33Tg9TLv48Zu7AmddnS6cefW3GwUNqPr8vuGUJXybXgQaVIZm4xrht3NtNj8XrZPCQRhQ/J6dgU82QQk54/eELphVTohcPoS7HvIdJbK/G4ciOXinMt1pCFplAol6hkZ5AL9HVJDeHfO1glIHKN6SK4wGn7ItVj/xDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726401; c=relaxed/simple;
	bh=iwYylQ8AuV4Dwv48M1+UsyJjpTEomPIpnnYBgnEaLEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaWgtVB7r5gIe3QTpq/N3YowkWWuX8BpYvsASq/Sm79EN6bZePMWt2F2tV731UP6IuCKWl8lZPMKhsYyCeoBLYAMuDVaSEf3O2a7PRft2sVEKN7Iquxw7ieNsnqHXjgQBPOeErlsqLberD+RrgE4i+5R5T6zQwRKhEc7QKGZd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mwexq6nr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mwexq6nr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so710835b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726400; x=1762331200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWLMkuBEjPNHOX1jtcXuUOzSLXt4OK/n+U6maOQyI/U=;
        b=Mwexq6nroam4j/AVv6x33k7EOtq66tL0llBbYjbSzj9/bzhqsQYkd04oIHfA1+Iy1/
         NlF5BbLHsnW4arOqX4gxBiOCOKyWZQqdENvVm1TVqRSlz36LLF+C9s0zQpsiy3iDN5r4
         pifDlX0dTpu2R361MvoHjgfAG/opHZ7qC1389R+hMcNuGc6/gHzBJ0xvtI2vpKC2yc9o
         H19nvoAl+VG4QZotasOMDHI2+WK2oNHF/aT7/AEFrLfsvoqJ8wAQQJWBm7xmmiKhYHre
         hfGJBkfKjh/9uidZqb6teA0c7+Ggh7IC+egdor2qdANxPpZxicHJAnIVfEexkyNFFcR6
         8FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726400; x=1762331200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWLMkuBEjPNHOX1jtcXuUOzSLXt4OK/n+U6maOQyI/U=;
        b=PtWbEHEzj+i9BGwcdOmkD7PTviCpbRdlcNTfQ0k5IqkG2QePO6tEgp5VOhRw9Y6g20
         icET/A/fSXPMVg67szD9WZ5RSYBPn64ORcEiZX/+hyHVhKxi2VozRwFMdFLOOFW0C4lP
         u/8y81iR6oq2cOPjQb5ftKLtCll5g9kxCTdzAqLYQr2IcFleVF10Ia9qiuZ/3eKFmy7X
         Wz/4phFilO5anPV+c8ou9ToBzMAgIRM3SrzDsmjNwiGLZtKARmzSPR2gRDU34DYQnHuy
         0sibs0j4iI+GP3c7tfnwc/DPeLoubveW9MkzQJWNkx8xNhNKkpH2b1STaGeTXC7jQhL7
         xbbg==
X-Forwarded-Encrypted: i=1; AJvYcCWpmWk7qWMSdMysU9ur2Yf2ZPOTOibKWzTWtpfb4JDFpLMBL7O43mInkU1A7qornWyAGA9YDsTeOvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj2eXHxhtFxmqjhJbkBnD6trq3L6ns5WfONpky7892LIj6ljkY
	eYX1vlz0JnHq+C/TCAjCuDwGuJxZcU6OrnuiIPWGHU36d1D9AzC4Lhxf
X-Gm-Gg: ASbGnctZYSMQO8SMVPEzGCdZE+M5spoYfMkpuUcT628ijW5QnSbe9m2XMb1+DdRGKCr
	n7SxkOWkzOCaa+DUf8Cekn0hJpXU8z4g05BHPoi8DZOnpGiRyZHr3MTbIqJOQ9EpcSxjqdrP/0j
	E9tDJOaiVGJ0oQ1a3ojb8HOQF2faR034RtExVtvVoA7imsr7gRGjwKZ5fOFu9SepYiFGhuNU05v
	tNz8hUcnfMpzIGE4mzjs4SxQGwxqEN1yuoZcbN8UC70hE86jVUg9oUPl/xV02x3Je9WtjehOMz+
	KeV1XnfCpl3j3MVjWEmCO32wFp86BFx2g5ymd7ZJf70bSi0oKB+HalaLpw3Q2NSXPMc0UaGFCfb
	2+dAPUi1fouWoLZj63F0dVIbcqxG6KGBWjg9tr6T04F/eIQg3bx+BvBsFu23hVM5teUxLc8+ivW
	Nw5kzo4PlLsvBh1lAjHQLFwA==
X-Google-Smtp-Source: AGHT+IFVPQNroTDXnGwGmdI4qVP/vYNEi7i6hJaoqjIk6/GCV39T3NC2T1TRLTj4se14ABHn/IHX7g==
X-Received: by 2002:a05:6a00:130f:b0:77f:43e6:ce65 with SMTP id d2e1a72fcca58-7a442cc2c03mr6582791b3a.0.1761726399703;
        Wed, 29 Oct 2025 01:26:39 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e570sm14326342b3a.15.2025.10.29.01.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:26:38 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BF4CC41FA3A8; Wed, 29 Oct 2025 15:26:19 +0700 (WIB)
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
Subject: [PATCH net-next 6/6] MAINTAINERS: Add entry for XFRM documentation
Date: Wed, 29 Oct 2025 15:26:14 +0700
Message-ID: <20251029082615.39518-7-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029082615.39518-1-bagasdotme@gmail.com>
References: <20251029082615.39518-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=770; i=bagasdotme@gmail.com; h=from:subject; bh=iwYylQ8AuV4Dwv48M1+UsyJjpTEomPIpnnYBgnEaLEI=; b=kA0DAAoW9rmJSVVRTqMByyZiAGkBzymgretmajEH8Gt4qs6FZhwcqEbXXScnAOlKIf01L2iEJ oh1BAAWCgAdFiEEkmEOgsu6MhTQh61B9rmJSVVRTqMFAmkBzykACgkQ9rmJSVVRTqMvwwD/Z5O5 PPrnPq81NjHLoWYI8Yx0P+6QRHzuZpcnCK+3HJMBAKApdR5dLHiz6ANWO1EodYtf3Z0vGB9tRZn B1HdrDGUN
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

XFRM patches are supposed to be sent to maintainers under "NETWORKING
[IPSEC]" heading, but it doesn't cover XFRM docs yet. Add the entry.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d652f4f27756ef..4f33daad40bed6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18041,6 +18041,7 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git
+F:	Documentation/networking/xfrm/
 F:	include/net/xfrm.h
 F:	include/uapi/linux/xfrm.h
 F:	net/ipv4/ah4.c
-- 
An old man doll... just what I always wanted! - Clara

