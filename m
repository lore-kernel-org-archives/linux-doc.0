Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB32F3C11
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 13:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262021; cv=none; b=EkXyo63Aduyy3uDD5bLEWrusAvNPjOk2u1D96cDU/CZ/sqNUFPmRAGnQd38xs7kdkmlNh93cmy1JGvGV9NORK1gfDFuldj53Cneyz+rvL3ic6sAkunIvsmMlU1yd0XmYUIqwxRhVUBD03g6mqyychYvBmL54vdcMZKAtrMFMYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262021; c=relaxed/simple;
	bh=zReFbCpQpq9hx7S5OuXnYnE+WALGscFOwncxZWVvVD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dvM9krc88xRRzudYS6H5TDcGviZC+39TKuo7TKEX0Sx6gsXJHexGyjB701frlUcB1/G8Fwx2YgTYAS8yfk7QUJVmdeHGpzuTGQRvBKucul0c6uTlQn0gb/Au3kxmNLq897x2pFyD/qQdhY7S/QJKi4QaHakXMnVLDVShBKgXU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlYkb6KR; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlYkb6KR"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27d3540a43fso54591405ad.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 05:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762262019; x=1762866819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQu9QKoK4tGUZ4g1byHHuUCj0MWqs0LgGabAs46ovQI=;
        b=dlYkb6KR/UW9LKWC9ves9afbFubRq69qhTidO/jqnz4jxTfSKfbh0c8pdOBPUMEpjd
         ANM/SV4e+opVC47L+0JgEz619QAnnyNk+HM5bQiVQ9sLTiS/2numzUPog15MGLruP08o
         NHeFyHy2B6Tg4lMzXyZThDP5S6whqybd3Y5s17GiCIRjStBA4wvvtnqxsam48EOYqiMb
         EGPDR8xGGxync7uy7MAPEjmW/iak2U6qLYlfDXWw8kbrzQx44e4y6xNSxc0jad/yGvrl
         nR3j5hFOXzVAYSoGiFVPqllo4D7khBoN1tjlcbOwxptjbBkMfWgUx59k3j1Ti3cRt45o
         wftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262019; x=1762866819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQu9QKoK4tGUZ4g1byHHuUCj0MWqs0LgGabAs46ovQI=;
        b=Z5K6Y3MQSUxGKSp460883IuuO87qh+mOhW7MpsdD6/F1b3EkmhZelCA/vptu/UDxaD
         1NJmWymWEDveuXOVOfztFT9f6leBv8kxNVYBp0qo66x6xr15Vv4cuCSo8CLpZ7oUEb3o
         BTvE1JgcJjZtZv2ur4iGh/2dK3gxth6wle48dzvPCe7ELU0b9wnvcJjCf7Mase1jK5V3
         B6SA/eYvmUgKp6qoklbu6vZsPd/ffpeuLzdul7Si9zI2hlSrausGHYkb0NoiIhYTJHN7
         wHucqcfK9CBhA0hCO/I3A4b24adVOQs+5wNFeQHAAdYKDI39uFeipOdnFlCqm2jBiC92
         Uvkw==
X-Forwarded-Encrypted: i=1; AJvYcCWUi6bswLHgq5lPn0qZQyIbL6vQHt1tlggnBgY2IybzjSfgGirUV7tAXwrqeW0CCBAzaVG/Erjb3ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUY9BRQbArI40SGLod/WUwk82YTwqeNNjPsQmNUVyuyL/oFzE
	KgOMeRripxGcpxIoniG+AsjjBrgqeJiIA++GINkX1g3Bw1D2Wqs71Y5u
X-Gm-Gg: ASbGnctL7qNIV8pTs6jsp8gJaOlbAmpupFtChb4CMUDioc7voxeiysgVOaQkUrZHjXG
	GJInyqzEDRY2Qj3jAL/iy27fmOFMADAjoYIsAfx4aD1E6Wc6KBjBU6NKdraZdkPAxYBs6q8lsWP
	Q8CBdQYAkq6D/+nmQ58ANQO+dIz9wvrm+h4NWc11he69PTjwCEW6fGGohZuyLBB/J39Q+u1igSE
	gSauMIpdQfHxzfBKAXwyHE4AAEc5AJoohjuSJT7niv/1uiXHwX/LWZJWHIXLDLi0IeKq/vMP/fh
	P4fQ6oYmwaih9x2vUTOTqpWrh59knMl/pP7Q6l697Hg/V2qSsbN1Gk8ElyrNdH1YWVo1xIKSAZu
	F3eImARPMMRPPPjcFOOFv3sXiBF14IxTzMWNdHfcI71gyq5ErgDwa88h0rsy9J0LfHdLulvOMAb
	Hu
X-Google-Smtp-Source: AGHT+IHpp78yI4E7fmdg4RKErbV+vvTaqrD8H4+Tl6H9yDf3Xf2PrS+XAQqFQAashL3w1qH77cAnFQ==
X-Received: by 2002:a17:903:32c2:b0:295:5da6:6014 with SMTP id d9443c01a7336-2955da66415mr134706725ad.22.1762262018823;
        Tue, 04 Nov 2025 05:13:38 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-296019729b5sm26887345ad.10.2025.11.04.05.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 05:13:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 48956420A6A8; Tue, 04 Nov 2025 20:13:27 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Integrity <linux-integrity@vger.kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: tpm: tpm-security: Demote "Null Primary Key Certification in Userspace" section
Date: Tue,  4 Nov 2025 20:13:12 +0700
Message-ID: <20251104131312.23791-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=bagasdotme@gmail.com; h=from:subject; bh=zReFbCpQpq9hx7S5OuXnYnE+WALGscFOwncxZWVvVD4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmcv91Wn2n+Py0/tO3Haeca1lyzF8xGxueOf4uY+mTxt TshKpJWHaUsDGJcDLJiiiyTEvmaTu8yErnQvtYRZg4rE8gQBi5OAZhIWzDD/xCPHIYmWafsYBYr mejACZNcgm5f/TxP6+qB+8r/egznCDEyPJZj/BY664JLhHKtoetF1XUlqpLRncuTn5opS+tx3BN nAQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

The last section heading in TPM security docs is formatted as title
heading instead. As such, it shows up as TPM toctree entry. Demote it
to section heading as appropriate.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/security/tpm/tpm-security.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/tpm/tpm-security.rst b/Documentation/security/tpm/tpm-security.rst
index 4f633f2510336b..bf73bbe66db2fa 100644
--- a/Documentation/security/tpm/tpm-security.rst
+++ b/Documentation/security/tpm/tpm-security.rst
@@ -153,7 +153,7 @@ protect key sealing and parameter decryption to protect key unsealing
 and random number generation.
 
 Null Primary Key Certification in Userspace
-===========================================
+-------------------------------------------
 
 Every TPM comes shipped with a couple of X.509 certificates for the
 primary endorsement key.  This document assumes that the Elliptic

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

