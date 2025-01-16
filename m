Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF41ADFE3
	for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014969; cv=none; b=boWjTOnT858+9GLp8+zBh53/iWB26m4FsdNCZiu3vAR4HN4XUBE+25SHNEYEdJQILNn5/Sa0W4hyafqTrajziZ3J7LfTZWpvUe6tEDgFtcV/zugvIZQsrN69OpaULfM5Wf2FSqxqg8dgm5fl3EW0FB1g3aveOiuwQyzaZwdFDOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014969; c=relaxed/simple;
	bh=jRpYSf9eaW+ho0lzpltGMAxASRyw0CEV/6XfYdKY0IY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=DIvSGRrozTjwPAOUKGr/DhWxXLokn2epi/JWmXYvFyb6j8r3JxWuTCnksOHl/G5U7TpZLjSVBPn2UZEjgSoGnRSS9hP1TY3IbPbNgiL41FqLUmcvpvq31RvCt7QCslHPSg5RrHqVu1laUNsbz7mHvwNmdtrz2ELG9nCZdcy3klk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=BHlcto/g; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="BHlcto/g"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21675fd60feso12639065ad.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jan 2025 00:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1737014966; x=1737619766; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x6XeS8X9JmzzO8cEu3bDg1COvcoMcAqw6E54ck6GWVA=;
        b=BHlcto/gWLAIqBZNfkMqUhA+mPI4NKQhTsoJCZMTiOk9VtUeBLCmqL5yB/v9M9oD7Q
         TPeIAH0Befg2dZlnDwB+SSafhD48aEzLLzqgBaT8UU/1IyCLhY9GfiUw+u40HbIINmQm
         pjdb6IIuplEuc97V1WlvFTlizLdCKOsWUvZksbeFsNFOUBCJYbJM6NpXIRWBlG8NOtzz
         FrL7b0Dd94mTumsoh2xRLkISqvdFvyDejqf9fkXkhYZNXqjClh+b6vX5gyyvBL+VVVI8
         /fpoZbkoSHwGO0avrzJgDgA00fHlewUllVjh4poC1LSFQlwAy/O/iofVkBebgwVUyWdG
         KWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014966; x=1737619766;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6XeS8X9JmzzO8cEu3bDg1COvcoMcAqw6E54ck6GWVA=;
        b=MUCICkeOYD7idftjh8mlNnDA05lo3F2HQHvT6f28YOjKZLHrryEShgymrtYdkKFhGb
         eWQ2QjMNnV8lMb+lzJV8I5fT9vsA44qI840y9M1v02Ut9lhHLK/cgcF+XqbGsdpETgd/
         4GGyQWdhmUf5pOXXJE9oRFy7MsscOu3+YavDbyuiG/OayU86VMJ9qJz3FmDYXIwU19Ah
         jnAPL6P4uRSvVkJOjPyNryu2dwVrR7Lo2ORFR22UpJtonLYB+jgS2zzUb0TvSziH1bhR
         13XfbKuM0KX019vZjY54kyrCVAv3Z/tLNd7ZfsuX7X1ewVXi7Dqk9rldINFibqdm5x3T
         LRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIL8YRN9X2ac8DrpNuFGCIODeyOVXNOlGR+vVX8Yf9lDJbODAxZQxkklmdMEjFLwAbE/4jJgsoM10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpsUvSUPeZjSc/VpxNr7JyZbFRh5THqrD3O0KPGhLDuYJKaWt6
	iJ9RaKOs3XbxDPtwLQ9pQH915OGqahiwX3iRf1L6EEAM8g8k7uwnxjxzLjDRlNk=
X-Gm-Gg: ASbGncsFa9EptvYMuQOzQNUvSm2O8TIX0YhZjaO7LO0gGvr1znQjXhwDT1gypcUdbXB
	Yc49mgbzhGYM0Bonj0merio6wQaRsMLirMt1qKGBlfu9KbZ4JShUvICAK04u65nrV74hmG92cvj
	wXlP9v4VUVDnpWbX1C2XrO++nxa3jThopOJSMWwWcIUgT/pdPyAgaBaHUp3htEgE8vWU36SuL1t
	AnHXY0iBWgRBmx6En1Rg9QS9Wapl5363tvaSciuFnp+Vbe07zFIUloaggs=
X-Google-Smtp-Source: AGHT+IHnr5s5lbwKZ8hVxzCBLTjyfZY+984W/EhLpkGsedZ1ouritoL5gtdrAjRGaaFIzstL0hHTgA==
X-Received: by 2002:a05:6a20:3d86:b0:1e0:c5d2:f215 with SMTP id adf61e73a8af0-1e88d18b424mr16255509637.12.1737014965864;
        Thu, 16 Jan 2025 00:09:25 -0800 (PST)
Received: from localhost ([157.82.203.37])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d406a4dddsm10309766b3a.155.2025.01.16.00.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 00:09:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 16 Jan 2025 17:08:10 +0900
Subject: [PATCH net v3 7/9] tap: Avoid double-tracking iov_iter length
 changes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-tun-v3-7-c6b2871e97f7@daynix.com>
References: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>
In-Reply-To: <20250116-tun-v3-0-c6b2871e97f7@daynix.com>
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
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

tap_get_user() used to track the length of iov_iter with another
variable. We can use iov_iter_count() to determine the current length
to avoid such chores.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/net/tap.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index 5aa41d5f7765..061c2f27dfc8 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -641,7 +641,7 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 	struct sk_buff *skb;
 	struct tap_dev *tap;
 	unsigned long total_len = iov_iter_count(from);
-	unsigned long len = total_len;
+	unsigned long len;
 	int err;
 	struct virtio_net_hdr vnet_hdr = { 0 };
 	int vnet_hdr_len = 0;
@@ -655,9 +655,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 		vnet_hdr_len = READ_ONCE(q->vnet_hdr_sz);
 
 		err = -EINVAL;
-		if (len < vnet_hdr_len)
+		if (iov_iter_count(from) < vnet_hdr_len)
 			goto err;
-		len -= vnet_hdr_len;
 
 		err = -EFAULT;
 		if (!copy_from_iter_full(&vnet_hdr, sizeof(vnet_hdr), from))
@@ -671,10 +670,12 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
 				 tap16_to_cpu(q, vnet_hdr.csum_start) +
 				 tap16_to_cpu(q, vnet_hdr.csum_offset) + 2);
 		err = -EINVAL;
-		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > len)
+		if (tap16_to_cpu(q, vnet_hdr.hdr_len) > iov_iter_count(from))
 			goto err;
 	}
 
+	len = iov_iter_count(from);
+
 	err = -EINVAL;
 	if (unlikely(len < ETH_HLEN))
 		goto err;

-- 
2.47.1

