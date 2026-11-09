Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226444;
	b=VEV9mFkpM8uAB5Jmz4CYJqgRPFkNwB6ZeTQOuCQ6U61c6pKfmBI8HUWCCvfedNWNgs+r
	 Pqcknw0lhWSb2aBqyKL/YesAWUUsI/wSVry1HrBuMEQzaIAd0hckxsWXrrC37bqt1vm6K
	 fCerGmBUTuaJX+bdvKR8/6aw8Ll1eRBifS1o8ZXcNjZEcAzJkPiKtVY+v/d+zuGfoqiym
	 yWKl8AkHugPWMTDHwKecKMTx19N6tv7ou5jFlkplJFXkKKkLLI60fA2LUY43pahE1bH84
	 JD7zixmDMUlD4hoTSy7D769ccafrdlN5YasAEUQhwPg9zPaqeKzQ1CYK+B7+XgmxhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
	b=WUBC5nK1tUTigZ/3wVQrgnPN/0TnXFfW4X/a+Tu4qw9WC/w2g0vow95iAcwEcc8sZoNo
	 rigP9GXqhaUhQ8EO9OYBVDKYEwAHQ04RsKc/zzJykyXeX3aZRsa0S+maJt2h7bL8sqZkn
	 k19uhC0UfJL3oZbONQn1eEcGraGFOXjFLh8MtpWruWUDKTu/kxB2Liiytrk47sGzZRGAD
	 HzkWNrGX9DDvosTmgjl4Jw8VnhpUHA8U8Pi21SMHe2fuq0DrnYgBMm/U/WGce8mziWnl1
	 hmpr/xFdKKqX16ZDIR6A9qCJWrzwjG0lbbCw4I/PB1T11hsZbJgTq9bpqm2+Of69+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/OYuonF";
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91309606A337
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91309606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/OYuonF
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-8b2fa622fddso2811977b3.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794226443; x=1794831243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=V/OYuonF4VZxJX6ZKEKVsMryA7aLihm5GRqBtYap8ddfmlGYuFx9dR/yXNlA/8uprb
         SjloK+Yimo97YStkTi6dkfLaN6NZYTUoI2YaudEZE9jzyCZ52Kf+XlCQLz3i117Wc7I8
         DeZqBL/+zDQ1ouSQYREfnWR1DXKq4+EaiCBQ7eHTuf8JBrTbNCN/Qawv73iGSaOiGG9q
         0+q1QeUEFChLhmfQh4fynBRKJ+nUqynNGdqXbL+AwCHO2NtHYX3uVqtBGa/DgluT9zia
         m6TJAwKOuI0JbYYRjRpd1RUzoTDAdh5PAPhYRQxcyuzPyc02XvXHMQCxvnL300VrtpuW
         G41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226443; x=1794831243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/6rTMTiN3zjj45F6hON9XdsqIM41fhzAmDLM09T6Xo=;
        b=rVPNHrGFjItKirupeh0xt3N6lo7WDEH/FLuskEScGh+dVJDcfS40LWa65+Va2GPhhD
         0fatP55dmdCVhV2EnTOsjFmgzQWq8gstokd1e5b0LP8S8zLqxQ/xj3XLfhQx2awJLhde
         fX5Tr6RC5ejHYY1lapUyNArk72hsb7m5ee3caJfc+bdE4tAMS69DbsAoyIHipIRM8oB8
         p0nMTu4WHcCaW5fL1h9Qd7Gf9n8RJQRMJ+kZweXPzsT0+U2jtApMG7aB5Ex+Ncntvq9x
         +kcLiSp/AX6HrhmjfoX843wMXqEqbpMjJEi7Ju5nyBafa4dKYS8Vim8QefB+zKUF32WG
         G2Sg==
X-Forwarded-Encrypted: i=1; AL+hErGwsYkC76O2jORU0ce6N1XjXr7Lc8wUUN8xX9eC4ehNRhQzmVt0IMmhbwo2/twnJxlAB4zFYP4EYoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQ4t6M1aU3rvGdHY0cEezTXR+56xdaXl+55xflLUsN/3lv4hy
	La1E2eBGAM/i7lRwPRo1a6jyCZTNupdfeoY/4Nvdlazm4c7MIkH5pX8c
X-Gm-Gg: AYBFou0KVHFw5VVlFOlEexDGqdWJCQA3SsDUYprjS8SBgDNYtsz0Rg8ahzSwHaC45+i
	IjuO5iqpgo3sS3DMdCAv0tEflSPPF1Wh6XSLYQy6mZ5QgfmMqMCHdR4M/VgnjSgnzIdzBpR6In9
	G64465FV7SZhZUiMojAxyMY+lmL2EL49LsR/x4AP8Q6cN4/n6J04W3IW1dQrmYJqkd6hDlzCuhB
	cOKrO4pGUW0Xw4tVx5rnHF9BU3UdidhPEAEcurolD0TI6CRzvHOBdjUZUQZFN0PdzabBvNMUDCr
	QaRmUJjZTtehh7ewcV04rHKRqRiKnELeEzEFSlm3NHldUHJeHMkqcJGRD5xgnO0tyWVOj2sJ3z8
	J4yogNBsoFdFt9zekG+AmIbx+l4QIpPbahNBTya1rUKY4Zq6g8KdGuuPMV4bs1TlOdlEUgqqeqn
	LyGolJ4z7+afCE3/I+/6KAKYllHoijN7z4CmcKWj/gu8yhHF4CNBikhSnMGk8X3xv4QkBq3jfA2
	mvYhowKrKh3Bw9fwqNE0O9QDin1ZK2s7fOCzeWRGdLVbhU25vMMP/vNjrKC1Z6JJpFjZn9gY4E7
	Kirfk6X2WtyfuKPtfbNOxON8CePcnY2/WoQ=
X-Received: by 2002:a05:690c:e3ed:b0:8a0:76e8:c738 with SMTP id 00721157ae682-8b36c664b7dmr25866737b3.0.1794226443428;
        Mon, 09 Nov 2026 04:14:03 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b95cf4bsm3720905d50.16.2026.11.09.04.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:14:02 -0800 (PST)
Message-ID: <7f9b7ab9-9728-42be-a5c1-9e8e62c23ab9@gmail.com>
Date: Mon, 9 Nov 2026 07:14:01 -0500
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
Subject: Re: [PATCH net-next v6 0/6] tls: perform TLS 1.3 KeyUpdate in the
 kernel
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Daniel Pereira <danielmaraboo@gmail.com>
References: <20261105-keyupdate-rfc-v6-0-99b695f9eb4f@gmail.com>
 <au5JP__7P_PzwDUe@krikkit>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <au5JP__7P_PzwDUe@krikkit>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sabrina,

On 11/6/26 16:40, Sabrina Dubroca wrote:
 > I'm on a medical break so I won't be able to give this a proper review
 > for another week or two, but since it keeps landing in my inbox, I
 > want to make a comment.
[...]
 > So this is kind of a "can we slow down until we agree that we
 > really want that?"

I am sorry to hear that. I hope you feel better soon. There is no
hurry. I will not send a new version before we agree on the
direction.

 >> kTLS does not currently handle TLS 1.3 KeyUpdate. It never sends a
 >> KeyUpdate.
 >
 > Because it isn't meant to handle any part of the handshake at all,
 > just the record layer.
[...]
 > So what you're proposing is a very fundamental change to how kTLS
 > works, I'm not convinced we want to go this way.

KeyUpdate is a handshake message, but it changes only record layer
state: the traffic key and the record sequence number. The new
secret is one HKDF-Expand-Label of the current one. Nothing else from
the handshake is needed.

 > If userspace libraries don't do the right thing, we can fix the
 > libraries.

I agree. The main users of this series are kernel consumers:
NVMe/TCP (host and target) and sunrpc (client and nfsd). They have
no user-space process above the socket. tlshd does the handshake,
hands the keys to the kernel and exits.

 > And that can't be handled with the existing handshake subsystem?

Not without new problems:

- A handshake daemon cannot write the KeyUpdate record to a kernel
   socket. It has no file descriptor for it.

- NVMe/TCP sets sk_set_memalloc() on its sockets so that it can
   write out pages under memory pressure. A daemon has no such
   guarantee. With root or swap on NVMe/TCP, the daemon can wait for
   a page-in from the queue that waits for the daemon. An upcall or a
   reconnect every few minutes makes this deadlock possible every few
   minutes.

- The traffic secrets must reach the kernel in any design. If each
   consumer does the KeyUpdate itself, NVMe/TCP, nvmet-tcp, sunrpc,
   nfsd and every future kTLS consumer need the same state machine.
   In kTLS it is one implementation, which user-space applications
   can use too.

 >> the 2^24 limit can be reached in less than 10 minutes in many cases.
 >
 > My math says that's 28k records/second, it's a lot.

Storage traffic is different from HTTPS. The NVMe/TCP host sends one
TLS record per command, and a 4 KiB read is a 72-byte record. The
record count follows I/O operations, not bytes. 28k operations per
second on one queue is normal for NVMe. I measured one queue reaching
2^24 records in about 80 seconds. Connections stay up as long as the
host does, so even at 1000 records per second the limit comes after
about 4.7 hours.

Without KeyUpdate, the consumer must reconnect at the limit. For
NVMe/TCP this tears down all queues of the controller, stops the I/O
in flight and repeats every handshake. NVMe/TCP is storage for
critical systems: databases for banking and stock trading, AI
training data, and systems that hold personal data. These systems
cannot reset their storage every few minutes.

 > I'm not yet convinced this is a strong enough argument to justify
 > changing the model under which ktls operates

RFC 9846 4.7.3: after a KeyUpdate with update_requested, the receiver
MUST send its own KeyUpdate "prior to sending its next Application
Data record". If a sendmsg() or sendfile() is in progress on another
thread, nothing above kTLS can stop it before its next record. kTLS
checks before each record.

 > Why does this need to be a socket option? It feels wrong to use a
 > socket option to trigger sending data, why not hook on sendmsg()?

I agree. I will remove TLS_TX_KEY_UPDATE.

Martin
