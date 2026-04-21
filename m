Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482C23D1718
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779109; cv=none; b=OmPryZiTmffy4/oXuxJSUWAtlNgguSc3HqUjxKOL3656ozDcHXivLtnLhnhgLUtuHWNU05cY+Xos3B6Blds+Aj75D6EzJsNak6DFS1pic9I8BT4ekbZ0qB4AHAKZdC2dW0PjAHGwBRHHJIIUQI0y7ky4eNHvJfk3yneXgcy3Q14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779109; c=relaxed/simple;
	bh=bksQ0Ol5sH++UgZ7eh1JZKghAgg2lGd7XkvUWodW28Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qZvHKDLC3SFiTYQJxDdd2RjAyLjfaoLoS6vbaL6tY24sLA3VbJiFIPkqTFieJiagF5i39Qgr9c6gX5KuskSpQ3AbiEJw0bcWD4r8RFCLTh0VS7dFJ1FT91cP+17g+IBmL5BbXG/9mEaFyIWfr4ihAnKP2uxp0Li6Y0LeQDTiaRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=cClBgcUC; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="cClBgcUC"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1279eced0b9so6118445c88.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776779106; x=1777383906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2J0baGW2c8ot7ZAwlVMoVMOKmtoMvPmfiKlkz6ZsUc=;
        b=cClBgcUC24FdpKU2JnH4Pa8ghonAWun66lvlqsMc0TS6SM3qmynBXdFhPo3KpyVpL3
         DKjBYtxguUkFOqMANugRC3jAVyxb1ZX6dIcyw6hwUjpTwr1XE7gW3u5T4G0BSoU/31g9
         voXRPi2wMK0NpJqP4ugLXin628LoKtljsRGv2qYTQYKQ6RgT80/ydejV1z85/MIC+w+h
         lnDc+oJqG4bbglJfzOb+2uxxrAF0hOKL+mnm99VJMHoiInwmUg1N6YN+idWC2RW0UxMd
         SofU7/kyVRijZ8CC5mVA4YW0PPNBSr1Z3vkxdLcRafiF67aAhqK1yY1Iz+bZuYcc2sdm
         Pmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779106; x=1777383906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C2J0baGW2c8ot7ZAwlVMoVMOKmtoMvPmfiKlkz6ZsUc=;
        b=Jsx3Wdqh63LvmulgakoabfRBGGG5QMwMz+QzbIriqeAKnXqnj6C+GIowVw5oToW8Mu
         oNp2a7FR7yPZXe0cqXlAyewPXKyVOpgE3J6SkPL6jW6whYEHWoN7bLZGfA0yUccS8XrT
         +mFqI8uAG3zLkyM8pf5gZ2GEl0AEe/ui3ps9YlOnJCvhXCyGIM8q7zEg1ZdEic+MEdRs
         EWwriSbSyRt1gur6pXq0cTqg0kWulKZH/yNRuZ0j+BvV0ncmaLI9RrKynCoRkpLRmO6N
         LE6yLDs7EwbJz7h0BFdqauqJrDwqbGNIY/bqez3NCFS9ql2X+TdBcMtOQJV2YPmE1DDB
         MBRA==
X-Forwarded-Encrypted: i=1; AFNElJ/TFz1bA4+jEIaxZHBlVMsrav/cFv/WuddDk88W215IcZUqJTphTHHFAsVdxrUmeC+izW6n1UoBNzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIoG0GiNdEW16Avz6nke4q90VyqvTBDSh8sFtlFRnKgLKTP1n2
	OmvJcNkqnF6Tcg7jLJnFq1qS8pKULeaX/bqVy5lb0uKZAMcu31F6SuKJcKTSYuXeP/M=
X-Gm-Gg: AeBDietwrXn1pKICQcanfyVTiLPjztz7/zTh+mb2aLVbAlH27imVfUDAH/bXy0z1pw7
	aTwtURmLe/IXM4CUSYHEqT/QJIlqpPMGA5jm3NMvlPHBELKHlClKlt6WUsbP3QxxaAxeLC6VONa
	mre1UIs8teMGjAFJ3Qn2LTVRVePq3jlqwvEAvpO48ON1GdGUDZIn/PNlIHw4cX9ruQtil0u7LHh
	4if5VU5+lSiU4XQ3Ytk1zbuLIu/KrOHph0MGfOqTXZ12TwWOXjNopn2MUOt/IFw+iP4I3amsZ7P
	SVEq7FP+Za/+PYkNLZuYcQp+OSqYmQKPMIQloO3bddfogo26JtfDGOek6n4yg99wHv08yBubT3w
	i2q5H+1WfqpJYY3a5QlytaB4WBDBbErgQP3EkxoptrH46HCtJ07hlV5F+GQgENLj4RCMKtWnGas
	ePxy2RXkwKn7mCt8kcjyzfR5nhYKvIaRBExruXInXu16M5Tw==
X-Received: by 2002:a05:693c:2b15:b0:2c1:3f85:747 with SMTP id 5a478bee46e88-2e47a1027d4mr10807993eec.21.1776779106079;
        Tue, 21 Apr 2026 06:45:06 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b944bsm19250116eec.28.2026.04.21.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:45:05 -0700 (PDT)
Date: Tue, 21 Apr 2026 06:45:01 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 toke@toke.dk, kees@kernel.org, crossd@gmail.com, jlayton@kernel.org,
 wangliang74@huawei.com, aha310510@gmail.com, takamitz@amazon.co.jp,
 kuniyu@google.com, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260421064501.4d71b943@phoenix.local>
In-Reply-To: <20260421021824.1293976-1-kuba@kernel.org>
References: <20260421021824.1293976-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Apr 2026 19:18:23 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> and all associated hamradio device drivers from the kernel tree.
> This set of protocols has long been a huge bug/syzbot magnet,
> and since nobody stepped up to help us deal with the influx
> of the AI-generated bug reports we need to move it out of tree
> to protect our sanity.
> 
> The code is moved to an out-of-tree repo:
> https://github.com/linux-netdev/mod-orphan
> if it's cleaned up and reworked there we can accept it back.
> 
> Minimal stub headers are kept for include/net/ax25.h (AX25_P_IP,
> AX25_ADDR_LEN, ax25_address) and include/net/rose.h (ROSE_ADDR_LEN)
> so that the conditional integration code in arp.c and tun.c continues
> to compile and work when the out-of-tree modules are loaded.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---

Acked-by: Stephen Hemminger <stephen@networkplumber.org>

PS: once this is merged will remove these protos from iproute2 as well
