Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747915;
	b=cOVL+eG1Jvi8T9GORfSkXwGpk6irKHBk2jZ60lJFm5MD8kSt6/U7We9zv7WASUJS4bKv
	 P1CoEe6nX40vsZJt1UmNg7A2eiS4eHiFq5eMewpRv85fsaR6GC0FaNH7e9kIp6nIFIfYH
	 37J2rFny72XjvLS4nqMX/UwI8rQPthstahT9UCsjNMf3+PT+KYDAF9KbbM7OOxCEsA6dX
	 +DWGB+DfRa2RtnBI9BDRpsRi1Je0bJ4SrV9nRK0ccIZMjQWkQexQpGuA5Qn6F5XscSBQ8
	 p3lWZov/opq0cg4sBR8Z3Iu/z2r6uG8K72ufjBN34hQkx7cyVbyhtLcHwjIhS0S/iBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747915;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=U3GFXWam4TmIQpT0XlDq+Sl01DF1V8kTIQ3JQPb/fqk=;
	b=PvVCW+C9RFXkn2U6PsnwYOPF3VMMjRoV6hA7Ti8gjkX9lqoXr3iSnCKbK64RPty+8WNn
	 n0TjHa7p4RXEvTzsQPnVEOGEoz89tMwe7v5aiZNrkyphGdNqDCb8NDoc2B9BJdnRCI4Dn
	 v6NEXA7xiD4g9Z5jLjmDRzlV3x2QQL6c6yaJIDmU/x6jKH2maEcGebjLtkQ5hF+XDxAuz
	 JNuvn1hYmkmjZINmWVDO1DiXFPOFnoNySOfNRdFbzdqBGJZY0lmacTFLEv1TbSNZlj0Py
	 2zR2GdHRdGVGfxxjigyNWLPLs0fw29MD3c1gORYjXRqO3LI0CVpsitzO7L1H4rw7aRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gDlFrTOj;
	arc=none smtp.remote-ip=91.218.175.102
Received: from mta0.migadu.com (out-102.mta0.migadu.com [91.218.175.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC73B606A31E
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC73B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gDlFrTOj
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n/yaE/5u3zb3VjPb/KsOiyC4y5M5RXSQDqpebthex+s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795747911; v=1; x=1796352711;
 b=gDlFrTOjSgBaGde5t6VzQd1WSF71FYfQITuNJh80zcuQVhmY0BUa1uzonkW7yOs7jj/hoCRR
 RMvNWXHEHthv8/N30p0l8fUZ+uHBxTiMMHKXnAnMnlVuTrwYwCQlGMsyYhz1PZBl3q01daFTk/v
 Nh3kSwvGjWLc1LVwahZzUBYc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f83eb12f5863e0f1;
	Fri, 27 Nov 2026 02:51:51 +0000
X-Mizu-Trace-ID: f83eb12f5863e0f1
X-Migadu-Flow: FLOW_OUT
Message-ID: <bdb0ea5a-97f3-4a46-a541-ef01c062d6c5@linux.dev>
Date: Fri, 27 Nov 2026 10:51:48 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/27] Docs/mm/damon/design: update for report system
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Shuah Khan <skhan@linuxfoundation.org>, damon@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 Aveline Noir <jm5905938@gmail.com>, Lian Wang <lianux.mm@gmail.com>
References: <20261124153636.91854-1-sj@kernel.org>
 <20261124153636.91854-10-sj@kernel.org>
Content-Language: en-US
From: Enze Li <enze.li@linux.dev>
In-Reply-To: <20261124153636.91854-10-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 23:36, SJ Park wrote:
> Update DAMON design for the data attribute report system.
> 
> Reviewed-by: Aveline Noir <jm5905938@gmail.com>
> Reviewed-by: Lian Wang <lianux.mm@gmail.com>
> Signed-off-by: SJ Park <sj@kernel.org>

Reviewed-by: Enze Li <lienze@kylinos.cn>

Thanks,
Enze
