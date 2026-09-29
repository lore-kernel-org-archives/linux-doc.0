Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CE2C08BB
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 01:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790643807; cv=none; b=j191Y2Z4KK8ag2tPOjTYiZiwCSrN78BR9fQXKtW0XIhx4BYdYUPsuyO9AooGtP7+CMseOg32HwkzeMEzeIf4qrHQHhNNoX/TBqYu6U5WIgNxggKTirtmDQ/TvPRxHxVi+vGHJ5k+N/gHGtcqBQM7Gvr5xT1prIk5yyeRGfykQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790643807; c=relaxed/simple;
	bh=Cc73sYFLSIMttxwMcehpMruet7yFfO89T/HvvTOvmWc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4GAz0ZFlLec10/oB97UwzXQgjrJ0RiMCkIhJm/fNB36gKkSkIjl+pwfWTexZaNPYrO3XOpV5RlWJQqS/pvll5n8k/zk8pEe9f7/p+O7TKQUMxhOmPqdl09UkEdRz/lw5lvqoQdlODD2ZsKUzQJtlfCnx7/2bGc9qjeJcMFVUBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1HrHuQq; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1HrHuQq"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso1658086a12.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 18:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790643805; x=1791248605; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tC2G8MEi+Qgc6YtX4GqkDnJqijVswtbQdET6mIsE3zQ=;
        b=Z1HrHuQqBOtIVGxBQea6SFhGNWbRnpfu/VzycW2tWnkfZ7KHfs2HuGJ+592YAXCmcc
         6UpaRywH/16sFyIr4RnDPsN861G8DOVxtCd3JfrKJB0nsTlJ3pEbfTN3W9a55pdmJG8Q
         jCfr0zpvPHmmBTNTiyVD5bBNFtkz93OqZz8SkQwJhDQrubNYmNcL8bAzW8CD2rZGpnFn
         atdyNeqN/NWMPeEOC8Ze4Ky8yGx1/Q/BDR+oDAzkzLClkJTTeyBw4gYetz898xCFLsM+
         E/oTNzsM4u0iihfWctxCYvyzQVQDudq200ZLEvaNSkKBrFG7jJ0NPD10cObg4z4LAkSO
         0qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790643805; x=1791248605;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tC2G8MEi+Qgc6YtX4GqkDnJqijVswtbQdET6mIsE3zQ=;
        b=zr3XNgZY+3oCByohUoRNxPYF5qX9dshDeAvfNSzmoit7zUyKWEX7H27FQVtVWQan9p
         IXPw0gNlbePM+MUzxTV+/RwqZNl32tikdCDpxFAvgLDSdjOr15/RY+Q94o4omEfIL0Hs
         ZajSiak1hZvQVllavOxo0htVkXq2YZCrQtCBrGxOwPZTxJn/jGZcu099P38Ksu51qJmi
         ewvDJaRemngBYd7bpxLsV4o7IGw0WLbhndsghpdqcCjHMBPfsPEo/YpWFemTpzqPHl3N
         OacSLVRz/i+uQSMfBbwVUU0tNbqdTBfHz62eNLPmTtEhR448h3qIrSX/LZ6e6GGe6idb
         vZyw==
X-Forwarded-Encrypted: i=1; AKwUvBztCBGuRLlVOnT3YV2xvrmpLul0tdymlkdoCtboUdFZdc7zMAQCU5drwavjdMA203cxJpr99l6N17I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAx0dQhD1fTxHOlwtxsWp3gR0v+CHJRiwqP7irEsd9IHOw20f+
	DRCvt41NsVv4v4ZxVMD5rGCcBBHvCYaPzaJfahh8/tNfpfrAGH0ssqx0
X-Gm-Gg: AYBFou1OjrJeuveqKC/zNVuJp05+PvmJYxh4QI0jesPzrsu7x4eKPEA+/ORL84Z6fQ4
	mE5qrfn071QrSXuocwtEtVAXFQ4uJErE/w7BNtQGM1AbNJRSV/jtlIW5RVriMACDM3LY7qPJKro
	ESIxypTHc/qp7NFzmmMVkUtxNiFJOLWyqHHu8r1mhQK98UkE40+6FQCRYfQgsOczrrLNTjEETZp
	UXh6SiJSVk9Qr+RKE8RWxNNRf/PFlXuJO05LRD7/CJzdOQFldktRCD8rwYxIoysruKyiQbhS2yu
	XJwCYswfszulDdmahbHUMjXykGnH9GcJ5GoGVH6FRGqB+MHrNjf6grYHBGhmUD8e9uzmivv3AQM
	MzODYjuOfTx0S/HnzJ165+dB/lXzA8FNyM3M3GzejCAFal8lUSatzfoumJcusOAEc/iFeCUNiAJ
	w8PofxLWKYSSihuW1ui2xEochMfkpX4OSwLnfCUozD01Zgo1rzs12IaNkjGTc/nqX9H+jVRxUTA
	ddwNlaRwBeY3QV9vKtgueuIj5TOeAoRfT4TcshoqsE4EuChulEWa7YPjxqSUg1ZdWztdJkIIHQz
	4/6Vvbe2eNpwEOdGCxEY3WT0o1+CLL0xrFnqZFhFwZm7m3PjqcF/U5KqOeDj/gle2g9pDhx+1Ld
	X
X-Received: by 2002:a17:90b:4acf:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a0f2c89d98mr6052076a91.64.1790643805183;
        Mon, 28 Sep 2026 18:03:25 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4985ff0f2sm2052278a91.8.2026.09.28.18.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:03:24 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:03:18 +0900
Message-ID: <m2zex03m3t.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	ljs@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v3 2/3] selftests: run tests on nommu architecture
In-Reply-To: <04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
References: <20260926010819.604346-1-thehajime@gmail.com>
	<20260926010819.604346-3-thehajime@gmail.com>
	<04259a99ed91f8a527b255951a6f626310728170.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


On Mon, 28 Sep 2026 16:44:49 +0900,
Johannes Berg wrote:
> 
> On Sat, 2026-09-26 at 10:08 +0900, Hajime Tazaki wrote:
> > Architectures lacks MMU doesn't support fork(2) syscall and only
> 
> nit: Architectures lacking MMU don't support the fork(2) syscall ...

ah, thanks.  will fix this line.

> Not sure where this should be merged? I guess selftests would make most
> sense, but you can't actually test it out before the UML nommu changes,
> so that doesn't work too well right now?

I think this can be used for other NOMMU architecture (riscv, arm,
m68k) if those are properly build so, it isn't intended for UML only
tests.


-- Hajime

