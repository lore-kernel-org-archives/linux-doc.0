Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D003733938F
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 01:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386101; cv=none; b=f4Yz5D7mTvJLs1XWdQBd1CPbUpidnzsD/ACHHhTgXQGKzwEoracaqe0YDt0ovic3bKkMrjnYe3KZVcjpU/sdVY7B4R3PKqw78u8Y8G1jo6E8QwvYUsBY7EXBAvEAOl0BRzIG4ZQX5cHPQHXy7dJBHZSIeYSdJp/HDdQ9E5BKUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386101; c=relaxed/simple;
	bh=TsKEM23vrGNZP59nClNAGbEF4QPHeuq9r9xlzWpsDi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaNKHDnA/rBO9IY/HuSVmqpKl2byEsD4yQyMUKYbN8HCdQPbhmN+SShv4o0871gIukXCNQ8sxwe51CrOlA0g0yuCtVHEhjlmcAIsA7C+u5OqD9vdLV21DaoJ1ADocjt0zCOO/d9rj/E8bXp8GQO3yj/XTof4IELSM4lEyrpI6Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmRIuzEj; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmRIuzEj"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c4bf3defecso1089823b6e.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2026 18:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386096; x=1790990896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=mmRIuzEjQ4ofmZmP4vOP7quIcZdDsgsU/UezqAP7IRD2UtAx/csfEruLphAHn5bEqc
         UTmfm6akgi1FKnKpoGWbL3su8Jxftbs1jtcaeKkKBudZGzc5faaZoyGXJ3pgOL2coin3
         22E0RJ5IExUlgOJZHW6O4+p+GWGQxkMTVqKnstRGrQcOJVuPzu8NC39xElfMkUMcILb0
         qVli6r7EHZeIjgxhxt9qAC5tBDmU05+G+vqdmz3C12Ms/X47OSh6JgBWd2quIWSO03R5
         PAp7B4OhYNqMisXRt9/VsuLqT8UQ4H1daarAwSHdlsMD1fcqhYco3Yyc9TPzPhvVuUtB
         UuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386096; x=1790990896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKazThAjDvEancv5DllE0t7hYEI/Pi0fz1aTpnksd5Y=;
        b=ekAySAcDaj0ev3tzUW5f2EANJboPEoPmqJBFVcJuwXJrZQZm/+2lfWDChXQ6sCLnUa
         MFuZsdZHJjtRynhPH/q+aQ0vFeQdfRqb4osh+7MTqEeTKUB8h1o/OnkDKyNFhfHCQUCG
         kdTRuahcq5kiYAPA7hldTFCxIla394UjLHcuJo2vwJiWAKKQeoMOU20wO/Uxrbdvfa4n
         0/WvqQXOAygHsSZl5sJrQ5XhDMtaURKtsD43kvwYVC72rgSY1l4kV6sCHu8Wui3gvxL2
         8UPGz7aBSC/t6aB7vFZDbLGjPcDGp88JrLD6f2TrdZSBd+uDDMLVeW01U/Yr3Fj5YpyD
         +VZQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6HQQovQTbz7Diq6VUWb7XtNTMKiqog2+yR0XJMNYvXdg08qLt8s8pKgGEe3OFbrR8E6iVaLjFE4E=@vger.kernel.org
X-Gm-Message-State: AFuF++nlrVXeIBIMWKdzqy/b3OkQaXlmAgT70Mr6XbaY97/T+DZ8jMCY
	DLZj1wvrK87we2EJd3tSpuSmKJXcC7/cxo4O/BQV6mdPcBSXc7K9vZC/
X-Gm-Gg: AYBFou23uIAozn/6Tv3sH88/w+5mEzH/wKR5TDnJn4edwkTy8q35PSwIQHq8qToDCbJ
	G8vaHhm65put6Lb0gDFcvPL0hLayWPc0I9ZlrQeHrMbgNQOBlOk7+3XnMrGpFRk74QAux6T3VMA
	y+/o6a4DhTpHR7qfILdEfd525oSYqvOfbZhsyCIbOJ03ZavRg9BT4IBZXShU6gkAadf3glDDCfH
	l0FHiXHcIsCp7WhmyNDufy/b6dpEfpRlXSOpMBa47KgReGIXT/sOkYAnB5QjKSIqwNGBnhLaF2w
	HvYwr4xuhNUJFEuRhyWMAFfZJVyAAWwGJcuXCcArfhMOA1QALeM8tWFA2TtvLO7ChQm3DQHfYJC
	RDp0HyxbNOPwesv4B9DeWphNKBvI4BWdtYRPr0FxmEWlSGgnGTNw7t92c86KQF8jTBoDz0Oh44V
	dzMsOcYc15c0hM4JSa+mro5dVeDXLYAaSHNQiAoZ52bZIF62dmVmeDC5cpoab690Gttudf
X-Received: by 2002:a05:6808:13d3:b0:4c0:12f3:6007 with SMTP id 5614622812f47-4d72892496fmr9250533b6e.4.1790386095748;
        Fri, 25 Sep 2026 18:28:15 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:1::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbfc14afcfsm3569233b6e.18.2026.09.25.18.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:14 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Fri, 25 Sep 2026 18:27:58 -0700
Subject: [PATCH net-next 3/4] net: psp: drop psp assoc clear in sk_clone()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-psp-defeat-v1-3-9f0b430107aa@gmail.com>
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

Unwind the change from commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), now that assoc state cannot exist on
listen sockets.

With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
ehash and lhash2."), and the change in this series restricting PSP assoc
operations to established sockets, this state should be unreachable.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/core/sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 2948dffcc3e1..d7ddd365abeb 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -2496,7 +2496,7 @@ struct sock *sk_clone(const struct sock *sk, const gfp_t priority,
 	RCU_INIT_POINTER(newsk->sk_bpf_storage, NULL);
 #endif
 #if IS_ENABLED(CONFIG_INET_PSP)
-	RCU_INIT_POINTER(newsk->psp_assoc, NULL);
+	DEBUG_NET_WARN_ON_ONCE(rcu_access_pointer(sk->psp_assoc));
 #endif
 
 	/* SANITY */

-- 
2.52.0

