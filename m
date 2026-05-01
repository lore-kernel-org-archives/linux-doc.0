Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F60B2DAFD7
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777660019; cv=none; b=AxYcSGXiAkJLobk62w3bbC6kBi1XOfvwiNVUpy8n2W0mCU6gw9IVU1xcwHxGz7XAoPYwxsWrXFwVwhJuPNC5hdreVHJmiOa0JKoMXyzNkIu6fQcW6FR0U5XImgg1yiwA+giISkLrRxfAWHtO2w9hPVd4e0zj0QGnYBF1ygLKJFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777660019; c=relaxed/simple;
	bh=75Ae3kzkXzxY1/SGVUTTAwoYV+w29nL+J93DbwCgOx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QzZQaNw+MbfKnfAJZ1/wKzbBzgAf7xUuMUDlAk+BGfEB+93Yd34pSljLwHz5TPY1lB+VMUYFUq6kjbBDfebhroTfuQkeY0lceUhYtgDA40CmHz509jYOIT/LCafHa7N4MiazPRqyz6qFDvVTqbdr5SeijGIJSI/jTvip6HZ6Tmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pxv/oyjY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ncWEsrL6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pxv/oyjY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ncWEsrL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777660015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1KhFILtV3QuHac5wRWE5z4XtvwHFFOaHpi9hLgTC4gs=;
	b=Pxv/oyjYEHLUei0geZo2y6uLQLOiKvg+UsMTlszcdbCvbK/kDyenhg/mWXPdXVAfAQswRT
	uleywDEUoiw7xSBEejkDyH6DqzOTmEIPZqLqyrM7CBIxxhdcFtDM/L6oaVKPZwpwWOFFh8
	FXoYE2qgCGxUvB7BcybQd+x4UHNP1B4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-dypLoKqTOQGM9tftZswQ4g-1; Fri, 01 May 2026 14:26:54 -0400
X-MC-Unique: dypLoKqTOQGM9tftZswQ4g-1
X-Mimecast-MFC-AGG-ID: dypLoKqTOQGM9tftZswQ4g_1777660013
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48906aa28cbso25040045e9.0
        for <linux-doc@vger.kernel.org>; Fri, 01 May 2026 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777660013; x=1778264813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1KhFILtV3QuHac5wRWE5z4XtvwHFFOaHpi9hLgTC4gs=;
        b=ncWEsrL64/o+XBxzCTQ382ZqlE0Xf26kW8EgoQrzi7NopuUugeNu/wwF+NgTMf01I3
         wXLS2jNFo3TjhgN3tsEOLftVlglxi8/uHBfPjJSKSS/4IIi6Xwx3l9I+deNN4xQYPonh
         gD5fijaApQx3WCbJWUtJSW/DoZ0IXCMZ7BSH1M1s1n8tC1vknY23VCGceR97CRj9ciKd
         U/ZmMdTqGVc57fNuxfFWcClSk2+ZgRVl+cyoO7ULrH/4AnxKV3Wdd+ggNNieeU9uYiQI
         CgXbrAIJkepoDnpUnitAHh41NS4mlvXfHomzjnCUYvoPMuFxkrP5XDoi312PkRq0ZowW
         EXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660013; x=1778264813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KhFILtV3QuHac5wRWE5z4XtvwHFFOaHpi9hLgTC4gs=;
        b=CyvlXhr5zMRu33a3ibNf9eoQDWMrpZNvBsogygNs8hqTitgx58AWwgqOzMRRt/9l/f
         gTZ/4FfWXYsHthGMLHnOhkfuqsduBD3NlTceokYEguPYjbsOwWhgbhPOhy9YsmssEp23
         9ieEx2c9u68TkOs+jWOe6UyZRyGNKx70KRDRYQbn/AprSYQce5Az38odlfbylI3koVF9
         5nub788T7uSDMI/vZccXLaIhUluU/7XkjYoYbTUujj6yr3Lr78dsUAjASVO3MAdyXLXs
         LjA2YoBMHweIRrnOimRu6xbniqmHaySccdrcSgcqMy/eRAHO7p8WoF0ugVrpYKyYHH0q
         Hn3A==
X-Forwarded-Encrypted: i=1; AFNElJ8MjReQSoTcdNzB5yZWzTmuqeQQT5pVFO2I9KKkmwz6RfrVE/qA8ga8BtIlTQ39I/q8c4cRpaI8SPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga8fDSt++G1rF0NpZ82Olk3+LtrdLPBEUSs9cU1lac6ZHNTBr
	QwSedgzdaxLzTwzeuHsJf97+Gkp6ARTIiNByGzhVoyI1ZgjFJtc+dX1k4nRxSvsNJ1LKPX9pnaj
	wM93RRROqK+POdM7qiiNCRGUqvwLzW7vDpfnN3x7IDnhZLiwsn+eFa1jpFd+ILQ==
X-Gm-Gg: AeBDiettsDwFmDzevXNXEZ3aOhBQYR67HF20e1XdqCucLAzACcJwQl6BJJivlZZRvxL
	ZzucV3EEJ/JrfpDULhSUZ7gHtKPcgJ42NL0EtyKsX7nc+mqWKIDxb41JFg+Lz0t/U+zRQ4Uij4y
	3s3R7Q0VH9SrzY+fss4ucXfMPXPwDuFGa45+G1O3n18KWpQZQuJiCVdcefdBf9F6KVfNAxHeOwK
	cyMFvElKMgW0aSU/nAiu+rCOmXG6K4XyfWqThT0VicIgYWyv+LZc4f3/kw43LaKXOsDQXeAh1QL
	GsV7Y5Yug96w3EaR2adHhpv6D/V1PY7iYq6rrvZqf83E5XRjjbuh+60nKCM63rQh8tBV4W1yXc3
	G2wBSKuLP2tF3lYkcX8SAhmRjf+qdONL78HMQA3VkuFUlXAdd
X-Received: by 2002:a05:600c:1c12:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a970a9098mr9297755e9.4.1777660013194;
        Fri, 01 May 2026 11:26:53 -0700 (PDT)
X-Received: by 2002:a05:600c:1c12:b0:48a:5821:6006 with SMTP id 5b1f17b1804b1-48a970a9098mr9297385e9.4.1777660012799;
        Fri, 01 May 2026 11:26:52 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm141515985e9.0.2026.05.01.11.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:26:52 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: Remove icn= ISDN parameter
Date: Fri,  1 May 2026 21:26:30 +0300
Message-ID: <20260501182634.1110715-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ICN ISDN driver was removed in commit 02bbd9802da7
("staging: i4l: delete the whole thing"), but the icn= kernel
parameter documentation was left behind.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 41c657cd362c..6e21d8638d77 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2245,9 +2245,6 @@ Kernel parameters
 			syscalls, essentially overriding IA32_EMULATION_DEFAULT_DISABLED at
 			boot time. When false, unconditionally disables IA32 emulation.
 
-	icn=		[HW,ISDN]
-			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
-
 
 	idle=		[X86,EARLY]
 			Format: idle=poll, idle=halt, idle=nomwait
-- 
2.53.0

