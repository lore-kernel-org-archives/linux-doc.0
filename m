Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3711B9B2D
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723657699; cv=none; b=trhItHaIz+s9/Ab6Zh96m5dXtLf4/oY3uNBk9dWYKUDN3zi4hRtNy+wrPqektN4l/J7yi/pmWN9ikdJfBW6NYm4D+kySqNdcV10e9ncItS1ipcC8U5MhvM1YiFxJ0fHvq4Qq3yIUzAiTn0lNykgeVyVYAcunlpd9GRZG0gglBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723657699; c=relaxed/simple;
	bh=I0q+hPjJFQPFw/7xMpBPGRI9GSR/XnF04oBYiCm3Esk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AfHZdt0/4/tgtmjRufV1rGXg/VvSMn1/UL1p8ypOnurCMPGaVEVKd03rI4CCbLW2eWArCPD7gBMT/r8mPNy7d+cse8NEbCHDipvfuZj8qJWikoacOIFgQhgTNHvwnDnW+q9UbScHx4nWpUyIE48esETLxoPNdkOt8sMQcJtxdSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2ZLJJr/; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2ZLJJr/"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7094468d392so59251a34.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 10:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723657697; x=1724262497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqbPHwcB9FwXLops87ZQEDiiS6X0e1o/bVoiwi0c1Sw=;
        b=L2ZLJJr/1sLZWeIkTkDeRz+KrlO5BHTQy2aZ7pPkCfJ6lf35DwAHet7Eqn+YzizmZu
         mtivULRVMblZ0IoE5hYfudL78AL2LEXMZnS+5wmcc0WMrpuuOHZgUkMdAo8mfxI108AJ
         4K0B51NsiEO6TH0EU9beYo6RKJxKWL9HmxEXziHZyD+jq01M8sx3XZuGHAmLg8uH5eER
         qUDF4vMiHIHOcWmG3bzH3hoPFketBFARhpe2DArXt6ZMAx3Le5xvXiVqJ+DcenTLbi7D
         uuVGaJM91vfI77t/QbRiQIE0ZJpBfPGci7aGQv810SSeJk1sKaG7yUSWxtD2ECknNZfR
         t6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723657697; x=1724262497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqbPHwcB9FwXLops87ZQEDiiS6X0e1o/bVoiwi0c1Sw=;
        b=BiazHGlwCc4hanfe2miicvFRkREIDFjBoAFhqwlw7Cz0VM34f0uI0/N/tIKO2ajusX
         PvBbCik1YkSAokF/ApgSLBprENl/wvV5kJA6Rq+r+EdhjwsvH1nW1h0hietRhLNJ8GPo
         EQIZZvo5GCOGN6n272/7sWSgOpqa7IOCcz9B5V1+x2oPYHyTNzlPTOwffpYH8WRUc+/0
         Pnj3X67b9F4PTJeVUcTVmOtqDM/T84nV4FAVpt3s7090f4cCxdbcfqQIyOq3aWyy4Z9t
         8KGs2gjcMBquNO6ezcRH9DZVdbVVHdw4xwsId7Fj5CnUj532KDTxZmMNyXzAEIzSySzv
         /DeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWobdwNfaxlOGOsJwXiDqPnybpFdsISCO7d4vg5ThW+7PL0hwfxHqjcQQ8oeZnHNx+ZiBssFxnxgcJhiyMSfgXq5p5ZjWUs2kCm
X-Gm-Message-State: AOJu0YzX/f5/I6kEg5ytV62XUjquFQHBKknJhZVmV4gaTuq9DRHjPUI8
	b3XDf/Vh1wiVS2DyUnddtNT/cEV3gBBMU2IskfbbKrv84sPdFi9G
X-Google-Smtp-Source: AGHT+IEsrGqlWyV74T1sPq3DeKe4yW2wn02CrmPPea5WlxKLT+tDXQw4H/H07Ae7kpr58ShOEK8hMg==
X-Received: by 2002:a05:6830:43a9:b0:703:6aa3:d091 with SMTP id 46e09a7af769-70c9d955a21mr4813776a34.2.1723657696732;
        Wed, 14 Aug 2024 10:48:16 -0700 (PDT)
Received: from localhost.localdomain (183.252.23.34.bc.googleusercontent.com. [34.23.252.183])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70c7b89c058sm2295637a34.79.2024.08.14.10.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 10:48:16 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Eslam Khafagy <eslam.medhat1993@gmail.com>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: dm-crypt: fix Unexpected indentation error.
Date: Wed, 14 Aug 2024 17:48:12 +0000
Message-Id: <20240814174812.3695813-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240810211557.42874-1-eslam.medhat1993@gmail.com>
References: <20240810211557.42874-1-eslam.medhat1993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation error at Documentation/admin-guide/device-mapper/
dm-crypt.rst when compiling the documentation.

As per sphinx documentation: Nested lists must be separated
from the parent list items by blank lines

to reproduce:
	just run "make htmldocs"
observed error:
	Documentation/admin-guide/device-mapper/dm-crypt.rst:167: ERROR:
	Unexpected indentation.

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-crypt.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
index e625830d335e..dc6ded632b22 100644
--- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
@@ -164,6 +164,7 @@ iv_large_sectors
 Module parameters::
 max_read_size
 max_write_size
+   
    Maximum size of read or write requests. When a request larger than this size
    is received, dm-crypt will split the request. The splitting improves
    concurrency (the split requests could be encrypted in parallel by multiple
-- 
2.25.1

