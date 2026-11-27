Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790138;
	b=Kv3EypWQY1x1hC+hnTmhOeAYBoJkpP+dQVCUS20eKinzbJhBKwxuCPUN3AOcG9tsPPoa
	 6kgvqSc+UXmJrbz84ETpirt1pllEcmXSINDQB2ATcHMR0YJ/Ug7jP1X8SkmOvpIFGcqEC
	 Nbi9zA2Yl6tThSwATwbF4s5GT/Mm9bMEA6MhAS/TwqEpltB9LBKloJhW9C5xo8yB8MFQ8
	 k3QSnxquuSfGPpEd8vU792b8ygX0bqjJT6cR/Ps75uZDb9NS71aHRBx2lv3YQGXWUpUvF
	 xkpIA6uavipxgEwvKdlB8V4UNMCwk7oDRZmlFuyULDgiDahRqLJFCXEyzY3U1ibL6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
	b=KhZI1v8Plpt6MLrNJ3JwZAwr36XepBGaSKeyhWpDxus3eJIeKBcnxmbTwgzYMdUZgkbn
	 X+kimcJJ04c8Qhoo5538L/an6gVempvfCdU6pEANtiLVNgBhXggeQy+J9sNLrHpaQB1uW
	 88cKqUQJpND5Bbsrvzsh5245yYgrFjbJs7aYLbCOcHUURFDtOk/fV+bM9cNXm5S+CTwOP
	 FL++a9UaUOr3A67Ec3MRttjZF/rKyhFNREzIGNOOHpGyxT+uh/11hlyuT1pLEWnmhVJD3
	 Y23FsW+LnuMHCysBy+Uol3kbVTeQLMXK2+tz1YM6zB3RRkvxyR+Cx8sSZfG8iRlPBtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxYQVVVm;
	arc=none smtp.remote-ip=74.125.224.137
Received: from mail-yx2-f9.google.com (mail-yx2-f9.google.com [74.125.224.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A7606A31F
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 14:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C93A7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PxYQVVVm
Received: by mail-yx2-f9.google.com with SMTP id 00721157ae682-8b343763c6eso9019137b3.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 06:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795790137; x=1796394937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
        b=PxYQVVVmOW3QTmnUGPn/8uXuLs5v4r8yVSS3T/M3GF2IsTX5jt4Nbh8H7ACddJ2jt2
         sYlu+5hx2ke6hDAaS5ELDKTx9oDWWXKf0Xx7w1AEpSzL9qY3UcL8IukZL1Lpvpg6jprA
         0nXF2LeidTFzmh2+cLVnwlFdTMS5jXC22NVlvhUL9BLe+wvmOFiA/0VehHoBpUnKrRMo
         FsI86FZf6QaVF9RfOqx+DHHPrSXJqATdlsFkcU4iPiSTu+e4wcQXRNPJnMk3IdRkKF8T
         ay2mGRYiqrJUCXFlzNHU1ozd/s7msf5nn1yAirhd7IxMikw63n2fNrWGC11qVGHImfdK
         iVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790137; x=1796394937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7628Lpv1Ui4aF9FZsnI4m4y1Sp7QMbMmxqeVrU981Ws=;
        b=XsDY9RABwbsaUMgS3/4nixDpH0zeJwiyA90cgeVhhUjezJxnhrAZZHsoWgDjvnlIFd
         bpsJS0vYS6J2epMzsKgYLR9/twp1J9FIhs+HxsZZTdIYIICdpQZQZ8IbX/Ywnz0j+eu3
         JIqn5+WhA6o8dcZS2CJhJbywJ+jCNt8v0ZvG3CToY/i5kXInVGq56670mNKpXlg+aSg4
         rSt4YnpItedLwjRsJKu82ljIrzbOgu1nnRxNpcsuxZyRGpJ/ucnIe6IF3Wzmo3QswTSp
         ADYiQ8FGZJI02RxTeEKLHnXlPyKb5/CKUUJF0k7urwjSDJdPZof4vnTJ/56t6ZtKY0c/
         mczg==
X-Forwarded-Encrypted: i=1; AL+hErGsHdKvfd+d2sjLikDW2BH6B6Lzrb8nBRcT/lLWLcDGIKXNJZsutpWq9kh/ZlcZwxOdgaDIcOnr+Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hj6NZMcSb6FmQa4vAHzV8mOYzskjjdNC2IiPxNj95TSJSrTPp
	g4RZGUJ2oOZJ87qcopmLtkyHfXhomrLzWe8xfpXWs6LduFYChGrw4XLU
X-Gm-Gg: AZFdTZdBNX9wZkRJ/Ni8vrEF3cHLShMO7Qb3J7K6W4dlz+cK20Vl2mSiasfv4eI3TQ5
	bv6fOe3ZSB/TW64veMUqP/kvGmRDwenhVk+o1BtoUOIoWmEhP5NxyCCiyRdqwsYs6sCyXqgWigT
	M3PZe8bLDWq5kXJi/iw661H7CXqv8C5vcfcSPozOgIlQEL7etidBPYQcAkEjQAtKt4I9463LKFz
	jwGx+yYYPYLAWVKuwm9oI5J1SGCD2jJItC1Y6np12vBUQXtNvInrEEeVU1v4UAJLVCjlg4uWTbx
	+K0LKGIAYH2wocQSQlcHFOD2U3xzGn/Sswr116Ei3IYTIDGIHpMoqYSUfns7LbPuzFJruSpkQQQ
	IArdevdzcE1UfIuVuppJjcboxw+5Z3QHSdSll6KsLIs5/9RovzGLjNPRHErRVua1QlvI7v9bU7E
	GEbeBb8IbeWZhYU7gQC8Rnc1ymkuYCKBhQ5raBQ+6s87NqsvRagLya9GJwCBBDPtlB++Qh7eusR
	EjdMbzJPft+0FLABplNjKX8Akv+TJasTd87qT7oWXJUq6xXN2F3fyH1STgwPpykc1UCCSYOQzIG
	B8dYphxqTQWeINQ5S0ZsHS3JJZ/s5zUuPOBoidCN9l67ZmV1N3ifAz2rJg==
X-Received: by 2002:a05:690c:c04:b0:8b4:c8c5:6b11 with SMTP id 00721157ae682-8b5204f087fmr129405847b3.36.1795790136722;
        Fri, 27 Nov 2026 06:35:36 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b59a06f3e9sm1537207b3.25.2026.11.27.06.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:35:36 -0800 (PST)
Message-ID: <17a445a0-16ef-452e-a174-5bb09940d3fc@gmail.com>
Date: Fri, 27 Nov 2026 09:35:35 -0500
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
Subject: Re: [PATCH v7 09/14] nvme: allow to pass in key description as dhchap
 secret
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
 Chaitanya Kulkarni <kch@nvidia.com>, Eric Biggers <ebiggers@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20261126-dhchap-keyring-v4-v7-0-ee438ffea527@kernel.org>
 <20261126-dhchap-keyring-v4-v7-9-ee438ffea527@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <20261126-dhchap-keyring-v4-v7-9-ee438ffea527@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 09:12, Hannes Reinecke wrote:
> diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
[ ... ]
> -     }
> +     } else
> +             count = sysfs_emit(buf, "%s\n", key->description);
>       up_read(&key->sem);

In my reply to the v6 cover letter (Nov 25), I asked that a read of
dhchap_secret returns the key serial. I would like to change that
request.

libnvme reads dhchap_secret and passes the value back on the next
connect. A serial in dhchap_secret would change what existing user
space gets from this attribute. Showing the description, as v7 does,
is fine there: the kernel accepts it on connect.

Could v8 add the serial as separate, read-only attributes instead,
kxchap_key_serial and kxchap_ctrl_key_serial ("%08x", like tls_key)?
NVMe Base 2.4 renamed DH-HMAC-CHAP to KX-HMAC-CHAP, so new attributes
could use the new name. libnvme can then use the serial, and it can
tell from the presence of the attribute whether the kernel supports
keyring keys. Today it cannot, because dhchap_secret= takes all forms.

[ ... ]
> diff --git a/drivers/nvme/target/configfs.c
b/drivers/nvme/target/configfs.c
[ ... ]
> +             } else
> +                     ret = scnprintf(page, PAGE_SIZE,
> +                                     "%s\n", key->description);
>               up_read(&key->sem);

The same for the nvmet configfs attributes dhchap_key and
dhchap_ctrl_key: keep them as they are, and add read-only
kxchap_key_serial and kxchap_ctrl_key_serial next to them.

Martin
