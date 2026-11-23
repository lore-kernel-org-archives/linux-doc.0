Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435004;
	b=WkJrz7G9DzdTWj99gym1Mt5qCYBqrfE868G/iyBSzl7fJSHWCc1Ve+cae0HG6QXFk/Hv
	 GSNseWjd27I8roBMAiYfxoPGS5kSLTjqFL6dSW84YSiynm2dXAwxMS8AqZ15Dn5VKAFb5
	 52Qr/bTeZlnSy71LhYAVIZWbmhUUj/tTo9Xm1J/X0JoIsJfrn+k9jTVz8/0Q/Yn5OUy6g
	 DUZP/SfPy3oIitRdN6Dwvk2VUfEwIz5hlxUPyN6hj4/P5dkRNQByNlAOwB6qyHMXv1HF6
	 yTRuntf1G2hbAhQiZ0/doDitE0e1m7pm495y/Qp3qkJDKz6hkFKArXToD30fuUGF5Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZJlmpMMEeTrTkXIDblm/53j4ojpLz2OHI/cOPPGH9Ko=;
	b=32gtNWOGGz1OxUaHkKhOmQI0T6ElcWiA/QVzYcYuwhsK52TldIt6s1e/hcSJdl/ra2qo
	 3bE4LhAMIweRDEEl/Z6KWVyeysgtxr2BxGf26voKbHLv4zii56LmPb6q/IweWYgr1ocfN
	 VNhLRbbwNfx/LYVxzFF0Uc29T+/XIwY4soMns3y6BUDKgW6//ni5ikTysvkrOaz2mVPMN
	 4PAn4JdfoDtrJ5bzOU38UfjcVohDFB35SO3mn5+NzrglRKl01eC2y3ltmXdQZGqKvaNgs
	 Ii9modKIPQcvFETCF/CpdFyfaOqrppU29x6vpJy83N3+5Hdv/Y0vaFzlcuZnRMwnzgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="J/awHD26";
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF47606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF47606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J/awHD26
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3866a784546so3993689eec.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795435003; x=1796039803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZJlmpMMEeTrTkXIDblm/53j4ojpLz2OHI/cOPPGH9Ko=;
        b=J/awHD261PLJj9Qe/JZNeYzKV+MreF1QxUUsO8EB2U2IjpsBFvQtCGQAgvGZkXeiX0
         Y6c6coM4F1xPWApHxPCiKoAEMIFos6Vld8cylqYPUWnY+aegIRGN5RzUA3czoCr9TKnT
         2MIA9VV8+6NN53yJmqoXzpcJ9CITcViyIgjyEv+MSBi0aRkRPXxNb735ET8MmOy3Ljp/
         M95/3YlGmNh/ys+baHJz+s9MBMQ87GzjANjRPbabuyHMQGSZbp+8UemVYh70rqmPZVc8
         ZM88A7NqFBfh2ImvY+zanu9/fTDT8QE7XfKeVIiV54lxawo80TrrLuicv38PFxitzbc6
         zX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435003; x=1796039803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZJlmpMMEeTrTkXIDblm/53j4ojpLz2OHI/cOPPGH9Ko=;
        b=BD7S+nHCZsyYXr0Kqi9tuJj1t6H4pU9tEc6q1fqHlEgH7p++QbnfcJbhNH5TOdxjLn
         fWB1GOI/558Cj703WiZiTtMPoGqEKtTPoaDKHjP3wOHfuKgdSUk7BVOc2yYRnzpd7CO8
         cgtQd5Pt8uYrBfGwtWySLnVKO2aGlLd1GtJZ9ZNQLNB2z+55v/koteYW2H6uTgxZ8HRP
         eAf3RkrpeZYttOjKQNHItNBfSjOGUw1gIJGqlKAcllpDTp9uoWqb5g25DaafWeZh+Lrs
         PyKzci5DLoNDEfNSe7v+3lKL+AWpOFGzYvTvDwt3/oG6Jw+bruF19IpYKe0I4wSmFfNM
         BcRQ==
X-Forwarded-Encrypted: i=1; AL+hErGWo4Une2/PSJPv5+LmvCauLIDvTk4jzqjtQyM4j+2ztqOkWs3inmtXUtvZ2iOIfgVczADjDcryjdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tCjR6ZaBQ+bqLMgtyRiy2QDhQUaJIAE6HkSNg4cXMg7VQ0v54
	tCeeWZOXrPikEg+GNl6/QEawDi9jaUBUukhCwcQRhxTYzc2ESkWCV96T
X-Gm-Gg: AZFdTZdccG9MjbnQlpxZC9NeS+zgRGWB1aAmpXDtvG/3+uJGcehnr1i7GC3NhfNIGUE
	avdYmbFyLoYGxh9rPIgI4aczzZOwXYrV32omktuj3ctSH3RwJvj8WSfgFqB7owsevLURIZaryZ8
	6kpa6SL3n9SULiJSnwjS4SQ9ZhFyrfhvoAid3sOCD0ln3jOgmBVaIez7TlHVUj3QHB4C9yi6dAL
	l02G6DuZxnGAlKqgUcipjZi8pZT97oLtoZSDvC2RX0e/kdAVZseVQEeshh9/62F5CGds3VF9g5X
	HrWm+XyZd9oB8UFsq6JH9Y+i50DrPnE9q6RtZ5qCTWyZzm5jRNwfrEEjKWsTiBBfD79rBAHA/Kz
	Lwz2cFDHBahad6ilVHm5ypE0+cTwIj3Xo24fhSRvQlQkKyqVggcaKERO/GynrIBkhNZOrh2anJk
	kNKgijm9Lo8bSz0Mh0a/Rk166ttWvEtlFGYgR1RcMBqFj+2p7HsS2w0Zk39s6q6+/ARI2frG4Ue
	W712LE0/yZ7UvDIQ0sdvgqwa6WZykuNH4X4fdK7lVVes9UBcyUf+Vr8iwV13dJTxaxyvwYvIKaa
	eKW4Ltz2GfvT7RvtMGrJanxNPtQNeq9Lx/4cPCDIGTyrcNIsJpl1dydbDy2Won/rkSBmjfQW7qF
	1f/vamtzZ8WfkCw==
X-Received: by 2002:a05:7301:5093:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-386992b3f3bmr8479130eec.38.1795435003131;
        Mon, 23 Nov 2026 03:56:43 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm33541924eec.16.2026.11.23.03.56.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:56:42 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 09/27] Docs/mm/damon/design: update for report system
Date: Mon, 23 Nov 2026 19:56:25 +0800
Message-ID: <20261123115632.8842-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121210013.130397-10-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org> <20261121210013.130397-10-sj@kernel.org>
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

On Sat, 21 Nov 2026 12:59:53 -0800 SJ Park <sj@kernel.org> wrote:

> Update DAMON design for the data attribute report system.

Makes sense, so LGTM.

Reviewed-by: Lian Wang <lianux.mm@gmail.com>
