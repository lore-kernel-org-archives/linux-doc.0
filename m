Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651482;
	b=IpAUwPbEvPiFC1ulQ9LAlQA4IbJG1zVY2w0cMyl0MyQu54G64x3dnPYsaRAlqizCREpj
	 89URrgkG/FH4Gd0kgPeHxBYe0KVrExTIiKfeLfoz4IrPRHckgzAbSm+mU6quAPDY5y78l
	 B7659bcV8wh/aOnXf1iUBL6MaptF3XgYUlVA3ms8LVIexZPuwWoqvSVoqZcpWd3Np01pa
	 L8ZELnzXgk4Fy7w27+JNsI22GpMqXRMeR98fRmobVrDaisYjr4J6d/iCcM4U2bvsUu6UV
	 8D+V7RgxOXJHuV/G3gbOllY6OMsT5TbTvHN2M3V7jgj1AI6PPRod7p9Ki5htEKFG0vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
	b=3OZFskibq7NzLKtUxW9fX+d7KgtbFeeH/cLwpbFGNYgg/YxO78ttmjVDKWYAfAHFjvXH
	 3ksOU1yqWdG20N1JhlMggj2PWRFEN5dQEa9vjRVg/waCg8nTwtXVhHlO2Tq2LAvt7wAO6
	 S6LXM9Pbj0zVIFcmeHeIBMm+5s+/JTlSI8Xs9YT5d8y5a5NUG2y0xke6fRCpvCMwIvo9H
	 GFwVdD6cPysBExVvwPzsuBiGyIXQxPYhrace11MscGfQpVhJehxOTg4+W/s+5qsKK+A77
	 TCjDl5dyisQTjVZtrKxC7jvixerRgGnM27B0m+z9WXi3LWDGm3Js9aNPKmSi3Tnw9uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD5606A334
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89CD5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RHJlzlK9
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2082a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651481; cv=none;
        d=google.com; s=arc-20260327;
        b=I5/RN+pZV+5L+1JYVNGvxoYfmknlZdHz8Z6Bno/tptly1kmIH0LqviOFmMJ/DARFFD
         xXMVaDIKXcd9fd8b8O27nWYqKvZoPSVSY6T5BG8NjUimlGnb5hNbcxlPTd4Zpe+nrmfc
         a6TkaL9jkOyvZSwFprJDuoTSOI9OShRrAkUKH7DEQmxXSwH8VSoS18KC6kJIM83WSHrU
         LBACgkgY97nx2VkeBZ8lZHez9joPh++iPCBannh0MidYpN/2m8dP3XI5IqNPiIWCbsn7
         ksx9vyPtvyG0ofmlXYIumLnTuXE/kR9TXmDkeE1Ba9OgdfrKKwh9bvhi+ER6+LwLKluc
         8qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        fh=znYABwuHEInHkuQJrrKMzR/T5a+SHq1uiVbZ2eC7hFc=;
        b=quVJCN8HgmH7xkGVChfmm/a7Rf/SuTOuaVmrXHCZRdbyfYgQ2dfeXTZcbxiDtBRiTf
         WXhZ2uCEtnqKnDw1haJnK+5pKprLPVomiNcHm+0xFgLWm7JigVAGnWFVNKLhgW0XE3Cl
         4dOndmevY+JIICDWXKH0JGau6Gj8WY2PYnvFTQ7gwG2vlzzKhz0PepnsKPryyVk3I+5C
         B9v0w3Qp87nLKyArQ1R3zC1r+YybO0rQrD22a3E12uP95IZafkuh5s14I0wliFV6Lh2o
         7SgflIsGFcNSFT/AT1KeiXC/OHh7oosEfcqnQGqzxn3FGAGbmdOaw6SgD6F6FBDhbiIr
         SzzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651481; x=1794256281; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=RHJlzlK97bzgvXNW3xL3lDaxN4w+2qFJE1LvMY2LQLzINz9zP/BXIKEYZFP8bTVh+A
         EuulrRQH2guD6Utn/XukATUgp1NTEYUsdzmamqkRjQqZiDi9K2SIsNujmk46Qm5y6JZf
         uIFSGrR990BOymBXHS1Tszzj4O86/1RwSR8bRNWPN2MZgA6SHuPNrcuPBptrZ5rhkepq
         lFcQtooLnqodgchqyzmjsOI+7faMvfesXvFaJ8Al5opVkj1T7uoos8Pe2du1wsPrZi1t
         w5DMRvVWUzkOF2Pn1RzYh0i2fUWXYvngpVGHQ4W8qiTOWH71A2iNPDwDZ+DiK4LqnDDM
         h3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651481; x=1794256281;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RwrqFV+JAK3ySp9u6e0Zx2PkbN0JduCY8deT2c09So=;
        b=SArlIHvr8VtelNA+wSlSFYDTvyvd3s1tqhfG5/zGb7fV4vDr9nIpt0otgJ/Mr5d1N5
         emnsFIm9OUj0bkUuEmlbLXLqPAozLr2abMPsESj1qJY4NYZgaSR0eiNMMwXGNkKYyN8d
         G61Im/vi5XnAV8szmq/I/OwULID8H0qKT/hvUaJQ67aD6AMfelBdckE/KokkJoSCwvRZ
         31lMYI3nd9m2YCdhsqIIxFQtiS0Xnsycb3lsP0tlohgmLiftODlL/L+YaaMrKOFdhqBE
         8QTXka7j4ZN8ydvfvWpzeYrfrq+zJjJkWcVgR9VQp1zqI0hN6+8HPY6oV2jo1ZRLGs+z
         kiOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxFHlCMwmazKjsn/67UTBxeIb9PgpvGYwk6GSpXcfSzkaRnEVvqT6PCHE9aqoDr/woncMC9AKkyuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zBoSpQ+1nUFiUFheGaYf0Gx7KOQ2SAFYQuYj7fVIQKHgtoyk3
	ahNNriFA5UvV1edjb375pTl672jnreiGG4B/Hd8pPL7GpQBdgQH1owMeoLdrkhLx/HdeJITg1Lx
	mkg62Rcyt/LhQJ4ZTs8uS8DoUL8z+MPv5c0GJGzd0
X-Gm-Gg: AYBFou3bJ9gbwUQ9eWIcJo//ezLXvFYYqrIL57pqD7QUvsvyvHXRwuZtnsy2HQEv1Xe
	psG752Imr1IVeAAtLjpxwsnpdMqhr51Ynzo3TmFbc2aoiUdTF+KPtVzuD9Nl1AkTlwzWNn3K7Lw
	SGyVH6kLgEiF7s0LmlD3mdjfyByafFopk78mT2+jSlomzYoyw+1nEVqabEaYT5++tvhafgl4/Wu
	3QR2igpGqzxwhjeMftWiUdIbLtdKZkifLG4ODGbBYYTn3HhcgbfDqFolw3+leE0OISSFvC4yioM
	T6qCZ8SRL4RclD3ND+J1JZKXPh67IUhlY4Xy0h6wPGAOJiu2HOfCSEV0+l4GRc3wkrFvVsti+7C
	GK2nSXA7Zuv4vufJ0wbTpE3UDvF/tQCCBA+lWw0joRi8ChCI+yBk64iwyM16u6RYYKC4=
X-Received: by 2002:a05:6402:20cc:10b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b4b42b3ef0mr308863a12.15.1793651480477; Mon, 02 Nov 2026
 12:31:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-5-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-5-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:08 -0800
X-Gm-Features: AclHuK9XRqRq9bYvRVLxJXUkdgt5z_NPqmaDip-9Zrh7UQsi494jQFBIdl60e9Q
Message-ID: <CAHS8izP6BmNJLUdKR0DpqieOVXreR7ycKWmVbtbBtP-kHy7HOg@mail.gmail.com>
Subject: Re: [PATCH net-next 4/7] net: devmem: add a per-device netmem TX frag
 size limit
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> Devmem TX frags are bounded only by the net_iov size, which is about
> to grow up to 2MB, more than some devices can describe in a single TX
> descriptor.
>
> Add netmem_tx_max_frag_size, U32_MAX by default, and cap devmem TX
> frags to the limit of the device the binding is attached to.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Abstractly LGTM but I'm not sure why this is TX-specific. Didn't we
add non-PAGE_SIZE rx net-iovs? This should have been a problem then.
Either you know what you're doing (maybe document in the commit
message) or we need some more alignment on RX and TX.

TBH I was dissapointed when LLMs started reporting that
binding->vdev/dev are treated very differently for RX and TX and I
have to write a cleanup that consolidates this:

https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bin=
d-map-dev

I think maybe my reviews and yours maybe should be more mindful about
keeping these memory things consolidated and as much as possible not
RX/TX specific.

--=20
Thanks,
Mina
