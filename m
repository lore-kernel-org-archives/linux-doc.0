Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EC24469B
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349408; cv=none; b=tRVmARXk7R1nXonSm49xygHfqgZPqkuAp6Htm0gmHxlcNB5UX8334TaEff3SSDJTPz9mNO7Ex57I6SPJ6fBEw+TxGu2hzNYrPvULtxCny7yMKHkj80hTFfp05IQWSNIUVmA0SRpu1LmI+0DCzyne+pTV/f4c4pGHXV4YgdmcFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349408; c=relaxed/simple;
	bh=EGmxIR9kKOSX51N1HxGcneN2hhaHwAGf1JsXcHdoHVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEpJi2C7bw4pRem//f8OrdrqoEizZHaMFO5qTjSdd8ziMMylQBaJbLmXgU38F9AFV1kx1qJ8XTdBtxyRZJh6u+6KsjuLqupDsWWFjJHYlLIHRuHnTJeUqlnPVY82vYaI9swgRA/w/2o7Gh1Ims/LArQRwyUViw+3MsmNhn24BHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4i8Uarc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4i8Uarc"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso2673304a12.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760349406; x=1760954206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJifNO/MlvLEol8h2cpUsahhKb87GytRbrPHmHhE5dM=;
        b=H4i8Uarc6bjN2gVX5qLBjCa0nVGVJQckdrm56FA3S5nghxdBjfny01RXcuz0eA7Kp9
         X/+QQmMZDkAI00aQCqkx/EuFp0AYIWHE5yHFAV2EOlKG7/EoTiUbR+AiA+1elktykWxR
         iNq0Icotv2fpyg9xPsrjT6uutm1uHFZtZnu+5is3kXq61WCRmvIQCtBCO2ekcVw7B/dy
         B5v/AzPQd3MhlKgB6alWIj9iYpcQOw+M1FMAZZLMlKp4av4DYBpmCURMpdGag7vljfLk
         WgrBGl5vDVHISvG3qzBls1bhaD9GGsOAHUiXiyKWCOHgs1OJIqq/1amz7kAoYptIRNIQ
         fmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349406; x=1760954206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJifNO/MlvLEol8h2cpUsahhKb87GytRbrPHmHhE5dM=;
        b=CBjawM+UYd0RVYyJntizLqob/13qjBFJqvqkUz+v7Qge/tNHUb7hkSE8trlKDiG8Vp
         KPJ+LoyPO+ygGYZonHegrYn/PEpS6F8/hrO/bSHsMJPV+u40EII4X3D5L5yAZ7IpG+9i
         NseA4t64Xlmsqxx+dhZnPT2MMJTREd7AXhvfJWAyGxrUDXlrZw6pYP8aXcd33wk5X+m/
         KQCmyKCaIAUAUiQyBVcjtfk7dnRof+L6yAQYkwvCVgkR6e0sCvrUV4AQ0xKlKo20Te9K
         /oS8d9MDhSozKi+AoQ1ma9TTFYtfwCLeFCnQH1Bqk3weuFB5eU70frMBdM0DMnVSKzIc
         r+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUzlDN5lYv5zMYBpI82uRSFv6gP5sXYlrLuSZrxpK7jV9ChnRG80aWIkEUp9ARj28qOx3tJGpIGQf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdsliBHB/miReDfzy4XmtNI2c/ACmk7ycZEZhRWj1JGeNNuwY
	N3VbajZdLQe+BXCO6TQP2GOfqrCDimS9qP8H+Odia/A8UOF5MkXwy20j
X-Gm-Gg: ASbGnctcUU7loSb5s60N75glRCkqACrCVOrJvOCy4lWoJHid62V2dC33GwhllBWWR8K
	Bmt4nJJlZJSYTr0zg1utbKyGJUy/sZicsWNqfEnWoYU3N/WZVm5BH51KxxuO7Vh913qi+CXuczt
	gbjmvWoPaXwZVT3W6bs0n+XGnbHD5VkIoOvicENuI1/f3fEyL7wUE/Fx8G0H7I6esyfHObXhNhq
	LfeCc8LN0nR0Is92Izi6UeYmZlv6R7/uOBzn7R0zFRJ4Ba/P6yNqntOSIvIKWjWQK5VTOj6nQQx
	X/n4DczImGK4Gdn1y+eoXfYv25btRadp/YyTo2Trf1eW6b6PiTRPpHbWZrTTjA3HmYYI1lPGobt
	UHCkttYmbfJ8fpdmwbCINtLTv2PEdx6QWmzr9BvF5fbSBqu1SjZuAsDM=
X-Google-Smtp-Source: AGHT+IGzpC5rqfVmsWGMJXGyOLj84deaeSTSLGbIECeDpck55uHP7Se5TrOU8rzQ6Rt7w04+qGi3PQ==
X-Received: by 2002:a17:903:903:b0:274:3db8:e755 with SMTP id d9443c01a7336-290272c0358mr237517515ad.30.1760349406411;
        Mon, 13 Oct 2025 02:56:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f078aesm128287165ad.64.2025.10.13.02.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 02:56:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3174B424BFFB; Mon, 13 Oct 2025 16:56:43 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Will Deacon <will@kernel.org>,
	Markus Heiser <markus.heiser@darmarit.de>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Silvio Fricke <silvio.fricke@gmail.com>
Subject: [PATCH v2 0/2] Associative arrays documentation formatting cleanups
Date: Mon, 13 Oct 2025 16:56:29 +0700
Message-ID: <20251013095630.34235-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=bagasdotme@gmail.com; h=from:subject; bh=EGmxIR9kKOSX51N1HxGcneN2hhaHwAGf1JsXcHdoHVw=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlvzhTpTzz78X/QzmP7+U+2fnJteX7S43LshGkn3W/9+ aI/RUSbr6OUhUGMi0FWTJFlUiJf0+ldRiIX2tc6wsxhZQIZwsDFKQATuWPA8N9z7deAJX3GIv8c A77en772USUHx4czn1iz2xkEhGTuu51gZPjqqFoiGmv06vyp6M2LP+rNXiFc1tmbf0ti2cfzvWE X1ZkA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here's two-patch formatting cleanup series for generic associative array
implementation docs. The shortlog below should be self-explanatory.

Enjoy!

Changes since v1 [1]:

  - Apply review trailers (Randy)

[1]: https://lore.kernel.org/linux-doc/20250920024227.19474-2-bagasdotme@gmail.com/

Bagas Sanjaya (2):
  Documentation: assoc_array: Indent function explanation text
  Documentation: assoc_array: Format internal tree layout tables

 Documentation/core-api/assoc_array.rst | 196 +++++++++++++------------
 1 file changed, 103 insertions(+), 93 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
An old man doll... just what I always wanted! - Clara

