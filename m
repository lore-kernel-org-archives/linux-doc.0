Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522899;
	b=zGTdZ9Eq9gpm+8oRemOWnjKSvjBuACZCf4/uinszT58LHXMkujuOzjNyDu9TvCViHQ+9
	 zaEjuhMUPkb1hN+QlPXTb3pzWHOHB3OgLp+ACJgkNr0XXS7x/P10wXBFs7PzeOKmA50N9
	 nTHLkG/yzNq8N2p9kkQPy6gNNNie3OD20Wd1OZTutxKOu8yDmR3lYNoqsp8SHYe0b2aPU
	 nh4CSslqMFtFK6U+yzpWVaxwhw7QUWYTRniV7JVvl5DP4JrAZSyT9PkID9jZTe/R5rYKJ
	 O/kYdqRe8TY28DZC5KBlNwt448hw1abATdpo8jKcUUPkP6bONrKGfSWCSHz8C+6AYsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522899;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
	b=oeLti7TjVjTbHRUQk+UakPzeAPaNBRVPaC5giWLJp1xEbPjbkO1am+ardeYFtQ6XX8wu
	 xCNQHpbaAVGaw58djPg1wEJ/EhhjgCdhfMjyG6m2U+2SECVfvYaYxPrsZH9HFMPsdj4WJ
	 7YwXCHHIvzeh48lSnpVfQi+h37Tol9f+8gBtKxTPKkKjSvGttbTNbWGf3QYtgAxL73KNZ
	 Nx0UxsrygK0HnCiCkC9wi8Td0C82Z9zM/HIULgqK/Gve1Z2Nr8DqDssnfk4pRfrN4DNgp
	 8JOAbuc0QkM4o0fVjaexpibf7qXLO+WQFc2EFGXa5p6a0wMPXMC+0IzNHLpzVHvN3qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=irYoeV5+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eO5N0yhd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722B9606A338
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 12:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 722B9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=irYoeV5+;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=eO5N0yhd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795522897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
	b=irYoeV5+Huj0povrZGvyx0LvoPD9+NecTvgf83Dtcb4KRD9fZaNR251KxM5UEA9Tco8rJj
	riFKbfqyxrsRfrqL8TPqBgVR3vI4/Y+m3tgtRHciaHZ6A6Oz3bjj+2MEMMFyaD7Ks/sNSb
	smgrdkzqlf7Oe4GjLr9EJKe7NzvQaiM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-xYKwX2SBOJeUK9f6O4iICA-1; Tue, 24 Nov 2026 12:21:35 +0000
X-MC-Unique: xYKwX2SBOJeUK9f6O4iICA-1
X-Mimecast-MFC-AGG-ID: xYKwX2SBOJeUK9f6O4iICA_1795522894
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so3241565f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 04:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795522894; x=1796127694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
        b=eO5N0yhdvqPwWigZ3gWgbuwkKZnuPE8R/dvagMIudClnqK3sA7WVwCKYiUvWkUHj0y
         sSYW1fY712yaTXlQZcTPX0zySUO9FrNzOm2AWAJSRIvRVoFx9V5calKUEgwjF69VyeUL
         lJKoTBahWk28NF/fhKMSHzw2iC8wlIzQX87btXKIL/gypSAca6eC6LuNIqnyN9tQPrHa
         zxt6OyNGYqcUgHrScYx0VLKNJmtWJNPXr8bJ1amqgtihKbgfnpRUm0yk9aj00YsZNHrR
         hBOF8wifdzvHFBNFbpS6ihVER3rEdReAhvDJgyTN7fmGE7k5lfzZ07nS80dt8UwSQgVa
         d+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522894; x=1796127694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AX9Mf5J+3aeVkpwh4J/8EgCykn4MsRJKSbKY+Cu0H4=;
        b=Jbk6PeQKVa+ToOo43z8o6Nupz5UGkdOmcb/OKS3FTdRMa3TPEHgZDIbhMeH6s2JNwT
         PgRyfgsDtvTneWic27AdWNAOz5K2QB6QKhHgi8QHoJhPAz2HifstB0MxwhATVxBQqq9z
         eG71W6OCUHZi392ViNy03qvlM8dTYcPkXxlYaGb4rXp5p47fnZ5CdwHdnNuqTrBbuOwe
         rO/HdZ07KIdt1q6GonIdFMS8n3552RWO7/SM3Wzlikc3UnT/n6nM4KUiz0wFE0SoYQNI
         /0/1CI/n8TtNVKu5ndCB+vBPP754+Z6F4p66CC/Te61O+bjeirhq3jXd74YMdWG01CE1
         ZEgw==
X-Forwarded-Encrypted: i=1; AL+hErFF/bAL8fMzRwHd3IhmwmWcL2FIm0twJuD65ZRQIFAhZVM8UXZ/WZOE7Ll+oBg2DiY3WGMA7ISQILs=@vger.kernel.org
X-Gm-Message-State: APuU4Z843uMGbAGcb/tvwClpoLvOIpRa24mEf1z6mZWu2Tr4XlAKss8W
	Efg/7HXmLDPBfdAfFIecH1MkB6zvqIjXBXSmj2TwVU4YPvfAAuK6RnTr7l3I81YKWxD4nVnGGS+
	LAidYt29dGgjnPsMUf8ZaP0Q1YnTjt/ofsg37wyrPmgDuAv8QMfgvfjYZzAOFIw==
X-Gm-Gg: AZFdTZdWAWI8OQkUaleOHrEsmyJrBQmCzsYvjjlU0na9VOnzNqmdrVEG1uavfofI/Oe
	4S8rKJ31JW7SALGtLBmFqHOG91ykSSwuMVWF4CkkFz0VuxW80STEJYTa+kSHXPWB38HthXJu+SV
	yPEfFuNAUkKO+ndDSwdNmg/npQvS/KMQuu/EcmW8qVZbOrCPW8KZ+NYkuQjDEGosA/3b0Df3M7G
	a/58R+pjvbaV4faCHmh9dCWrshsUSDFYEiqoal9pwFXcHi6DfQ6BZnH5JQtXByOti2tt2Vtpgzj
	IVnv0pIy3ossivYkzR79QYSVqjrx/pd/XHSOyCd/sZqsYh1mvzzsZGlZNcJtcHst6fS2DzufYxB
	3vsV7EDNQrKyUU+/62fGYJRDObFnWi57w9BjlsF7YttW6FI40JABJ13oocg0QM7joVRwzxmyMz3
	QxAxdQHjoCN8U=
X-Received: by 2002:a5d:4b49:0:b0:4a4:c39a:1d4d with SMTP id ffacd0b85a97d-4abb4d70005mr21160296f8f.52.1795522894151;
        Tue, 24 Nov 2026 04:21:34 -0800 (PST)
X-Received: by 2002:a5d:4b49:0:b0:4a4:c39a:1d4d with SMTP id ffacd0b85a97d-4abb4d70005mr21160241f8f.52.1795522893602;
        Tue, 24 Nov 2026 04:21:33 -0800 (PST)
Received: from [192.168.0.19] (217.red-88-4-146.dynamicip.rima-tde.net. [88.4.146.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm22753198f8f.35.2026.11.24.04.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:21:33 -0800 (PST)
From: Sergio Lopez <slp@redhat.com>
Date: Tue, 24 Nov 2026 13:20:19 +0100
Subject: [PATCH RFC v4 1/8] vsock: expose the core port allocator to
 transports
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
Message-Id: <20261124-vsock-dgram-support-v4-1-3607484e85e8@redhat.com>
References: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
In-Reply-To: <20261124-vsock-dgram-support-v4-0-3607484e85e8@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, bpf@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 linux-doc@vger.kernel.org, Sashiko AI bot <sashiko-bot@kernel.org>, 
 Sergio Lopez <slp@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9250; i=slp@redhat.com;
 h=from:subject:message-id; bh=H6wwDTbNUOfIU+6gW7svNy8mFx/ZAcmIgQ8rPn9Y61E=;
 b=owEBbQKS/ZANAwAKAfRpJ40vDAI1AcsmYgBrBYFCXK0OR2qEvJXRWLzPD6uy6PA2A5SuZsoAM
 7zW9nJwD0OJAjMEAAEKAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCawWBQgAKCRD0aSeNLwwC
 NSRFD/9F+CeGLOjdD/j4KTaTYyBx0/j2NSodi5aQUuM+IFVzFeMxcfYE9s52APHXO6p9Lrbgtzk
 YpVBPLVrKlMS5qG5XFjFLE133B07DJgRPGk3G+M9q3yeb13cE/mB1AKfNqJvXXXyjDLnZPHA9HW
 oTune33u0unE016HbYwAUGTBh4zMSeYgRP1xsh8AGgcrdBLztdp7DLTnhVP8/KGEasG5qBrIjgv
 ZEm3cNS+5zxatUljKhperbij07BIogqaEZU8Tloy+gCpdXBE9HGavhQ1zSfcog18fvFZpXpNJ1z
 JS+ImWHYR1L0x2RxxeN5jjE7RTmH1Z0DckXknpkyuNdcWocJfzACzrb1/mEBhWeCm0wPCWY38Jv
 PhvcVblRypRMlmtAsD7+Oas5G/twhio6kbiS1wWGk8oDVTM16CPErsYf2oflzj983tT+G/1IXFh
 pJY16wgriJDaKPFj5T7oPNA7Bk3qwzkPC5aJM18XGoAoPtMNXKZfwvBiH25vTxUkcZdncaCsNYw
 hGrgLKJvi1gPnNjjp1VJ4XHH4W7IqqWj8ltOEvKUpp6M0PAc0hWAft79pi5lrf1V7DSiW0dIWqC
 0+BtDdB3BAgUJPpIC1mKO2SKih/HphBQe7eCi/O9CSIjiCrUvsQhc4v/Wro6HnxmbYhNHLhDBPH
 zLE31PvfECAtkDg==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235

The core port allocator is currently private to connection-oriented
sockets. Virtio datagrams need the core bound table and port allocation,
while VMCI datagrams must keep their own endpoint creation and port
namespace.

Export vsock_bind_common() with the bound-table locking inside the
helper, and use it for stream and SEQPACKET binds. Keep datagram binds
delegated to the transport so a transport can opt into the core
allocator without changing other transports' binding behavior.

Keep datagram and connection-oriented sockets in separate logical port
spaces within the core bound table. Filter bind conflicts and bound-socket
lookups by class, including wildcard CIDs and automatic port allocation,
so datagram and stream/SEQPACKET sockets can share a CID and port. Stream
and SEQPACKET sockets continue to conflict with each other.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 include/net/af_vsock.h   |  3 ++
 net/vmw_vsock/af_vsock.c | 98 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 66 insertions(+), 35 deletions(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index e8481f12312e..ac061115ed30 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -220,6 +220,7 @@ void vsock_remove_pending(struct sock *listener, struct sock *pending);
 void vsock_enqueue_accept(struct sock *listener, struct sock *connected);
 void vsock_pending_to_accept(struct sock *listener, struct sock *pending);
 void vsock_insert_connected(struct vsock_sock *vsk);
+int vsock_bind_common(struct vsock_sock *vsk, struct sockaddr_vm *addr);
 void vsock_remove_bound(struct vsock_sock *vsk);
 void vsock_remove_connected(struct vsock_sock *vsk);
 struct sock *vsock_find_bound_socket(struct sockaddr_vm *addr);
@@ -227,6 +228,8 @@ struct sock *vsock_find_connected_socket(struct sockaddr_vm *src,
 					 struct sockaddr_vm *dst);
 struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
 					 struct net *net);
+struct sock *vsock_find_bound_dgram_socket_net(struct sockaddr_vm *addr,
+					       struct net *net);
 struct sock *vsock_find_connected_socket_net(struct sockaddr_vm *src,
 					     struct sockaddr_vm *dst,
 					     struct net *net);
diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index d0508887a2fb..d5cf240d4ece 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -14,14 +14,10 @@
  * specified an address that they are responsible for) and one for connected
  * sockets (sockets that have established a connection with another socket).
  * These tables are "global" in that all sockets on the system are placed
- * within them. - Note, though, that the bound table contains an extra entry
- * for a list of unbound sockets and SOCK_DGRAM sockets will always remain in
- * that list. The bound table is used solely for lookup of sockets when packets
- * are received and that's not necessary for SOCK_DGRAM sockets since we create
- * a datagram handle for each and need not perform a lookup.  Keeping SOCK_DGRAM
- * sockets out of the bound hash buckets will reduce the chance of collisions
- * when looking for SOCK_STREAM sockets and prevents us from having to check the
- * socket type in the hash table lookups.
+ * within them. The bound table has an extra entry for unbound sockets.
+ * Transports with their own datagram endpoint table can leave their datagram
+ * sockets there; virtio datagrams use the bound hash buckets. Datagram and
+ * connection-oriented sockets have separate logical port spaces within them.
  *
  * - Sockets created by user action will either be "client" sockets that
  * initiate a connection or "server" sockets that listen for connections; we do
@@ -295,12 +291,16 @@ static void __vsock_remove_connected(struct vsock_sock *vsk)
 }
 
 static struct sock *__vsock_find_bound_socket_net(struct sockaddr_vm *addr,
-						  struct net *net)
+						  struct net *net, bool dgram)
 {
 	struct vsock_sock *vsk;
 
 	list_for_each_entry(vsk, vsock_bound_sockets(addr), bound_table) {
 		struct sock *sk = sk_vsock(vsk);
+		bool socket_dgram = sk->sk_type == SOCK_DGRAM;
+
+		if (socket_dgram != dgram)
+			continue;
 
 		if (vsock_addr_equals_addr(addr, &vsk->local_addr) &&
 		    vsock_net_check_mode(sock_net(sk), net))
@@ -372,28 +372,41 @@ void vsock_remove_connected(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_remove_connected);
 
-/* Find a bound socket, filtering by namespace and namespace mode.
- *
- * Use this in transports that are namespace-aware and can provide the
- * network namespace context.
- */
-struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
-					 struct net *net)
+static struct sock *vsock_find_bound_socket_type_net(struct sockaddr_vm *addr,
+						     struct net *net, bool dgram)
 {
 	struct sock *sk;
 
 	spin_lock_bh(&vsock_table_lock);
-	sk = __vsock_find_bound_socket_net(addr, net);
+	sk = __vsock_find_bound_socket_net(addr, net, dgram);
 	if (sk)
 		sock_hold(sk);
-
 	spin_unlock_bh(&vsock_table_lock);
 
 	return sk;
 }
+
+/* Find a connection-oriented bound socket, filtering by namespace and mode.
+ *
+ * Use this in transports that are namespace-aware and can provide the
+ * network namespace context.
+ */
+struct sock *vsock_find_bound_socket_net(struct sockaddr_vm *addr,
+					 struct net *net)
+{
+	return vsock_find_bound_socket_type_net(addr, net, false);
+}
 EXPORT_SYMBOL_GPL(vsock_find_bound_socket_net);
 
-/* Find a bound socket without namespace filtering.
+/* Find a datagram bound socket, filtering by namespace and mode. */
+struct sock *vsock_find_bound_dgram_socket_net(struct sockaddr_vm *addr,
+					       struct net *net)
+{
+	return vsock_find_bound_socket_type_net(addr, net, true);
+}
+EXPORT_SYMBOL_GPL(vsock_find_bound_dgram_socket_net);
+
+/* Find a connection-oriented bound socket without namespace filtering.
  *
  * Use this in transports that lack namespace context. All sockets are
  * treated as if in global mode.
@@ -832,11 +845,13 @@ static void vsock_pending_work(struct work_struct *work)
 
 /**** SOCKET OPERATIONS ****/
 
-static int __vsock_bind_connectible(struct vsock_sock *vsk,
-				    struct sockaddr_vm *addr)
+static int __vsock_bind_common(struct vsock_sock *vsk,
+			       struct sockaddr_vm *addr)
 {
-	struct net *net = sock_net(sk_vsock(vsk));
+	struct sock *sk = sk_vsock(vsk);
+	struct net *net = sock_net(sk);
 	struct sockaddr_vm new_addr;
+	bool dgram = sk->sk_type == SOCK_DGRAM;
 
 	if (!net->vsock.port)
 		net->vsock.port = get_random_u32_above(LAST_RESERVED_PORT);
@@ -854,7 +869,8 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 
 			new_addr.svm_port = net->vsock.port++;
 
-			if (!__vsock_find_bound_socket_net(&new_addr, net)) {
+			if (!__vsock_find_bound_socket_net(&new_addr, net,
+							   dgram)) {
 				found = true;
 				break;
 			}
@@ -871,16 +887,15 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 			return -EACCES;
 		}
 
-		if (__vsock_find_bound_socket_net(&new_addr, net))
+		if (__vsock_find_bound_socket_net(&new_addr, net, dgram))
 			return -EADDRINUSE;
 	}
 
 	vsock_addr_init(&vsk->local_addr, new_addr.svm_cid, new_addr.svm_port);
 
-	/* Remove connection oriented sockets from the unbound list and add them
-	 * to the hash table for easy lookup by its address.  The unbound list
-	 * is simply an extra entry at the end of the hash table, a trick used
-	 * by AF_UNIX.
+	/* Move the socket from the unbound list to the hash table for lookup
+	 * by its address. The unbound list is an extra entry at the end of
+	 * the hash table, a trick used by AF_UNIX.
 	 */
 	__vsock_remove_bound(vsk);
 	__vsock_insert_bound(vsock_bound_sockets(&vsk->local_addr), vsk);
@@ -888,11 +903,26 @@ static int __vsock_bind_connectible(struct vsock_sock *vsk,
 	return 0;
 }
 
-static int __vsock_bind_dgram(struct vsock_sock *vsk,
-			      struct sockaddr_vm *addr)
+/**
+ * vsock_bind_common - bind a socket using the core port allocator
+ * @vsk: socket to bind
+ * @addr: local address to bind to
+ *
+ * The caller must hold the socket lock.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int vsock_bind_common(struct vsock_sock *vsk, struct sockaddr_vm *addr)
 {
-	return vsk->transport->dgram_bind(vsk, addr);
+	int ret;
+
+	spin_lock_bh(&vsock_table_lock);
+	ret = __vsock_bind_common(vsk, addr);
+	spin_unlock_bh(&vsock_table_lock);
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(vsock_bind_common);
 
 static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 {
@@ -914,13 +944,11 @@ static int __vsock_bind(struct sock *sk, struct sockaddr_vm *addr)
 	switch (sk->sk_socket->type) {
 	case SOCK_STREAM:
 	case SOCK_SEQPACKET:
-		spin_lock_bh(&vsock_table_lock);
-		retval = __vsock_bind_connectible(vsk, addr);
-		spin_unlock_bh(&vsock_table_lock);
+		retval = vsock_bind_common(vsk, addr);
 		break;
 
 	case SOCK_DGRAM:
-		retval = __vsock_bind_dgram(vsk, addr);
+		retval = vsk->transport->dgram_bind(vsk, addr);
 		break;
 
 	default:

-- 
2.56.0

