Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329380;
	b=SbWi1WbPhu79vSAi6NjJma9aGFC8yELmQBVhjRq6GEDEONzkayABfKm7orH+pcinYily
	 fMqZPsxRApk1g0d1wn8Od0xEOn8noyle6VZjOXbsH+3TlRXYZWkLubqOF/FgEDi5ejck8
	 IXK1ESygWLlZ1iK3aQOQa0qlseoJCEcyvoLsHr0v2WwZV5dJYSe+ySxamnDusbTrivvoS
	 1ZNyeuG/fcI3Qiad68KyPLAHNJVgaGwoxMBUwEvUrVDsmWWvc1amy7uRw9l96n/0he00L
	 ADTSc6Tf4AaCjDcx+3tAEEVjuBoXwrZAZG4QspNbJzqKQmfgwvyeiphpeAEAbFf8XrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
	b=Gik4NitSa8JyiIHsEHyC/dw6Xqc0YQsqKjdbdNHj7zgE7VnTK8l7TEZYtAN82h2zOfGc
	 namV+3PJuuCy2HFmssaS8n/SFzvXngIRQu5QYcIVqAadPzwwMEUqnBtR0CZ1EfFYcyuop
	 iluX09A1lYqgjjr6Yo8IKYtyO5lTN/8/cR1e9gWENxAJuRB2Bh/zHmaCK9eTJjc/PYbVI
	 LWiDyflsxDM1Gm8HvZo7C1as8rEnhcs7k5c2HXtQfscYQVV+u7e4OcFylqqiSjPr32Ek2
	 VvSEeKzWHnWwLZlKvsEUoH2zRD71cS5ryAfeQrWh2miDLfk6/CLdL6DOpR6dKurpy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC;
	arc=none smtp.remote-ip=74.125.224.129
Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ACC606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ACC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd9gmcUC
Received: by mail-yx2-f1.google.com with SMTP id 956f58d0204a3-67be911a2a5so1164208d50.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 08:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329379; x=1794934179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=sd9gmcUC5EjvUfKx68rTBxuM9bdbaznz/tEwxEWenOWnU4qLBJS8XdmeO9Tqxwj+lw
         oW3msGNKD6Cc/5Hqirx1MWT8/n2v8Qjm9PUcuicql2WYq+rF8q44tafK9hFR2FUQ9pYp
         OvMf+F5cXA6oZ3QGRiy68Xwm+LHm3/qhIh+r4ya2txJhybsQZsYqO293qHl5BNjQg7xu
         kRJyWMJJrSkEmzH+uxkug5xGmR3DD1NLa4QS4lTBW9dhmtICsLwf/0BnRL47ootGLSEC
         AF1ORHoqamMIBedGpXGvtYQ5Rp3f+VaA19VjR2KGUb+z3qUm3l7PYU9mWCi/qlXOPrJL
         wMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329379; x=1794934179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tP18IBGb4RAX2VQoul/BsJwOYmY36Sb1G+z0aM3/z1I=;
        b=edDUy6ZqssrMOvulzuxI44fGaPUVs7GYubu//TUxJ05oEz16alHyTq3oe0bYN77pNB
         uvJoDCkODaZ3GIq8CidsEwG736AJFXLoqm4hC8stYQxlxGLWwXcgdAteGIju5fz0p0wx
         dO0WH/ZSL1AUrtoK/hMZps9IFDKNWj3927gYW9RlJr3kJ8OWS3cV4q+iGov3o3NoSrr8
         nD82SQKy+YYdBHTPR/2SLXpU8NonbLk7/+p0ISDGbQQqNbLaePKxvqSVe0legpZJ1c+3
         /iOxNsXwuglnG7dBVEWtdU9P60LwcEqLCJwSP/nKLNnj9Xhrho0gm4dftj1ofRiPKKh4
         S5Uw==
X-Forwarded-Encrypted: i=1; AL+hErErB11ItxBQFV2qDJGDehcoQ94RXAHiSYmNloY8ZplD6NQqZjjbRqJ3/PEhqhD+WB150ep7hoVVm+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P3GiAWLiOlBjAMV0hJueq/aX6vC7yIm5aE16iwDoDE5VBhlp5
	ma/V6Jm/BxxJvku/o0zdiM+/ewYh27R2+hu5XoVtsZZDgEHhXUAFZsAy
X-Gm-Gg: AYBFou2A6yoGrzHWMfDJN3cPlojNYiRWF+vvcRjOWnSEsxxKdvCvm0aghMrHzZ2KUF6
	o3EE/urbANy1CYzwYMHXadWYwce9JL4P4dK/CORgL97/ta+UGuvyIiUYkmzBtUHiOZGfdM0od0+
	Yo/Lod1Lo/+0TUrW0fdPmdz/xBjfEaS4Thpo8Jw1+Kx4z22MA6bHczCQwMPGnYsxip7RNobBt2l
	G7rL1N9r3SBZZ6FkqYtH4c+zYkyoLPEYWJp9adarm+2z2j+ucKyxk54l5u26FWmeAfmS5ML7acr
	+rtXWdoiwj2WefJ15kq9+vE2AG9aAv5tE30/A9JvM7EkxPzbpHR2K9tVims7099rbDEfxwfl2Gz
	6AhAJNn0O1dxLD5UhzjiKZO1t5YiuaysHz7mbZkens8LQiW53qy3gWXpZXX6kfk263w0QSQcuYX
	AvT1ZAuQz/8Nn8mdL4Rf8vM8nvN2lgCCMYFkWpx3C2l8vIg3xImCotofaSxkDrl3OND3u/SqXYf
	1+AKcrxj2mibvZdgtooV8wlYIe051QOLD1VnH2LyE0sGIwhMBKAx1qaxQgh8lL1taRtjG86zYHw
	Y1edjtl/fSmuZXKtRymjN/8YQ93ZU3H62+gyXDTBErzBNGC/JZmbYXjBnQ==
X-Received: by 2002:a05:690e:12c3:b0:67c:fa4:2b9f with SMTP id 956f58d0204a3-67c566077bbmr2140240d50.15.1794329379380;
        Tue, 10 Nov 2026 08:49:39 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm2244105d50.6.2026.11.10.08.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:49:38 -0800 (PST)
Message-ID: <83246c2b-6663-4c52-95f0-50dac116570b@gmail.com>
Date: Tue, 10 Nov 2026 11:49:33 -0500
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
Subject: Re: [PATCH net-next v6 4/6] tls: update the RX key when a KeyUpdate
 is received
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, hare@kernel.org, cel@kernel.org,
 kernel-tls-handshake@lists.linux.dev, alistair.francis@wdc.com,
 martin.belanger@dell.com
References: <20261105-keyupdate-rfc-v6-4-99b695f9eb4f@gmail.com>
 <179424471155.994134.17986033334400694237@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <179424471155.994134.17986033334400694237@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/26 12:18, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> What happens when the KeyUpdate is not the first handshake message in the
> record?

Valid. A record with [NewSessionTicket][KeyUpdate] is legal (RFC 9846
section 5.1), and the check reads only the type of the first message.
Mainline has the same gap: tls_check_pending_rekey() does not set
key_update_pending for such a record either. With a registered RX
secret the result is worse, because the kernel owns the rekey and the
connection ends on the next record.

v7 will check every handshake message in the record. A KeyUpdate that
is the last message will be handled. A KeyUpdate followed by another
message will end the connection.

> The RFC does not forbid a KeyUpdate that ends a record with several
> messages, and the rule the code enforces is in section 5.1, not 4.7.3.

Agreed. The commit message in v7 will cite section 5.1 and describe
what the code does.

> Could the comment be reworded so that a future caller doesn't assume the
> old key still works after a failed rekey?

Yes. In v7, the kernel-doc will say that the key may be unusable after
an error, and that the caller must end the connection.

> Should Documentation/networking/tls.rst be updated to match this
> behaviour?

Yes. v7 will update the "TLS 1.3 Key Updates" section and the
statistics. TlsRxRekeyError will count every received KeyUpdate that
ends the connection, not only the rate limit.

pw-bot: cr
