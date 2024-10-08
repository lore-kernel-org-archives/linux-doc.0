Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3714C1D90A9
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728371841; cv=none; b=bID7vBSUmg/+ffX4a+l2EnoF80zZeWGH/avU7g5b0BPWQDsH+ww/IL+TEaCGeL17lHhyo//aQA8Rz66ECk+EXHmjxH/UfBXN1QKw0K4D0isrxs+8Q+roGtQ2TqzwY+G07wyA2PJed4aDe8EqUyHPQv2zTse+E7ZE0S7X67rfI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728371841; c=relaxed/simple;
	bh=/IbPserPXJa1bMDNzcpey2MsSiGwUivhhrPZ/JfO9dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJbmoAGo+IEyEYKrc4ci0JJ9U5E642rqCtzxku55vpxeK6s7o6IEl1hLTbKabXYqgzdDjHXlD0uYHPf/F4y+dxw7zu4ZFPnm6OIhXUlEBHXEfK6zM/YzCaKPrquYxfv+GIRr22uogAHuvjLhYOiw3jytRaiudMV7gt0QjzaeLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=SXUz4QNl reason="signature verification failed"; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="SXUz4QNl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e029efecdso1562160b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 00:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728371836; x=1728976636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f01doXKW6VFqsZ9MOvvcKDX1KhWLQSKuPO/rCisrRcY=;
        b=SXUz4QNlRZv35Hg1fCJeppBfUO4GYxuADIRAtbI+p2j89whTCrVZ2qMLSj1+58DtX1
         9NTNqIt5SWi9i4+oOUlnTHvxg4pPPvKnKGkcHTppFMh6K6tMHauI2FXKvgB9GM+Jz1qp
         7L8QmwgCIX6UFPCLveMH3BP2rVBcoV1UK1Gg3t5QdzJjF04uPq2XHiEchf1P2yZLOEAg
         lGtbPQrhFl6zsDPS0d6iBvn0Zm76pOdYQ33hBNJGUaohV89OO18gf20icT6jUQKhoW68
         gF8HS8Qi49K6RFmuklsdKK7bDYAI0qhmZaCh8lQrNQV/qDAslhUYtx+hVV7MOCsi8Pij
         K98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728371836; x=1728976636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f01doXKW6VFqsZ9MOvvcKDX1KhWLQSKuPO/rCisrRcY=;
        b=Uy1JVdr7I1f8e17plt64THYmFOmw3njFztYKP050z2wPL60hQJWm4fNWqDr7XG66K9
         yyzrLmaSctF6P/d7x6WgGW4ZFWGURva6KgK4zfOMILFgYcI4aoQQjM64UbThavJejUXO
         NtKtVpqmO+h4wqdRoVhJ7S/tFQoBWCegZpM0lUzvEs2kbSA//qjrwdR4gC8a9y38DEBs
         eXWPtqkw1vKNjdXN8hgg1f+aS1tr60RLKu30Gftb4P+xwottOPuPIwZ13wVeQnRFl0Gj
         7LQdYnl9hPN8YpROo42PkPLGCja3plhEBBfPipumNlgHwwskGNtqEZrR5ZmD85ui/BL5
         hcEw==
X-Forwarded-Encrypted: i=1; AJvYcCUwbrbjC7OdelqnvpOqLfP9WJZPrr8Pyg9jc2tBfRH3F1RMIeXM91llr8BbOEwmxjArD072I0gSgi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZM07zbC0/KkXvGF0Np8Ox/RyYzJcsXcneqwPE0LTnbp7d57iz
	Iy9G1SM6azpVOddUUKYECuUQ9uiAppuFWOBV1WZ7DJm5CU4i6NUrMCfLv2ZcFxo=
X-Google-Smtp-Source: AGHT+IEUDv9nt+vKX0Q/pnMHLEKmwOXUvnewz9lr9/wo/hLdaw/xgTmRckwI+bGaNzPWcVxI+fAWWw==
X-Received: by 2002:a05:6a00:2289:b0:71e:117d:b12e with SMTP id d2e1a72fcca58-71e117db5demr2405190b3a.9.1728371836414;
        Tue, 08 Oct 2024 00:17:16 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.195])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7e9f682d368sm6107758a12.43.2024.10.08.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:17:15 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: Fix spelling error in remoteproc.rst
Date: Tue,  8 Oct 2024 01:15:57 -0600
Message-ID: <20241008071559.18523-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following spelling error reported by codespell
was fixed:
	implementors ==> implementers

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 Documentation/staging/remoteproc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index 348ee7e508ac..5c226fa076d6 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -104,7 +104,7 @@ Typical usage
 	rproc_shutdown(my_rproc);
   }
 
-API for implementors
+API for implementers
 ====================
 
 ::
-- 
2.43.0

