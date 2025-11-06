Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF5230FC16
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428870; cv=none; b=h7tTRPMgH0dHqOlevbjLmh/3tUmEwp8buC7Uxu+sY7UE/kaJXNnXs+0c3i6+IvTpYiicmDxvPwjpK7fOE4+BcUtnJZhaucUoGqC+rGQYVoRqp5u1FvtzNbiZEbwnG21dvAPq1dwOD0q/UU1YVSTLknYGTu1R95gR7I0CxAGjuyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428870; c=relaxed/simple;
	bh=PIBWvcOGx3E+xP/X3olfKFhREo5MtRxZEreOwnQfuac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVhLH91/gvIill7Q1O8edP7M/zvVyJk+OSmAadkoo7zEgxIKj9H9DVKGkyBGr2Hb7aEitcmLRhTS92M01RB2n5FJY57RZ5LcIn26SPqXmohvn2Q9Hz19EdtIjQOA/6qo0c0p0zskBIAGBv3+uofOcUePFZzr2E0+zDQKD/JQT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NcFWqOl9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NcFWqOl9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429b895458cso499188f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762428865; x=1763033665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E35Mfd2KNqwL4ub0lUAB0tH3ZBUXTYukyrKrNsqdkLg=;
        b=NcFWqOl9r333Pqok/ihYQny+rLcGkFG+15+RjfZK4k5jL2LOod9I0U3oenG/2IxDH6
         /WzC3btXr+PBscIMNTlXCb7n2MzH3pHOTwZPLMjTaomVXGksROd3U6i6dU+6StMJ0ki9
         tPcKcVYC9IvnvG7UcYg14s83VV2SLuiCYsXqj71EF30KU9rmNHieoT724naJOb7kadcR
         fWudniu9W0Ga11Di/W4Z5oeIiO9fgZwi1nXaK+aH1KbkoeGYTEBZ+nNbYVEwwDCe28Sj
         qY7Ew6maSzb0UCWgzeGCffr6Mq4+bcvIBtxa53h6WbtTXvEEp1jdoetdBvZ5/1fViMel
         ZC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428865; x=1763033665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E35Mfd2KNqwL4ub0lUAB0tH3ZBUXTYukyrKrNsqdkLg=;
        b=EaOngbr4JbjX+SIkHVJ/WPxoQv5MefiDP+aqfkx1fhhW+eQ09qid3EdXo63A83QAdg
         vnCcNjaOXpMylTaEvPjXLnNSyekO/d3cm/drYmh+back3d58CN/CE/7cNah5c8u4yg8C
         7sQPoWtK6WVHDNE/4uCInH1IYEt9FRi4LL8jwcq96HiyR5W3nnTt4XCE6GXPR99Xkxsv
         oeeW2fqFZpHdGzxCNer8xXu6jOF7zsX4kwFAV+VrKpjjuPMyTx9PDG6khnJawRdySTpO
         EIrPWNS9EvurARK1rdvj3/bscuG/PpVUbhufyMqV/X7RDQmbdK39k3lqgE4+HPNdu9DX
         thfw==
X-Forwarded-Encrypted: i=1; AJvYcCUAX4vD0tQ7+amzHc0eQdT5MtOAhZHLjEaGybnnuHUrK6OmCcrCVKNpjjz5qIePhM9ELHMUfmBmo0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTHrO8c5IFIEPD9Y6rNLPFKlpVL8Q/ChSs1jVHYOvepJkJP+yh
	ruEqjlgvn457MSrogMKqA+m3zxFPMs3xj9YlLXyzDNzlywaJfAxC3qrjk6V4W7yxDOg=
X-Gm-Gg: ASbGncs+BTyjd7Ir5mBHdJ/5Bv/c+n0VizapVH3Ex55WRNxQlWd1GYWDiRw115gXpbK
	516tnqBqJP8wNi8TYguivxzR0H/ml7kg4RCZxqdpia7Wun3w1pXMx9aIPIMDO5gjA1D0lxUnqKp
	aOgYmOYOu5LkDK8btYmAAlhB9rrsXcKx5ilV5FuRgHX33yobY2SsoFd9rWLnAAxZ3mLqy4Vh4bR
	OqFtk7fd+yb+uqOs6OwRF4037JPh9qGA34Up7hACeQ0cJDALNSt/YsBLCV40RiZtCWlZa9z7im4
	DGbiTzJ3cgmEh5yDCxIoGvIgu4EvsDSWheB1FMiqBzoqXvdbMSVHpURSSZ3I3H4pDMH2qPzwRF8
	kUufUFzedgTu4fwq/mrbD5sXHEXfxRm7iUzP24LD787G6s2Jtc9lO5gCqlmLNOKdwGVIQAPQ1wC
	oxK2M=
X-Google-Smtp-Source: AGHT+IHDM5uqH1lTlgiy0gZ816Y7mB6+jLC07Q9PnHKX8SPeCtEMPy3MUZ3C1t+b7c9r5af7/R+E2w==
X-Received: by 2002:a05:6000:26c2:b0:429:ca7f:8d5a with SMTP id ffacd0b85a97d-429e33063d6mr5764505f8f.37.1762428865104;
        Thu, 06 Nov 2025 03:34:25 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d9de:4038:a78:acab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb40379esm4389459f8f.9.2025.11.06.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:34:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 12:33:57 +0100
Subject: [PATCH v8 01/11] dmaengine: Add DMA_PREP_LOCK/DMA_PREP_UNLOCK
 flags
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-qcom-qce-cmd-descr-v8-1-ecddca23ca26@linaro.org>
References: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
In-Reply-To: <20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Udit Tiwari <quic_utiwari@quicinc.com>, 
 Daniel Perez-Zoghbi <dperezzo@quicinc.com>, 
 Md Sadre Alam <mdalam@qti.qualcomm.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=volqknp+tx0DItKfWFGksTYs/5XlskO5EOEiP7Isvj8=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDIe7fM+c6JThss78x6vFh67ENkGcKNWIMXNcj
 X7Rggt+weCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQyHuwAKCRARpy6gFHHX
 ciCfD/9ei8LcK1XMguZ2IjfIqPhTMMGAbmKjNvxM7eObMolTj7QBpBl4m6HwxEv/0HdXNH2HeK8
 MYrXkvyal1PtKeLK8MfXp0ZzAYAgvLBP+zhuPgEPaModgpiBR/kF9Zp/s6Hf0WVNcBHSlnwVMYo
 vwC6m8NamT36XqYB0maSjgR7GBFnJzI5YJZgpsglM4ap2k8fnojDPXcsao/pZ9BnSbWHlnVVk5Y
 DaMK0Qm7Grwv8674u9WPnL61uym5JCOR2DfurBF2idRACYh8F1eyGsLw+5nIUzlJ3hqVyLzTOzH
 AIAUh/el6TYZ0fTiHWafoisPCH9aujx6UqN/izHt8CA4mOJOd01HGV6Dfh6g+xFRXzfvHCpEqEn
 CoIS7QJyP5kpmufuu/IB6oNjAjPUIo6MSf+dKBm6vZFS3KL2Xkng0+qAcvCVdRxTR+WGi1sfIvX
 pIyuCw3QvcBXusr+zfOJ+jCcJ3FttwLtpMuqWrHKAhd8M+YH0EvT4xHG680afaW1MvCc+ZpiihM
 ZFooTzcqWsxm1t5lgzYcTts3Z7gWgkATCC/a8FzUoJJY8F2wIGeMExtMxBBdbsfryXJki5u328Z
 Ugf1XiQoKrAhc6iVXtlYWXJkvmJyRyOJ7OlXgKm8kAqVHyxNBiBGzROpL2zfAMWPdOGiB6e6/8j
 iFTOi+F1sdmtt9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Some DMA engines may be accessed from linux and the TrustZone
simultaneously. In order to allow synchronization, add lock and unlock
flags for the command descriptor that allow the caller to request the
controller to be locked for the duration of the transaction in an
implementation-dependent way.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/driver-api/dmaengine/provider.rst | 9 +++++++++
 include/linux/dmaengine.h                       | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index 1594598b331782e4dddcf992159c724111db9cf3..6428211405472dd1147e363f5786acc91d95ed43 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -630,6 +630,15 @@ DMA_CTRL_REUSE
   - This flag is only supported if the channel reports the DMA_LOAD_EOT
     capability.
 
+- DMA_PREP_LOCK
+
+  - If set, the DMA controller will be locked for the duration of the current
+    transaction.
+
+- DMA_PREP_UNLOCK
+
+  - If set, DMA will release he controller lock.
+
 General Design Notes
 ====================
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..c02be4bc8ac4c3db47c7c11751b949e3479e7cb8 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -200,6 +200,10 @@ struct dma_vec {
  *  transaction is marked with DMA_PREP_REPEAT will cause the new transaction
  *  to never be processed and stay in the issued queue forever. The flag is
  *  ignored if the previous transaction is not a repeated transaction.
+ *  @DMA_PREP_LOCK: tell the driver that there is a lock bit set on command
+ *  descriptor.
+ *  @DMA_PREP_UNLOCK: tell the driver that there is a un-lock bit set on command
+ *  descriptor.
  */
 enum dma_ctrl_flags {
 	DMA_PREP_INTERRUPT = (1 << 0),
@@ -212,6 +216,8 @@ enum dma_ctrl_flags {
 	DMA_PREP_CMD = (1 << 7),
 	DMA_PREP_REPEAT = (1 << 8),
 	DMA_PREP_LOAD_EOT = (1 << 9),
+	DMA_PREP_LOCK = (1 << 10),
+	DMA_PREP_UNLOCK = (1 << 11),
 };
 
 /**

-- 
2.51.0

