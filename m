Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED3D327C0D
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 12:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766492165; cv=none; b=h6MLdSjVH1Ak58tUbqYOXvcXFPqWq+F/Fj+1xNTldE19yDWNFnuyHlh+n/GsZgntknd6Xfh7fWl+exojma03x4Zbu5Q3jIGo0AWbtUR2V3mm63H/WcyKddEOQMXHmEFpTgUIqPVJS5t3osc6lIp9/V1vzJVwMRbeirbNEkP3KhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766492165; c=relaxed/simple;
	bh=OGLmQSyOMsDoSAfsoCSwoHFdHX5YIQRFf2nOSW2RmGk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qef5EuSMXpZR6619KdsVELCgT45Lm894zxRmYfAC+X1OmA22lWRGdVku9+LinZCcp3t1H/iveeWaVWgF1rOSuqWur66G6fwIG0JwRGKNgpyLb2ZmmBVO9q7B6ZJlbjogpren4tAyZvNZQi5EhVknSe1ffwR8lQSFhwAn764UBB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8nuZ9y6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8nuZ9y6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0fe77d141so52948505ad.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 04:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766492163; x=1767096963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MC2Cy/XxfafRlttKtxBQRpcn1uT4eypNUG7Btr0pmc=;
        b=K8nuZ9y6g2mrj9Pjz4l1B7v/T1taxvF+nh/0EiqqLXOW/bOPAqGLc0vnKGbvieWyXF
         5hv1tcB2ugbnt7pT0nBVUqlDVjvQm3SFYOnb+nuhLbQ8kHYvn6Uqogb+01xVptfCU1Ve
         6k9+CaZn/YwPOU+CMA3s6ozVfhlLeXpy6cj4T1mlKb+uxVp1rqBNdPAypcWl0pzXKDLM
         HuOXW+avTlTH7+9t4KR7Y75cws2hCZ5bFYSd6zMmNpRP4VQAaSw2SLFBa00WJJdKa4+g
         lbr0Lp+FwO81mxxwxcWJ9I8ULxw0gDT86kEr9EMJ44YBGHsh9JL0x1StJ5GXtUOAH7Fg
         2T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766492163; x=1767096963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MC2Cy/XxfafRlttKtxBQRpcn1uT4eypNUG7Btr0pmc=;
        b=heOCr6j+ugdpQK8wXgnr/8XwoZpNdcYTYEsptqnCz86oZSPgtGvsV5CKPqWj68W6wE
         r7B2PHKWKNwabwjWRVrD80tJRgpnhcce3g39GISfPSqAhz6H7rTbv8oEQEHKf96kgZwn
         hLP8RYKIjV8a//RhWFrCH+06iTOlOguCHEFtHW+Ktjs+ufaoix2OHzjD8AMYcoA6xbJa
         hNC/m5n/GI3gtDxb4YmUgexC2SidULALeCZpaLw9ZFXbLo3Wk0/RHPDQdfILqzan5MUC
         8X387oqV2SbjFOZpomWTJd/zYFGAfY73Ia5MRt7N9wTwJUMdh41vR3tPVMa+Y/tIlBFF
         RgYA==
X-Gm-Message-State: AOJu0Ywt0W77Zgq8ReWbRxsZpWQDnd/Z3EYr/ps87deYE6dVqk3Wcc3w
	cPmSFi/pN/j36Sj1lWrKs16YIlfFH7Pvs8WVLgfyIbm3o3YwdwGVNymT
X-Gm-Gg: AY/fxX5dTd8izy2hjjE3lzcY8G+RXHC7klTpn+ankpr3bGwLgCUKRPZ84vMXoaMl0O/
	BQUBL6gaQmVe8Lc6tYq6DkEbtr1laHNtUdBakYikzLqDAEgzCIi3NVJ/8+roDu2JwO6c02a/k1C
	fz2DQcZmw2BH0AljE677EU5Tdlq6w6iX+l2+hotFWkU3s6E4fkw7ukw6bqIb3/33ip9F+86q9uB
	u/Y63iDUDpysLJgMC1VUWJ7LWDzobRZZfSnbrg8Bq1gGisy7MvCm6OueliwTd/5c8Doz7Uzznns
	pYp/nYnFLAEKmMDsry7EztPbQCW/bFV8NTvDBJF9Mo4mIbjncd8Ie+lB7ulnWMtUvBlru7KVYSi
	6jpMpivkG4KKV5xeoq0UdXfTYNwhA6Ik2LsMrdImXGQGNKf01d9S2hUu67oj90HLjgPI1rtxw6z
	IYantVANk4J0UvT9SHoikmCvqkBkqEgPNNxlhu
X-Google-Smtp-Source: AGHT+IH2z5nI5uKG7lcv+7cra9HeGui3TtKmWc1tXlLRbsFRZ+1dUNHMSq63ePV60a7YRtOr+KuQ+g==
X-Received: by 2002:a17:902:f641:b0:29d:73cc:c9e8 with SMTP id d9443c01a7336-2a2f221285cmr160421115ad.2.1766492163206;
        Tue, 23 Dec 2025 04:16:03 -0800 (PST)
Received: from LAPTOP-T7JN4DDU.bbrouter ([117.208.21.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d428sm125624285ad.73.2025.12.23.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:16:02 -0800 (PST)
From: Vishal Singh <vishalrajput96156@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vishal Singh <vishalrajput96156@gmail.com>
Subject: [PATCH] docs: conf.py: drop stale FIXME about pdf index size
Date: Tue, 23 Dec 2025 17:45:43 +0530
Message-Id: <20251223121543.401133-1-vishalrajput96156@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment describes intentional behavior and does not indicate
unfinished work. Remove the FIXME marker and keep it as a normal
explanatory comment.

Signed-off-by: Vishal Singh <vishalrajput96156@gmail.com>
---
 Documentation/conf.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276..7e0817469e86 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -572,9 +572,8 @@ epub_exclude_files = ["search.html"]
 #
 # See the Sphinx chapter of https://ralsina.me/static/manual.pdf
 #
-# FIXME: Do not add the index file here; the result will be too big. Adding
-# multiple PDF files here actually tries to get the cross-referencing right
-# *between* PDF files.
+# Do not add the index file here; the result would be too big. Adding multiple
+# PDF files here tries to keep cross-referencing correct *between* PDF files.
 pdf_documents = [
     ("kernel-documentation", "Kernel", "Kernel", "J. Random Bozo"),
 ]
-- 
2.34.1

