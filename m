Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2292633D6EA
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386095; cv=none; b=IREOFMM/fR/9IzZVOW6xM96lvs1qd8KX5vY/ifznNPqnddti/4BDR13gZShXBI07NuF4Vq+enEySEd5VBYf1GaIy3ZB8hhteAKdsJ02pK3SNihA0+urWO5KTU1iUbjGiP26fJ/8NFnHcjmXNeWGad6sc9YQgBT8grZHmQTNRsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386095; c=relaxed/simple;
	bh=H9m8zVbsOp7gcmCBH8RlF9JNCRCreopPhtESoOXnPPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM+bu6QRyQML81fv6yERB+iKZFcYKAz97uqnw2mbI4X9zFs/BJelUEYVDDq7eECNOVCQL7fHoU7IN0Db7Vky0HXymuzLMA9wgRUMo9Pf82+wf0nIaaZ5zbY+k9WXZk26HdPSvxBJb/SAr0InMgTSTz1H0r4SkHDhhzO8We0GKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdKLYsq3; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdKLYsq3"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-8138dddb94bso1038767a34.2
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386092; x=1790990892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSkTsfaYMmP1PnU5Xa8DizzGfXfRWd4gMaFV5M1yLeU=;
        b=mdKLYsq3sP/a65j0YnVfyvsmXEkMlNVTe9jwyxRJbWkQswYSLS7kiftONLMpVp24Ww
         ISDvZiK4zpsAIojGb6YuTxks/VZn/aRr3X8DfqdHbsex2XtibuppKvGJ1VT56bUxUxZq
         wxNCqGb6nUtLNjf0JGcpLYq0y/4MkawB2qzpU+8fXbP2ZB0qmqsSAslvZrHn/yUi5n9S
         eBBohmSzC7qjTsrtBRU7/e54yVQqyJEQeMHk61z2OpfzFJZpnRDRVY9VSxEq8GKRzAjt
         IPY8esi14rq7RqUNMC5abme7+BrRemi2CUCdypX4Dv3ww9lp+u2tMr+DnmzeK3Gxopan
         y+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386092; x=1790990892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSkTsfaYMmP1PnU5Xa8DizzGfXfRWd4gMaFV5M1yLeU=;
        b=bxthvqBMaldNhAYoZhsYPQSuP6Yapr0sTOfGMCEdlfo1y9PyoCkQNLw8UseOY5c5a7
         aCxudhNDcWYhPT67BvXbgcET1qqJffUANAKrj6L4Q7YRUw6IDRLAv8BzStrtEcbWpStY
         L32MXCRC+7QhhdQlmDmw7BmXwXgmY7aFqELANJAHTAt8Li+aiHTosj/Qq2cnVe+Uqufi
         UotX4LeAnaoaCyT9+XbLU2ZBlN3NNwRBrQ5+W7qdru7ITYNWvG47UhdFelV5dnYXsuaE
         X1zudQB2Wk+EjPmody1O7YDy+SdpPgAD+tyQ29k5RkvNIFM6Qyl8MTCDizA5cqjwrB8y
         ZqHw==
X-Forwarded-Encrypted: i=1; AKwUvByvuDvBmA4jI5iP54TrVbJqndPv963eKiedm+NHiMtosqSyz+D5HUZPotrXK/Dy3DgdNNSgzNYVasg=@vger.kernel.org
X-Gm-Message-State: AFuF++k0BzRnE30lrvsEgLciYA7+O76jixhr0EhD/nI0lH3XqhmQpcL7
	2hJcX086R4odIzWQ0ekiJD4bR5EbPdqzzUSA3VryydqvBGWRc4hv0Txe
X-Gm-Gg: AYBFou1V3lhTCwtHiMgj34BYjQYkXpzfwWoav+q+G9r3YAyCKZjGN0LhTsepCwJpom0
	1FboKEE0VERzYPL4JKAvZNV3P149DOWHSfUOAnpsEBRbLP8OGN2aBr6+zM8fsliMkV4vTEdKxln
	rNVNRd5oc0YhsQWA7pHNhhY37kUbftbabcs90XNbsAtalJSK8BSy0gVBhU+WuLQ36GmlbVgZ55K
	PRiDCMkgEiXnrAfZgMs3GxGVg390BGBHXMSXX8KWYdmwhe1pIyg5gAgq462FVb9INKyW47UG49E
	IYcgpJDiUMtmhDj6/hotKnITIyXp/ijBh4AAxjgru5CHkTWs1jxD5jvaAv0prJBbkAuVB9cxMFH
	fi357j8lsH41AHnvEkovfA+9wvr46dBarz5PhK3Vq5ed5RPogJgdfOwhpnN3TnRq7QY1/kLScIC
	hjudbhkXEPyHlLqTkZae1f5bi2peYk17mBy/h8DLEttsSjq4sri3hE+i7W7bhWC0L93zEA
X-Received: by 2002:a05:6830:3896:b0:811:60ef:69c2 with SMTP id 46e09a7af769-81780d90ff6mr8450075a34.4.1790386091940;
        Fri, 25 Sep 2026 18:28:11 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e8befd4fsm3885911a34.15.2026.09.25.18.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:10 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:57 -0700
Subject: [PATCH net-next 2/4] net: psp: require an established connection
 for association setup
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-2-9f0b430107aa@gmail.com>
References: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
In-Reply-To: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

Return -ENOTCONN if sk_state is not TCP_ESTABLISHED when read under the
socket lock in the rx and tx assoc paths.

Nothing useful can be done after association setup on closed or listen
sockets today. Listen sockets could accept a PSP encrypted TCP SYN, but
the child socket will not inherit any PSP state. On the other side,
establishing PSP state prior to connect() will result in a PSP encrypted
TCP SYN sent to a listening peer that will in turn have the
aforementioned limitations. That implies that there cannot be any users
of this feature, and thus it should be safe to remove doing so as a
feature of the PSP uapi.

These can be reintroduced when there is a use case and a design that
takes into account all of the socket states that are reachable by
relaxing this constraint.

In theory, the check in the tx-assoc path is more restrictive than
necessary. FIN_WAIT1/2, CLOSING, LAST_ACK, CLOSE_WAIT could be allowed
and the peer would accept PSP encrypted ACKs in the post FIN sent
states, or data in the half close case, but for now we can just document
that connection upgrade protocol should avoid these.

The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
psp: add socket security association code") where an unsynchronized
write can be performed an assoc shared with a timewait socket when the
socket is in TCP_CLOSE after shutdown. This commit is not included in
net, because its premise of preventing listen sockets from holding assoc
state depends on the net-next commit 8cc3aef0cb19 ("tcp: Do not allow
buggy transitions between ehash and lhash2.")

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 Documentation/networking/psp.rst | 13 +++++++++++++
 net/psp/psp_sock.c               | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/networking/psp.rst b/Documentation/networking/psp.rst
index 4ac09e64e95a..2aa971e16d95 100644
--- a/Documentation/networking/psp.rst
+++ b/Documentation/networking/psp.rst
@@ -132,6 +132,19 @@ numbers in a way that deletes a prefix of the PSP protected part of
 the TCP stream. If userspace cares to mitigate this type of attack, a
 special "start of PSP" message should be exchanged after ``tx-assoc``.
 
+Upgrade to PSP must be done on established TCP connections.
+``rx-assoc`` and ``tx-assoc`` will return ``-ENOTCONN`` if
+``sk_state`` is not ``TCP_ESTABLISHED``.
+
+Disconnecting a socket with PSP assoc state (``connect()`` with a
+family of ``AF_UNSPEC``) will succeed, but should be considered
+unsupported. Disconnect does not reset the PSP assoc state of a
+socket to avoid potential for clear text leak. Disconnect on a socket
+after ``rx-assoc`` will leave a socket that can be reconnected, but
+with potentially stale PSP assoc state present and a reduced MSS.
+Disconnect after ``tx-assoc`` will likely result in a dead socket, as
+the subsequent ``connect()`` will send a PSP encapsulated SYN.
+
 Rotation notifications
 ----------------------
 
diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
index a9cfeebe4ba1..a6b1c42dd626 100644
--- a/net/psp/psp_sock.c
+++ b/net/psp/psp_sock.c
@@ -159,6 +159,12 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct psp_assoc *pas,
 
 	lock_sock(sk);
 
+	if (sk->sk_state != TCP_ESTABLISHED) {
+		NL_SET_ERR_MSG(extack, "Socket must be in established state");
+		err = -ENOTCONN;
+		goto exit_unlock;
+	}
+
 	if (psp_sk_assoc(sk)) {
 		NL_SET_ERR_MSG(extack, "Socket already has PSP state");
 		err = -EBUSY;
@@ -252,6 +258,12 @@ int psp_sock_assoc_set_tx(struct sock *sk, struct psp_dev *psd,
 
 	lock_sock(sk);
 
+	if (sk->sk_state != TCP_ESTABLISHED) {
+		NL_SET_ERR_MSG(extack, "Socket must be in established state");
+		err = -ENOTCONN;
+		goto exit_unlock;
+	}
+
 	pas = psp_sk_assoc(sk);
 	if (!pas) {
 		NL_SET_ERR_MSG(extack, "Socket has no Rx key");

-- 
2.52.0

