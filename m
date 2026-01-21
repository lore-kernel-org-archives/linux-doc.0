Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A29225760
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033530; cv=none; b=hF0Inn5xAIbFBfFiTKHklB9M5N6sdnk5pDOn9qSBd/+ORIRFPVa9OG3ZOWN5K4S3mYCTsUyMyFRH6AmeLPa6dn8BmcX9u4fON6fQca00OMAO49N8F4o2n/A+U6xiue54uxc2kxIg/IQ1rcduG/12+HHF08EvIfwjcdJ5AArAjDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033530; c=relaxed/simple;
	bh=FRcd1avd4PB9PmO5dQgmUicVEjm2xp4QOwjVLS7lcRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzKY/Dt54Uu9F42yb9skrYiCwgB+Z0F/S3KFrxzOp8bniyV36UcehmKtpXXyX3TJhvKIkR+3M0W1TX1aElc6Vu9f0Z7iTcXtN2lwSiUpbv62G9Cprz2BYphjKh5I6/fOYstlkJcok74LzccGFU9c/r0dnIAJsSB0dfkjPoZmFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBrtJQme; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBrtJQme"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649389b1cc5so401760d50.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033523; x=1769638323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I07oD5ozWqHJLvu76IbvCT33HoDsgDmgjc920I58eyc=;
        b=bBrtJQmeE59NXHhsCJs8WCLGtuj91JCF2az84shVTkEM1UofTqyWeNYgT6szujrisB
         gAuWbl1dCQjjBtACh2BEzez10t0APvdfWCrc7jvJTEvQ9MustNZcNJN3M7zAL3naD0VQ
         ZWokXgW6cf6Vdn7H48GQJyJh02hnuz9TlgQ1yIlK9LuWMg22m+h9b10DZHWu6bbzNRhE
         Q7MchC7NftuW1V1oYVPG68VHBM1nXUNblv8ou59pG66xbsl2dnSmoXFybBh+R1/eObY5
         bPbjjC1LauYK1PpmlJwxAXtVaHJrI+eFbEVtD77fIOUU8kuvo+mhojVupIonbP42xDI2
         fI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033523; x=1769638323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I07oD5ozWqHJLvu76IbvCT33HoDsgDmgjc920I58eyc=;
        b=HGjsLLKphgv7ufpBWddQfTJoZljwNrfT1doAKYeU05By0rvTF1zIJG+9DnUvKafSZ3
         UtBB+5GsC7gKve/9dh3H2p+CHD+imrx+X4nlqSxIGiHoetrer8wWrEUpE6UlYyn7eReV
         oJsZfF8LjmZFFAMgl9we3P5/cgk4KJgNpx6J+BZbZVFtJXjLow/D6QNf4m4MXY19WtFc
         9AE1BzVqrKVai1x1ZFfi9sRxy3gc6JuWdZQoQE85EAMMX7zriONg5l4KteMNps1AD22d
         DjCqrsybcUCPkZ0+IEfNXk1q4ACjrURTWSYLqZ7gJ2DQc9P3FDi4YU9gtGNXMMzJWDcF
         Jfwg==
X-Forwarded-Encrypted: i=1; AJvYcCU8elgZCtCJwrEXqZ9urt+EpEDR20m66Fd8UAhFA8sevlAAr87feRc+c2YZLzIwcd2Rc+6U6J/adfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNWd1nRlCaRQbaKGqJoUmQ8fyY9Do3EX40fZDyiiMa6GDAmWt
	AMwhzTzOaQXvCdT7aGZdsu5L5q2P8R3nDWz+JE+/deqTBqGsEwvNG5qq
X-Gm-Gg: AZuq6aKpM4ZJgc1hAlv2uo43nePqDtDQ+uARzPuvYsjUa7JGxiHipKtltyCYj0FzhFp
	uaTEFZghp4z+ZHmtMT06LABIKUmDhArrZWiiZhoQH/mfuudNxxdDJBwG6aws5q9TjkXs0c+MrhJ
	Vv7To+fnk9i01aHdVxyACdH5BtfTvlN9lJ6OOJ/TmvzAVeVYb0EKiOkL+64Pl2CPn/a0ZFL6ajq
	1AHLweGKTh5GUOMi3KYgz0ma0+Yx62el/cGKOwDlbB5En7zR3VejmTIV2jy1TIud2Js1cuCOx3J
	o1C7IqRFFprT0bQkvTOnyjDAytlmiipoz6Q5VRu6T9lBO+2f2NehefeBYJAZ+dEsWHkrJpQQGRo
	Lrdt6iJWtpswBSH3kVIs/XXeS+Gshn6aMKS7NCVqsGucPA5/iDSeZxjIaQPdCgtVt11hgNRQAYb
	Tg5ev9ZW4Juw==
X-Received: by 2002:a53:bc8e:0:b0:641:f5bc:6960 with SMTP id 956f58d0204a3-64916510381mr11289328d50.76.1769033523366;
        Wed, 21 Jan 2026 14:12:03 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:49::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6494080138fsm2463373d50.20.2026.01.21.14.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:03 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:45 -0800
Subject: [PATCH net-next v16 05/12] selftests/vsock: add namespace helpers
 to vmtest.sh
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-5-2859a7512097@meta.com>
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

Add functions for initializing namespaces with the different vsock NS
modes. Callers can use add_namespaces() and del_namespaces() to create
namespaces global0, global1, local0, and local1.

The add_namespaces() function initializes global0, local0, etc... with
their respective vsock NS mode by toggling child_ns_mode before creating
the namespace.

Remove namespaces upon exiting the program in cleanup(). This is
unlikely to be needed for a healthy run, but it is useful for tests that
are manually killed mid-test.

This patch is in preparation for later namespace tests.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v13:
- intialize namespaces to use the child_ns_mode mechanism
- remove setting modes from init_namespaces() function (this function
  only sets up the lo device now)
- remove ns_set_mode(ns) because ns_mode is no longer mutable
---
 tools/testing/selftests/vsock/vmtest.sh | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index c7b270dd77a9..c2bdc293b94c 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -49,6 +49,7 @@ readonly TEST_DESCS=(
 )
 
 readonly USE_SHARED_VM=(vm_server_host_client vm_client_host_server vm_loopback)
+readonly NS_MODES=("local" "global")
 
 VERBOSE=0
 
@@ -103,6 +104,36 @@ check_result() {
 	fi
 }
 
+add_namespaces() {
+	local orig_mode
+	orig_mode=$(cat /proc/sys/net/vsock/child_ns_mode)
+
+	for mode in "${NS_MODES[@]}"; do
+		echo "${mode}" > /proc/sys/net/vsock/child_ns_mode
+		ip netns add "${mode}0" 2>/dev/null
+		ip netns add "${mode}1" 2>/dev/null
+	done
+
+	echo "${orig_mode}" > /proc/sys/net/vsock/child_ns_mode
+}
+
+init_namespaces() {
+	for mode in "${NS_MODES[@]}"; do
+		# we need lo for qemu port forwarding
+		ip netns exec "${mode}0" ip link set dev lo up
+		ip netns exec "${mode}1" ip link set dev lo up
+	done
+}
+
+del_namespaces() {
+	for mode in "${NS_MODES[@]}"; do
+		ip netns del "${mode}0" &>/dev/null
+		ip netns del "${mode}1" &>/dev/null
+		log_host "removed ns ${mode}0"
+		log_host "removed ns ${mode}1"
+	done
+}
+
 vm_ssh() {
 	ssh -q -o UserKnownHostsFile=/dev/null -p ${SSH_HOST_PORT} localhost "$@"
 	return $?
@@ -110,6 +141,7 @@ vm_ssh() {
 
 cleanup() {
 	terminate_pidfiles "${!PIDFILES[@]}"
+	del_namespaces
 }
 
 check_args() {

-- 
2.47.3

