Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C41ADFE4
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703146; cv=none; b=G0nAM9quBkioeLXhxMUHq1FxI/UrocbUEeoOH162O4rDA+sw5XdZOR1IrBY8vKdzFBIEMMw6FQzMH6RSPg38yEyFhskOf2TNIET1bXPlDBABf/IvGUF3BKoipzYLCLhImSmYTWXEN6mvI1BhRdDTZX6T2JBohNT7hSx3jwfCCkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703146; c=relaxed/simple;
	bh=LYTo/8Wrk86/MtiAPfbdDE26Hplmwpiabqw+vW+JUaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HUkzS6lAkBi0HnVpBLTpo3ZEGJhrHj+EccnYDqM/TVZ0GC4eQFtO38iz8tZS7Cxoulr2PqiP4Vk97g1uJZcrnWqkNkN01Kb4Dmf3JtLcWRl0juNThJyAvl+GaIeGhMYfj08PUOySRjKHox5NIF7gnZJw0d9jGrQ3kJuAs8h/P/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ANpTy5e6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ANpTy5e6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so3225512f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744703141; x=1745307941; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZGd0w9zY9e8wiKe6AcqxmAzlgtf9nDIhq/RZijuzI0=;
        b=ANpTy5e6H88t8JoihICGKrnOBDrQKp5o9rEInBSkFqeYXIzI83BED+wdqSIGAdWY58
         Pk73XBzL5i5KW10GgOnkwSUU5LLQTrwhl2htyk8BBBnNSdQbZiv+q9CNe28g/yzL61pC
         0PLmQuRx5HBv/Fdzor/CbgdExPacB/6oqmiasoWVWNbdlpS2386mB4+9iMHQfDM3RhqC
         Irbqh3NcBIvpENxqOUVVX2M7TsWHB0bL1lMUTGex/Ga5FOt5JJ0TObhpI3csRFWDazR0
         Arnh30fztajOvlp4kQ5MblEqACN4QqoyFB1anXZybzNGWzPl8S920bKgD70GOjr+1xfn
         56Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703141; x=1745307941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZGd0w9zY9e8wiKe6AcqxmAzlgtf9nDIhq/RZijuzI0=;
        b=xQbzikzbk7A1TUQxhMFaERWaGCAfExOsUf+Q64Ln1aIszH9lnLoIUnCn+CFA8gwsoY
         zSkgLve3/vhyZFki1E64u1WCJxtHbX5Mm8iyAybJJvr8tQvCtCbHtQri0FMDgJtwXJrH
         3II/mtOuKcGZ7Fkh0oU3YlMeNdrfpNEbfO7C4RCp/nD+Z/B8lYvkiZwCQLtamB1B4aI9
         PmKdlQ7P6uZcYts1501IqzPOo32hnAEaNsqppZZqECp6sT8gDj3VwxDYKvGhpACgbJ/f
         Y5XrYXVzTCLOIirJgf3qiMUxF7VDp1IIFNNtK+KnPSxXgpjkkMQDtJfbekEMMx790scZ
         CRpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVFlyndQ7t+0mQXsUQeHu/R59YqGiHyGqXgRP0r/eLIA0vVL+/yvTLNLgyEjk656crK6ef1WCrJfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl8qjOsUKymRpzUa7u/+mlIxh5vYwwbH2hviDS1gyywPjfZMfS
	LF8Uqd9xzFzMLuBxznbQKrxmYyDNCZkNti1ZZwpI+9QRrtNt1j0YJblKZFjWVz0=
X-Gm-Gg: ASbGncuHEtcQpYYS0JidbDHQqydQPMP+HXUjExY2k91f/G/ldNWujcMk8DH4hquFc1n
	UTOQ619hUFkLsRrg+XNghzOEj9nVneJNmnncShi7B73s9KADdQnA2kjTSh2G6TCyVI1swCo10kD
	FD2BchhZamnUEk6VOqA0F7EtQ+oBD3pyJP8oBXp0g+iyEi2MwNODi6LXI32tqS1A+rlkkuAfEmp
	iUjkAZE9nIQNAqX273TQmBuP9B75129ruWVDOefQneHr/Eeplwqpm7jQ+k+cPlBbTAQDV/lp4m8
	x1ExQaM7OofgoHdqief0NKwWWyLorRcn265VBSE/xm3i8TcOFgdjCIzVhovfxmDJhAkPLtqsNwF
	/qZfuwxk3NtCXvLXO1g==
X-Google-Smtp-Source: AGHT+IHV7T+O8BH10hFsQ0yYigBYFXjp4027w7i9ivXroOobo0vEoRWLMN+TMIMe0o1dY3KNhquw+A==
X-Received: by 2002:a05:6000:40d9:b0:39c:16a0:fee4 with SMTP id ffacd0b85a97d-39ea52133cbmr13519488f8f.27.1744703141589;
        Tue, 15 Apr 2025 00:45:41 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445270sm13137060f8f.81.2025.04.15.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:45:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 15 Apr 2025 09:44:12 +0200
Subject: [PATCH] docs: iio: ad3552r: fix malformed table
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-wip-bl-ad3552r-fix-doc-table-v1-1-717ffd320c9d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAEsO/mcC/x3MTQqEMAxA4atI1gZqOxHrVcRFf6IGRKUVZ0C8+
 xSXHzzeDZmTcIa+uiHxJVn2raCpKwiL22ZGicWglSb1aQi/cqBf0UVDpBNO8sO4BzydXxmps9q
 aYH3XKiiLI3EJ3v0wPs8fCe7Ikm4AAAA=
X-Change-ID: 20250415-wip-bl-ad3552r-fix-doc-table-589293c9b860
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=uyyyxJVkC1X19c9K6rX5j2f5tLF1UJIDKdItLe/uiwA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/x+dX8FdT6cgy2T+eN9l1VjlW3s5XKq64YBookfUmZ
 8KsRkXjjlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABOpm8nI8FPDqaq0NvpIql3C
 n1PTJ39gOtL5prT6bNlfyVU3Pte1hzP8Dz39Lz64fH+AElPa+bmJRxdd0S5b01nxptTi+2ITnad
 qLAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix malformed table.

Fixes: 9a259b51e3ea ("docs: iio: add documentation for ad3552r driver")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Fix malformed table.
---
 Documentation/iio/ad3552r.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/iio/ad3552r.rst b/Documentation/iio/ad3552r.rst
index 582507abe8c4c2ecb51a1f8389d7deec44d20222..f5d59e4e86c7ec8338f3f4e82d7a07587e3d8404 100644
--- a/Documentation/iio/ad3552r.rst
+++ b/Documentation/iio/ad3552r.rst
@@ -56,7 +56,7 @@ specific debugfs path ``/sys/kernel/debug/iio/iio:deviceX``.
 | Debugfs device files  | Description                                          |
 +-----------------------+------------------------------------------------------+
 | data_source           | The used data source, as                             |
-|                       | ``normal``, ``ramp-16bit``, etc.                        |
+|                       | ``normal``, ``ramp-16bit``, etc.                     |
 +-----------------------+------------------------------------------------------+
 | data_source_available | The available data sources.                          |
 +-----------------------+------------------------------------------------------+

---
base-commit: 31c52fe3b2efeebfc72cc5336653baaa9889b41e
change-id: 20250415-wip-bl-ad3552r-fix-doc-table-589293c9b860

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

