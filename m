Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FD23F7A9F
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 08:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833909; cv=none; b=Y5OLvAEPNAbBoh3vNx/D8iXcpVKUD5hm3aV24MW4C4rz3gdI5HivPOwQcfpkKRCF0y1VdJ5yKrOmTNCxBaNdKlcNISxgNKCAqmweR6H8uqIGf1KunWywRW8Noqr83RwP1JmXlZW5ZZ5HCNz+QcXbn3f8LU7roJJwNZyxo9RhQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833909; c=relaxed/simple;
	bh=9fkJUNnDEG5//voE8x3IYfoMkyUpqv8GjX+AcNvz/20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZM7Maq6hSjC0gvMlnM9bFBs9mYVcpHOKnAs3tJXTgXfVZO+zBiADoZAunbMnBr6nDVVCUxKc6UdqZMYLdo4cBW6oaipJ3Q8dL7yRHA7dwD/d2E0UP2HBvA4IYdsYfAeg0a648yO68zsV1vX6nyQ7zkQ1GMmn1QOfJKvlqctGZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=m3GTSLAi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="m3GTSLAi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso20232995e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785833904; x=1786438704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcDTJW4kwiodQtam5lraHbRy7DjpIfJ7yuEDA9ny7sY=;
        b=m3GTSLAikBQyIzLnqFeLCNtKinHzIuEkLknskTPVWtlGk1e7u7dAuPhb/HMyd6Goty
         7zIz1u9Vp5JMU48okkYKGjDOGVFEig45Geb7d2ldT5U174w/5VfZUrOoxiWaQJj06lfO
         CthWhj1Qmxb5SzOoXBWjmidIr7XWuDnPQM7Lx7aCKb24a5WZ+4woTAo6gdTWD5hIg6pY
         UMDcUDOtHldCUsl6eynIhRRxoWBBr4NPh0UpQCLL5Z3pyixPg1vT1htZr1x7EQ4nfvEN
         bpQJ18LbD5OIWX2U86t7IPngIZTnq/KKbY5+UPwm1Di3JqFeXUbPUp0e+qHc2pskaNL/
         XHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833904; x=1786438704;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PcDTJW4kwiodQtam5lraHbRy7DjpIfJ7yuEDA9ny7sY=;
        b=B/yB+nGZMjdsy/oVm8FQK5ZruwIBlR+poMsyTtHt4ImAcisOorYEvn7O7S0wn2CyyU
         Ik3foqA8wX7UOEwjZ0IjSi79cVzUl4PULQ1SBpGjuQ/lYH1yjE4jO6PiULCo3oYe4z8e
         MTPoH96XMdyfw0elacOzygt60J1aZrzA0A/cP5DMoXrkqxqYCdUiUPQ26gv++LNeMp5b
         pCZzGN/Yn4Gs1MOhtb3pEWj6jZ/M7aZjIg5PNC6Mr0YiXaNlz75irwl8NUWGOEhfTz+R
         nDFMsm7o7y1rcpDvuGVFNpYTNZW+lUV26bMikhkiTWz4OearISaarPn4vzO2/r2gns3x
         yEgg==
X-Forwarded-Encrypted: i=1; AHgh+RqhVDzTYJv8uYb4Qt9j63fluYfdr47Z+SNCx/y17uvES/9nbMvRcCDTVMtBUM1a+ZF2zpx8s0zI5zU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bqXohdg34RXdrsUXHiJO9IuSAuxb+n6//3qPewg14+7fjAjo
	D1+I+epdkyd3sGAaGvcx8xB+iW72Clq1leY4iKaX3sqi19B8fRjAtfER4BqEnTVYp88=
X-Gm-Gg: AR+sD12gNIpW/9FKdEqP3O10Ji2uIvyaUEZYHYEjR0boM/i/ECTUub27eYhUUydiyEi
	kWGYXO+Ha/OenaPgm0BZ0Giqru23sPqqnQh7fRC/gBbq2wI6QPeel657aeZ06fDOS8eVqNLZkPK
	zpksAVfpCYMP/o4gRmPcAltHnW3aM3hpyy71SjAeAQNPmaliN5fN33AnjT9Z3s2xyIG3Dcv/Kzc
	2H+UuS/PsKrHL+Mlaikf6/XG/HqU29PWbCg+X0mIxOJrufY7iOo19W1wLVKihdt1vwyaoQDjW+x
	IFk0nuF9GVLIKpfCN5yb7I1aOsQ2Ewg+GdaGyGUckpAbuZqEAxXJ4KmxW55inDrDEAi9EaiF196
	R10EWE2XzzgYvG60Gc342jrxw9ogdL1+HjWVdmKhKWd7pufQpPklg/emKcPWh8Mj8Sin9sr1Sqm
	G5bGLthsTLJaOrQdfrQ7CE57h81Tfhm3DxHlUTRpJ10E5t2/s/YdPxanS+/y+A2AocVaIDP8jBf
	ye8jxAq9JmGAT/7lriOb9h67eCd2RgsaJFtO7HFK/Q0PJZ7vqJg5g==
X-Received: by 2002:a05:600c:c8c:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4980c6564d5mr283848775e9.13.1785833904344;
        Tue, 04 Aug 2026 01:58:24 -0700 (PDT)
Received: from localhost (p200300f65f01710496a76592f11363a3.dip0.t-ipconnect.de. [2003:f6:5f01:7104:96a7:6592:f113:63a3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49807bb45ebsm225671135e9.4.2026.08.04.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:58:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	John Ogness <john.ogness@linutronix.de>,
	Alan Cox <alan@redhat.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fushuai Wang <wangfushuai@baidu.com>,
	Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Abinash Singh <abinashsinghlalotra@gmail.com>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lukas Wunner <lukas@wunner.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Gerhard Engleder <eg@keba.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Russell King <rmk@dyn-67.arm.linux.org.uk>
Subject: [PATCH v2 0/8] serial: Some yak shaving
Date: Tue,  4 Aug 2026 10:57:52 +0200
Message-ID: <cover.1785832297.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9fkJUNnDEG5//voE8x3IYfoMkyUpqv8GjX+AcNvz/20=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqcamS60N34BMNL+Us9dHojEVxYalHWgzvIqIxO UxljGs6mX2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCanGpkgAKCRCPgPtYfRL+ Tv64B/wOBpzzIShaaUBxe2pXacSkgO2+egTOFux2agBuJbSkPcgFx9ypJJoXFU6gMPDDXTd3TR7 CCknuKUXAtEzGbOZHL6B8mg1LmxloVupqoIyoulFXO88++Orco74mDCJ/wo6I+LqT3L/m2KWboW fr8au+Fqf1UCf57yYF60BPLfPrYLKeBXCbEbvyoXX3gEUcHOdWmVDgmAt0NL/wg/8vbnsEMhnbr fmE//Y3KzLy700vH4LspmSf7nuy0lV8ug31+f9P8IvrMBXuN2ss0hoZwc7VPqRxEwNM8/NNulGF df3SgQ+E8/TI8/Rzh1Q/xsS3MWbsUyTlyreMne8ZQT1mnxer
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since v1
(https://lore.kernel.org/linux-serial/cover.1785489518.git.ukleinek@kernel.org)

 - Fix author to be my Capable Hub identity for proper attribution
 - Rebase to more recent next
 - Actually build test (rant: For mips compile coverage of an
   allmodconfig build is rather bad)
 - Two compile fixes (I spare you and me the details)
 - patches #2 and #5 are new, originating from suggestions in v1
   feedback
 - slight commit log improvements (Ilpo Järvinen)


Uwe Kleine-König (The Capable Hub) (8):
  serial: txx9: Drop noop probe function and dangerous remove callback
  serial: txx9: Simplify knowing that .iotype is always UPIO_PORT
  serial: txx9: Drop usage of uart_match_port()
  serial: 8250: Make uart_match_port() a 8250 specific function
  serial: 8250: Simplify serial8250_match_port()
  serial: 8250: Fix corner case for port matching
  serial: 8250: hub6: Add cleanup code
  serial: 8250: pnp: Annotate init and exit functions for conditional
    discarding

 Documentation/driver-api/serial/driver.rst |   2 +-
 drivers/tty/serial/8250/8250.h             |  10 +-
 drivers/tty/serial/8250/8250_core.c        |  25 +++-
 drivers/tty/serial/8250/8250_hub6.c        |  11 +-
 drivers/tty/serial/8250/8250_platform.c    |   9 +-
 drivers/tty/serial/8250/8250_pnp.c         |   4 +-
 drivers/tty/serial/8250/Kconfig            |   4 +-
 drivers/tty/serial/8250/Makefile           |   2 +-
 drivers/tty/serial/serial_core.c           |  27 -----
 drivers/tty/serial/serial_txx9.c           | 126 ++-------------------
 include/linux/serial_core.h                |   2 -
 11 files changed, 63 insertions(+), 159 deletions(-)


base-commit: 415606a7be939835db9b0d6b711887586646346d
-- 
2.55.0.11.g153666a7d9bb

