Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1372F21D5AF
	for <linux-doc@vger.kernel.org>; Fri, 30 May 2025 04:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748580659; cv=none; b=QjJyzaehW6Ue07mXXpPd81/3ahEPD+DBGTwJtKatw+oP3LoyQGCxedtYB8dk82bftNak4TqOdAA7GHv3uhVXs6k5xtLyl3XjUEASElJgdMFApaRl59Ak2wtZuUutBgQz+OwXqjeY+ZgZbzIlDGj7dlJsdoGM9gSHQJbl0Km6GIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748580659; c=relaxed/simple;
	bh=Y+hugblmAxgmRkyn2fxyuMLaQgzvEXZBlnk8Jh/v8UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=VHKl6SmdLiE0BPTtFvnXVmkt1NZUdYVWaKxYM7NbI4czWyWSjYGcNRX6O1Y219ODzeZNevnRyT/7A++WhDnhZ8Q7k/6Z2FrYhggpoOkZ4N6k9Ez9I7PyiuzojQoyxQsIq/5VXLLSXg3eOMTGBlSRS198lb733KnhROFh1ngh+x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=HBii2iHP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="HBii2iHP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1163943a12.3
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1748580656; x=1749185456; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/6gL7uu88i7p+1Fmf1z5Sh293hU0sJzRplicMeiOvs=;
        b=HBii2iHPzoj9jJ/IffKhV0roKmT29z+48zVvaXIBgN+JH0g/9B8VdOlUXh0CcHBWgV
         fNbChmEtmX0xPgGFoDX+th4mj21BdMXBc7o11Uyi+Rk30i54khWidHIk5Sg4/C4Kr1xG
         fuCIXBdMx0LmdeSRs1HLQjY67prBjyMOpReJ9PsPO/+UJjyRRowIzbLzb0cYtHLLgf4E
         H2J7MC3Cz4cjzR7Squ3QiLiMjw20Z03sTa7aCO8b5T/3IHoj9YHpE/2ZAd/XtLFi9FOX
         WSQ7ZdKIi7HZN5YALumYb6Kwh8+UIcrxmFazHhR4XP0R41rKbWWgjQshZl2KZ+iK3+zw
         Kacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748580656; x=1749185456;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/6gL7uu88i7p+1Fmf1z5Sh293hU0sJzRplicMeiOvs=;
        b=cCKs9DzdeLsPFMtmkVfJM8+ggyJfF76gptLTNGRrLukAWrN1WhmtQDci+y51X80ml4
         9MF1lyv0mOYe6j8JLsJCLcgZbxpuTLFTISHuf8BvkvElThSUu1KIel7CxX/9s+Zt3A01
         rudP/8BMENTV5sSw7TYY7Gv1/PLIVDtUYe8ut7NyrxgUEVb2rbWkfnHOhnNfRMEvg3VW
         uc2NB3nj1JStzfh00aghPMdwonx9Z71I7+eU1Qqz5XYKPctM0CuX4x+wU8Mt7WcGlbjc
         eEJF5P0b/uJbE0pSu0A13RssaCEPtRlFnX1WmFniLamD8if2YNPNgijaBzVSg+p1H4vj
         IvNg==
X-Forwarded-Encrypted: i=1; AJvYcCW+GZYnb4vqe99OlyUI2Af1uRQiU2c7esIrDTC1C3STxVPDRpfCqBOOKqqYpV2+TAS5wzA+vMafswA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwR+rWy9UpOkMEvi4OOxadgqeguYv0dQGjxihgo3ltzJX2pZW
	d8+Izt4eKdkXWXvneVyQKB1yYdleHj2HwZp49hoXGKw/FGZwAyxy+Xp1KsX5Ph4ZWlo=
X-Gm-Gg: ASbGnctIdJlVo+qhCH1fcxoANoFHvN7U0X7UIyvKmlfWY88NCFWe1W8sWJWktIobm9U
	JilVaJl7/SX5t+LIkUTrs7yaJJoSg3plzC55eu1furdMQH+1+Nt02fRbAJmFzyouzHduP9+BYep
	svZHiO43ksLkPrEAEsRw46n6x8A5t2hw4HttcC165ITkPlRDWDcNRdig6967O20DZLxpwsBh4Xm
	MVhy1TSv20tMFz/VpX11e8JwnMkmbBCoygvE57dGXk4Y8ptTe+YgBx2ui5syEzTC2HnzeF/MdFZ
	Gb/oeTJNW41I1qpPCd0xiwtHT+d2Go5IImtBUctwjf2H85UrEF1T
X-Google-Smtp-Source: AGHT+IEvyG17b9tHV2YruoiWIXuiS1hBS4XsYuWorEH+zYiLpcrIZIgqXit2l5cDU5DJsN67WvzC9g==
X-Received: by 2002:a17:90b:17c8:b0:311:c939:c848 with SMTP id 98e67ed59e1d1-3123efae69fmr3575677a91.0.1748580656408;
        Thu, 29 May 2025 21:50:56 -0700 (PDT)
Received: from localhost ([157.82.128.1])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3124e2b67ffsm426290a91.5.2025.05.29.21.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:50:56 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 30 May 2025 13:50:11 +0900
Subject: [PATCH net-next v12 07/10] selftest: tun: Test vnet ioctls without
 device
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rss-v12-7-95d8b348de91@daynix.com>
References: <20250530-rss-v12-0-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-0-95d8b348de91@daynix.com>
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
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

Ensure that vnet ioctls result in EBADFD when the underlying device is
deleted.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 tools/testing/selftests/net/tun.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index fa83918b62d1..41747e1728a6 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -12,6 +12,7 @@
 #include <linux/if_tun.h>
 #include <linux/netlink.h>
 #include <linux/rtnetlink.h>
+#include <linux/virtio_net.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
 
@@ -159,4 +160,42 @@ TEST_F(tun, reattach_close_delete) {
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
+TEST_F(tun_deleted, getvnethashtypes)
+{
+	uint32_t hash_types;
+	int ret = ioctl(self->fd, TUNGETVNETHASHTYPES, &hash_types);
+
+	if (ret == -1 && errno == EBADFD)
+		SKIP(return, "TUNGETVNETHASHTYPES not supported");
+
+	EXPECT_FALSE(ret);
+}
+
 TEST_HARNESS_MAIN

-- 
2.49.0

