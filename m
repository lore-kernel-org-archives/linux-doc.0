Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8330E303A1A
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625570; cv=none; b=Cnu/nXvraMzjUkrR7TxQ/R1BADu6A0S2L9A7rv1L/+/wG0tGD3+YnfcD6y34AHRkxUKcgB794JszlUjdN2bcfMikm88L4r6i/jhpCjvt30fWZ28LOvjexPxXNiqAAaMZyG3NFZgnmRpF4g/Gy1i4PgRAkJeEbqa2ZHWUin+jVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625570; c=relaxed/simple;
	bh=mBEy1OSTcyq7VKG86f9IZoK0MtyDVKheqzPYaoxq+m8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBSvaWd6+zKu1+TdER7kB05X6oSxpPyJehU8Pw+WR0rP3x8HQY2SmbpUxonSq1o8tJ3Wa/1TAm0/hsSShWe4xVSPc01IgKz+0SWEB6g68p1BR5zGD9QSz5sBKT4zctoEMEj7FU73G6mEKaFJSZ/VfHjse648PA/e7MD57FqxpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ell5bih7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ell5bih7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4775895d69cso127415e9.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 07:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767625563; x=1768230363; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ts41TgvYnjmJxWsnOyTQ/BgspdhUU8k1HH+4HjNQvU=;
        b=Ell5bih7RMfsUw2TrPo4Idt2TUmorIq0wiKjAr/BjKzQogbCcv4+IPuKm0nHXL0n8M
         KVAbVGGdP0Md/rgARbVbmj/D54VJqyBhxy2L2cNZl/aNKIRWivSAcRKLVuLxJBBFxdYN
         yyDSfM0YeoQWV5bXczSnZDOpXqeKn/JqRc41vQsNz3vrfTvKmHq2Nnwv//VeWPzin19N
         y9aFJ08kiJ6VmUG8sHjNHmXbphIiTwubxD+86br1vuu2X4/mNFZ/0WwPX4zJ4mHaA0QW
         jHzSlRu2yolQrLw0aHfzP0xKaN4arhnE9tAd+yENRnNPR7n6awQVePLM4BlcpW9xEeOH
         0eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625563; x=1768230363;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ts41TgvYnjmJxWsnOyTQ/BgspdhUU8k1HH+4HjNQvU=;
        b=w74f2r4gkBp1cC+LC4c/zNhaQOueo0dSwm4JMOdNd7U7v4wH/nNNvhGFTWP63zh8MQ
         bbvaDW1gX3ssVJO+7n5odHYNm++fobK5b6+RbBnlmNmg7m76xTcayhWEJ7K0/59zNDxe
         qQB3EJBGWvk1nikcQMqIQEKEmdzKzy6zkkx9TzCKnzDOZqELX2YX97tZHVeA6BWDNrcp
         /vuoPN74v2NI0O5jjH6MCq9N92BpRSrkbv6nwjQY4Lh5SFkz4N/az/YdhdOJmfRRjGqe
         qFcMTI+Z6sIzqEn6H7kLm8/BFSne8mFPw7Z6XJwlf9vt5E4brclHoGtPbWaxES9P2QRu
         AXWA==
X-Forwarded-Encrypted: i=1; AJvYcCUwynQCoTgKeWlTOM1hKOIZwB7VGIufmAkyVWl4TzLE+2dVGxw4MhdTFM5rY5or0izj0+mvlZPUQPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydSrOMBI7IkEo8TMCuw1p60jyaxD/uoI9nT8wPl0fZB5ZuMGtm
	zzt+MT91Rf4g/rIgKkN2Bfhz7dlnX3S0UhajsOBEGJYIGSffb/MIlsJHrDeFjlOxx3E=
X-Gm-Gg: AY/fxX54UU12Jokf1nFjtWLWVZzqW8+B8XSI2Rg3nfnVazaRrYyeSM59EgurRYJQEc7
	mjOCcnwwhZERR66AYuUkAi6JNIcRgYJrUtrqpNh6i1XUwIQx6NAfK9fOo6w3BBWw/NeAmXj4I9m
	I6W5WjcBMv4e+c89hJXOWLiSO7D54HxcK/OnfB9VBKw6WypGkiMdk6xFfb094igfjf7m2VQciPD
	4JnRTlirQHGg/iBbp0UwyOiL4LUvPf/2WwhtfZpCBQRtSN+oTit+brMgBiFXJC+M42Hh+XmNImT
	HMzg6Dp2XdqlQ99ZIip7y6hqhWqTEgYP2XNDUymvK4cjOsPfYBcECh2Ennx87NIqbQ6NXxqk+tM
	fz6qPwI9CQr+liz7N5PS275k8fpsEruKVh9hR6FSvgEyr4CYUZmVZoTgHHk6eb3m9A6w7an3nHF
	VK0JqhJbycR7BqOvs4394xxqd+0XUAVoNyCpTZxA==
X-Google-Smtp-Source: AGHT+IEFUFyWxKIpuRzUghKZNpwVRLFqSb17M9uewYZj3vgeXf7YItVpz5KhLuiZ+Jqa39+DF6Jd9A==
X-Received: by 2002:a05:600c:8116:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-47d1953bc47mr540669925e9.6.1767625562700;
        Mon, 05 Jan 2026 07:06:02 -0800 (PST)
Received: from r1chard (1-164-79-94.dynamic-ip.hinet.net. [1.164.79.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d148ee4sm159871235e9.7.2026.01.05.07.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:06:02 -0800 (PST)
Date: Mon, 5 Jan 2026 23:05:54 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Lyu <richard.lyu@suse.com>
Subject: [PATCH] docs/x86: Update AMD IOMMU specification locationi
Message-ID: <20260105150548.73422-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.13 (2024-03-09)

The current link to the AMD I/O Virtualization Technology IOMMU
specification (document 48882) in Documentation/arch/x86/iommu.rst
is outdated and points to a defunct URL on the AMD website.

Update the link in Documentation/arch/x86/iommu.rst to the current stable
location for the specification. This ensures users can easily access the
required architectural details.

Signed-off-by: Richard Lyu <richard.lyu@suse.com>
---
 Documentation/arch/x86/iommu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/iommu.rst b/Documentation/arch/x86/iommu.rst
index 41fbadfe2221..cd1843812b4b 100644
--- a/Documentation/arch/x86/iommu.rst
+++ b/Documentation/arch/x86/iommu.rst
@@ -5,7 +5,7 @@ x86 IOMMU Support
 The architecture specs can be obtained from the below locations.
 
 - Intel: http://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/vt-directed-io-spec.pdf
-- AMD: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/specifications/48882_3_07_PUB.pdf
+- AMD: https://docs.amd.com/v/u/en-US/48882_IOMMU
 
 This guide gives a quick cheat sheet for some basic understanding.
 
-- 
2.51.0

