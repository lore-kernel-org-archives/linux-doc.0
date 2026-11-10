Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329998;
	b=OYa9FQkNlI4loLBN+Myp+7gpeLYoII1ELqSJM3S+x5Rwe0MS7Kn6554/HHcLOzfIRdkm
	 AVo1ErWzXD6p39PppCqnAnnGTeJEsiQn7l5nipKpb+43ojWQ3E8L3nEAtzG70EVMplMEo
	 KmBrOX9QgJHpeLIRoegb5EjqC2m3Ng79+FIGdJ2IHsL7SBfPy9fuL8DLVuK8C6ASOE6lE
	 +x4znLtpb5al7fiCXntVItNG2dUjKqURfCOKPVKgfqbRLV8OjYM2NmeCpYoFAbHnit1fI
	 t8q3XaW60oxKDIGGhwVQSEI0t5H8Mm3ClJUeooy6/38aDCStYI6tiBo4Zg9Po6T5GIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
	b=hTgD4ejz8b//FxdUIJ8WlwZGc9AZfST/CbfS+1uRR7k150bfq/BNPo7r4CfeBJMTYeA8
	 Y7pyc5/TgcYDpDAkiQGsEK6Y1qHr5vqsnW4+tcnlwZTP17bB14Wy91WLFHm0qYYm1WlQ9
	 QxMbaL3QDx6wCAR93Iv8QPkEfswduaRLYyY8KpnbXvADgPxk8FYwWAAC3zNUY9KJwyB+/
	 B0g4Nhffx2x8fAjwTQVo55HGvGsta/9AfnNxmHiBfYkijfiwrooNCbmYmfPr79jhPB7zC
	 DELuEvcSLfCUBZKUkthTrH7jtE6EtQdn/nHJA126r39fqE188e4A/ep5MPIeHddDwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VMlRc/dY";
	arc=none smtp.remote-ip=74.125.224.138
Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16D606A33C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E16D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VMlRc/dY
Received: by mail-yx2-f10.google.com with SMTP id 956f58d0204a3-67bf5e70218so484538d50.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 08:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329997; x=1794934797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=VMlRc/dYo0gG+xfLo/0j8ixz2semg2ZuvI3E8PQY+x4HxTGob782iCF9vJDNiutK3/
         cybGhnZmlzPzZ3o9Dx2IZMw06MVNhJS26tA826PS2yNQiQc+i1Xz+laPs3C5xf6uTRfx
         E9iARkRgmd7apWFoaDw0aSKRaohSqG3oHo+EyOSf8CFEM31Sk5iAhgjyY3NU6lwlT2DG
         2CsbJr/caRHdjZi+TYdtEY8r6vjtFqO+XkM8si4qQDTYLLTw8LYznx6kmOMxt1YLo7qK
         X9YaQ7p/whE9IuG6a5jrkTuqcLQgiKCiq7OqnQm3H+oqDVLLodeSQ5PWXxVYZPKmSiAg
         oQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329997; x=1794934797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kf7w354TnqYFz6mNyIxqofoq3s7JBFyBYZ6UqKXQCes=;
        b=LnudmOcF3cpfAj/pohwJUdAE4nlo9cNmxvv/h3i1Se+D9hQQyFODZ7xNGU53mNceXF
         bd9UCA6Vbc+2NyGPqArDUNtPJIXlV1s5t7udecG3MsmeSH+gj9ZwuVUgewkPPNbmhgo9
         CR1yawTdh7d3S+2jUa0pNvvhDwddkd6v4LJv7Q170kUlU/Da6raFmU/rRTO8zuwdH/wy
         U9e+4r5x6xh+K1HuXDG1YTPglyVDvcUODeaJ99TPh5JUTBimzQe2yMkUIYLbUyepfK3g
         RAGGJFZU3LGTfzDtfQ+gOkjfvBJMStBM8e1XTjO4VeG17z4ttMCqxznd0pI9/Wdg1dmh
         ZN/w==
X-Forwarded-Encrypted: i=1; AL+hErGnNs5doTnJe5xqTPX8utpq3OHfcL0EEe1v5+xBXlQ8CMAK6MgX/N1rMNdPeruk+wlTe75MpGPCll8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fdG5ZWrG2DBGvQ8oLObQNp8l83sJ6NvkkcB6qitMsd6MuiCFC
	JidwJxs51CsRnhnhMQJqEQe/AspKYhE6EPBXVytyfMs9v6BrJb9acV1x
X-Gm-Gg: AYBFou1ZNS1iSSg+RrRRdfvnK/mSiw5UL2lbjrrcIeo5CjxlomUlsYKKRczx3t4fAUw
	xAkkDVpgX/hTQMgwFFym+WHDfCnXnIe2Yas4jet46w3KrTl6EEePL9sYqhCb7sY3V1Fq+WoQ5uh
	0WgveSgrKus/JhlUqK9UYMmXpP16mwR3Thfzrl3j+lnKc+iWGFX1qQyAii76dQtVDJViA84Kgq9
	ptiRbSvKC5DNUhxo8sX9PBGHY7POafUhJcBnrk8vMycMAbUzmsv2JcDbdqxM3YYY3jeag50SzBc
	qrrCEn2EvhUVyh0tNgsOD7HWjp04+pM9gD9YsQKJW1iV/dK3L9pUrpnRa/Tm42pa2GsRTVeXZ+B
	0YPMowa9wDHNgFJG431d2VcfHv0Q2eJvWjkRcy/a/c08/BtrN4Kviooge1YDtvOL2u7Ow22BBt4
	AKm7vdw2J7bo3TA9yBO2PHTKah9xK2K5/REwXoEJs9lv5HVAmSXKiKo+usdxvahV4Wk6tO5559r
	rFMOjQg91LCCdPDV5Kdq4c9dmCKzh6BvlSA270hXKX1M2MH6525m1Vv3y8ckHqnrxVWSXKWYDCq
	OYutApAkNzNidcuiDGi31uclT36yDOmb19Y=
X-Received: by 2002:a05:690c:e211:20b0:8b0:6d2c:1895 with SMTP id 00721157ae682-8b392b410d1mr14729287b3.32.1794329997081;
        Tue, 10 Nov 2026 08:59:57 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393b2e455sm22746087b3.41.2026.11.10.08.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:59:56 -0800 (PST)
Message-ID: <85e09745-7bab-43b9-9982-4428f5b61750@gmail.com>
Date: Tue, 10 Nov 2026 11:59:55 -0500
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
Subject: Re: [PATCH net-next v6 6/6] selftests/tls: add KeyUpdate tests
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-6-99b695f9eb4f@gmail.com>
 <179424471492.994134.1896421329544039632@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471492.994134.1896421329544039632@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> If the AF_ALG hash interface is missing, should these tests skip rather
> than fail?

Yes. v7 will skip these tests when AF_ALG HMAC is not available.

> This isn't a bug, but does any test check the next-generation secret,
> key and IV against an independent calculation?

No. v7 will derive the next key in user space and compare it with
getsockopt(TLS_TX) after a KeyUpdate.

> Could the test also check that a KeyUpdate sent from cfd now reaches
> user space on fd?

Yes. v7 will add that check.
