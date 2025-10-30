Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149083370EE
	for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 07:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761809409; cv=none; b=n571qrw6LMJv0yQpPWa8z+AwhvXdzJ0/qpkCF80cnh78XnrZVNdOurgPjrNFa97WRQoLetAuVuN7wvoEim/V7RYQ/WuYEiFQMeq4/ZRdGZY038fP48HsBVI9ro9QcKlZnxg6w0BxrcaUgDf/YHfTvk9ZZHJfNXIBoMzL8rQWDig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761809409; c=relaxed/simple;
	bh=JEl9GC42JmfajoHCarU2JPEtxV/Dvh3GNqFUPBkz8So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2jzaSiIyudKFj+tlDj8MaR4sEX07JoZT7ZU9KHfoI4U8G2q+0hoYJ8XBE4UWBOCXZ9l/i4qLRYSUcVpX1KfDscLxH9rUP92wrHVuLoqaTLOd0Nw3mgvqu5tNKqWmvoshiFkUGmiDVvWmdTnvV1ABORw7q/Ynrq5MWBn4t3IGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0ZmbZzI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0ZmbZzI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33067909400so587539a91.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Oct 2025 00:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761809404; x=1762414204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdDJYs2ftj9g3gsNmVUwfcn6X4b2n8l3NR5CnT8xsbU=;
        b=V0ZmbZzIGnlOpu/06RNsyXxKeyupSXjb2mOzW3Wqkxq1KrJRk9iKcal67eoeNvpXJi
         FuOSNPtyqOcDo6QeOpicA7UxeRi99wd0BDn5IPVSXesgeBJvW/ewK8qmvPpDgJFJfGq5
         Bt6MrW60/qHSifP2n+o93iQeTKGtGGLEpfNwOHx9N3HpZ8aS4jRrR/JR8CjFiTo7TjRW
         WGxO2AdkSkZjUKtQHZdWh1cQ1ck2D1yYGy8x4bOaT78FmyCLGbNGeNSdu1Hvs3k7kGUS
         ihHqzSio+tTZvyz9+hqiEGn+Cl+p2lJ6jhoYLNGWZEcSq5umb0Eo/ng3VFBrM/t99X5j
         ossw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761809404; x=1762414204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdDJYs2ftj9g3gsNmVUwfcn6X4b2n8l3NR5CnT8xsbU=;
        b=pXJt6W0t8dMr83+sNUWmZtOEZEAXrM1HfSx/B2GyBwNqkXa8p2Hrn+XgMtljer7UqR
         bngm9aFrXfRUA3xprRmqaTGfUTPn4ET5HnpbtsjwdBR36vJCfE1as3g3Au+vh0NA9SkV
         N2UQRsTQak5ucXsl+x3NQh+FB58pNwCx8q5XfWV7cnEQWW31FDi5hdjb/bSp/krnEGt1
         SN3oVrZz1novQ+DpllZ9KqQUkgfNqs+ItLzkx0srrkqaTq99R3+KWbzfxQVdBiBFXKzV
         CTdTfSSkJKgCmLTIHrsouRCnAM5GxoVKkHYlYin9XyGLXlEWLtmo6vee/mYq3rixN7aq
         fjGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2S5Bsy/oYVnjJyWKKZYmSEGsrODtH8e2xv0s15awY0rzDTlDdi4idFifhbaB1ApgSdn6sx9vT6H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVl+plWQbc5KB6Yb7iy3kBiIfYMLirlo5NbCXSTNTjQip/69Xj
	u/36Au/3C7StWuM0Oimc5/ppPpHUm2hoWWMqpkm2Y/2cq5D6W6G7xkKR
X-Gm-Gg: ASbGncsx1m7E2PrkGif5wGWnH/WxgUGY0wjpv/C7AEDvmqY92Np3wruL7zM04yuuleR
	HykOA08aQag9pnlbgx9fL9zUlF2SuSw634Zee0YV+GuICL9gnNY4/OuYB/J8xQMbv9O315vL5wQ
	JdFLWVylMmJ5mwDTMUNejr6r2NGBq7u11eGNg+UtLTJ4ARCth2jNbq52cBXvEr81alySHGHj3iZ
	B3vJRDabVJLhk0gGLarL/HORvgP0SSDToq039FCrRoBymMTz2QxDfJoZNA16EXeuZtM52+xg4ER
	IrpMRnPkbfyDiNmtjLLFsmtVdEyG0kroVKbRX3pHinRrutGlSLrJKz4GRvMrnyAiT4jskFska5Q
	RTpYFrNYICMmAYGBhALskwHJRT9WVNisq2V5If03oNcq1LY0aJksITBEYaqL0AWVHue0spjGUHF
	Pl
X-Google-Smtp-Source: AGHT+IHmZ2LrOAPsOHzLCV0R7WL6u7SHBbA5fx1AuypMoq9aZiir9lY6E508nqoYTXIY9ZDt2yElfg==
X-Received: by 2002:a17:90b:3906:b0:33b:ba50:fccc with SMTP id 98e67ed59e1d1-3403a29a3c2mr6444652a91.18.1761809403953;
        Thu, 30 Oct 2025 00:30:03 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3404be704efsm1002505a91.0.2025.10.30.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 00:30:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 358A34209E4B; Thu, 30 Oct 2025 14:29:49 +0700 (WIB)
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
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH net-next] Documentation: netconsole: Separate literal code blocks for full and short netcat command name versions
Date: Thu, 30 Oct 2025 14:29:44 +0700
Message-ID: <20251030072945.38686-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=bagasdotme@gmail.com; h=from:subject; bh=JEl9GC42JmfajoHCarU2JPEtxV/Dvh3GNqFUPBkz8So=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJnMwhlOXPI/DJQmTfk5adEEqQUnNix8yLrm1ou9Mbpf9 rlcfROj31HKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJTK1k+F/xcGfWlaBJJ//J ZvqcPx3p9qUw4oXfE9sDYj9fV11zW6zKyPC4x7tt2V7RhLQMT7s017pXX1aHaCvv7b3DduBVTH+ XHhcA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Both full and short (abbreviated) command name versions of netcat
example are combined in single literal code block due to 'or::'
paragraph being indented one more space than the preceding paragraph
(before the short version example).

Unindent it to separate the versions.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  - Apply proofreading suggestions on patch title and description (Randy)

[1]: https://lore.kernel.org/linux-doc/20251029015940.10350-1-bagasdotme@gmail.com/

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
 

base-commit: 1bae0fd90077875b6c9c853245189032cbf019f7
-- 
An old man doll... just what I always wanted! - Clara

