Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441122FE052
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972080; cv=none; b=o+stfxVdgmlyCyc0YpYkRDCytrfJbg4K2xYd5SNJsP2zIeS0im048LtHZb2/BbMSEnI6ksInlIQjWyN9dmSRtYfMKQDwdN1gboVgyCrJmEI8u7KM6BUO989bAtttdmtTPDPQN/cF/Pabfuj7gX5/4mszLv0WygQocoF7k1DZ4UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972080; c=relaxed/simple;
	bh=ETCxKe1lxZb3SWQ8fUOsUO737vubyIrWUWj25O2D/t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AxacfbA/eezz54TSsE+3/sv8I7qvxIITnB94HyyjT/7ty1irH8+4ysqLneyQWt476+yNy7toEagHgLoEHGtIe67aK/HXH74KZVT2wbPb9filqr9og6XGK0QuzOTAINtXdViSca1J5Vg/orTnT2DwS0kzHv/tjUF3ugEDaPZO0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UROvUfIn; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UROvUfIn"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-298144fb9bcso28127465ad.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 14:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764972077; x=1765576877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxMNtySUxAzv/peSNoqoAdUNMoJGxwk+RXdpqiXVMbs=;
        b=UROvUfInTvuS00NH7IQ7TBwLYJNTH+AYTrtsKLVh2tuS2nByZD6N1L8tY9Bmj8e81K
         6DQaErku3kuO3Misp+fSGbTRorCccW3j9sIbkBetEdHZb81C+Q784aB6EQytxejouIWi
         HYgJUI62g1zxMlAwAy6RYYscSTbVUopkUlZYbiALMBUkbYSp0HBeS9I16u4iF/ywHZI5
         fFnpsjh0pgHIrujBOmTLHvj+mh8geuKx074QMOORyE3tA37YPjDh9+1yuMZwh1YTjWXx
         CbREveIk5ZnNL31+VRseOEeAlSsVPhe9C3D939b6rKXX53GL5BUO1lF+JAKGZo1cdcot
         tqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764972077; x=1765576877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxMNtySUxAzv/peSNoqoAdUNMoJGxwk+RXdpqiXVMbs=;
        b=WbH/Ks434tQXWhLxZY5TevpSSaJFGIbe1OZy6/mG1cHxGQ7C7K9zNAaMLVq6mADVoD
         Ghe4GKHOElPO9zjBk4inxMvU7fQ7ELldmVy4Yo4+8j+597Mq6fRVOLhf1mc596UqpL41
         1E5idBAQ+5YAnQ0dfQNuNeL6pVmkFxmCizI1Ov5K9F/PzEetTsp4/WmVUeqwNUaFKbI8
         rgkPeVhzn6JV5OTM/d0JJ4/iNLWMMKnDoAaQ4MMnF+SQ3FVeYE8iRcT6l5rXebBaF6NK
         lZ8K8jIYQEf83xrW3ccj3DiZkd5NtzvNew5P4N9e76LeTuEgAqyqzkijLXkgPtydl/OF
         Yn6A==
X-Forwarded-Encrypted: i=1; AJvYcCWtmXi5ZBEOl0+1iIXl/F9i/ZqaSVJD6Jf+DGqywsmWfTEUxld+xwGYaB1uphlj9iuvWTrukS9Yuto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu62wrLe1Lmru1VJFZU9wESuErYbV0IXroRu2yb4+Je840INqI
	/8AB4EdJpT3T5q6GuhggVnCKFmwLEK6SS0LhlAnMQKEutcXmoLhuj+tN
X-Gm-Gg: ASbGncv5v5iMco+cH/bk/TUWj0AfqXakOZKDBQcySblDiUPqkl5qr0gZGPmrVHno+6a
	c1xQSYxYwlFscytH4G0YscOgsF1imBDGrpVo4GNJUnInorTDbGKLh8Y/SnFEjVNCc/AqqjfyFAt
	mIyzsTy5zJ+D3mQaj38RDyefU3EEMdkiIrjCkb39t5/CcFP3XFkEpGH6+HJ6HQ3P+l24w6wfrqY
	ozyc+c2FDQRVgXNF96ArH7ZNzwG557gTG1se7Doee0Tg6a7uCzjICcKuGARjSY4cCHoi7K9seAF
	L7tIT73qig3ZGIJBkSg6X78PzR3u8mKCRd23t7vMuwMbvk8rs0prLDDxzFlepGZYWyQsQQs045l
	E5anVo64uTQtRKVPf3kvGA5p8zxLyE4XSjOfaWoUrsDydNMzv/o4XvBPWZgmPPA8QRPWosO0hmj
	d+DIasbCDb/wL8ZHxEz2PIwEg+SaYmRalEQ22IrX8vFg==
X-Google-Smtp-Source: AGHT+IGuOUvLgEAYpZGh7Yc9kXE5Hzc4SXMEcfBaOSNY5QhZCDw3zlp+SMdkrWi0ruau8RBeB/xrKg==
X-Received: by 2002:a17:90b:5388:b0:340:d578:f298 with SMTP id 98e67ed59e1d1-349a25c2e2emr417620a91.8.1764972077160;
        Fri, 05 Dec 2025 14:01:17 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:8839:f626:f539:b6d1:1913:1426])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d175bdsm3851020a91.11.2025.12.05.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 14:01:16 -0800 (PST)
Received: (nullmailer pid 783287 invoked by uid 1000);
	Fri, 05 Dec 2025 21:58:37 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: linux@roeck-us.net, corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, shuah@kernel.org, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, katharasasikumar007@gmail.com
Subject: [PATCH] docs: hwmon: fix link to g762 devicetree binding
Date: Fri,  5 Dec 2025 21:58:35 +0000
Message-ID: <20251205215835.783273-1-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devicetree binding for g762 was converted to YAML to match vendor
prefix conventions. Update the reference accordingly.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
---
 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.51.0

