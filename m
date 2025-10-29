Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3421FF26
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 01:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761703201; cv=none; b=GziLvckzkXMXvp//c3LXiUB+DhUrnd5ADadK8CccINrvf3VNlaSizLx1kMXZg6sIKD4X0WHQYDxGpWeCIEjizlG1DvhbOrFwRIO6KTJiJCqVTV9OIJj6StF1g23zTC//VO/xc4ZU5HjjpRf+D8gRUxlR29sgMLJb0rjLujWjnic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761703201; c=relaxed/simple;
	bh=hP8eF0K4Fnew1ZKu7xTTUKH7Tg+SmdBmlL5J3VUiePw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jdC/Ei2qqscjcyPtMU19jXKWrdzgdUc1YV0VJl0xRQmPmWqHEn/Ds1OSRFEe/0oij9lw6EK0P2o04tRebOMLe33+mfON7U04e4YrUlVEyKThOzH05GNyxNTcXcDaXgvAd0Hs3+Yo6qC7vvh6OBiYmThUdAKqwkZAp08UWOUylDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYEqokpC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYEqokpC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b55517e74e3so6109729a12.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 18:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761703199; x=1762307999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gfqaQ+uC7bdG4ILE549OVeYT25uPWQdC6S7HhQE7unI=;
        b=BYEqokpCBsHmtejJeGUUev3w4G2PKT4TwDvORE6nxjSHaAIbyTLgVNkyBuNEZxQo1g
         y8Zgzg82TE7OOepAHXgTHjAEdOa4ypPcM+jYW4Zc/qmhP6Rtwr/J7q774IOMYYe7lJjD
         389zWAtpNb4n/ioo1xgK0liZMwMMHCYzfM+C6qVdPokRientoMBCQqqR5ErpxKAvgBSK
         Fpfbi4AocSyGTjr94ukXQvhZzM+AIm1ok+HrpYg3Skq8RcizUCCiqtCiTDqWQL9iByxj
         mXyM8sOUJiC4EHHhX983FH/176GdiP96W60sIZN9GbpmNFyoG9woVf89bCmoJlUHIoE+
         lZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761703199; x=1762307999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfqaQ+uC7bdG4ILE549OVeYT25uPWQdC6S7HhQE7unI=;
        b=CPiXpqRWvJd3gj2BS6a2XRgpyf5nGWqf4DomF9LxXI5u4B8x39jDh1KehEumidUX55
         SdEnYCf+ArxUi3FWc/8SBSqzk7+zmgMI8ZXXv+mqP5cx+TOWU/BOc+Vjqoe6YyjGDQnV
         +WoCei8G47lpuTH9FaIV6hEsbyazdEY5RTxruaBWWd4lr1xPHs3CWjGkE1G3VLKiGjis
         wbA0dSTiE1d8cU4ue/vd+OxFNuIwriF+PEiCrtdKsZLy6kk1sPmaRBgvOK3flojKeuw+
         lU6m7gDXyiXUR6PuL2HE19pxmHQnWBB0EUsp6gD8BHAogQMenjLLTy1LRcQRwOVDP67n
         vQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1BDjD9296BtY8P4YlUwPmIJONqJ4PkUgg39Lfq08NdMfwjpAH6ikJy2QqTyAoP/4LX8Uy00L3lL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPm7te8J6aQS0i6DnqdSmrgYeWhPGll5OFVqcCCX/qI/r3C/g0
	n4Wsd4ifSchsuZNkGyznvZ3xzMhcrqSj68HBCkOySNua9ojbYqemPlMP
X-Gm-Gg: ASbGncthQrVEvoGjUxm2gA0Ubl3dzfVa0Cc1Y0JV8JLXRXwI+TVjI04C98uGB3qvVlZ
	+0J9LhBfOVTU9ToKOYahr8AIAeWhI+5ZjrkD6cfhTVZbC5soUXnZuD/OEFtOtAKV9W7JIGpdR43
	z/lkOxyhyoAyI9d6GT+Eqe+xQ+Mauf7KbPdOk6zlbDhk9sKN/I4tRuyEpeYqyD/8BHA8xQuAoyA
	CIVux//8bGfPnoeaZCD0TNY5yPzHths2yC4rEEt0JItPTZB9nhTZcoCnpGZJ/8+xnBCTAuZhxx2
	wkXkRtXtwghamZcqbe3rARWeURpzk/epCbqDIB58dBIrJW828CQ+F8nPh0st7Sl9Pywlz9EHu8y
	0F7sxMxxQtPHqtTwoIqfGojBq4FQOdQwPdfyvEwdAWC0qROd0Bb0m65UP6qEbFWuNEEpFe5GgD8
	TTZofha2OJjCI=
X-Google-Smtp-Source: AGHT+IFlhaFEy5i7fb+WJyyvynWY8Siu4ggFFXY3WiOcoLFv8mNx7LPXoJr5hXn1kPXaKhQcEU3+vQ==
X-Received: by 2002:a17:902:dac8:b0:290:c94b:8381 with SMTP id d9443c01a7336-294dedd419emr16660645ad.7.1761703198547;
        Tue, 28 Oct 2025 18:59:58 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41403fa75sm13177538b3a.28.2025.10.28.18.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 18:59:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CED3F4206925; Wed, 29 Oct 2025 08:59:47 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next] Doucmentation: netconsole: Separate literal code blocks for full netcat command name versions
Date: Wed, 29 Oct 2025 08:59:40 +0700
Message-ID: <20251029015940.10350-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=bagasdotme@gmail.com; h=from:subject; bh=hP8eF0K4Fnew1ZKu7xTTUKH7Tg+SmdBmlL5J3VUiePw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmMJVKXNp3r85oX7K8e5aYyNynwSkWpxenE3JLd3R5fN ryO13LoKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwEQkORgZHnKHpSvqlLE9y83a 8WfdhcUsXgFb+ptNtvq4bli0qqjLn5FhWa54mShDdGOaW7fsfJOs4jAWu22fdU8+s5ojnf/pphM TAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Both full and short (abbreviated) command name versions of netcat
example are combined in single literal code block due to 'or::'
paragraph being indented. Unindent it to separate the versions.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/netconsole.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 59cb9982afe60a..0816ce64dcfd68 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -91,7 +91,7 @@ for example:
 
 	nc -u -l -p <port>' / 'nc -u -l <port>
 
-    or::
+   or::
 
 	netcat -u -l -p <port>' / 'netcat -u -l <port>
 

base-commit: 61958b33ef0bab1c1874c933cd3910f495526782
-- 
An old man doll... just what I always wanted! - Clara

