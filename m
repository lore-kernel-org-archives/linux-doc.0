Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830699;
	b=5kJZoPEYgna2UZa/P4bRxgZavedEO5iJkGxp85RIjh+YhSz+kOaMawTpkYhCgIvNwcHL
	 J8vhqK1nihTaM3BebcHRYOhXQwxLGH1hzgSewG/mH5W7PtsCNupbiGFxmImGOgPQIpKsA
	 giUNP4HDb6Pz8h5HFTHv368JWJp9DQDYK+fc/Imvo9WlZ3g5hj8x27vXa7VyZxbMAPZpg
	 ppNMdHp7/k6HXuBjIlBNEEuGvlcY8zZuVrmtG9Tq8EsKHY1NNEzP37J9FQanzP9ib7M3G
	 BOmZfdDVtZT65Dpub0aIuBmYMAlEI5mdGk0Ygml3dyaexhtiiWkndSG9seQz4lQHPuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
	b=LWQI2iRt5K9M/k9y6qBEWuaDsthfldFlVd5vI5HWfM9R4q7XDnrpRQIcyswvOUn70M6R
	 /NlFiCVjYzoP+7bYdf67HBbBgUmQdl+a4ntfQMxou0ucVOTjQCtoP9XtPuQQbvrm3T0Jo
	 tC6a9a6woz1M0sz9r6wQNjx9nKA38XzxDupzpo9DpnHxRcqc8kIy6+CnOMGnVPRzS3gTw
	 1CwHBtRaYm8AH17dQYCiOX3aZkjeCGwQM0YMBrROxkO/UwtUpmBJTyaUebIrzvWTDlCYD
	 3rXs2soFpi+ZXZr72qbczOPW0uEOb4Nfw72OPO+BtgrPutUjtnYVa4ndCgUP88HwBpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE62606A339
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 12:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEE62606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I5X9Fro
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be1e468a8so2420158d50.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 04:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830698; x=1795435498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=0I5X9Fro5lTpqrbTIJJvYIobMHUh80nHVy51NkUgs0cZyJk7aueiHYWXPwaLeIOvZN
         qwJGzc6RrLUvj9I5DLGaQTXn1ewCUUSnKPbTTE7o5Ysx12G9MF3+NIe7DPP1Wtsr6BQa
         CoqU9SBM+he7p8Sxw0U51krnBadTzBWn+2yiALp24XnEhLwbfT/U3YB6/UFSmsxTSE7D
         ZSgoMOTZywFZ3HogO+Od+P3dPDl8TBVWHtCJmlWqMbhYbRvw8ansbw2YJ38ttYsXTWpB
         z0PtVq//0Ehsdgww5oEwRifxndf9H6qlH7wm4/akCrejK2nU/TgL+s4a8vZQFHwHPigH
         nwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830698; x=1795435498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8x2RfWqC4sWMy3tixcc28MUcdJoxePFEMTBw5xM84A=;
        b=dAOhJ2j0QWdySsIlDHrpQORc6Nq666idGgSsc/OFl4Lqkik0fDUxqfY+7EufQy2q18
         rtcsIxUlc5KgucnOtQ9R2LqtyircaHqDjNpJe6mQL/EePaxPG05WpJetBpfSaUoFuRLe
         5CYRDDhOGK6PCH+e+JyvY8pTmvfVZkWeviOJ/NnnNU+4IJhc7kkvc7VXm8xlSmQvCYYR
         nhLxu9sIHvw+Qt4iMVlx939PoNJnww18DBvvpMgIY1c9+Fy1jmuV1meXtdDWLgQ6bLzn
         pKUrkQJ9tLTzPJEV6pNzu83n/0V6tCfD0vS2M2Oe8jU4LiYptP60hcBQOvsnbrKHL1VT
         Q56Q==
X-Forwarded-Encrypted: i=1; AL+hErHa6PP08Z7esuGdYoMDWekZZdBI2Nd/rJ6MTnPh37nvM9dUDcGgvogmfwsG5LS9DOBCUmc4lH2oxvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eYT+MxLyZYBTEjPWLsX076e4WIiszZWkWzPou64jScSCGyMKj
	m7MVHJxC83FUxEBjKqkIDYS0+V6NQmz4cjmpv4xRoSJ1Eiu1mSDdDN42
X-Gm-Gg: AZFdTZfBviSlp0QJ5eyShUDKxxufH44g3miMqBBzGePkOVUL9mvJJG4TEmuzpauFbF2
	qbjZjuZ/aI2Ha8jrLqp/FGxZy3XHkRGM5K2/6JDI9GEMe41+l2ytHy+YQk4e75O+wnK1dNaQHkQ
	2Cer9UTddnWqBSpMhaxfdLPGdMo0M5EeYU7dLq265OE5xovQO2StqcpFDjp5xZ6L8HdUgwAGAcu
	pnE619cPTwyzX8/j/nw0XO70zloKeCdMo7s+aIhb7tVFtki/pU8vMaNnp1v+mGgm6FF9U+GgdEO
	5pn7jo53uDkTRnvBIDhO6hukw1y0ChAdw8okZ/VNHxB1fJeC0l+NMhFBQm/Wvvq5mhASng4qU1q
	ipAItSBpmY3ig7md12q/f4r6mhl52H4Z3G1D0s9xekDdKkdOKC9jxMzzFTsKfpxTP9tVJv3GQFe
	VRVS+i5zA3apFPPrtPw2eqCRB+f9wpsRYVIW7DRwKI4Cg2fDeisDSh+/7DDI0h+UpT4W9Fnx5f1
	GlWuIITyOXCNE59UuQY870e0OiwTWu59BnZEB5y/cHNh+EBMBHHFO8jTQ19sZY9qsAeNtDs8o9g
	2vesuxVCMJz8UH8CtRhwTCgpEPqfE6qE4KbagVANMuTLdOTy
X-Received: by 2002:a05:690e:1c1b:b0:67c:b95:6757 with SMTP id 956f58d0204a3-67d897366a7mr6743663d50.80.1794830697852;
        Mon, 16 Nov 2026 04:04:57 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:75::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm9706309d50.10.2026.11.16.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:04:55 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Mon, 16 Nov 2026 04:04:37 -0800
Subject: [PATCH net-next v4 2/5] psp: support tx rekey operation
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
Message-Id: <20261116-psp-v4-2-1a599df2aefa@gmail.com>
References: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
In-Reply-To: <20261116-psp-v4-0-1a599df2aefa@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

The tx rekey operation creates a new psp_assoc with the same rx state,
but with new tx state. The new association is spliced into the socket
with RCU to be used immediately in the tx path.

Drivers that use on-device tx key storage need additional logic to delay
key deletion until after any in-flight users of the key have been
drained, so return -EOPNOTSUPP for now.

Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v3:
- move the replaced assoc to psd->stale_assocs, so a rotation
  racing with its free doesn't count the socket twice in stale-events
- document that the previous rx SPI also stops being accepted once
  its device key is rotated out
- drop the claim that the peer accepts both the old and new SPI
  after a tx rekey
- document tx rekey in the tx-assoc op doc in psp.yaml

v2:
- place new assoc on pas->assocs list instead of psd->active assocs
  list
- reject tx rekey on SADB devices until deferred tx key deletion
  lands
---
 Documentation/netlink/specs/psp.yaml |  4 ++-
 Documentation/networking/psp.rst     |  5 +++-
 net/psp/psp_sock.c                   | 57 ++++++++++++++++++++++++++++++++----
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/Documentation/netlink/specs/psp.yaml b/Documentation/netlink/specs/psp.yaml
index d5713f5d1af7..f6af1a510d17 100644
--- a/Documentation/netlink/specs/psp.yaml
+++ b/Documentation/netlink/specs/psp.yaml
@@ -283,7 +283,9 @@ operations:
         post: psp-device-unlock
     -
       name: tx-assoc
-      doc: Add a PSP Tx association.
+      doc: |
+        Add a PSP Tx association.
+        If the socket already has a Tx association, rekey its Tx direction.
       attribute-set: assoc
       do:
         request:
diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index fab797506b0a..43f222b38d3d 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -145,7 +145,8 @@ Rekeying
 
 A connection which has completed the exchange described above and is
 in the "PSP Full" state can be rekeyed in place without being torn
-down, using the same netlink calls as in connection setup.
+down. The Tx and Rx directions are rekeyed separately using the same
+netlink calls as in connection setup.
 
 ``rx-assoc`` allocates a new Rx key and SPI, which should be passed
 to the peer exactly as during the initial exchange. The SPI which was
@@ -154,6 +155,8 @@ next Rx rekey, or until the device key it was derived from has been
 rotated out, so packets the peer sent before it learned the new SPI
 are still received.
 
+``tx-assoc`` installs a new Tx key, which takes effect immediately.
+
 A rekey is rejected with ``-EINVAL`` if it would change the PSP device
 or the PSP version of the association. It is rejected with ``-EBUSY``
 if the socket has not completed its initial exchange in both
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index c1e38845f08c..d497f41c483e 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -280,6 +280,53 @@ psp_sock_set_tx_key(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
 	return err;
 }
 
+static int
+psp_sock_tx_rekey(struct sock *sk, struct psp_dev *psd, struct psp_assoc *pas,
+		  struct psp_key_parsed *key, struct netlink_ext_ack *extack)
+{
+	struct psp_assoc *new;
+	int err;
+
+	if (psp_dev_has_sadb(psd)) {
+		NL_SET_ERR_MSG(extack, "Tx rekey not supported on this device");
+		return -EOPNOTSUPP;
+	}
+	if (!pas->peer_tx) {
+		NL_SET_ERR_MSG(extack, "Socket PSP state is not fully established");
+		return -EBUSY;
+	}
+
+	new = kzalloc_flex(*new, drv_data, psd->caps->assoc_drv_spc,
+			   GFP_KERNEL_ACCOUNT);
+	if (!new)
+		return -ENOMEM;
+
+	new->psd             = pas->psd;
+	new->dev_id          = pas->dev_id;
+	new->generation      = pas->generation;
+	new->version         = pas->version;
+	new->peer_tx         = 1;
+	new->prev_spi        = pas->prev_spi;
+	new->prev_generation = pas->prev_generation;
+	refcount_set(&new->refcnt, 1);
+	memcpy(&new->rx, &pas->rx, sizeof(new->rx));
+
+	err = psp_assoc_set_tx(psd, new, key, extack);
+	if (err) {
+		kfree(new);
+		return err;
+	}
+
+	psp_dev_get(new->psd);
+	list_add(&new->assocs_list, &pas->assocs_list);
+	list_move(&pas->assocs_list, &psd->stale_assocs);
+
+	rcu_assign_pointer(sk->psp_assoc, new);
+	psp_assoc_put(pas);
+
+	return 0;
+}
+
 int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 			  u32 version, struct psp_key_parsed *key,
 			  struct netlink_ext_ack *extack)
@@ -312,13 +359,11 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 		err = -EINVAL;
 		goto exit_unlock;
 	}
-	if (pas->tx.spi) {
-		NL_SET_ERR_MSG(extack, "Tx key already set");
-		err = -EBUSY;
-		goto exit_unlock;
-	}
+	if (pas->tx.spi)
+		err = psp_sock_tx_rekey(sk, psd, pas, key, extack);
+	else
+		err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 
-	err = psp_sock_set_tx_key(sk, psd, pas, key, extack);
 exit_unlock:
 	release_sock(sk);
 	return err;

-- 
2.52.1

