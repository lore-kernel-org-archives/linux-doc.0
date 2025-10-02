Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E5F2D5939
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399803; cv=none; b=qznG+Px0fmM8BMy/3mSskEdTeB3YCpp8mUSu7YBr1NQN3Tr1psx2Fweb2VZliKDeFbo9PK+80duKLB1vmgASrAYGw9KR2g5OAsf70H/1xbtsbpet0/45qQHR+0OILFOzZH3s6rTW9NY1TwNtjvmQD1iX1yIbd87ROMk9miNfL80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399803; c=relaxed/simple;
	bh=o8uIpvdm8rS/o+S1mykUYGGLHkWfPhCsX3cg0yw1X58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMG0HIs3lxizKLFRzw2EkOwDP8pP+m3Gx3PsTKB8DZvCo2zrK//jtDHYxPRJ1Uibc6XiDzACx5hTh2iK2n3+NHqW/HiPHlSyVLKUBPQeygj8iHTlX+bQzjvi1ldmGR8HYd/SEgl2NQrAyWFdKdXtjg6lPaoNB4YCmaWpROrYR7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDVYz6yM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDVYz6yM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so706649f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399800; x=1760004600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=ZDVYz6yMmRu6882C7YCgncuxHZK1w/wzCMXkNq+Wbp9p5lV78PDRPvJpAfKCFarqLg
         uJD09CeMZnKKzKQwRB3Y0qmS/Akysi9xtoIsZLjmGmcMM0nmq5bF31NW10/kII/BA+vk
         c6jxGdDosYJfAzAdgmJYuw+NhzY6voZTi4zEYIlAzCxz4rUPxrAlZX+z6wQBmNAsGLLY
         kaP52H7M28Qv/8vHWomuuTAw9h4PZc+ipoSRDe1VAwpfql3gkNzgLRoAZfbCMZ0UuUYy
         446R1+oKPitoNe5dHo3m1AlYd1SyIBdE+7+Rnw/ZWqQcuZ+7U79u2KxLoCRipforqW12
         I6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399800; x=1760004600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=ZJdpAXguMTwlz+yNzxZc51zRwVSi7RD/dP/6zMo7XKYusBT8G/4b5l1NjNfatyfo3l
         O4k3oPOQwhlahrsBbx/5pvnAjg6MiuE9ZSsHc6rynpGfJVBPSzxU/ojNrBfvQXV+uvEb
         n+QEsr6XTE5BiIU2xb8FAKH/kF1FSN0m46JEhakYmEo6d82wi5Cb+pVL0iYr5JlUpwHt
         1MSbRl8+0KDDF77JATschAym71zN0nx2DexjSwokStwAa3UAtH66ZhmSrnW+spF1BDDM
         sK21Or6WDSdq0zsMuUT8R7c5oQvjKxSmttb6BlnmSnRnE/LwtUOXyf9fChbenYFUIcZD
         RYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDioDQ8sHxeIofyizk2Dz9shTgudGZsCvWKcbQDKiaDqk3xyYJpQyaLaY6+45AKjXDYMiOjXy7tJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw03XkD2Inq5BNfBp9n/lFbuKJ89/0UhJduONgIQu6NXZmzWYYa
	UDdVTdPc1A6wmxoAo6KrWQdX+0M/yZKsY7EtANony3wDCyqU5Y++M7QFn0HDMm0b1fo=
X-Gm-Gg: ASbGncstCsVJqn0LwPpbUk4h0FXKQ++31/wjTgPqrRVbsuqpYA00CdB2ATdzAcHqpXP
	yIvv19FbwZVGslDR+CiNeorIIIQ7OtgqeF1VytEuSZRGhGdNOFQ/8pfFJgB2hUzoiJEJUob+qjM
	uNNeVdpTtPEWvTUcoVlajXHmItmQ95CO7bK/aJBC24BiAyubixg/Gyy1y4XnD9JvxB6ncUfa5of
	S4C4kB6ftttwEWWm4e+sLBoMuagr9xjkgyXnxXegcFrnUCAktTD40EbIFRi12xWA7KChCIso8Xd
	jTsy6wLolpyqQzIMpnNeGAkP48m9YTGYh/heWDIafB5HLiWCM5kbg3JpQwi6oca9bA5T/CXAcjE
	+O3vb8yhihL2850Ls3uHKN7fFgD1ya9s5d9yXQ5pMTc7cXghmjviVfDVLUCX0
X-Google-Smtp-Source: AGHT+IG6HKInp+uRx4lrhBICFNa45XLSFjaTQzHhAm4u0XucfQOV7OmI9NNGmwwxaM0SBXY84aYtrw==
X-Received: by 2002:a05:6000:40cb:b0:3ec:df2b:14c8 with SMTP id ffacd0b85a97d-425577ea4bcmr5328296f8f.20.1759399800449;
        Thu, 02 Oct 2025 03:10:00 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:10:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:33 +0100
Subject: [PATCH v3 5/5] coresight: docs: Document etm4x ts_interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-5-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..0cd83119b83f 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
        value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
+   * - ts_level
+     - Controls frequency of timestamps. The reload value of the
+       timestamp counter is 2 raised to the power of this value. If the value is
+       0 then the reload value is 1, if the value is 10 then the reload value is
+       1024. Maximum allowed value is 15, and setting the maximum disables
+       generation of timestamps via the counter, freeing the counter resources.
+       Timestamps will be generated after 2 ^ ts_level cycles.
+
+       Separately to this value, timestamps will also be emitted when a SYNC
+       packet is generated, although this is only for every 4096 bytes of trace.
+       Therefore it's not possible to generate timestamps less frequently than
+       that and ts_level timestamps are always in addition to SYNC timestamps.
+       Timestamps must be enabled for this to have effect.
+
 
 How to use the STM module
 -------------------------

-- 
2.34.1

