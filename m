Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433725;
	b=nk+qQA8ZrmSlSWhGv9cPNNI6QzpM/VycNMN2NTTO80XKwKcsKH2rzu2WCyj5oc1UHpUs
	 +CZnAfez1DwoOftNFat3b3X3n2WibQ+D8lVglhwB39UdneKn05UNUxd3+YobVX5ylXa9/
	 2ZMgpdrbn/0JdwnHsKoKZry0QccGYxZ4D61AuWQM5eK2+Q/Guj9u9ANoFPe28PmgZz3Tp
	 6vDd7ztIcgPkotm8dkwJcvYOj+HNpR9O+4ZKi0rZAx+pQO8GIhkLVkZC4sDNDIShS8+pC
	 Xjba+HsQYLRpj4qvt+TGd9XJnd3mHOEsIBHxA/02ewxurgV7XbCyUmjy+JdowNRdLQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
	b=OXQFsTWZ/1ApL9JpbKK9tNbCIYE49yfwEDxWn35LSU90xbNnNwBX/afBMH6jvr2tOQ5y
	 msFEQRAt2zb1qgtesnAX9TibTs8CUuOipxz4lGVE7I6QnA03edM+FXVmZyETaYuMvlhMq
	 SQJZYwx5sTxc82ZNAX6/zIOhfirEmLUBbcoNVb1aoTk9CkVLtAiQR9EUfQkVuJC7CUNEI
	 VcVS9/sn4TmiaW8HvJbK0stlsB+nN+IL7q6T4T4XBP6YwTo9UH+Pd7iVH0zQy0EbLVxK+
	 sJ8x2YzPx1ysjMxFTi/VJ0m0OlSUHoNFS3vjhXOf5w4MnEhqsERij74GY15xJwomODg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A22606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A22606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ake94c02
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1667594a12.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433724; x=1795038524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=ake94c025Pcg8BInjOErVqxBlmWTqqVgqg2H4GFWuVtFOV/VA8AOF5EBhpeakZxZqM
         giPzK+C4b4BCW0QcvuFW+11krFPw8NRmt2qHNei4AJA+wEGJxHcLoCbUetZYQN0+RQEQ
         auoNJD0qDQ1224vXtoxj4YIhPRw3Lwz6jbl+AmvKRfENbmldxiMBKhxW4swAovAv91d5
         xBs1BjwShouGoiwRJcn4uqBK8DGCmnrpCbNWOh8ohmFQSP5pQ7p3KJU5OqgwSdRBgKTm
         AGTXCghXyc0r2OUchoSUzlmzorZbSOFkVWhPW6QPwyDlfQU2bB7OREnhzMFMXYii55Dv
         YgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433724; x=1795038524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqvT//ywRZvyN5aUarjR+h8osuwosZKu+ejEl3vYsLU=;
        b=LXFfjWyPGtJsE4sF6/PRf/g4nzJbdsQY9Tp+zxThg3JpVK2WLI223z8Rn/J0Pk6WiU
         G5N2ROaktAn/mghmhdznX3MN9/2uVHTEKVi3YXw6rv9CisbxHhUpsikGnPMzJGR59z83
         v86p5v3eBRfGU4TcGo6yRz7kbgDV6VUEORKDcRhXgyvntP8rxMrzHAAqcXPnyknGxbFz
         6TqZPsmCXTVUG+V0mrOZRhCLvDtUpR4w3J60tjrJn1eyw0dUdMYebF95BFXN/byYX6iZ
         Dutwhv7aDQudhskXl1iI6/KraW2IDq5y9VhiXfSS0ZLaUpPd6V+IaOcnVJ1/guRVOKj1
         7WpA==
X-Forwarded-Encrypted: i=1; AL+hErFLdc/VsgLrtrHvNGFXDkCjzCs8uhwYYW7rISBzvEjgtsWLG+IYSQoj3OLPzb3pTlS2Z+49/8efbX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tpl3mOfmq+NPf8YoYLDbpdu6HQAu2bSRIcb6GYtbuaK98oa1r
	fNquGKuWh0NzI4UAfb7iC5j+t6ULuw+TkCqIpCgB9WX7BHorFwjsua8o
X-Gm-Gg: AYBFou1JNUksRzEgce92hjmgPNtr+22gucanXZqdOxlrcyT8whggq0Si+Wd2v5d5ni4
	eJ8KZqZIglLcPaXjMBkk+t3iHB2s+QGmY4Px+yK1E+TZ3N/zEYg81xRSXS/0j1oajkxjCb4G3Ln
	X7ZryBNBm4jBlIQKhHnmsFCsfYju/04YleYeguBgF6W+RXRGaHtM93jh6a9czJYb8kkKq2M2+/s
	DMMejH4/WWHDllNqnvHwDcZMW4e5VkDxeHg5EkM8oDH81H+qldhe6MaSzVYy5fktrHs0W8FtECn
	+UjqDNtC5m50L4k8G2PH584N9yCup9MoI2NSeimdB2cPO/t1GaHw4Yila9oy8v1ym4d8Jz3pyvz
	r7lO73O3i3Isf6yvRE3LPnNYoTJfZiOd4b44zowr2PrBxWFlOZNwVCf/Nb9flvJ0YKyudqfNLGC
	ZbAD8CphPPjWTQJ3Vq2CT8Un18hKpTw37rw4PrEWp4HXLV0ysAbAI0PQlQtnG3um0ZxTZ6TD2Wz
	xRc1Qn74pfbY2o8/O2YdNTd65RaTkVc1u5WJCUwCXQEAjrm7yQCoysmQ/Xze5SEQnEGIgkBnqsH
	b1KhWl6N0il9Hzi1tCnRoXXHukswiZVm0bkAraJkspmJcz+xA3kk2gICETNy/FKmaQkpiwGgxZn
	vIjQ+VJhpWISZn0NZlEmsMEqPDySKX6gladA+baOsJu6FnFcOhvaKYilq3oIFQNzv9sZ72xafxr
	wEy8PMxh8iV8vcFn7QVqF4rLM=
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3064154a91.33.1794433724406;
        Wed, 11 Nov 2026 13:48:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:42 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: dell_rbu: make usable
Date: Wed, 11 Nov 2026 13:48:24 -0800
Message-ID: <20261111214826.6577-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First commit updates the API to one not disabled by default on many distros.

Second commit fixes upload of firmware more than 4MB in size, which is most
modern ones,

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

-- 
2.56.1

