Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466019;
	b=M6o8USRIoHPBxZZstRkNL8N6tALcoo4yTOStwvjX6VoG938/ideEvXjpiw+HnOrfjpUK
	 7X4A1BthFaIbN96xuhwfQ2za0vAf7BNV9pq9ekkD8iyOW5/HTNq6JZMsEoebpz4VH0a3K
	 xIhRyNxg42WIKQNVpoNYzXVxsAO3mu/UYRg2arT7eiz5vklrYQHBoToWfbbrEBZSxPHRH
	 xCJvMcdhz+rLlRwMmfvgpLpBwhqz7OqXq/pyfeypsG6itLxwD817zS3MqMFhQY8tVDxEy
	 lCErFeN9QBEHlv/1Nj1ktKfbDaW958/MMrVGscqvcwZ4LG4A87yVUZMUykiHFnEVWuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466019;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=3s0ba+JhT7e7ZmcJLS7jtsYDj8qHsofUQXzvKGrQOyE=;
	b=OLzmYkin3x5K3dgyge3q6i089ifgcd518KVUtf2Vdlhs/W+jeJ85a0nldzcgTBoSo4L8
	 m21WDD1XXwxRVGjbz6tAnb++BDAofs0SNq0jJs9w6NU0mb7B533JDxcZ73ojktPf7at6p
	 TNCar0zL6HvTc1bxY+um6JbJ5+xvdbJj+SoIXcQVsWuo4WYQENDPiy3oqbqyNIq06jAK4
	 Hpk1HDdhsy4ol4zqdCtbed1HYg7tChb8Z48W4YPfWQltdU8AMwymNPYnDMcDBfHuIwqmb
	 nV17Nbs3kpx9cLPSodPkLl3h1+kh3jT7j0pKz4Xwt1Nrt5EdG2/seYfpPoswne7dE6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DvZWRoED;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7A4606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E7A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DvZWRoED
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VCsgURmrph3MxwNfIKjcE580EzEMYSnhLi99FXbiXVc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794466015; v=1; x=1795070815;
 b=DvZWRoED8+5nMqfQGwV2+ymgWuRLUn4JcaktO2Y8WK4yiRPtG+rbxH1ERXr5UzLZBnn25rfZ
 ty/qBlA1aG/TMWrByrWvKJ0HrjeilgkfdUGAyZSdNEgDR1225nptYNrqqhPraf5gL7Emfh7XmIY
 mXQ3m0sylmy0jn47AxI/eIPA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 32a893e63a772586;
	Thu, 12 Nov 2026 06:46:55 +0000
X-Mizu-Trace-ID: 32a893e63a772586
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 12 Nov 2026 14:46:36 +0800
Subject: [PATCH net-next] netlink: specs: rt-route: move fixed-header to
 operations list
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-ynl_fixed_header-v1-1-8475ea19e409@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMUQrCMBAFr1L220ATrC1eRaSkyUu7IqskUSqld
 2+Cn8Mws1FCZCS6NhtFfDnxSwroU0NusTJDsS9MpjUXrbVRP3mOgVf4cYH1iMr43rrgpu4cBir
 ZO6L6uryRICvBmun+N+kzPeByPdK+H/HJGLV+AAAA
X-Change-ID: 20261112-ynl_fixed_header-2d7acfcb54f8
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, Wessel Jacobi <wessel@jacobi.pw>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

Wessel reported that fixed-header is not shown in the generated HTML
page like rt-link.yaml. The doc generator only renders fields on each
entry in the operations list, not operations-level keys. Move
fixed-header onto each operation so it appears in the HTML.

Reported-by: Wessel Jacobi <wessel@jacobi.pw>
Closes: https://patch.msgid.link/8610ee11-e1dc-481a-9654-11188a06786a@jacobi.pw
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
I'm not very sure whether we should also set `fixed-header` for
`newroute-ntf` and `delroute-ntf`, since these notifications are identical
to `getroute`. But because `fixed-header` is defined at the operations
level, I've added it to all list fields to match the existing behavior.

I rebuilt the HTML documentation, and now `fixed-header` shows up correctly.
---
 Documentation/netlink/specs/rt-route.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/netlink/specs/rt-route.yaml b/Documentation/netlink/specs/rt-route.yaml
index 48d1659f20f3..b5786b465eef 100644
--- a/Documentation/netlink/specs/rt-route.yaml
+++ b/Documentation/netlink/specs/rt-route.yaml
@@ -708,13 +708,13 @@ attribute-sets:
 
 operations:
   enum-model: directional
-  fixed-header: rtmsg
   name-prefix: rtm-
   list:
     -
       name: getroute
       doc: Dump route information.
       attribute-set: route-attrs
+      fixed-header: rtmsg
       do:
         request:
           value: 26
@@ -772,6 +772,7 @@ operations:
       name: newroute
       doc: Create a new route
       attribute-set: route-attrs
+      fixed-header: rtmsg
       do:
         request:
           value: 24
@@ -808,6 +809,7 @@ operations:
       name: delroute
       doc: Delete an existing route
       attribute-set: route-attrs
+      fixed-header: rtmsg
       do:
         request:
           value: 25
@@ -815,11 +817,13 @@ operations:
     -
       name: newroute-ntf
       doc: Notification about a created route.
+      fixed-header: rtmsg
       value: 24
       notify: getroute
     -
       name: delroute-ntf
       doc: Notification about a deleted route.
+      fixed-header: rtmsg
       value: 25
       notify: getroute
 

---
base-commit: c88fd6989aea9237a60a4859139a265bfb7ddc0b
change-id: 20261112-ynl_fixed_header-2d7acfcb54f8

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

