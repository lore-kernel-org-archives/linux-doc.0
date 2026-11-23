Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452266;
	b=iibm2K1OmkCF64iLGpSfb5l6xWqGqyMSFoiV8daydt0EBjiVj4KLnNkHzLCxt+BnmAFP
	 AJadlZ7kn062uyWMgF27jqKRt538P+rXthbMmRACVoSIUVtI5NmkT4P621mszupFEvqEq
	 Q/WZX8L+XzmvASQBot5RLREVtLZ+tAP8MXEFOdL1DA+ElpwusQv0UU4pKAh/drdwSk2ty
	 5M5DStwtiThwoRTuhtmUhD8BuAZBjsfEFjYJdeG4aK2WnJmA3B4/qaY5NsLCNGrsKy+4y
	 dPuoIrPkqI5TzePj8rLx2hJBwVaV9FW0dpeqYzRPPue7c/E7AuueOeSpVb0m0ccOf9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452266;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9s0asUcF3mX53rYsxFbgE7bi8OLnIG92yhRD104En8=;
	b=1fi8TNpNeC1LuIGhvSeIe+dhmeOWMNyjwgRpq3zP2Phhwxo4cKEPUemMAaRrx+1Hggun
	 eqQrpP5/lQX7GjbRYrfgJfaTC9vAeuG4dNbue6cOMhnBGz+3w4lvKWNJSDmOS50Z7dPO0
	 4tlRNOO3PqTUPsm4K7SLUJhbzbFF8YRVeoGn6N8Lx4DkHx9Spyjc0JX3ifBP/vAow2iwF
	 Yi1KosHGZmUtJUKeg547DpN56hxzkhYRUT+EUSoacaLRCjdqFazYuK/3Cm12uWrW4iml0
	 gWb9jTi5Squ7kTZMasVq3O5hfbUkyBS9kJZ/JZLXl3ey7rzMkmyKkzRiXu3jSQBT1Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=KHowNZEl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T47wJBu+;
	arc=none smtp.remote-ip=202.12.124.149
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2100606A333
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2100606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm3 header.b=KHowNZEl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=T47wJBu+
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E7A3D1D00619
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:44:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 11:44:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1795452264; x=1795538664; bh=E9s0asUcF3mX53rYsxFbg
	E7bi8OLnIG92yhRD104En8=; b=KHowNZElMKYXTUS6Vn+Jgg4rJdNRkurLDOe47
	YduFJv0uhlrKMdtF3pL7LFZg7TZci0dOU9ymhNkM0g+b6XpV8RzaRAKYdEFcTzbS
	ukZ7IReKJjiVEzgQwhcVh6n/XJYpbWQ1bmGUyWmjACDVEEjBfxfzFduDEtszF4ax
	0w2w708ipFG50TYmEEsa1eVlTdxq+zh8k9AIDEOiHTUQGykfahvv5Nrzwi6fJPkE
	R454Ccm0Jl13o8eLfxLcC+MvlqUk0xEidcTlR5u05aQ1JlREinppMPKtWJGNSdGT
	k9HNdmsshJKSYfNma8EhbF3CHBeN568nKUSGJJcUdzy/IFsFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795452264; x=1795538664; bh=E9s0asUcF3mX53rYsxFbgE7bi8OLnIG92yh
	RD104En8=; b=T47wJBu+TTJRLZUnvWjk/jVTP1vYkP1oVtrR+ywUK6ACDShYCH1
	tSCO70DHwgK1AYGBN8AkmAoXaAhAjufYCCDplwsk6B/rNwjiMW2nDKzxWv28MITK
	WxIqbjQcvK7p1CeP1jCwo5QWaXu54GX+3uCThI69SZQJOnvtQHzfdy4zYO7E4m1K
	0mFbHonpx8t4e+kQ3EN+2Lyz5Kfr4xSB1j2ZL3nOLO9rIDekfaNrgpg1InN0jxgX
	rF+Iiwtheq8IWsM0uVWgWTqEGzJ276kMkEiobY0f0qBlV4BToP1Vs97gZTZ0qPvP
	t0JUxK9ICUTSblzZKE1JnBrWYYvXONriUSA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795452264; d=fastmail.com;
	mf=PGJhcmFudEBmYXN0bWFpbC5jb20+;
	rt=PGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:cVGdmBzmNi+LH49W/hQzBOmNsHNy0DBAlGS+QQ7DjtiFy0K
	mi3oklesKvK/n1bfd6a80uppa5TnBbs0PNceJtDfS6I7c7fS7IDuv//AeT5Tf7Me
	VMn1/CMqBSH8JlrvR3Yket3wNR/COpJlcEhjwCPaVBxCyqHqiglixxF7Ag1Novhh
	w6ayqWZa6d3rROwag7tl45bhERaw2CEkF2FF3KgfhZ0s+yWkK5Zj5ypzchkfyDTP
	A+Ceakk6xdCb65DTaWHW/Eqjz60qEAlMfjtMyBBpTHk5LjQIIBzLoj6fz4e0ZiQC
	LEsJ7I4uS6Cc/LP+0heXUWS9zfXw8ndhEi4tqKw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:lTbYK0gL1N+3GbljB+7bNYMiLGdD7zqRrpy0RZO4Ktw=:kkanJV4u9+DmEnqJSoQ5Wug8OzPsDrSriRYq8gx6MxM=;
X-ME-Sender: <xms:aG0Ea9LNtKmn_ScZQhgSLpuOlFCQnQkVm18PVrdnL5UwHXd3856D2Q>
    <xme:aG0Ea6p4HxL55pvPHLP4MhbtVhSdb05HLsWCOsRD0clO6UAELx_Zd9bJoI6mNkk6f
    wQ646HkyWT8zNr9Rv6DZtsQBltpB4MysF3qdEVuwthYDi2ma8jtkoggqw>
X-ME-Received: <xmr:aG0Ea1zZnNssZZ6Eec9Xu9wZiP0Wgb0ZYs216B2b7Tpq80oyQqV6G5_z>
X-ME-Proxy-Cause: dmFkZTFgBE5ApSHOfW5fH134JqdDRU2Lxuyh7eVpFb8qGd36aMKloYaWp2K26oChWmfuL+
    TTUxmFo25S56u2aGJhCxsbNmx1c2ByEFWY3t68M2s/s9NOHd7nrZKBhJieNQsw+b+n+CJw
    Gsdfky5DnnRhjOBlCgPD1hkTW1FPY2tuKXLW4+jQcZZCV0OuJSXuD+nanZ8zhH0PrDgW5k
    gBK8rqhhSC45ex4w7sVDBgfMDZ1QyPFeeMDU7u9U55U66vCvnwKOyqcSjRuKzJp6TEXZUa
    9aSQGh4xWXwpPNhgaxVKlFZAYhvhxPH4ECOYDmzd3wP/HA3ehMSpcXUqB3NHkFBNVsacbd
    zD3G5EUwvNJK9pilu/+U2Gh2Bf1WtpmpH2HegraElTBpOMbetOZDhfqu3kPcAbpvUzkA5m
    vP9F8frgrLcQF/+ReMzWkvY0fUL2WJIvtupJpK7jfn7H6lgqj+Pm5hFPJ8ZpvXj3ZraHMK
    WIK0PTEeEBTYT5dWZHnoT7EJ5FpaQO78kr236/DXMawSqGsaNpXhztAtrKsV6D+NYI9/MR
    LwO5LurYcLtWP3mSX/misiwWtKUwveYsziwGUkrxKcxAX6M5zHgi6XUcjOq62zK0Fz1uHC
    bTfC09KFFeMFpM2xPfjXjaddqB4gwVEmL819xAZ73PttbaSighKyLZat92EQ
X-ME-Proxy: <xmx:aG0Ea-ON3Zl_aB-4scK3-bhEfpn7uPgpQ8Jihsog7_46qSqpvDCLLg>
    <xmx:aG0Ea66jTI7-gsvs7rTcb4htCAbUChwcn0XAHZHpBtFRCSb3anr6wg>
    <xmx:aG0Ea3lGiTEr3PU_Nr31TgLjsOuE3JM_R3vf113v2ck4wfz6u_GCLw>
    <xmx:aG0EazQSE5sx59_v4jpLL8yLa4c4Pi8hU641tPCo52FaKGAS0slRSA>
    <xmx:aG0Ea7zV0Y2KtWDwdt-oSKtcSbBzp1Ng03x7lvms3IUzsmUZUREbwRkA>
Feedback-ID: i9dce4b48:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 11:44:22 -0500 (EST)
From: Baran Tuna <barant@fastmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: digsig: fix siglen parameter name in digsig_verify()
Date: Mon, 23 Nov 2026 19:44:10 +0300
Message-ID: <d548d5aed35fb8b664fcc31dc21773a251205399.1795452233.git.barant@fastmail.com>
X-Mailer: git-send-email 2.53.0
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

The kernel-doc excerpt for digsig_verify() names the signature length
parameter @sigen, but the parameter is called siglen in both
include/linux/digsig.h and lib/digsig.c. Use the correct name.

Signed-off-by: Baran Tuna <barant@fastmail.com>
---
 Documentation/security/digsig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/security/digsig.rst b/Documentation/security/digsig.rst
index de035f282196..25a0d7969668 100644
--- a/Documentation/security/digsig.rst
+++ b/Documentation/security/digsig.rst
@@ -62,7 +62,7 @@ API currently includes only 1 function::
 	* digsig_verify() - digital signature verification with public key
 	* @keyring:	keyring to search key in
 	* @sig:	digital signature
-	* @sigen:	length of the signature
+	* @siglen:	length of the signature
 	* @data:	data
 	* @datalen:	length of the data
 	* @return:	0 on success, -EINVAL otherwise

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
2.53.0

