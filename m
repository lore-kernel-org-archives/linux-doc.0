Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EF37BE60
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886336; cv=none; b=CTM/Ib/6Z+CayrH6Kc1UjGZy/BV1L41tdx3Mx02W266YW4ZO7tUviCRDuewuejS6X168paXA4Cq8HTRoq9SNboeqLqUNDh+E0DU1UNKrmE6l4Ko8CQoTid3CiC3FxKCjXY42aQIUUZDvVx4EfDTY7KliEsut6GE+SB2kSHIeyCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886336; c=relaxed/simple;
	bh=H9xSN+o2u3DPOyU3qSAxjvQ1NV6WYvyCbOgeBvy/A0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6JWg2RVotdPHb86s9PopuOUkLuHG9V/QTFKvcCk1bmBPCzUzoO9nk2QGRZHAyKZsDGybzeCZ4S95u5hGChoqUgMBu6+IwDTVTE4z7UlnZ+AJW7c8NARLonDMxRXjpulGtikyRZmyT6yEaX0eDTv8DaynHkO2MsDSihcLdAqNyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx1eohyf; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx1eohyf"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7964f1405a0so48798297b3.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 14:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771886334; x=1772491134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6YNbaSbY/a/RFjAEl4EW9IaCZutb07kY998isXwAsE=;
        b=Fx1eohyffkGHHbjY1dC1zf8vtzUj9QGwo+dO7ADM9n7bciwc6Gs3QCRY5g+VKISPfW
         gRrQNpKubUfNLy79WSE7xzVLcjT7FAUXv6YMMkfD2zu05cmy1TuxR/0JDfnte8stKX+x
         BCSKbxdhbis5kVe8HLrEEMI3jXoHZnOv1AUlm0jDDnzvOM1wdcSlYf74cj1Pc2n5EoJ6
         rDnP2pR4f23rWOJSQ04z+a0DUsCnqC2voT+H7P4dQ3AClHJ8fgtUoIPL4nCS5o7pTrMe
         zXBSI5hiQ5yW01d0ytFJ5bF6wCcfUqJxL2J9HOltbdxKOdeYx/4pttsuKqbJholVz++/
         6T4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771886334; x=1772491134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M6YNbaSbY/a/RFjAEl4EW9IaCZutb07kY998isXwAsE=;
        b=jZRFUcmWfHMRyuDtFt242dgThEbfR9fh+xES0nQ8kdyH868F/FfrGDZgJbSWDTIkBh
         1Wf0q7D7JRoCyshbEY5q46vkMLFIeLdEzTAUb87uADB/n5ZfFwSw23ouj2+mOER4RLyb
         /JyqaUrU7YMUEKeiGwNTgkWQHnoJNqg1AnkJuD1EyIn7IDyrFOA+WGS9lo/+Q1EfphIc
         gFFO6QJw0htaXFNKDesTQT9feCNQuZ281I2vd3X/WWaN7Stku/H9aml+8ecjRoItidPf
         7d9bjVDrQOjS52LGQOmTOikUc304Dkd2ajZPuVnO+aP+kwqMUZf1JD/7PsdJfWfDJp7J
         ngdw==
X-Forwarded-Encrypted: i=1; AJvYcCU6D5S01VDUICDgYMATu98YAhAVnkrI5S55PVSOnpOfqCKXmytb9buecFvqS/5pYsUf+CpPf/WbbmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzOK+7DGCZb5J4YI0bEax5Sx0PdWifzbr5SAvq+37SM9miBvn
	ACYWW+h9Uo3M29EPogBA8hMHp2OUX2Fh8FbRJRQMZqO1BtWi1t5sHd2o
X-Gm-Gg: ATEYQzxlUAP2v28O73m9JPgm8DXFgn4yDg5yEAy999casTS1Esbghuj20O6GdsBL44R
	zPm262xc2681S/7Lz1loTm8UPcA4h41Q7i/KMZTjqbJhf5qaVGhZrb42L9x4XEk4HohGKgl122/
	4czUsZiXiODqelcKQazOelDpaAw59MKVKjlCaP44OCQEwPa6mPnjvbnFv58xY7IF2i49MGW96gG
	sdLp4rFtg7brRIEqMJm1h6zvSGR91hAhsiIe92eOBlHhNFRV+7+NlqSxP/M909gGlRm9hGrhb03
	2oKHlTN2LPP9GU1S6vc+SmHX4wswwRc5ooWOSKQw2Wimn5rGvF9Ho0noTEvfG3yTzkGGFExML68
	XAtXWbrRQukxUahYGbM2D2Wle5eyTUfkK7FC5Sw5u58cFcbgzrcC14QCfjT5iut0FsLYgIYVUvW
	gBwxFA5LNijzYUvkapyZQs
X-Received: by 2002:a05:690c:6d91:b0:794:baaa:cca7 with SMTP id 00721157ae682-79828f1e7b7mr96957847b3.20.1771886333827;
        Mon, 23 Feb 2026 14:38:53 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982ddccc24sm37639337b3.40.2026.02.23.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:38:53 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Mon, 23 Feb 2026 14:38:32 -0800
Subject: [PATCH net v3 1/3] selftests/vsock: change tests to respect
 write-once child ns mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-vsock-ns-write-once-v3-1-c0cde6959923@meta.com>
References: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
In-Reply-To: <20260223-vsock-ns-write-once-v3-0-c0cde6959923@meta.com>
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
 kuniyu@google.com, ncardwell@google.com
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

The child_ns_mode sysctl parameter becomes write-once in a future patch
in this series, which breaks existing tests. This patch updates the
tests to respect this new policy. No additional tests are added.

Add "global-parent" and "local-parent" namespaces as intermediaries to
spawn namespaces in the given modes. This avoids the need to change
"child_ns_mode" in the init_ns. nsenter must be used because ip netns
unshares the mount namespace so nested "ip netns add" breaks exec calls
from the init ns. Adds nsenter to the deps check.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/vmtest.sh | 41 +++++++++++++++++----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index dc8dbe74a6d0..86e338886b33 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -210,16 +210,21 @@ check_result() {
 }
 
 add_namespaces() {
-	local orig_mode
-	orig_mode=$(cat /proc/sys/net/vsock/child_ns_mode)
-
-	for mode in "${NS_MODES[@]}"; do
-		echo "${mode}" > /proc/sys/net/vsock/child_ns_mode
-		ip netns add "${mode}0" 2>/dev/null
-		ip netns add "${mode}1" 2>/dev/null
-	done
-
-	echo "${orig_mode}" > /proc/sys/net/vsock/child_ns_mode
+	ip netns add "global-parent" 2>/dev/null
+	echo "global" | ip netns exec "global-parent" \
+		tee /proc/sys/net/vsock/child_ns_mode &>/dev/null
+	ip netns add "local-parent" 2>/dev/null
+	echo "local" | ip netns exec "local-parent" \
+		tee /proc/sys/net/vsock/child_ns_mode &>/dev/null
+
+	nsenter --net=/var/run/netns/global-parent \
+		ip netns add "global0" 2>/dev/null
+	nsenter --net=/var/run/netns/global-parent \
+		ip netns add "global1" 2>/dev/null
+	nsenter --net=/var/run/netns/local-parent \
+		ip netns add "local0" 2>/dev/null
+	nsenter --net=/var/run/netns/local-parent \
+		ip netns add "local1" 2>/dev/null
 }
 
 init_namespaces() {
@@ -237,6 +242,8 @@ del_namespaces() {
 		log_host "removed ns ${mode}0"
 		log_host "removed ns ${mode}1"
 	done
+	ip netns del "global-parent" &>/dev/null
+	ip netns del "local-parent" &>/dev/null
 }
 
 vm_ssh() {
@@ -287,7 +294,7 @@ check_args() {
 }
 
 check_deps() {
-	for dep in vng ${QEMU} busybox pkill ssh ss socat; do
+	for dep in vng ${QEMU} busybox pkill ssh ss socat nsenter; do
 		if [[ ! -x $(command -v "${dep}") ]]; then
 			echo -e "skip:    dependency ${dep} not found!\n"
 			exit "${KSFT_SKIP}"
@@ -1231,12 +1238,8 @@ test_ns_local_same_cid_ok() {
 }
 
 test_ns_host_vsock_child_ns_mode_ok() {
-	local orig_mode
-	local rc
-
-	orig_mode=$(cat /proc/sys/net/vsock/child_ns_mode)
+	local rc="${KSFT_PASS}"
 
-	rc="${KSFT_PASS}"
 	for mode in "${NS_MODES[@]}"; do
 		local ns="${mode}0"
 
@@ -1246,15 +1249,13 @@ test_ns_host_vsock_child_ns_mode_ok() {
 			continue
 		fi
 
-		if ! echo "${mode}" > /proc/sys/net/vsock/child_ns_mode; then
-			log_host "child_ns_mode should be writable to ${mode}"
+		if ! echo "${mode}" | ip netns exec "${ns}" \
+			tee /proc/sys/net/vsock/child_ns_mode &>/dev/null; then
 			rc="${KSFT_FAIL}"
 			continue
 		fi
 	done
 
-	echo "${orig_mode}" > /proc/sys/net/vsock/child_ns_mode
-
 	return "${rc}"
 }
 

-- 
2.47.3

