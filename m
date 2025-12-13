Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD52356D9
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656368; cv=none; b=J5p4T+N+ugqabltMlVwe2u5Pn2Dc//rVRLDolFQGtVvb3PqZPQfaMtZt1e2AdAa7PqbI7PBEPDLe9kw5DpkRf648Q/gzuAABAZCR6VMoxqPlzBGokpctR1XSbK50cMh/HkRMlr1jHlnF1AJx8FDjZLx5dQifU+tSxLyVrfb/z4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656368; c=relaxed/simple;
	bh=TwEi4W3Wz7CiB3xdylm+NGxwozA6GQtRNLp8+VyMOEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tz1mxlv8VkF03Bh7EHl/U8pPnP09J0hTC2raauMcvsiWWKxbp9dQ/GBDdYpYrDf2QDO4guR67u6pyog0LB9cfNXL2ZMvvXTJk6S3nhI8iCe739wtGcvKY5ugvQ/RnpjgcjQmtdfa/jYFEMNHzrm4fFbwVzY7xnBno2DZi/hq8QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4SvBWgw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4SvBWgw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b736ffc531fso456572466b.1
        for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656366; x=1766261166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHGFOsqkS31gTErFV/5m1vr2r3hQ0elcZNql1xhW9iI=;
        b=J4SvBWgw8msKHT3rwe4EXz5t59VE2anbWeqMcdceA1+SuGHl8F0nA7M8A6Sxr9lNT7
         KA0oKRS+rQ4StMMsHdVmcgjmXBiFcz1hwSGqY5rxXWWe1cp/Tbv0XYOC7E9w2ZzSbn3j
         CvD7RFza/8SvhtHXZOkG+K3DG1vBrBLK/QPNZr0U4klHhX0gw8wM3U2x/YDGkHn+gM+U
         NtgHiSrOm3sUWO1BBEkBE3M3udddU6yWRIA/369QRUzGc7JlvG/6g4XM8NIsI4YE0EjR
         x6T/UkQzuyO439AYkUzl9XfclpEwv+BhplzYnpBZUK44WAbeP1KokOA87shktae4Nd3T
         sN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656366; x=1766261166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHGFOsqkS31gTErFV/5m1vr2r3hQ0elcZNql1xhW9iI=;
        b=qLhbLCL+wMBYbkudOxmWqGX0L8cOFSF9ZOpJPvDXI3Qd7kz41mA4JxhKuuiB9WzA3c
         suxv7TzV9uf6gyNIDfr8kutD3knB5LmifWWgCWORcZ8Pd63IuhMv8vrOC7MCdxCe1Frf
         R7il9tooLfCYgAcj8CoaUjVdNJQAOQtTmjTM8yIt2ZScgYzbSCQx6QS2cQ9BdrAXjnQ+
         7QdeYpvvUSfrTmqW/Dh8vnvK2MfucHxjUI2EY8rBkyrW5FtzKulrGCIQ/2EP/QHym7ve
         SFetPEHaU+4KxK6T6C3/PgTmjM47ffH7fBZ/AHbgChaPMi3+w38e0aCY6caCdnJNnDpR
         aCDg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ubBzewMXBiI0p7NETa9zNylBD2k6eQVBR4toLs9iVRFzeEbO5KfWfZ90djtC1f3DSgjEEqRVRIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7jhvErAQVE6y8oj8llYuDf2OwNccBRHDltUPBSxGGO9pGpnx
	BvvUvhUeUTqZzNcqDAGbCUyM2azVA6XMOubZ6tN0m1hXIEql/L0UJs7i
X-Gm-Gg: AY/fxX6ZeHZbjgZeC0w1YvQouvRyqVhRg+e2tkF9tp2smhhekJ86F02N930byxLO/PR
	A/pDm8JXutKqDfQNaySCtz2PZoe6YLxxxyqRUoX3SU/0mob91CpSW+mlD2Kyc0ZREbPyFSMHZZ7
	2/AOF26IMO1CXrOF1dxUn4XzZUW6ctBrlups0RosFST+07Zq53D1rM0qEm93QTXZN7+k791WCqu
	Kda2VK2D90P2/YpgmYiv2by400mcl7fNnUGsTcMIP9ghB/fbImWlOYhY5+QC+SUIj3lGZZmb344
	uBBksoz0YCrrO749qmIkYiMBjv+/6/SHVm4jFr0EFFw8o6jUEoqxkfWxTw5nEKOQbeDnVBeIaIV
	MrFHGtbAOG7BKcg4xLtii8xIDwVGGu1RifB0bGfLwaTm3eR/QzRWYGv8qQpfz2NF5p/sfi2RP0y
	iKQtf2IyM0YHPO2FlMwZYbwx+zxGEPuzDIJIcacFcY
X-Google-Smtp-Source: AGHT+IGaCgD8cV0fgaZFejpb/WaFYRCA11d59vWkf2LFb2rS+n2zbSBBFJpot8a2kmK4HpgIFrCgOw==
X-Received: by 2002:a17:907:d23:b0:b72:70ad:b8f0 with SMTP id a640c23a62f3a-b7d238bb66emr630797166b.36.1765656365499;
        Sat, 13 Dec 2025 12:06:05 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:05 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] (asus-ec-sensors) add two new boards
Date: Sat, 13 Dec 2025 21:03:41 +0100
Message-ID: <20251213200531.259435-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213200531.259435-1-eugene.shalygin@gmail.com>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for ROG MAXIMUS X HERO and Pro WS TRX50-SAGE WIFI A,
contributed by users.

Reis Holmes (1):
  hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO

Robert McIntyre (1):
  hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A

 Documentation/hwmon/asus_ec_sensors.rst |  2 ++
 drivers/hwmon/asus-ec-sensors.c         | 12 ++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.52.0

