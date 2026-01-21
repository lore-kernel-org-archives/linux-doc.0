Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA143438FE2
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 22:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033527; cv=none; b=mA4WMEMLFcfMq089X3XVXbQFztXqddyuimz2kOu/2Sp9iNZmmxJ9jxC2cXM/9waI7bCOEkaRlyp6fcUVXOkSbvpwJndMZKVqhwpE4/ighGC1IsIEaBXPbcLHRncccWKAs5Z1vlut1IZWLlFoz9gqBbrkjnuywK50sUbwsBLzLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033527; c=relaxed/simple;
	bh=QFGTndIZnCvd5tocHyARHg0OdzlZifxdeujSy28wwJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5LCIIG+/IRfwH+5EgTun3EDeaVWAUb8ZNHc2FquRkMKpxYPyPHxvBQGRnaL9DudqhEnpAGxUCew6AOoeYxZgMI9E6N6ngwtz07joDr9L6symAAnVndMFehCIYoUbkKQ4LWrSmmVQTTboSZ6hc8Ho+dMq0hFOUfGhUkgOOf9ONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTE3V2XF; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTE3V2XF"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79274e0e56bso3763907b3.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033522; x=1769638322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqm0dBa6mjJHml1X9kPKSm15M0oyticD3F9JJwXOMvg=;
        b=fTE3V2XF/rfgkDTJ2zPRvnIk73uupZBp4RuazKysKvb/4LQVJODMvJkjGSAFTgyhQE
         +o4Qr3mXdbLpTlH+cjE+RCIw6jGSqjzYyQJNmdno12VNY3OE/UDwZaOggZ0ZEyqIisMz
         57jizkfkmwQtZ9i2EvNW7PKAmumXp7Bsmxefgyfeg7/Dej/5XyZ0goj9FM9vtQY12cRQ
         bqFM/uSnnryGbWTz0Efz+zSzJ+piIfIU5/hWZH/iFts4L1iGVi9n4tMbvoZMpCUPe6mn
         HPbSPhT7ca8U+rEb5pPitYGPLMg/duUXNWJG/gBMfocQRwE5t3Wt1idyalsbddxilldm
         dgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033522; x=1769638322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mqm0dBa6mjJHml1X9kPKSm15M0oyticD3F9JJwXOMvg=;
        b=tSLkKIwn6nKAMmkQVQXYD9wMLd7m9OnSG9EyugXRGXCYckzWcuSSV69bsQrmMzjKZL
         getABSBmGtTCf8Rs8Zlv4jvK6ZmmQdokXEGkG6s+o9iolggBajl/ubhMP1T9gFJyyqz3
         PnW9VDArCj0KCTxoFl91907TZg6OdNxhWr91HoBjQmxIlDGjAEsa9LE1lxRmMX6T7gMX
         dIgRw65gwS7H3EZENVEhfbcX3vAmlSz5Ce8mN0YzD2Psoft2BQieAm0SPOMAokb/tXrM
         d6axvn2Yrb9TS21jjIzYG7K2ic/6PgywZl9hac3Fu+Wc1KDUP0zZflWKGXq81pjdcnK+
         oj6g==
X-Forwarded-Encrypted: i=1; AJvYcCWt7WnOjlnfLfwbOUG2EuQXEvItNgz13c5RLc247azjfDtv0jS43+6A6uFGQZrh10gI+yFknsV2oPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZrGQWA4mlWZeNhR3vDbFVJNG785+KELEudvs2QEwY69zufTh
	AOwlXsRVpcULtetx1ZdEFi84AdOWAtyN5i4FdSQ9wHFFgzSSRFXh6Uxl
X-Gm-Gg: AZuq6aLad649yqabD1SMT2aEzZwJPXDB5HAkhq/Kx9UOpdH9OSSL27/NoEDKa1+ZX5p
	zwWt3zrPYPepNW4wrBBH3iggWh2TOdzwsnxwlHH5PfRR3PPgVzoYf9AIxs2/Im5h7xi1qodGzO0
	sJ0LxO7AoPgphnnmoJL+avPtGL930xB33ZCwMZef6HgcoO/NCxVT/FvviR8rBW5cum4xWbES+mf
	7Q+anMWfAybksjo2CFvirN2qZS/ZKPzdNSv9SjXfms3OfWu3i3mUhg9I7meKINo5TZT41hxtUc1
	8vvolUoNDxcawIQCgTRgbucxsKB0Gpjaa0yjwhFNMwgIWHhS7gfyTXYcibgIreBVWEHt+Zpp4Na
	Nre5UQpZdO0/SdjT7trkbryWYnRQMzbDbjzDg3NAED0uAQt148pCagqMWmyjJsQnDAHYyi6ODM+
	R9YBEy7UOz
X-Received: by 2002:a05:690c:7204:b0:786:a0fb:fa8e with SMTP id 00721157ae682-7940a11e123mr58055607b3.15.1769033522528;
        Wed, 21 Jan 2026 14:12:02 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:6::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79415015f4esm20243667b3.22.2026.01.21.14.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:02 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:44 -0800
Subject: [PATCH net-next v16 04/12] selftests/vsock: increase timeout to
 1200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-4-2859a7512097@meta.com>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
In-Reply-To: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, berrange@redhat.com, 
 Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Increase the timeout from 300s to 1200s. On a modern bare metal server
my last run showed the new set of tests taking ~400s. Multiply by an
(arbitrary) factor of three to account for slower/nested runners.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/settings | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vsock/settings b/tools/testing/selftests/vsock/settings
index 694d70710ff0..79b65bdf05db 100644
--- a/tools/testing/selftests/vsock/settings
+++ b/tools/testing/selftests/vsock/settings
@@ -1 +1 @@
-timeout=300
+timeout=1200

-- 
2.47.3

