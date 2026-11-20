Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194969;
	b=ig+e7S3ChJYr/OMHZtDCf+9FQ4W1CW9Gc0zwlQ8un0H9QDMyXQvATGZA1QqNHxd7IQd2
	 rJlxkHreIXy/8XpXvDnd2Kawx64UxnEtGft+jViovMauq5hE6GCNn/0W26qB5z52HqWd7
	 LUm5sl/LxcmMFSK9QCkIyRcmZes3oUcLrHqouQmhr6zYnK0q+Ri01/r1ziVO/JqvQlbbC
	 uEF1MnbSwqhRrJgJ47Gb0B1IP6vKfcd6O2E2Q4jhFo3L7fxv4KktW8NT1p9XcvoxdhspZ
	 7F/fijQm3dGt/dH+f5/JQWS/GXF9B6LQUPrUurlM3qEa/lLGoA8PB6SDfq8J5hvlW0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
	b=1gPE8kIMPoxyDqAyfaATzYm/TR64cUnOZ/hnUlDJk0yXjYNdesmRVQSFwlLReGvPe7ZN
	 UEvL6+L/bqOIpAvoGfqmVGyh+vi1a/CSOaUmuznWeCs1Xr3W2mP3JF3zyGQYQxZcyPsDI
	 K7XU8eth33BvDx4rrcFIcCKEnBuqs//j5a6rZ2ypQ2T6qWD0cpa36P9y/+DyhYnI3js4X
	 h0wmobkX6/KqMnEjSmezGgzv2IliA7Zd7bqp6XayC9poH8zFV8wOWcYF14E6fZfJShCmw
	 LI1nmNKgupsS5UUfrZuOvJSC2xMrwHFArdJZVU9KZ+tAdV/VXL/HjUteN5bqnRpQ+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEED606A338
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 17:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEED606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AYj1Kphy
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-382f4710a17so1873103eec.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795194966; x=1795799766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=AYj1KphyjjLBd4V/PI0NWhMVoZYCdmaZRrY06hloFeD+T8gHDVou4ZKAzkkBMJMpFS
         DD/OL5TJJ4YfVrhga+du0R6u9ks2KrZUCMJ6/WAwoKqXfkGxIFmPiSRnB9/1vup0Ucfh
         MHHy1HihObWfHY1g5UY4DJSh3d6sPl2alK7+CMx3bzJexjOquxX/BeGJbcPU2IyS0BCO
         y6O5u7IsCb8I6xcx7K9hvraMy1APDNKGB1ZTtC97fX1s7LOGk4cOSmoqwTjtJ93uggvo
         Lg5Cz9LcamiyjmNa1aEXv4huAQlai0tFrqkYHpOfqqFHQJnaHrx+RTge4kaGB1t4SnLS
         NCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795194966; x=1795799766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ad10zri1NeUwfB8wT8cUAMe2pfsqkPCnj1XoQxSAtyM=;
        b=oP5AcZi/S9+UFQFlMe3Ux+1B8EKNWF8J9i6n+QyrWAmhXRh7qxA0ZXBWAtpT0eNDZq
         SY1ddbshZP0F41WB0DKHWMLS4HDBd8NFz/RA0wKOcZ+H2bxJMqBgwfC9V8m2j4xE3h66
         OicSOo+6FLjDUMnhlOupsVv7VXlML+J9rjlWWrYvq/k+sgjyOmC43exh8667htuuXRB3
         SdUQ9XAnjUPNEX1ZU5ooEmBvkgjxIvHxJSHb48brTB6I+ijqJ46WqUIk3hxlSjRUtYp4
         st+zeE+tZBUlOcIujU/RQfg/SmwC0uXV2/taReYmsjTg5csFMf2Y7XZ+/ZgwVbgFUQgm
         QJQQ==
X-Forwarded-Encrypted: i=1; AL+hErHyBjnM/8O1Xc2DtVybZh+GVwxr1JVlOfXUOYVSyVGYKskBg9kXAwQ/mkn7qJMQGJ+O7Y63FsQsK7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PqtGtw6UnBMtoK9jfrIs4NLP6TF+K0XvlNTWRlcL8pAC/eKpp
	EUJOkr+38t7S4utQaU+pYWl/ZzFSIl8rB0FWFvHz0Nwu8O++g6nf0hqU
X-Gm-Gg: AZFdTZeTod2Wd0880EssQplXOJ99j4oYs8mOl0nON6av4E/uWTitY/Cs71H7wxuAnHX
	C3j5LWZ5m+1mh5FDavJ1/yXoI3VXusZ+pmiim4nemQeypJf8M1cm5wrxbs0d3/65t1CItfS8vEW
	TNa36jBXBpjxb8PIus/nnjEevsHTqnI6f6q5CLBfusYkWllQUnfaDP9qbb06PaPFhHi+7QGKgO8
	Xg1TjvG5zJuhzn4Glo5zFkhBfNyXwyp2ajhBhcQcLWAQd0Zt2YfzvXkQNhtoaoXvQsjZmRDwFGZ
	62cn0KQit4LrRxK75hr6wEHNbVd/RRwoZFrv/4tV0MeUqC2tamBhhLA4XXJLn2n5DADTBcIAusS
	YrGKrFYGTAHO4EK8Vtw4P5i+pZtxbXepZYl2C323AonkkAbf+Je89c8XqQm20aycel5hYdbR6wA
	weO0uzg99hfxxP81yHbci27w6Vf7sfFkLE5lHL++1vWEJ+WbQdGpqn9DHfryxdVP81meHC/zQvb
	VtlQ3MaT+2/8k6ijlCvugNBIB/nMT+mmxpsQuCOb4JErj3e+M5iiCdoF4dnbMGoleX1JKuM4jXO
	Fydiu584mWpWoIIMR1QqXvIONhIHnL2lvtOmgKOyIOhzARiySCUXtJoE0rc=
X-Received: by 2002:a05:7301:7188:b0:384:b800:2adf with SMTP id 5a478bee46e88-38571027b9dmr3560666eec.27.1795194966043;
        Fri, 20 Nov 2026 09:16:06 -0800 (PST)
Received: from localhost.localdomain ([1.238.129.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm10816041eec.28.2026.11.20.09.16.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:16:05 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v2] docs: networking: correct skb_shared_info field reference
Date: Sat, 21 Nov 2026 02:11:31 +0900
Message-ID: <20261120171131.73045-1-45sangmin99@gmail.com>
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

Correct the reference to match the structure definition. Use an inline
literal so the field name renders without a leading ampersand.

The discrepancy was identified with assistance from
GPT-6.2-Astra (xhigh) and manually verified against
include/linux/skbuff.h.

Codex built the affected page with Sphinx and verified the corrected
field name in the HTML output.

Fixes: ddccc9ef5599 ("skbuff: add a basic intro doc")
Reviewed-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Sangmin Lee <45sangmin99@gmail.com>
---
Thank you, Willem.

I've always wanted to contribute to open source, but I was hesitant
to jump in. Your thoughtful review made me feel welcome and excited
to keep contributing.

Changes in v2:

- Use an inline literal for skb_shared_info.dataref so Sphinx renders
  the field name without the leading ampersand.

v1: https://lore.kernel.org/netdev/20261119164351.49040-1-45sangmin99@gmail.com/

 Documentation/networking/skbuff.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/skbuff.rst b/Documentation/networking/skbuff.rst
index 94681523e..15a9a9399 100644
--- a/Documentation/networking/skbuff.rst
+++ b/Documentation/networking/skbuff.rst
@@ -21,7 +21,7 @@ to as shared skbs (see skb_shared()).
 
 skb_clone() allows for fast duplication of skbs. None of the data buffers
 get copied, but caller gets a new metadata struct (struct sk_buff).
-&skb_shared_info.refcount indicates the number of skbs pointing at the same
+``skb_shared_info.dataref`` indicates the number of skbs pointing at the same
 packet data (i.e. clones).
 
 dataref and headerless skbs

base-commit: 362917b0b26bd16587d41a37f5fd1c252099a73c
-- 
2.50.1 (Apple Git-155)

