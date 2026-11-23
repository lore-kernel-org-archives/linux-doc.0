Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455546;
	b=bXFLyCATVcNsV0+jdEVkfuyoxC1IMoRNXHlbvwVoRKqfDRma3xR6cGJD6hnxf9BFGLpi
	 QE89YrGUSSVV2dH7a9ITl3YgRMJmnIyNbDGzO/y2ei3gfyDWW2vsRZhERRCmWvGu8IpAF
	 L4VGiaWFEL7VtE4AuD/Qrnkf2wBtHF+EyhfJaT4xzuk3wcoQwVhsfumW0+RsXHDa/HWt8
	 8k6ZXjmnesdEYlc/GsRshdwkwqWsLxYi66Nt/xPOzTjRi3zCpS3KWjdke8MjOW4Ghb862
	 VtBaKpt7JUxVOD5e6Ix3jA9noqy6ijRcB0RQmxZfa1IyEpgwrTZBkzDq/NZlhZ9oTEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=6/YqHUloJtkZbpJ39+cQO94H2zNky60itqgdCHgeegQ=;
	b=03SIkPCKKg9my88wrE8PDtpwyZXPT1URXpL2w8T0EP5l3Nhhd7g5gZfZt3bvruXI2pAI
	 sxMGgru5fAPUn8Px/9Mza8u79bugfHakasY3j8RM0EkCd1HbBCsO2N6y3ksVXuK1X4tVh
	 TQwFojfdrC5McY6lle8gpSv8HlnfVcZrRtrnfZeEVP4X9sZo3gwLD2CtT1wEOK9FSg5qk
	 YXLptG9Eh5RmQJZiacBae2Ptj0jlHKypKoGmUoLXyHkqAci5pTFoyo3CSf5CWrrqZh77k
	 8uP9vzgqla3nInp7H9bolJ3tznIxfg16Wed3qnGyCnytvcihcs4k2Qz4J+Ako/JtHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtgiM6Qq;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47392606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 17:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47392606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YtgiM6Qq
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so1400658eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 09:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455545; x=1796060345; darn=vger.kernel.org;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6/YqHUloJtkZbpJ39+cQO94H2zNky60itqgdCHgeegQ=;
        b=YtgiM6QqXRQEENoKa1m3heyRy4YKImPfI99jFknmv1nqresZy/NsP8rOaGeOjtRnmS
         GHIEZZgZP47f7ZKTR7cyBWlBHZ5/QszI7XtUY84Y/AUPwPH7GFt8sEftfsVidIbmzdUn
         4J8tieews9I9FZS0tJ6gbD1rmCG8/QPkjd/53y3RAwFlk74TVTlyoQXUJeklVCsZGFne
         vJY8nUIOdLkYVsGeUmvlIQk7YXQroLNoBmuAs5+Vov/PaNHx/23Tf5+pGdtSO7bt4AaU
         UK2eDpc/nnKk/o+4UejxuUaaYR6VCvcA2ikybR0NRA/rlqZGfZji44A0Mn1Z1KzcWY8P
         4IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455545; x=1796060345;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/YqHUloJtkZbpJ39+cQO94H2zNky60itqgdCHgeegQ=;
        b=JTCTnISuPagcpSXzu8y+ORSOeLIqJ320n6Fso3fFb0wJf0mwhVFuv9SAnhm/2j8YLf
         FYLJk8yp0M3BrunkwzexK/hWD7wIo6aI7jELQwa9hadau3Ww6A4tgm4jJ2atNZcYBEZM
         /9lP1Flub+QH1ZeLqt0SBfhZvqwA9iVCGX91Zx0E7/RR2soIP4VGgILQwK4FRv7gyQ0N
         2HZIqDAxYO6glQ916Pmue7DgUsYDRByyycXkAwK4eAiTy0iqCUN/h2WkJGmmK7fCmwE1
         9QHSCjlEHbyUILJYKCjKfgPRpk+s1td4umta0sp8sA/cYzlGNMHA0I4X2tKy0IAAkPZd
         4yWg==
X-Forwarded-Encrypted: i=1; AL+hErE95VODwQD9I/uVP6F8qX50kXB5J/oJ6vtjzvDcboFUt3vGlDSw/cs8eVrePRTMHItkQZfzNkHpzS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ltZrIRToXp8+C5Ljy/OyDvmngj2ol8CapcxOl19UiT/rqm2c
	VEwYkGV57W04JJQcx/TxbtidzrHwI0892oxPLXeAF9Q4yOyxcETaHbGp
X-Gm-Gg: AZFdTZcYrPpDQI6agS0LHjzcVPZCFqBlREU7erY4ZWWa5fTTGmaZwt1XiwBgJ0PlmwK
	BCQkizhrUqq9qPqQZpSeB+xv3AJFntLSlu+D5dGYDwBbg9qyLwBqHT3Po4246VbV0nY+ZOpIIou
	DaXLEXAHQBrPykTRen3BGiiPTtUCvQ/rpieOs32P01xLkZ+p78GJJ4gH8zVCo7Hyv5kk3L4D8uD
	/zhfo2IkO5KSMpsjNYQEGZGQqW/Bdzx1ffpeHrIzUhJQiywp/8Z0P346W91dNvW8e+8CyIXKIVX
	OZf4QyIzxuaLWDu6evduPTJts8Bt8ooY/USG9ZCTUrNZhk3xKLJ9KFS6fxbIBxjVmm2k8iueusH
	sbwEd6969QFZd0+GMmWZyv9lE1EUxN7SDlvQ6zmI6TqLwTRhT3/h4grODWaFJzJoIpMw1jNo2n6
	rOyURmNEXoGquK+/wRterHzZYGmaCejdvx0kVGnO+FhZUn+lSsosQ7NmEX6bZ1pUGSy7vzEdkLe
	xHL3OaCB55h6VjVXe6cb4QCpmM3Licutx6Hjg3PACUPTKwrUJN/MbLKy2kaGaOv3UPj20IVRvtC
	He+KHmHd9QXDEspAChqtZKCTMKWo6YbK49/CGCTu6pUcl/zKioF5L9/Xa86A7DqHnVIphZMlPzg
	qhHajqdIs7fdmxYPP9j4clLTQUy7m8BTnA+gzpNzjBhIRDa3kWJ75F8iM9CMlVw==
X-Received: by 2002:a05:7300:1486:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-38570e24c35mr16246805eec.25.1795455545227;
        Mon, 23 Nov 2026 09:39:05 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm31532302eec.25.2026.11.23.09.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:39:04 -0800 (PST)
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
Subject: Re: [PATCH 26/27] Docs/admin-guide/mm/damon/usage: update for
 user_report report support
From: Aveline Noir <jm5905938@gmail.com>
Date: Tue, 24 Nov 2026 03:49:25 +1100
Message-Id: <179545256509.4.13115689957500135208.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, damon@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261121210013.130397-27-sj@kernel.org>
References: <20261121210013.130397-1-sj@kernel.org>
 <20261121210013.130397-27-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Sat, 21 Nov 2026 13:00:10 -0800 SJ Park wrote:

> Update DAMON usage document for the newly added user_report type data
> attribute report support.

LGTM, thanks.

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
