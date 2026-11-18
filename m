Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010984;
	b=BrQBryiFQDmQWaqVZOeejQRmNO/8IM8a1gSNJOChlNpPo3uX1Ux5+j+i4sw0nTLeouoX
	 8uUMYhMzK4DP2KkZICfWhRA/9jaj8PCFDwD9PpBwE9Spj/rQUkNDxwNUD5cONTSZmRFes
	 jRCfzKRprviNQRSs6CtezlAuP1otL7jxJNyUwV3/TZ7fpAd84rv6N4/N3CL4LyZQjN7EH
	 8Yuel8rTHpYUHbv6qFZYor1ApMdsDjbjbcmfKjSlOz8wNWfao365qXfzo5t5Q0/IOke16
	 FRgQduvhnLOizS00ap6pKxSeH8DfCIPZLfbDVdBfVzYauducQkQ0cobw2TNBbpWLeRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
	b=mc+6eXfMxUPRbtVx3P/l4TJeysh63npbsywCJaihRMdPTCEvWkn5tTMq7hXXz/RInDrh
	 wEp+QQt8nJ8wn2NL4t7/KTX4EZqjLmrJw0Rq/tO0r7YPxrJtM2BFOJ83OipR0fuNAMbKi
	 HnRI5hut0UGwMktTLKRrjI/ktau+qHnW/AK3cVBeW9M8nc/IjL/HLgEaTgKo1s0bwxf/y
	 AMjkynVo+Z3Zqvja8NsVJfGz5r5FGzUNfUE9k8Psy0Ha9v8MNAUCWTSzFia5CwIIim5zx
	 ZwAsDQtS0R6W9SXkhRjSd4O58VIkwA5i5wMqnPKszwmOsjEJODgq1kphMmp5Cmkq9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7Q7R2io;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5660A2625
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F5660A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D7Q7R2io
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-86103aaac12so1164843a34.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 06:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010980; x=1795615780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=D7Q7R2ioolNlOqkHOMmCmgYJugv+9RIyIrdghZ4WbG4sWvx+OjE4Yd+UEoQ4Zs0h6g
         mlRSvlyXr8lRNf8nvEnAHPOftraDFhiZsw7rjprV6d5kC9TFxUvBbOwBNj9viXW6FSbx
         hQKnhPJs4pKUJwFLI19DnSy5+zxBdq3ijnKIivDYeAZaa67W7IpHTrjbJlP1AkiF9u7P
         T4n9vrt/RJYhhi0+ndHof7y2UBd/F/MSARkDslMt3xAPyotgr6N96YuHgXMECEn1Kvat
         Pfqz1kFAOZCR3vbtKl+QcKXPIdhyMmfvAKiAlfLl+9bjxZrFkKYxbCnxPe3KrqLGxsUi
         Fn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010980; x=1795615780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BhI9NvyCgtOZtuaslrAqMXx6Ds5DSmZ6/JAKnGkqXCU=;
        b=JPSKwFujC+3smnLwOwhPRWKS0PzmDzEaUpR7WnkVpmAaJu8MIp1JABlH3iXzSxdekj
         kwWdk+xke8ZiZcVpD3esmy8+359hSrE0uJE6bp5zz6GvPQmcxN+liBA/Je9tAPs0gahG
         3kQKd6A+TRgnHYzCDfgV1wBoidy5d4dYDsRomabWUjBDtlCURy0aZMeJNDG8D23wK5Nz
         Hwab3UvE7X/9kp8Znjm9nMd8sifPUAXw7Nv8N44SzkdajydAGqV4850nQspiXqamAcQh
         z7DiPQpdhPk9d5Dv4AsF4rYGez68pb/CGHMbmFdVKkE5UseNyQXlbt53O+hCzqyTc99i
         YeQg==
X-Forwarded-Encrypted: i=1; AL+hErGGnbj5j1EwBZUVyUnib7cibJpMMscdLZ1+WhM19YPI2OEiRY+gqBv4bdk1TsYZ8Tqv90xspZaNak0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nrZlKhrDVCsmV48nP5Hve1ZuQmPFMUXUa2tzAvbHL4tfJWipR
	8S4OTuT8cYwU6r97ED39HGouItJPNELx249QrJ8Vv7N4mzBblY5a1Q+7
X-Gm-Gg: AYBFou0l7cvvrW1/bECg+7PAjrOTs3IcFpTnmL3WZ6lKkq+7c1hyS9nYq4MvEjXVHTf
	278emWdwwSDB5ia7QqNjVhKxI1FSYrJNPCJGpndWh78bt11Iqn7fitFRz31CJ3icJ1bi6OR0pSy
	cJLNqQQSBXTy4SC8w0fgGRrh1gp/rP6U4vx3TkLj40Hu7VpiDaG5FW3PJzfuuEP7mS1Td8AAz8U
	N4IpPiqF0GxGqjn6/ya2LG+IVgtxZchkgnJxJ1P86vrjY7e1iAOhQJdfI/atsO0pYVx0gNCCZV+
	zQAmvtTT/oEd+EztKisupUreeZCwpoJsZQZCt85g3C3xwbK+3/KkXw10dXTNu/c57cruP4nsdYO
	QKIUXjgsKdRtpAitwu4zGhOY626h7APSXFPv+SCzYuBEIam8SRmSDo8bq1hjmdaMcD0zRxZyJq1
	nEEUOHFfHZIjdP5fMhPMT4m38q9hb+hQQkNfS2D9o++6ss6p8tjuXLC+kWza4YdkFycL65aVH4T
	KE8KLlK2GVl5ozo+AqHrTMB/H0gkI12o8s84viW+7ad99P6m9tmFezNEDWUdtyvo3qpsRolc+Fi
	yoKJoYXFWxNgRr3mwrCCgMqR3A==
X-Received: by 2002:a05:6830:680d:b0:845:8d86:9f81 with SMTP id 46e09a7af769-862f0832679mr1678535a34.6.1795010980265;
        Wed, 18 Nov 2026 06:09:40 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021295csm2160757a34.15.2026.11.18.06.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:39 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:03 -0800
Subject: [PATCH net-next v5 1/6] psp: support rx rekey operation
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
Message-Id: <20261118-psp-v5-1-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

Support updating the rx PSP state used by a socket. This is most
useful to do after a device key rotation has occurred and the key
being used by the peer will become stale after the next device key
rotation.

Create a new psp_assoc for the socket to use that contains the same tx
state, but with new rx state. Copy the previous rx state to use as a
fallback while the peer is in the process of switching to the new key.

skbs matching the current rx spi and generation or the previous rx spi
and generation will be accepted. It might be reasonable to stop
accepting skbs on the previous state after seeing skbs with the new
state and after waiting a grace period, but that is not implemented
for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count it in stale-events
- drop the requirement that the new rx spi has the opposite phase
  bit from the previous one
- keep prev_generation valid across a rotation when the prev SPI is
  from the same generation
- document rx rekey in the rx-assoc op doc in psp.yaml

v2:
- copy old rx state by value instead of pointer to prev
- place non-datapath fields at end of struct psp_assoc
- disallow rx rekey when socket is not in full psp state, or
  dev/version doesn't match.
- require the new rx spi to have the opposite phase bit from the previous
  one
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     | 23 ++++++++++++++--
 include/net/psp/functions.h          | 10 ++++---
 include/net/psp/types.h              | 17 +++++++++++-
 net/psp/psp.h                        |  3 ++-
 net/psp/psp_sock.c                   | 52 +++++++++++++++++++++++++++++++++---
 6 files changed, 96 insertions(+), 13 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index f3266763c325..d5713f5d1af7 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -265,7 +265,9 @@ operations:
 
     -
       name: rx-assoc
-      doc: Allocate a new Rx key + SPI pair, associate it with a socket.
+      doc: |
+        Allocate a new Rx key + SPI pair, associate it with a socket.
+        If the socket already has PSP state, rekey its Rx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 0f9b6b73f244..fab797506b0a 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -140,14 +140,33 @@ The PSP assoc state of a socket is not reset when the connection is
 torn down. ``connect()`` on a socket that has PSP assoc state will
 return ``-EINVAL``.
 
+Rekeying
+--------
+
+A connection which has completed the exchange described above and is
+in the "PSP Full" state can be rekeyed in place without being torn
+down, using the same netlink calls as in connection setup.
+
+``rx-assoc`` allocates a new Rx key and SPI, which should be passed
+to the peer exactly as during the initial exchange. The SPI which was
+in use before the rekey remains acceptable on the socket until the
+next Rx rekey, or until the device key it was derived from has been
+rotated out, so packets the peer sent before it learned the new SPI
+are still received.
+
+A rekey is rejected with ``-EINVAL`` if it would change the PSP device
+or the PSP version of the association. It is rejected with ``-EBUSY``
+if the socket has not completed its initial exchange in both
+directions.
+
 Rotation notifications
 ----------------------
 
 The rotations of device key happen asynchronously and are usually
 performed by management daemons, not under application control.
 The PSP netlink family will generate a notification whenever keys
-are rotated. The applications are expected to re-establish connections
-before keys are rotated again.
+are rotated. Applications are expected to rekey their connections,
+as described above, before device keys are rotated again.
 
 Kernel implementation
 =====================
diff --git a/include/net/psp/functions.h b/include/net/psp/functions.h
index 410adb6718c1..5a7a518b9579 100644
--- a/include/net/psp/functions.h
+++ b/include/net/psp/functions.h
@@ -77,10 +77,12 @@ psp_is_allowed_nondata(struct sk_buff *skb, struct psp_assoc *pas)
 static inline bool
 psp_pse_matches_pas(struct psp_skb_ext *pse, struct psp_assoc *pas)
 {
-	return pse && pas->rx.spi == pse->spi &&
-	       pas->generation == pse->generation &&
-	       pas->version == pse->version &&
-	       pas->dev_id == pse->dev_id;
+	return pse && pas->version == pse->version &&
+	       pas->dev_id == pse->dev_id &&
+	       ((pas->rx.spi == pse->spi &&
+		 pas->generation == pse->generation) ||
+		(pas->prev_spi && pas->prev_spi == pse->spi &&
+		 pas->prev_generation == pse->generation));
 }
 
 static inline enum skb_drop_reason
diff --git a/include/net/psp/types.h b/include/net/psp/types.h
index b8905efbd604..9eb89d2d680c 100644
--- a/include/net/psp/types.h
+++ b/include/net/psp/types.h
@@ -3,6 +3,7 @@
 #ifndef __NET_PSP_H
 #define __NET_PSP_H
 
+#include <linux/bits.h>
 #include <linux/mutex.h>
 #include <linux/refcount.h>
 #include <net/net_trackers.h>
@@ -78,7 +79,8 @@ struct psp_assoc_dev {
  * @active_assocs:	list of registered associations
  * @prev_assocs:	associations which use old (but still usable)
  *			device key
- * @stale_assocs:	associations which use a rotated out key
+ * @stale_assocs:	associations which use a rotated out key, or were
+ *			superseded by a rekey
  *
  * @stats:	statistics maintained by the core
  * @stats.rotations:	See stats attr key-rotations
@@ -152,6 +154,15 @@ struct psp_key_parsed {
 	u8 key[PSP_MAX_KEY];
 };
 
+/**
+ * enum psp_assoc_flags - flags of struct psp_assoc
+ * @PSP_ASSOC_SKIP_TX_KEY_DEL: Do not delete Tx key from psp_dev. It was
+ *	copied to a newer psp_assoc during an Rx rekey.
+ */
+enum psp_assoc_flags {
+	PSP_ASSOC_SKIP_TX_KEY_DEL	= BIT(0),
+};
+
 struct psp_assoc {
 	struct psp_dev *psd;
 
@@ -159,6 +170,10 @@ struct psp_assoc {
 	u8 generation;
 	u8 version;
 	u8 peer_tx;
+	u8 prev_generation;
+	u8 flags; /* Slow path, protected by psd->lock */
+
+	__be32 prev_spi;
 
 	u32 upgrade_seq;
 
diff --git a/net/psp/psp.h b/net/psp/psp.h
index b123c2427905..92d7b92acaed 100644
--- a/net/psp/psp.h
+++ b/net/psp/psp.h
@@ -63,7 +63,8 @@ static inline bool psp_dev_has_sadb(struct psp_dev *psd)
 static inline bool psp_assoc_needs_tx_key_del(struct psp_assoc *pas)
 {
 	lockdep_assert_held(&pas->psd->lock);
-	return psp_dev_has_sadb(pas->psd) && pas->tx.spi;
+	return psp_dev_has_sadb(pas->psd) && pas->tx.spi &&
+	       !(pas->flags & PSP_ASSOC_SKIP_TX_KEY_DEL);
 }
 
 #endif /* __PSP_PSP_H */
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index f2cba3fa3a23..c1e38845f08c 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -149,10 +149,39 @@ void psp_sk_assoc_free(struct sock *sk)
 	psp_assoc_put(pas);
 }
 
+static int psp_sock_rx_rekey(struct psp_assoc *pas, struct psp_assoc *prev,
+			     struct netlink_ext_ack *extack)
+{
+	if (pas->psd != prev->psd) {
+		NL_SET_ERR_MSG(extack, "PSP device mismatch with existing state");
+		return -EINVAL;
+	}
+	if (pas->version != prev->version) {
+		NL_SET_ERR_MSG(extack, "PSP version mismatch with existing state");
+		return -EINVAL;
+	}
+	if (!prev->tx.spi || !prev->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	pas->peer_tx = 1;
+	pas->prev_spi = prev->rx.spi;
+	pas->prev_generation = prev->generation;
+
+	memcpy(&pas->tx, &prev->tx, sizeof(pas->tx));
+	memcpy(pas->drv_data, prev->drv_data, pas->psd->caps->assoc_drv_spc);
+	prev->flags |= PSP_ASSOC_SKIP_TX_KEY_DEL;
+	list_move(&prev->assocs_list, &prev->psd->stale_assocs);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 			  struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
 {
+	struct psp_assoc *prev;
 	int err;
 
 	memcpy(&pas->rx, key, sizeof(*key));
@@ -165,10 +194,11 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 		goto exit_unlock;
 	}
 
-	if (psp_sk_assoc(sk)) {
-		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
-		err = -EBUSY;
-		goto exit_unlock;
+	prev = psp_sk_assoc(sk);
+	if (prev) {
+		err = psp_sock_rx_rekey(pas, prev, extack);
+		if (err)
+			goto exit_unlock;
 	} else if (sk_has_decrypt_user(sk)) {
 		NL_SET_ERR_MSG(extack, "Socket has incompatible state");
 		err = -EINVAL;
@@ -177,6 +207,7 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	refcount_inc(&pas->refcnt);
 	rcu_assign_pointer(sk->psp_assoc, pas);
+	psp_assoc_put(prev);
 	err = 0;
 
 exit_unlock:
@@ -302,8 +333,21 @@ void psp_assocs_key_rotated(struct psp_dev *psd)
 	 */
 	list_for_each_entry_safe(pas, next, &psd->prev_assocs, assocs_list) {
 		pas->generation |= ~PSP_GEN_VALID_MASK;
+		pas->prev_generation |= ~PSP_GEN_VALID_MASK;
 		psd->stats.stales++;
 	}
+
+	/* Don't allow SPI from two generations ago to alias one from the
+	 * current generation. Rx rekeying under the same device key generation
+	 * is currently permitted, so skip if the previous SPI is from just one
+	 * generation ago.
+	 */
+	list_for_each_entry(pas, &psd->active_assocs, assocs_list) {
+		if ((pas->rx.spi ^ pas->prev_spi) &
+		    cpu_to_be32(PSP_SPI_KEY_PHASE))
+			pas->prev_generation |= ~PSP_GEN_VALID_MASK;
+	}
+
 	list_splice_init(&psd->prev_assocs, &psd->stale_assocs);
 	list_splice_init(&psd->active_assocs, &psd->prev_assocs);
 

-- 
2.52.1

