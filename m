Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDF91DEFC5
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729571; cv=none; b=KtxlheVpKVgZ1CZ7CDPGst3+JCm1ua3pyErnTiCDhBfDFcUtQoIjRpdX64SKv15kngAtzERHqmEOZ+t+eynlKHw/mVq6Js4F4/B4E6qgaWI0tewVSa0BGSp3nYD0PkU0JYd4tNS8bAwg27vOgFO1VkKT3N/lirXcmPdFm7pH2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729571; c=relaxed/simple;
	bh=nEE2/C77oF+j3LxMBPOVoqrwqXRBAnjdJN3gCt7XvfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=V1y2KC/d5CdbWMfZ8aT6LVQ9uneFmssX6psfAD7YggpjyrjiB5QryIPnZ9ucpTax4Oo33tmRD4ssyPmON2wHyO7dLDZFVwXVaY9+zCb+F/zwEgEDCc00wh7H9G0xZBf63xhfAJrlz7XOi7fLOS7avX9tskZhPIqthBhlU2zBDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=rCVknn+e; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="rCVknn+e"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2feb9076a1cso1714900a91.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Feb 2025 23:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1740729568; x=1741334368; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/24Tf2dJCQDhe+eHaFoVGEomrBLp8dkxojt6Qs+7G8=;
        b=rCVknn+e+OkQz9SUULOPDMPYr5DJnJsUbozQMjF0rkG5rVIGlwFbq8tUnyAf+Iw1fg
         2taTxmIDbxWAkvv+2d9GSWMoi85DrNyK6sRQIMCJOY4LPcUac23QR2M7Zg+1ICxMzOQa
         eAZ5YsXwOUU6whCx+MfXO2Yfp+pVHJO/lbrN/y/aS5sD8zwQZLLalpM+3hV47HkSeapa
         axjx0VFMmNS/9A01+gY1vrBE80hF4uIhQ23nEWcoMYODYZy4EsqArgKWcuO9v+YB0PUM
         iVlXAMTzmfbbnyuz80Pqo/y/31RLQiIRfO6b/tTHPxn31grYWHvlH6vwopZj2GAboSlX
         ZEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740729568; x=1741334368;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/24Tf2dJCQDhe+eHaFoVGEomrBLp8dkxojt6Qs+7G8=;
        b=af+v24DNJ9CIeIlFKJUp8ZTpxnjD3uwcZTDRM1ysXfHb5pIMBlpgon6q69xXDFqTZF
         BTnww2zYeXcp3K+qGm+s9hKeYn7vu0Y6Md5mit7URd13mKjj00TuREhtijLoxu/H3WF0
         8zIq+gKMS+qqXmPZv+zPsNdGm10NnAyyYWfKyW0he4cyBbbL3EHUpFvweUefQf3bYuIY
         tvmCLADExQ7d0AUWkx5u6aEsHQnAF7tVfLv/fNZrEBX93t363fio/0QagIygLOR/armc
         5vH+i0q7IsRVcn06Fo8vS4adDGqdvWRFRDF9PuHS6s7PV923285qlQrlrbHNFWxD4VFh
         h8KA==
X-Forwarded-Encrypted: i=1; AJvYcCUAzp0JDq1wVd6FAQLxhjfZpYJWOuBelvnf6U9Uyj4RY3TLy5s4ALWL3mjY8Pqo/49Fhf/PL0uS1Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRnv0ks8jsB2YIcIeYiz1uvidY3R1taWRt5Ns/L0Lx32s7grlc
	DApPllXuztl5ULivXWRTMH4fB7EZPf1okVloiT5sVDkiHNYPXS7b8G1GSMz6l9U=
X-Gm-Gg: ASbGncuJZdNeGL4zTRTRfD+Ee2mfSU1fIEHlSe+J0IOjgYxl0GKQnYq5FR2kHW0YRJm
	e+Mu6VDsAObv9N/bmrpnr3fEtu1QybR5crtsmkMfJesJRn3AIeYs/Ics+Mn7VPVFW0m8XOpbsvo
	C9lJPyEF5wxiaWofC96XMeYdgEUMlxtMYKezIK3eY5OY2L78f2sh5ahb07tDKi8HlHIpdWrTmpu
	0aQS8KTXid3aPpP/DktI1H+QATMdgEOlJcMlelHzTR0BSyUDi30T9WZmEMRGVM360Xu3lblBh8A
	jIPpc8iBRzUERTS7xItJ5wjkpbnIjA==
X-Google-Smtp-Source: AGHT+IGakArRWPozSXDLt1J/ZIr5ZW8i64CgVAq8BmJe2fBTFkpotPO0s0B4850yKyMXjttbX+FZIQ==
X-Received: by 2002:a17:90b:3845:b0:2ee:c9b6:c267 with SMTP id 98e67ed59e1d1-2febab403a5mr4261783a91.9.1740729568382;
        Thu, 27 Feb 2025 23:59:28 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fe825a9681sm5223275a91.9.2025.02.27.23.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 23:59:28 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 28 Feb 2025 16:58:50 +0900
Subject: [PATCH net-next v7 4/6] selftest: tun: Test vnet ioctls without
 device
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-rss-v7-4-844205cbbdd6@daynix.com>
References: <20250228-rss-v7-0-844205cbbdd6@daynix.com>
In-Reply-To: <20250228-rss-v7-0-844205cbbdd6@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14.2

Ensure that vnet ioctls result in EBADFD when the underlying device is
deleted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/testing/selftests/net/tun.c | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1be1c93adcd6c2f07654893cf97f8..463dd98f2b80b1bdcb398cee43c834e7dc5cf784 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -159,4 +159,78 @@ TEST_F(tun, reattach_close_delete) {
 	EXPECT_EQ(tun_delete(self->ifname), 0);
 }
 
+FIXTURE(tun_deleted)
+{
+	char ifname[IFNAMSIZ];
+	int fd;
+};
+
+FIXTURE_SETUP(tun_deleted)
+{
+	self->ifname[0] = 0;
+	self->fd = tun_alloc(self->ifname);
+	ASSERT_LE(0, self->fd);
+
+	ASSERT_EQ(0, tun_delete(self->ifname))
+		EXPECT_EQ(0, close(self->fd));
+}
+
+FIXTURE_TEARDOWN(tun_deleted)
+{
+	EXPECT_EQ(0, close(self->fd));
+}
+
+TEST_F(tun_deleted, getvnethdrsz)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETHDRSZ));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnethdrsz)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHDRSZ));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnetle)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETLE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnetle)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETLE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnetbe)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNGETVNETBE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, setvnetbe)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETBE));
+	EXPECT_EQ(EBADFD, errno);
+}
+
+TEST_F(tun_deleted, getvnethashcap)
+{
+	struct tun_vnet_hash cap;
+	int i = ioctl(self->fd, TUNGETVNETHASHCAP, &cap);
+
+	if (i == -1 && errno == EBADFD)
+		SKIP(return, "TUNGETVNETHASHCAP not supported");
+
+	EXPECT_EQ(0, i);
+}
+
+TEST_F(tun_deleted, setvnethash)
+{
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHASH));
+	EXPECT_EQ(EBADFD, errno);
+}
+
 TEST_HARNESS_MAIN

-- 
2.48.1

