Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87438061F
	for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711144345; cv=none; b=ipUN2aP7+gKowFeZ4hsjfarNjjBD5VogA30wHYytc1ixgfH18aMb38KzmXsrcCseoPE8N9INkCeExf0eXRxjoyM8VRWuGIjO0bw6pt1yjzkLbKbcEQmh58vkstd/wASEzs58l21tp4XZ39nmMp9hitbVg0P2Q5VJ0EWG04mMZvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711144345; c=relaxed/simple;
	bh=jYLrs9FzuD/uXocxQfXfUA+/zRjYUAxdEYngmXiXnyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQxX5/8Nb1DMNMaJVUyQdJjoACfXwKDoOXS1+/2AQYIW6Y3419ier+hXDKRxhSBgm6Nc5TOWwg6n5ArPEJ/PjIjqMjY1gnfAbWQ4emgd/HrvJJq3YuzxmyDXFn5QMJzAWLY/Jx/GXlAhEPSOJHH2EYmB+VN7HnkltqKUyw16Kv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qGfcP3pd; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qGfcP3pd"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bd72353d9fso1464911b6e.3
        for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2024 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711144342; x=1711749142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CLFi25Vmi0M7L3CTPnrBRviDBPZHtDLMk3xJ3WKq50=;
        b=qGfcP3pdGzPbVUM6MX5aqub9ODSGWjOLNM7B90eT6jj40PCXGffzYtRh7LmMlMt+gS
         LrU+2kJVL0khCEJny/iBdM8z8MoR9ctF3u/+LHxoUgG5UCMrdvQpBjKngOn045MpbNJY
         RF0I6T64nkxW8KlnjLrF6hlLhrThUTvQTQVcRJV8eaSFTbCuXtWmxUX2jr5TVp10qJdB
         UFOoRgC1ShAAfqmgfM3ENcfuEI3QhYlGGCPuWHUZlZw3Kx+4tls6MS/VX9Z73QcTKMm9
         N9m+nDKPv6mloQ8/RMh09ushB/QNIf7kjIaDEovWRs2wqCsJAYe5rlAGGCEKtDwBcIYZ
         AbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711144342; x=1711749142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CLFi25Vmi0M7L3CTPnrBRviDBPZHtDLMk3xJ3WKq50=;
        b=cTsYAynRSaqeWbmXPUCAx/numYvjx+v1H981VCh9XsQjJOvoRIyF3V3zwJS8eLL5OD
         jyf+2lK245Byv8naAtobxGqKYCFp5L8K5IRpEwJOSr4qOr9pOU/ZylOznRD2y0YgeCUn
         DzkGPfSA8D2Jv078d7xTn6BVaDBfsqdjEwa1tfCZ6QtNRfHLx5ng2ywbhC5tklXuSoJl
         7jfi59REGx85xbEFVKz2/NHPW8FZS/M/nC8QereFVn+uHats5/vU4Hpb07x4Du779iC6
         mMCO/m+1TH5MDjuMH/bAkByPAEBoIhtsInBxMBvFmAYlEOF6Ywa1R5ci8iCcumYzpLpz
         5Niw==
X-Forwarded-Encrypted: i=1; AJvYcCUiE16BQbIczmiWOolLg7YxheSw+0zG+24Uj6ip6rnt7YGB/pIhgmTrxZOyZJNeMS96yWy2LMNO6SmWvTduQagRLxyHS2eR9tNH
X-Gm-Message-State: AOJu0YyA6TSQncaJH/kGq+0yyhhWKRKUuK9Ngd6Gsm1bNRCC8bsEJFoK
	NaCgXCjGpMTvf696ZnuYM0RCxXA212Xf2ra3mDcXarOp9+srE4NNRA6mhbybJnk=
X-Google-Smtp-Source: AGHT+IEhahZJfwf604IZtu7lbi/ax/6vF+wMAUo1Iyn5jinQ4p2xQd4Vs3Su3pPg/PcBO2WOIiErLw==
X-Received: by 2002:a05:6808:3c98:b0:3c3:9949:b457 with SMTP id gs24-20020a0568083c9800b003c39949b457mr1256083oib.22.1711144342078;
        Fri, 22 Mar 2024 14:52:22 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id x20-20020a544014000000b003c37b3571d3sm88254oie.8.2024.03.22.14.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 14:52:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] MAINTAINERS: add Documentation/iio/ to IIO subsystem
Date: Fri, 22 Mar 2024 16:52:13 -0500
Message-ID: <20240322-mainline-ad7944-doc-v2-1-0923d35d5596@baylibre.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322-mainline-ad7944-doc-v2-0-0923d35d5596@baylibre.com>
References: <20240322-mainline-ad7944-doc-v2-0-0923d35d5596@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

Patches touching the IIO subsystem documentation should also be sent to
the IIO mailing list.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7b1a6f2d0c9c..fb2377bad376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10466,6 +10466,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
 F:	Documentation/ABI/testing/configfs-iio*
 F:	Documentation/ABI/testing/sysfs-bus-iio*
 F:	Documentation/devicetree/bindings/iio/
+F:	Documentation/iio/
 F:	drivers/iio/
 F:	drivers/staging/iio/
 F:	include/dt-bindings/iio/

-- 
2.43.2

