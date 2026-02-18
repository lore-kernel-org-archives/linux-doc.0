Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99629E114
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 19:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771444215; cv=none; b=LfHD102z6saXoSo55BBO7LeB+r1RTql6+0PgKZ9PX2FUKNul++P++llPRNMitmfd4iNRedAWxTBKZKdP0UtaQ4FkT7x9mXe3cXN97Onq9ExObHe3WHrUnUOOfCSHlCJOT9UUVXtQRbymbZNoAKx9WpcBodpmqdE2Gh3V2W94+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771444215; c=relaxed/simple;
	bh=vBUAyAbacjfaRDxMQvWcGcFT+qxiW9zxnAxYnB8luFk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxMkxR2OEZDKobH/B4L4Z1Res/fsx1u2U1NXCb1E9MqahahPxT066IDf/wr0AuMTeKWNehnoB3RSfRVL8GTNvtRYNTvNvNdzOuFTaEh7UElt7IjWyDFvvpZY1eowsp+ph09sEEswuDDc/yKxzYUwlGY+g+5bQQV05+4vmNWCYfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVbuwURM; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVbuwURM"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb3e22435fso98628585a.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771444213; x=1772049013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wD8Ttwe5Tegj8OFrv2Q7m/YBq2wmzpAVQJC0WJWjYy8=;
        b=jVbuwURMGnIT8wZnEoDOKBVuYcPZa0FvLLJWn6II3NWQOwxbE5qA72CQQz4IdD8zD3
         BxCvNxVOU3Ey0PUWpRWCpFpGLiuIv5KY6Tqpv5sOp1RbDihMGN5Qccrs3i15JS/fAzyd
         7OouAo50xoDSMkPYVaLLH6F/7KeTBz02CAQjPpE07IrEneG237rqMTacB/PQ5hydpy/i
         e3P5c2PfOLcgcbCT/LLpjZ21hF/PFd6NindCvhmX/r5aypBby1gIHAjAVOi8QwTyHJuy
         KUFQGdw6hPqTTdTu8pBFlmWErnY4BTq/4bPzcQADZBkSqR0yMwEn6ftyykosbArpKQcn
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444213; x=1772049013;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD8Ttwe5Tegj8OFrv2Q7m/YBq2wmzpAVQJC0WJWjYy8=;
        b=D38BJhCQPCSNdRyvnadd3X3tIDXjr68g8MyR5ARjFDVJrzyqWGljzos0nGTFcn9Hsb
         jMr3gdKHWPQpNar82KlQHwrbbZlcUoREmTYLasV1ntKruENi3V4/KxuQJHRP9p322/I4
         TgO3IXw/XVMwc3nxpo2Kl58MxtkDsbC40DSj6tCObDvvnZbg94OMYZp9RKriiY5pqsjy
         6LXnUw9M134NQCTxnUB+Tum7LFNw0gEIBzT6h8hr9SYjYcabYL5i3lcJAVuoYjy9M8zn
         Osq+6GZ1BkzjR6cWQ0LedHPq6AOdlweGgpn/2WHKbXotw6yg+8SqOZpWqng/c5Sk5YF2
         0QBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmqXVioqKwD198HGaclKsFXwVeoshjVTFSIQ8kbzFpfI6Dxog3DxyjwgYgdIJg3gh02yqx/Bn7ruQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tTUAMZRyAn1k7xgCbB66gEdjdY7E1S8YzHR15tl5akCABlTt
	TT+xPQKXR8RoXm9lhPHewIlLp4sEQSFPXlHzl+7YX7J6xZs0HlMJb7IhPLChZg==
X-Gm-Gg: AZuq6aImoVa5S0hAi/LY7CObUlXGAJItDeRCwXwkF0RpDr1tMnsKzyAThvh3e0LrGL4
	CEmjHTIy2bPHz5BxAZi7L61aRZ19NW5zhWGJ3EQDnJAwDH5xwVEhuS1pU8rtjDbw+/lwLivYqKA
	AwAmmvm5eVdkyk4UUDf2Haa1ycMKXE3Ik+0jC4TJ+OhKZUptulmXTB6xRe36egNiq3/13nf5hI2
	oBklqHN3GnWDk2oGTp3ykGRle2arBB5clUYeG9XPDXOnQ5aEmviQfNFa7tHDaSQVk/fy8HQjCJg
	+9I6789VYgWElEIKO2QYbmAj3szWhxK2S/WH4Sr6BQcWxCW9TwPiCsIwTRQa+32thKHD7fEdsn0
	y1Oqm2NFoZ40BMIiCOa407C0fFqUPs5w7+3TCFSGH5eJK6UdjVMZNwk3CU8A4Gv+TgqCr0uSeI1
	QerUDyGsfpwnOJRv/ImE8MyA==
X-Received: by 2002:a53:b118:0:b0:63f:b605:b7f2 with SMTP id 956f58d0204a3-64c557eae43mr2160180d50.10.1771438271298;
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb1d22sm6051799d50.17.2026.02.18.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:11:11 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH net v2 0/3] vsock: add write-once semantics to
 child_ns_mode
Date: Wed, 18 Feb 2026 10:10:35 -0800
Message-Id: <20260218-vsock-ns-write-once-v2-0-19e4c50d509a@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJwAlmkC/33NQQqDMBBA0auEWTsliWKjq96juEjjWIdiIklIW
 8S7F3KArj+8f0CiyJRgFAdEKpw4eBiFbgS41fonIc8wCtBS91KrK5YU3At9wnfkTBi8IzSm7eb
 edCSthkbAHmnhT1Xv4CnD1AhYOeUQv/VUVE1/0aJQoVXLo5WLNoMdbhtle3Fhg+k8zx//dlzIu
 gAAAA==
X-Change-ID: 20260217-vsock-ns-write-once-8834d684e0a2
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daan De Meyer <daan.j.demeyer@gmail.com>
X-Mailer: b4 0.14.3

Two administrator processes may race when setting child_ns_mode: one
sets it to "local" and creates a namespace, but another changes it to
"global" in between. The first process ends up with a namespace in the
wrong mode. Make child_ns_mode write-once so that a namespace manager
can set it once, check the value, and be guaranteed it won't change
before creating its namespaces. Writing a different value after the
first write returns -EBUSY.

One patch for the implementation, one for docs, and one for tests.

---
Changes in v2:
- break docs, tests, and implementation into separate patches
- clarify commit message
- only use child_ns_mode, do not add additional child_ns_mode_locked
  variable
- add documentation to Documentation/
- Link to v1: https://lore.kernel.org/r/20260217-vsock-ns-write-once-v1-1-a1fb30f289a9@meta.com

---
Bobby Eshleman (3):
      selftests/vsock: change tests to respect write-once child ns mode
      vsock: lock down child_ns_mode as write-once
      vsock: document write-once behavior of the child_ns_mode sysctl

 Documentation/admin-guide/sysctl/net.rst | 10 ++++++---
 include/net/af_vsock.h                   | 20 +++++++++++++++---
 include/net/netns/vsock.h                |  9 +++++++-
 net/vmw_vsock/af_vsock.c                 | 15 +++++++++-----
 tools/testing/selftests/vsock/vmtest.sh  | 35 +++++++++++++++-----------------
 5 files changed, 58 insertions(+), 31 deletions(-)
---
base-commit: ccd8e87748ad083047d6c8544c5809b7f96cc8df
change-id: 20260217-vsock-ns-write-once-8834d684e0a2

Best regards,
-- 
Bobby Eshleman <bobbyeshleman@meta.com>

