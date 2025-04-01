Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DA21D3F9
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547845; cv=none; b=RjD2zNf6T+Ldp9OemD3ZayGgmYivqk8rB9zvyT/TH4QBqjJPo5k1oehF2u6asErrcja3QugyBZ/+GWm7b/59Ms3SqqkY1e7u/3vuNcFV7cMDTgqPNBoZhzLhSvecIfDsGhT56VwTaQkvVvUmtK1z3PdhuKKu2zmlXwclY+ROcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547845; c=relaxed/simple;
	bh=l4ovhFo/GzqCAr/tJep6ZW+QzYV4DEuHtmNsouGPBYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4dyV+swf5F8a7IYboHGlZbzJSH1/6HfsjAqUMFcFiIAEHQMQoXyBbRxq/BRWJs5SVj6wo+D/oZ39s+LfnfJko/JOlZr/f+kA0wLYY52k8VG3FjgQWu4ZZ1fZ/2AKoqw6tUaPD5778CXGCNDlzq0yj33lq4+9Ro6bSAAsXDpvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ftxaf8Fu; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ftxaf8Fu"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2b3680e548aso168053fac.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547842; x=1744152642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBCDwaIxUQd/u+f/hpgM4pDWmpkYUglr1PKpMsLAoic=;
        b=Ftxaf8FuQ49cmFyUjyzNc5t9IR71aC6bJ+k/VcsagAtpUWDOLkx22ArEGiEug6CHAP
         dEywpVTsvC5ElTsFqHrlGwbTOYM5OKi8Et+1hgqwqrtg09NKWF5Ei+cAXNoLYCFMkeS8
         sV7YPT/qCWpf5gZU8PyuzoKE5/na7+ZEcIoTtatTfF3rBGXENK/VeBk5RPkxdkzooRFZ
         EcoM/H52az8JHBUVaaEdNWSvXLjmdgszFonU3Xp2lAuk2kY82VmdFX1HbejBHZuiMSaV
         DKukjbYUT0ImLHhQSumUQJ0qn/2DbNrI674DG29Tnv/ZpVKDTz+lZpTouvsqxdKhNQV1
         a8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547842; x=1744152642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBCDwaIxUQd/u+f/hpgM4pDWmpkYUglr1PKpMsLAoic=;
        b=SKq7AmjQkPTWHGw+jrtK1bDtxllxApA4aksz1k9zJPl29VZBBvZts57O/pvod3r6H2
         Kq28wy+Qsu+PtOyGisXSc9GTcD8sns96NQi/0wGG7sfPQTzBsvOvkwS1fdBRB2SHFfRQ
         toUFP/ezGypqZZ9EGjGh7xDebuqYjU86lZkL4P0yTrGOUzEUOnk4VVgLwn/D48cAg+/d
         ao8DBw3F0joaQeSVdIDDFKNh82a01PkkrS/t7gdEVT5PYUiPqSrSnZrME4UWg1otRA8x
         Da6dWVAfOscCoO1MEJKNOLpBb1YfZ5YmF/5UNktpG5DXX1BRZDqJJyEVk2GemJ3Cy6gU
         xyNg==
X-Forwarded-Encrypted: i=1; AJvYcCVSk6sX7HCG/01eRkYEG2BhoV7A8bQ9Rc3lBUnP1HV5PNmbPjgWtzVGGpI2c3p3MgAj15jh71HPJxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnaI0X4KyUcD+fTxENV8VtA9W5e+eO7d4QwssdXlVDuYJw6VF
	kTNdwVB6VaUK9HNPHTn+NL8in5yJVlr7FDFW/lFe+3RFi0aYFh2rgZxBH86GcBo=
X-Gm-Gg: ASbGncs8WA0tZBaA40zpj1gjZSOBa4e0Hs725QPwFGoscFgJ8I/H5u5OC9ZOVIwVC6K
	d+eg0iyssu7WNXkoD2fLKveMQHfgag00wOkfM2fbCe1ZpB+UTJhemmIXczj34iFcQOAfKbdLB0c
	WVbCZSJ6uA8hI4TTV+lxXgfx8zYlnUEOIECTurYAHfcOeYQSfw50XlkisNepxd2xDjjdfPkYjIM
	hWB82CEe8k7A5aOMDjMiwXVN00Lq1mmCG9/ghLR/QilpUqJ+PEWrE/NrmgRv1bbnZqP7FAcLwxi
	tvqfzNk8F+vRkr4vr2aQA1pBkO106+Ia8cOLFM+/juc3lsM5I+M/iEkHYVRuvjSINlDtaoAyR3k
	6
X-Google-Smtp-Source: AGHT+IG0RQHyDvXPFu8JV/9+WZdcEeqrgyW20fSgLeCJLHlRPKjnuoZzwGLndZZ6UfK8jDOTJsiFtA==
X-Received: by 2002:a05:6871:aa0f:b0:2bd:607c:c804 with SMTP id 586e51a60fabf-2cc54fd24femr1065837fac.6.1743547842472;
        Tue, 01 Apr 2025 15:50:42 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:12 -0500
Subject: [PATCH 5/5] Documentation: iio: ad7380: add AD7389-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-5-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=l4ovhFo/GzqCAr/tJep6ZW+QzYV4DEuHtmNsouGPBYY=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23WMhCW7TbNSZvazzPiomXbl09MZazclNtB
 fCYnNnM1zSJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAOq2g/+OjQ17WKD87fY99tB+cemDltxMECfTBSuDgl8osf
 /FWPmdyiaR/AWO5B9bC1JRXevV31aslR861AdpEmjzcUEEYwJaUfce7VnRFrTDB7wfz6/4m+oFA
 RojezRzqmUPMZjtSUhRELY6O9N9NHA3c0Im8959uL1N3RlCV4eFX6Rxv3U0I21OYTN7kutRcyqM
 DH7j1P6wFnBD86mVNukSIAPgy9l4iIOpfzg9Kr8B2I5GBUItHXh9YrCcKaQah3usts0UDSGNtz2
 CJPOsdBJa3ccu2dlzBp81K5sL8EoavDVJYHgen3fowvsw6ypXqFw4C6N6KDmEdAXRYlnnEeQo1c
 zxz1lbFaoE7Cfnm9gZ/x8Sktwliobva92+S/ZEzUJhLMVXCo43STxd0n0iEP5mdsZZQVpIeeI3W
 JPYj4VNKj5yZILUTA+Rf3Bq1/YfKgG1E9E+OeFUCB2Qy+3HnRGmMed2lj8HJ5fqpg9ytDGjvgMl
 j4AOGGmmTZZ50cJxSqBji2uq3rRqetlqzAV3tmHQl/CjyfIfr8CgLhjCLdKGWaUSnptxazRP+Hu
 oywwWA2266i+1QH3rf+nOpP6vMGZhg1dbvPemWc7vVsEwX2y/+oSZDF8ZAKipXsluVNwrzUoJnr
 qGzVhyUpoFvcU0b9VcXDGokYp7hDHe1loXC+alFkhkz8=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Document support for AD7389-4 and it's quirks.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/iio/ad7380.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index 24a92a1c4371db6b59ef47edf06cee860641ebbf..d51f9ee3e939c9d33515ce79701fc7c89f5094f2 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -27,6 +27,7 @@ The following chips are supported by this driver:
 * `AD7386-4 <https://www.analog.com/en/products/ad7386-4.html>`_
 * `AD7387-4 <https://www.analog.com/en/products/ad7387-4.html>`_
 * `AD7388-4 <https://www.analog.com/en/products/ad7388-4.html>`_
+* `AD7389-4 <https://www.analog.com/en/products/ad7389-4.html>`_
 * `ADAQ4370-4 <https://www.analog.com/en/products/adaq4370-4.html>`_
 * `ADAQ4380-4 <https://www.analog.com/en/products/adaq4380-4.html>`_
 * `ADAQ4381-4 <https://www.analog.com/en/products/adaq4381-4.html>`_
@@ -50,6 +51,12 @@ ad7380-4
 ad7380-4 supports only an external reference voltage (2.5V to 3.3V). It must be
 declared in the device tree as ``refin-supply``.
 
+ad7389-4
+~~~~~~~~
+
+ad7389-4 supports only an internal reference voltage. ``refin-supply`` and
+``refio-supply`` properties are both omitted in this case.
+
 ADAQ devices
 ~~~~~~~~~~~~
 

-- 
2.43.0

