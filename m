Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106680;
	b=4MXGd4zdlYm6o5eMN77elS1/LOtMICO2IeZnfI/zRR29fMU6f/f+voktFB68dcdeCTDg
	 4WJtrCGWVFUGs9zTC7clIukrffZjYTE6s0Qj3irQMUXtRQpcvntDvadzBSbQpc5UZ3Qyd
	 5SFSQLiffaxMW143AezPlNQun/zpNRU7kZoGXfvkFuzV6h9emmmJ6vx7jQgKD+WQj4vku
	 xJYGZOkeftbX9ouJ6Ejbf4tYMrqUoOKo7p4o2Le9n5kpKNq4oVLnqowe+ArsVY81Whf7A
	 HcpFf0eQYCcQVj3ekz3L71nQ1hBWW0qclT9J92zdM54FC5bqLmBtA83TJ+l9dtTbiXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
	b=q1bXL6iFpDIK9c6/0cAbjuSM7IVZpUeW6TEpMFsX9LyntcoEMEGWYKE7QwJ1BJ0CacET
	 pczlZkvjU24Y+JmUKrtTnbTzWY/V6fUQeZ2UzCvqzAA/V8eaVsF94XsrNPVPIeuYnqTPW
	 2EwL8Qn/K3dJOrY/k0wILAQBkdW70L2qxjmhykjAO1OiESn2sfm4JpeOq3JadphW/z9Ii
	 lzKoL2dlYRxpWyEQ3K7PqSvt0mdRyFpYKrml456fPqn+oMSBoAb3MYN4uz0wwPheDpbAX
	 F6g35IIzNfBKKGAIkbbltqfCQOWeAT2K0EJbU7TrXz71sROWaqShAAxB+vnZaZZwKQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72511606A32F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 16:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72511606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQ414flI
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b271e573adso1197276b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106680; x=1795711480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=RQ414flIVmuB8vvRnrunHccGzUqdPpcgcwYaLUZ6H21cZDBg7PY2aTLFXnBMsHoMRd
         38tQFlsbfGyeJFasCda8TvHb5k5Yvi/eVOjKqNM7qQNDa3hXTfeZ7txKRPwllccKZAZ+
         FRFGP4cpEees7vLq/ZIQ4DL6p/nvsxpC65XPvX3HaXYsMYWCy3mL3yO4hfJ++wq26riK
         PzQr3/Q85tHXTcKb0MXJryCgzxEQHlAxs4Uy46E9FmZeBuO0pNGI/D0lRYRDvGiQ4L7p
         7RTF/IwJvehvOpit9VUNGo34pB9FwZ8tpKR6VsVGdtr5JL3ZJGnNQx8rLlSW/gNIZGh/
         HHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106680; x=1795711480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+X+PnXRxbIpUUxSS6LCpA/7gQ5HQHgpeF9zf6tH5/I=;
        b=Hw/Mwk5SsOrVwg8hZ1TlfnPjREAnZBoWnfWBi6aQAlMCp34xjJiolXicCJFpkDc+TC
         /tx1mQwuEfHdHUELRufJM4Di/MfWUfyQgDk5+QbqstxIl8yBPD71KsO5PK4SmhkzNRbI
         mEUWFQ2tGtHbxGjgh9CRLRLML3qqWqjd26FHUt9JUfR4KgmwPkFlNjN7JaAXkcLOnRgh
         hyM1MeF7jBqpYHt90QNdGYRFrfFE5BRB4EriExv4YnWy/PDVcMgy6oezXsCCOpH2lUUG
         oyd8osoo7MstuhzCDkghTWwTtNPCFHqJqz5hpHLmD1Tv52mJNHb3AXhmaoUUDF75uK3d
         izIA==
X-Forwarded-Encrypted: i=1; AL+hErHXASussvYypH8gKoTxv3AJaOCKdK0o0q0IbPHr6fADS/nZkI3E9PC/xMSChmpy1UUpdQatNiVnSzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o19aFVg6nGhG48RGlORFG40tGPIxnv4m3S1U41+PqqLntbpPW
	6dL4+laZYLC4w6tBr3yFIkGtgUWziu47ixhx4iNkyROnNPMaRHG6SHJkk6Dja19KhlE=
X-Gm-Gg: AYBFou3Jf/apnf+L3JtvkdHnLMTr14Jn6qTsEHHREwDFSZiAKl7ZH7WYojaaZqfcAbT
	xjfO936ZziLLampFpqEx9nXAdJANM65b2I188rByfO9m58KW8wcDSdiSLBXs5bT/p75sHeBUk1E
	Ifc5JG9QXh7CC4qtF3Ix6uTBnjiId5Ve5dGJY/j2ZC+iXSiP3Ft/Hp7b0bfuH8vQTBgQNC1z+Gi
	MANSks82kPDp/RkJaI1Xmplevv2pEtve2JXoQCJKZ2AsTfUoz6FnY2S7Qd9uhN2SaN/WkbVT/PE
	4urMAHKEr0B5JzT0RcxxLR8fpI9Z+yjrS/ljeAws3qkBm2AD4MAmCHynF+2h/qFBdhSy8BAHlgO
	e5aE3HN7uSkFb3afw+ikGNE2nu9X6Jjir9W2EtcqIjSYzW2A00ovBZppbn8FQScyOpM8yKpT2ER
	YFrTpJIcyEUobKA11KCdD6mhY5CuBgUXzzpW21dKkf3w2kJtOJ7UiJ0fMBmOVvmZ3rEWRJQvKZW
	J2zscm4wndfvx+/JNEPR10Lv/bKsMpw+tBmwdHm8VNciy06o2gDK5jyAvFfyI+XMafLFH9XWtE8
	zRi1GaJbAtkTrFs8iO53GwAG4i27aXLhTz0GMmiRPBrtZ+gHLjNsncq3B9o=
X-Received: by 2002:a05:6a00:1f0a:b0:881:9f52:ca00 with SMTP id d2e1a72fcca58-8c87cb4b0demr174911b3a.42.1795106679710;
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45736sm173790b3a.25.2026.11.19.08.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 08:44:39 -0800 (PST)
From: Sangmin Lee <45sangmin99@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] docs: networking: correct skb_shared_info field reference
Date: Fri, 20 Nov 2026 01:43:11 +0900
Message-ID: <20261119164351.49040-1-45sangmin99@gmail.com>
X-Mailer: git-send-email 2.50.1
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

The skbuff documentation refers to skb_shared_info.refcount,
but struct skb_shared_info has no such member. The actual
field is skb_shared_info.dataref.

Correct the reference to match the structure definition.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..e66adf19a 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+&skb_shared_info.dataref indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 9068e05d35f3b02a802f520e664032f802bcd2e9
-- 
2.50.1 (Apple Git-155)

