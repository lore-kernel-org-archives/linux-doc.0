Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CB1F03C4
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 22:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547838; cv=none; b=RBECYNGCzNYvATuHWx0UCoOqfF7iiWTqwRjK9zumnn+yjaUpzPXKqAVa5sZVhn1vGTA1nJ/8mGd1W0CjYUv43sKyiOslcM7O1ywBrV/o6Iq4N/1umZuD0AAKZCEMz3oS1gas9ofl5a+qyBI5669L1PBMlrOBEqyzgDAD5anKsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547838; c=relaxed/simple;
	bh=YAlLqkiUmn3HLW9UEES3iRfYVjnsBQso51HpCIG25JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=egNXaDcPwup5o7tX1eZu9zSY2Xbh2ILqSh/dSd7RavpXE9OE4rbjQ3gGh6YWlqZ5QApKx7xd7KQ2BElESRv4+kUfaglk7qB0Sr+m8moMhwx9wQdI93yN+rcmvp4sEMwKhYBcOnf+yFkofg+96DRix7KoOxWUrYZuQ0SWMt/dxQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=itJMp6hL; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="itJMp6hL"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2b3680e548aso168006fac.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547834; x=1744152634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KzpsO/kBfwd4inh4brwX0T0qUV9oBaxwEbylk8edno=;
        b=itJMp6hL7yLifBXJCZeS6T00kh9130OjC/qiv2cftxOXRjFR4Pa96bWm3A60nwkedz
         R3JinWmRhS8dOn50t7gLIm5d8PryAy58sxDP+tYb6/5qmzSu5ba8fOBOZHt8zKW0TmTC
         bMBe9GHYMrng1ZgkwCZD9nkQRAV4QZfBpDSswHmuk8X8lvVFRaOLSnwVhilVPa4KoDyH
         IhQSonikSjbpNWQibSt0SNiOvqjpStOKpPPrDGTpGd1ZWc9YZVUQ4BLl6hRtJU+s20G9
         UDwTHmrKHsG01zxRnC7hNQhQVRABaxIZVSk8s0tQqebbMRvH805TeEZWRl2cNTUbpU0T
         DEVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547834; x=1744152634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KzpsO/kBfwd4inh4brwX0T0qUV9oBaxwEbylk8edno=;
        b=r8GPyLzoE/xH0p7XMxfgnGy3ENRbiecP/2BGIaQD50Q/flFhpMjMjzx1NK1EY4wRCM
         jx9/VUl2WOyUYqU9uJSlEv2DwTwRsOJQZINAAQiv5P0fco+2YBaY0PfPLKfTg7buKo8b
         ogmI2GKF1qE0l1VPsgn76jVmaYyuMGicec5K+5lRse+pWHzSPqts6ZYDwScxotjOwNQO
         Srzg60rt5NitQRSSrLQPo2M8AhZJHKDzXG1ZfHZOZsKxJpQImLyi9N2mJoY2Nl0NiW25
         F6sGFCObigIOtpPfpMt05AIe0bjs6ToOY9yQor6VLh40dCYfQRaYh860pN38qJVL7NIW
         RB3w==
X-Forwarded-Encrypted: i=1; AJvYcCWaMUI1eLnANQh7wFDTJNlPQowM93Hvo8xGQrxzuucj9yYVl+Mgfpm6pGkM8iqtUF18nTV0tdcyWIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26R7f1NGJD6o8wFcRpgLZwUooqMR+dJJwhiFjvzbppc8II2Zf
	bI/gmoESQd8xjUE6nH+wJPK+TkGSq4joTPTdXVwVSaD4HNSFCKnro6WgSEIsf3w=
X-Gm-Gg: ASbGncuyafTiOUHrUruWwhDPLwh0FNuI3s4Zkh0w7n8BnjV8Z5tzvy0+LzL4UxWEbgs
	qGrXzIwkWaUGkhlfa+VaFNjCXkWH/LdXGYjkF+px7nCO31kj6yd6hLRopBgJhbFhCB62mBRYCcy
	khYBCiP6KCS0lWtyiKT5Epo6tQRmI1uFbffUb5vNvS6J1aXwg/8Y/GvHtwiSsHTmF1VFn/4CbJ6
	xEmeLUM2hRUvZSClGuT/lDNow6fSOJEG8VVCH/ZyreKAVjPIvJFB42b8H8Xy8SGhf0cfBA/Y9SX
	DNzXObFmtXHfWUC0uFsceAL62najh0BpS4eEbS6WVLtyTNzAv1WwtJthZasIWfsgDvuOufjF/4B
	r
X-Google-Smtp-Source: AGHT+IFSez3et7WKBsDlKmMYtgl2hfH5thKM/Tt23C6oNV6Ycv2F2CQ+eNAr/KccskPj3MVGvqv3Ig==
X-Received: by 2002:a05:6870:ff93:b0:2b8:65f7:8268 with SMTP id 586e51a60fabf-2cc550a11e4mr1066371fac.11.1743547833793;
        Tue, 01 Apr 2025 15:50:33 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/5] iio: adc: ad7380: add ad7389-4 support
Date: Tue, 01 Apr 2025 17:50:07 -0500
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ9t7GcC/yWMOwqAMBAFryJbu5CfxngVsRB3o9uoJCCCeHeDV
 vOmeHND5iScoa9uSHxKln0rousK5nXaFkah4mCUaZRTGkV2nMjbThXQPwM61LElS55m7wKU95E
 4yvWVh/F5Xjnv09FpAAAA
X-Change-ID: 20250401-iio-ad7380-add-ad7389-4-1f6d3d7dc749
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YAlLqkiUmn3HLW9UEES3iRfYVjnsBQso51HpCIG25JQ=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G2ji5jZGeBcfDlKiaW9oiPp8fE0x2NefCXng
 IV4mEI86MiJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xtoxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fANDlBAAjJs9Hsb2pr80RJr0dynacRF3AA3EXEZOBA/50Jq
 X0W3pne1SXihcZdmS+0RlA98QHthDG7+noKnN8ME/V65oCJdZOSM5pWVaden3dQxCJp1bnvthbx
 A1857Szgkm93pR9OpsTg/oMs7OUSLIulOzR2pOfQq2V7trNoCjw3++Rq6o5KD+7vyi/m5RJD+nU
 lilNSLAui4aYoqCJShuK2uLl1gGIHHWtbAs+kuVokPKZSO0qmQ9znVgo0NkTrqW72vhC9aY5MQV
 yEY4piz+F/PSy9ZCbD30jZMWuPEU52E723U5gQRvlytQmWbOoSWp8ThAu1a4efGzdFJ0tNawCCR
 5DSZpFTduiQ27S1UCgjNrWYHyYAcSB2MjUuVkU/ejPoCq/vfoKhzmIUyvuLe2KWW/XXjYy28v6O
 Z4siF4TMFVJDU0fat7yMIsk4kHJngkHXGute/By+eB8ySxcTmftT6b7RoEd9lJH5X0XbY2phWid
 x3uRGz2HWVeUneZQ9JcdvnYfAlcvNiAZhGnCls42wuC7qrtk6S2wfnHDKEvVr8tvi8ih98CWjGb
 DtqMx3//ZBITuW7pJjctLVcTxNps63y/BYzN/Lc+Mh4e1RDwvQiDScOFjVRL3uDvcrB/ijZ/MeV
 H8KxbdobeYPMY4SznVb5H3U7iIrSLiRPY6o9ECH/sHRY=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

While developing this driver, we glossed over AD7389-4 since we didn't
have hardware to test it. However, it should be trivial enough to add
support without testing. It is basically the same as AD7380-4 but
instead of no internal reference, it has no external reference. And we
already have support for chips with internal reference only (ADAQ).

We have the typical DT bindings/driver/documentation patches for it plus
a few patches to shuffle around the existing code for supporting chips
with internal-reference-only to make it generic enough to support this
chip as well.

---
David Lechner (5):
      dt-bindings: iio: adc: ad7380: add AD7389-4
      iio: adc: ad7380: rename internal_ref_only
      iio: adc: ad7380: move internal reference voltage to chip_info
      iio: adc: ad7380: add ad7389-4
      Documentation: iio: ad7380: add AD7389-4

 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    | 11 +++++
 Documentation/iio/ad7380.rst                       |  7 +++
 drivers/iio/adc/ad7380.c                           | 50 +++++++++++++++++++---
 3 files changed, 61 insertions(+), 7 deletions(-)
---
base-commit: f8ffc92ae9052e6615896052f0c5b808bfc17520
change-id: 20250401-iio-ad7380-add-ad7389-4-1f6d3d7dc749

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

