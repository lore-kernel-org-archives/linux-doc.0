Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285936;
	b=yCHT2FfUaWSP8tkPZQFwo1uyikFAiKD1LAv7Fc1rE90ikJLooR2mgBhtsJkGFoyBKJn5
	 UJGt0Y1pr7WNI4RRDg1pGTriMEzSo5HoouHWvy3bvS0K1kTzsNHlYMCbxEtZ0e44WVySn
	 eA5sGSIJGb6aCSmQ7xoJFqoSggg7PQxpXTbZW6AQlug4OP6LhD7vWGMms6C3ozXU0SzEl
	 255yMZeUl1+o2DqsACIQyqrwQQqbFgFR+iUsvoMxRAlG6q/jCNgC11BUjofTR035BYpp6
	 5/u8Q+uKyY4KFcLR2GF/f1J66aEUzVhYf0QSiHrslyL33f9VAAqlvA46UQRcGQbRnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
	b=K5/Gb9v86+YrcTImx73Gqp+Yr21rynp5X9lOC6oGrTpO6ceKo3grlnWOYfStJVeL+x4b
	 uwT96Qy37rx6aGbUqgvBGYa10ka0gPkIaIQgTsmc8Rv2muLaz0iMvbAeRIdFMQbmJqYu6
	 JleJBrbAmfYAg9Fp6XjrbhF5Z/Un73D5VCncKRGGWRFZUHEz3UFDMiB7DLJRNrRJoRG5m
	 WjH6ok+x3UFm7wg5g95XeDs1yKdIP1+qiwcIvZYMRMkLluTi08mCPF0HWmFJUfzcsI4cd
	 k07clB4WIMlvTbTox6gRCqDzANqFJubtYWb2f5KgkYj8tV9ODKPgMLdL1BPQsvw/hPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58556606A32C
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 18:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58556606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Daghztvb
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so819599c88.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 10:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795285934; x=1795890734; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=DaghztvbDwmLFkrHuo7a/sJTEMIbMPmqTCllt3YXXs5/QvBXSOdXJqhVDvN8JLxAn0
         Vriw8/p4M1Guwy4T73CnQNyFoXuwNeLiyfkeQxsU6imRnXU9tQehTBTNWUntjRpNOnmt
         81VjVdUMTWUnSOsb6oSsyLdzYGp1/peaaANrZO6Z0YHZRiHJmCYVw7lm+R+1lAM23u0B
         2XQ+EBzTODDyCbn7xTfv0qbjMsNI0g0OwlLQ9b6SaiVFY0RhrvKqDHIKkpGzbbRioG7Z
         5TG/C2jVnysrVLiW9jEyHjBQO8xtX71626/ZYM761cudpBrdY6lAEgVsCBaRu6WR/0Or
         mQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285934; x=1795890734;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yO3QbsamQWD6lYmcNlTS5aLXfBdJGNAcBuob3Fh76eg=;
        b=zRRGxDL9TDIVnMylqdcZmzMZ3NOK6Xb/4J+KgEcFVcAFOFf+OTqEhcVM95ZuqgYFUQ
         fOg3Ri9xvLFebphBfW+VFVxxHgTHZMcsr+cbd40AWQQGcnDO6lxxz84PkQ1H17AlZ5fQ
         zRTtSbVnM+voFf/kzQJJ8jH26r3lsQOUCcMI0NJsPdebYtN9Th2YAhyWMulKfHAc0/BU
         J3clXSW6WE06QclR1gM2UveuMBzsGy81QA3/APl2P5RQ14KtrDaVt4i80gbO5x+sBaSm
         eLfwHz4ZhGtVH/EscjZQ81I9CqNj1bKMTKOKZU8ay+MtC3qPsKaVr9bvd9E0/vuvZkLJ
         k8Hw==
X-Forwarded-Encrypted: i=1; AL+hErGs8pZy4u6PDFHiEnCt5pcZn3MsO74M22xq2sZpos+kmlctw3/79EUabAWg3iO+E8ll/qAqha5Bqsk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rjTpyFhp5tDmL3blN3XSID9qdFkJTXkkJAiFbMKlylbZu5/zl
	IVt7EAYWlLUo1lnBvVYHfT+GlmDrug+e2y/E5Mmdn0PAoraEShNeVGd2tUayEl3e9KKmGXTN0aX
	VhfJs6A==
X-Received: from dlbrl27.prod.google.com ([2002:a05:7022:f51b:b0:1b2:375c:827])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f516:b0:1b5:1a41:f3b6
 with SMTP id a92af1059eb24-1b5567b4783mr5725838c88.4.1795285933762; Sat, 21
 Nov 2026 10:32:13 -0800 (PST)
Date: Sat, 21 Nov 2026 18:32:13 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-1-e795f20b8cfe@gmail.com>
Message-ID: <awHjn5AXWjW2qMPw@google.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: document black hole detection for tcp_mtu_probing
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:52 +0800, Yongjian Wang wrote:
> ip-sysctl.rst says that tcp_mtu_probing=1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
> 
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
