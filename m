Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646883;
	b=0tYnPCmhti9BGru8o9I+6KDmsnh5kv06v9eGAkD6eukK0ulRWMjLsGVqTbn1sW7ZjSrW
	 iay7Ojp5YKb+dHYw3MoYlYdyuf2sNKj/yH7IQ6IBMjj+wzoxx68uXVgmScsGJ9VWyEKfk
	 Px+8Vzzj5eG9jfT1Hqc0tWWWdQc9pw4/uOUT09O9KAzueCrcScvyP1EEennI4UdxVBeOT
	 7fK7iZJgjlv4xLWa0q5IG/ciqPYt7oNTEY1H7BwKtcnv8EbutqjCnMdfQa84JNR9J3vkU
	 8rwIXvjyOIA3yPOuqHx43fUm54xuRAN+Boa3WEAm1TTPKc1nF9yJxIpjPd8OYiU97Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
	b=dfoubcVYwiZeOy2GzxKrFButhvJ68qXj+Xib+GDbhcla2srtceZJyhhyvbSod4XTw8PR
	 JTarxPx2mPeHGF/nMgl8V1gU0RNCpoPKSWADwlDL9u2vTFfcUHV796J2PCcKO/AhZz9tN
	 j7upDbulm/0RdvsOyCDBJuspxilEUi46ls1YzZ4Wn7RykiCHWsRj0JCmWExdzUVmjKIZj
	 zx+tG3pEjKVKkTemk4/xIlOC+T5FE3AEGQBWGrMBaQnx6Tagd/9sVZCKuVURyK1w4zO/s
	 2FdYBEBzvFVhshKYQ1cGk01i3OOso2n5PNmkp8YC7dx6byluHIBSvJvuRVp1qb/ZgrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j;
	arc=none smtp.remote-ip=74.125.229.138
Received: from mail-dl2-f10.google.com (mail-dl2-f10.google.com [74.125.229.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ED3606D822
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 19:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83ED3606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IhiP8h5j
Received: by mail-dl2-f10.google.com with SMTP id a92af1059eb24-143601f9f98so890005c88.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 11:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646883; x=1794251683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=IhiP8h5jzlmVlab52upLzwlOFij5iekEIG/X+yYfMJG3DW1rdsi4zAbXqX2qE1NgLu
         JdBpIyjfMkSoEncClqlyb/NpnB0PAOc3LDyPl6zZQ6q0wbOlm1d+/CVNbScLvG1z6sxM
         i/HtGMFHaaYHwKydBo3RF8fpo0x9IWf/CCQt417191kH9vwvO4fL/HkwHY1G4fXwz505
         V/Pkctgjr+J6Fprs5cmLUlEdFgPYno+VvEoPo9SVJosTUo/rIBV0RTAPhAJjEeIoWzxB
         +K8n6+YCssxKAswNrAWo32Hkd8dEq5TMp2WfY7UsPeLV7QucuSk+d/u1UkcvMprBCBBC
         5p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646883; x=1794251683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVsuCPHQOVUX+J0ERU9EzUWJOblLPkY73pQVUzYA+s4=;
        b=uH91WhOvZ6K8HUa/Nho3G6KRh5aC1NY/vLKlo+xNAHdMwybho6CX6GbeYtEgt3exBH
         ukGx0tb+kpgc0CuTqhtf+7bpMXpm7RxdWsOX+tX2Os4DHbugRrmR4rhqgev4ESmD+8WJ
         dzhHU9dHek8KwFBN27Nz7Dmi+IUlI096ubE7YkLM7lmtZ8Na4HOnJJyuuFURGQkv+G5s
         9ba2lBVDxM/EJmjfcxAD4aQ4Qz/mhh3ZqhCvl5Tzf+CpwgqPlfCxnesDvqk3Beae6QtQ
         pvFLX1VM/ZVTqcFhmcxABuEfcpx+PumrOQDjUVNjDjvqxvxSeD8Rqsv9MD6eLAPGCms+
         bSlw==
X-Forwarded-Encrypted: i=1; AKwUvBxaO7JBneF+J3Px++Rvv3fb1rlyAlfpiEW/r/FBjnicRkaTYCUnvG2IBT0L1/5/6jxstYMCYMaqt9M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXK3feLl6jl718RZEg1Wj5tDQUkuOm5t5SHi5StpkN829YvMbY
	KgxI2PKsjrS2HhUQvezNUCecqeKBaTYRjx2E9H07/L+X6ayid/nBDZL4
X-Gm-Gg: AYBFou2kR0EByXuPQoa5Xkl7XQbDf6nCshvvt1Hkt+suq0TT8qcTjEeLlTKmP8BgunT
	D3BfZMZoeikmDGWDbjZVc89RABeb78Yu7AdGSr7TcR6kJuShH0yBv/dO0Ip9HmdzpR8KeOoxvjP
	jEUqsnTWHBuNXfjGql8vClXKEJoSXHdPkbRDy84VplMBLLRDf3st+j8StD8fx7AttRLWT478O2h
	iRwJeiLqXE55t3Zd8YQvBigz6v92Wbsn4nC+lZXhYUYmPdWVsRUhamIiLSDma9rlDzTrF5GQlPH
	2iZoCwG/DbzSiBENX2CVvFO2j7TLDe8OkSDlsle0oTEWhJ0WapgDfAcsMIFtHPmw6++XgRy7pDC
	hNy0ogiOwE2Cxi9X6/3lwYpp+oOCf24yCIxNsgK5BQtqYGkgiimjyaO6FnPK8bOunOyz48wLZYi
	tltlFk4jUUxjIEi3BhjPoGmghbYj1vIEaLrumy48poRi2XKfxWMp0JOjmJ0Zfo7jERgAPNTcuBo
	3n7Dz4bS3BP2Lj2SfdfLTAil/CLQ3u2slB2hfKdbcA/lhNf14bwH+uxD4zQR4wLsJPCuY8Wn8oq
	ipvBq6v4WWAbfe+gaaJMyGM=
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr15040908c88.31.1793646882743;
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm36444456c88.12.2026.11.02.11.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:14:42 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	daniel@iogearbox.net,
	razor@blackwall.org,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Mon,  2 Nov 2026 11:14:34 -0800
Message-ID: <20261102191438.1059771-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
References: <20261102191438.1059771-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

