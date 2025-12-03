Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C699C2FFFAB
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785569; cv=none; b=fjURcRQPMnQ0hz8FIHIuDsOP6VCMAcnANquZmMoZfYFBjAWsP7ksGdpyGG4SJK2nnRpUWrUA+ihwrUPHtqRd4kFvHta1/GAzcPkLRQsM9G7oLij6zn9BsRNiAQGZysvfH9uoePiNU3nFuQHWta6rmxO+2TNMC5APJQ0HURDhsJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785569; c=relaxed/simple;
	bh=dq7F0uo55KGJeoowbZ9mn+/+bBkR9BMF4bPhrTA5kps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NRM8YFqB3ieNqH7BvE+fVFW1wDMf/zdGd/qPLzL/CcU9qlCwv0HmZt/D1IIcBK9NlY/lXrUYmRiRDnimLYeneES81DEwQDZ0DmQQrLPxJ/4N5/zp5cq09f/mTjpDxLSphnz6f1syh02jIgvN6F0xBklJs7fEoe2OSrqbUSJbl9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDAjMeUM; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDAjMeUM"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3418ad69672so4622326a91.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764785567; x=1765390367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=WDAjMeUMyAI8FioQ36n66Wm7NrXpgpR7WdLcTUDmRd9HCTXZ4spgDF5LjMTy8/KoI7
         S3zveGHwJN3rP+uQdO1S62KDoi60qzmL/CX2xNo2/wzUO6jWVLh+aEk6JJxMbBkjVCs2
         xhr5Dwz7A1j9MHqWkte/13rKWI/+GXcuynprfuJnk9JpAq/4FR5cthCVD1DfBQnBI5nU
         XOfBiLTNEK0en3Bgs370/jGki2pRY3qLIRw+323PDC8znb++mKnAxD5zqB9ShIj0EqFF
         HsTqglGZxWxs7k+wdndeziLgGfPekzQ4KBhh+Yp0l/GJ4SLzeenK3iD+LvITn4JRyv4b
         n8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785567; x=1765390367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=EZkjJSEjSdb1jjrt4+tXGSz61DAsle/PP2/fjgUtQ9e6SFPAO4t51MGujuofIuh9yK
         uCPay1ndZeWkUERTTtMHnUMMiw+0hH9SiUoIxURgszAlpVoEe59cB2UD8UYg4q1YgkKI
         ZI6C6q8Z79BXYY8CGLBIBmFNWKG/6sGFYVRv9NOf+XWuH7s4vZ781TwCobGDoPxAfyVs
         bnxcgwG9q8P6YpMobjNUdfmZsM44iyX5zjhU+XSB5U+YNSKizYrfFRfgxdkDsPRgjpzi
         AGiTuyfHwZqodti+B0ap7+jyN4dd9EMvmHd3FIDMWcdFbpTW50gTlkjwZiKksgSbt+f1
         XlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpqQ5RPVFU1el5060SZ0PtpINhLfijjpg2+y6OtjE4hjQJxjaTLtfmVjD4uWcLP04VhgGwV6t/hWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXj0f5mQvpOjSYGmYXFsQJZpua5Qq1YDd2LSjJNnw2vT+Xeh96
	q7aOijS9C0VB/UYwMichOvnskBoM+AEda8ZiydiJOem08rxddRkyURDC
X-Gm-Gg: ASbGncviyF1/SnFd0nN0yK0OkEEeJbScmRemMDmlp/OrhmowgefUsXWoru7z/GHaE/R
	nMDcgaESe5VrixtZ5NYW8xpU9oco2OUUxNhmOgFVRwkjJQoc8qQeGf/DmEXuMkFE1G/yZadhS5p
	facz8VflYsocIP9NxdXk8YMo9WS+Itw/oB0l6n9bQE3gHFSee+11h56rEIpay0dB/zzvYnFuFW1
	A1PDfLiMTzu7ijmV3OBqzehwZvhtBBZ5y3D9hT1EpdveeZhmVjNl7O+cFH3aZa2M4nc79XrL/BY
	OGWPyXrf7+fnMugghk4KYLzu+fppRM0/LRDvzILMyAL4U8a2knDKYn9lFXQHf7bU2KTitIevnVa
	iPEYVm4crreETp9jiPbKtHF34LvUWPx1HWdof6WKJBACJ1arNzSnS8g9qrf7S5QqVkus0+mwzOZ
	S08xneWyXbZKArQuiRFqU=
X-Google-Smtp-Source: AGHT+IGZrryg5z3Z/u/8JFpgB0WolHytle+7b50MsN8Rhr9Rq03qsmx+6dhKqLkzgC6AajyFnVhnjw==
X-Received: by 2002:a17:90b:2d47:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-349124f6c2emr3577411a91.0.1764785567109;
        Wed, 03 Dec 2025 10:12:47 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910bf9fd1sm3475565a91.13.2025.12.03.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:12:46 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762 binding
Date: Wed,  3 Dec 2025 23:42:13 +0530
Message-Id: <20251203181213.51618-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'g762.txt' was replaced by a DT schema in
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

Update the reference to point to the new YAML binding:
    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
- Use proper commit SHA reference syntax

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
2.34.1

