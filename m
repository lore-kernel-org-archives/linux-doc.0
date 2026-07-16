Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2C41A565
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200954; cv=pass; b=bBtWKQFzwApeOE4+53T69oondzorY/jihbqDAFmsMsvVhcJV1APIGY/tYTtQgBf9tbNX3dDfE41Mt68LdPU1vKf+Hx7RTPDGhJ0INOS/WWJ/OiTbEHREsq6e9lTPVD+lUEDIpaQ65RmyYpmtfhc0dn0H+l99zymX1KLakY7p4CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200954; c=relaxed/simple;
	bh=HPb5WPC4lCTgEt30xhiUbaSUaPQItUNr9aD0MaQHPaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeoXulQa67uu844hnFKIBej0QddK+Zvm0pQAryyw96cOdTLuHHDh5Zp9wsISe3UID+zPgnY6r/nMQpf7CsLPY42dY9myWIRoeccO26Vy7TlxkNDVPd30JnKcDpEeMAtu4bsrRTpPqBqanIRQKUDmy3mQg0Qmra9tmTfNTyQbZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJspsvdG; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJspsvdG"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698bf7a1a2dso9374212a12.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 04:22:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784200950; cv=none;
        d=google.com; s=arc-20260327;
        b=iSEIwkCuBAKijFhjbg+K0btO1rcV+5iK0Ahh1CXG30mgxiMSwxyF1lTdJWyYGY1J4U
         TkECglSasFaAkeapdOopRGh8yoKr7V75vEme4ddzqxzJhD5R+D4NGMcZ3uwdM25yE85A
         wBCbBPO85W7hnU3YYGlB3GbVh3zuAVcJvNQ0FMPHKVMbl0xIktCwW8rPnMDgY7LzwTXF
         RW2G89EOD5eg8Xg6owUx2xd3Sgon3hCKTzvu4tnyvNKzVwpFYf/F0fVoq8nW3yDOmHaS
         aNb7pLuN55feNz+4AV3XqnkkeR1YzYWZ4CcgFGfgG6aEGqtw5FZKEtzD/VDumBnO93bG
         fHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        fh=+xE6wsvyam4ZoLB9KTYenT3gBxmJX+VvesQpPfuiNCc=;
        b=MF85ig7GdpEBDi1Lbt/3ws/vuGIq87yCBD1VAt0B/UkWv7MT+FZLcQub4OBeSn3Kiq
         HKVVGr0T9eIu0sMOacZwhf6SZYs4ZQF7PjqoTnrkWdLWNr5h1YtwZKJeUvC2rzoyC0Ai
         iW4RbtteBnZrCEPm1UCochpOgcOTkLd02UylEHSWOFjRnlWJGaqRM2hpeZfO/ZZlDu3T
         9RoUr0JlayLSH5eXCzHfYf/JerB1B4mRgCbdVuS2mCCpklEjDvFN35uEzsfO8wKywoH5
         G1M9bBjaiKaqYsAHcq62hyLf7Q2/4b6ZZnqXwK86aaI3h2ul3m6Z1LthJ2PfcL06XEXw
         OfAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784200950; x=1784805750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        b=hJspsvdGqeWz3kqfIsMzUQ1OPAddpQ7SL8CkhC2J83taRK1A3hZqmFmxZdDe7EEQqE
         ns/tfaN3gRa7IIyHbUxHBE0wYEcpuv5t0vwtzCIC5lDUkDVu0XQuDyvUhnzLrdyf3XS3
         dekcSuQuBjJSNBDja21Rrsb+hsmPvqmBxeTIv0lp8wU70g42zyW3jo2h9bYPXGc+HVnw
         cFL4gh34aEIH4rOMpN0JvHpnVilEJABcYO9JmXv2dNzAkW8O4ZNIhB5Y1Fo4GWKv6uVd
         un4H3DuYitn+vgS5W85y0atrNgaFo9pDC54YbloPTGgKgOvWu70LxEzdMMA9z+tDjbtr
         W8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784200950; x=1784805750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7PLUu8CkOddbo13f+x1689IvQHMTxkc+L3wTNv9ExY=;
        b=sSRsJLVGgh+6YXcxnhsj4K0v3zjxkvK+ZFFXxLt2vuQqAbFK9eV9f4EZ9dnmmEFKCo
         aT1AYxvWLVZOzoedzZ0GAmuAQ/WyzQwKBil4cwF59Y8+GmB9jVDKExEIIAQBUfzP3ZHH
         XUKG7tT5WSBpOa0Zf9XnAOH3Sx/HUFMV79MwboJszH34y5L8Lm2QSFWKQ/MqXfCGhcEm
         1Qqi8lu2OzDg+1nWG4JPmO1m7/1GhIa8g50pg5oDijChqxys7Z5EACiMvSxtZTheeJ3/
         SN3jTVKkQ/OsbAzCe9LUC3cK0sbfV+IdVQejk/CjL6PDu6m1XodKAkbQf7a7OYAnrQaE
         XV3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrCiA9uYG9OU1MT9QdPSpz4WKj1w4LGjGCsayMg+5+zInofLwrUAIRj+LScPBQ5eOBOm612yIosVbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzfBv1R8bKQ31wbRDoKn6HD+6DSSvniTbygBhMasQnG/DmjpsH
	arRxq5UNRNVONfCsMajaRJN2wD4felExsjZOaq7zMxj3Sn4xjH4982QCXBYYHZ4oE1QmXRARrWa
	Ans/Ti9DWlk3DX86E6T/wj778y2WGRwM=
X-Gm-Gg: AfdE7cnoX/yAhIm7ZRqyvEe3nhBfwasu4zrHO6b0PR+KsLCpjzHymHQMNeAeogNAwJL
	hjAiKRMCgPJhVfNzigbFY0ByyqQM5IHqdYT+tCxa08819eSjLwxhLd12F+JLQan3FcsKgpHeV8r
	QWwvUolZg39khOL+fC/3qzrSCXhmEubI5axJZVi98SPbusXVp6Bt4oki69POTMcZeHw0suYoQnV
	swL3WicCzrA8TaCGuMg8tbedozLs3RRCF5A/3ak3+AbxyGAqTbMOKNByRGLjUDNvtkeaf0fBLhD
	jDvYY7axDqBze9YGlZOO
X-Received: by 2002:a05:6402:42c9:b0:69a:6f1:d2e9 with SMTP id
 4fb4d7f45d1cf-69e199dfa7dmr3605844a12.30.1784200950281; Thu, 16 Jul 2026
 04:22:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-2-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-2-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 14:22:19 +0300
X-Gm-Features: AUfX_mwI45KknVT_65FZwLBjVHUIxU-71Sc82a4VjAhyLSVgrPTPeRc4elHkh1I
Message-ID: <CAHfVqdWBsBMqerM7mq3U0fMKhCSMUd3nbNFi1vgFehRivG5B0w@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 1/7] ptp: Add ioctls for PHC timestamps with
 quality attributes
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 5:06=E2=80=AFAM Arthur Kiyanovski <akiyano@amazon.c=
om> wrote:

> +       n_samples =3D data->request.num_samples;
> +       sts.clockid =3D data->request.clock_id;
> +       kfree(data);
> +       data =3D kzalloc(struct_size(data, timestamps, n_samples), GFP_KE=
RNEL);
> +       if (!data)
> +               return -ENOMEM;
any idea why you free then allocate back?

> --- a/include/linux/ptp_clock_kernel.h
> +++ b/include/linux/ptp_clock_kernel.h
> @@ -123,11 +123,34 @@ struct ptp_system_timestamp {
>   *               reading the lowest bits of the PHC timestamp and the se=
cond
>   *               reading immediately follows that.
>   *
> + * @gettimexattrs64:  Reads the current time from the hardware clock and
> + *                    optionally also the system clock with additional c=
lock
> + *                    attributes.
> + *                    parameter ts: Holds the PHC timestamp.
> + *                    parameter sts: If not NULL, it holds a pair of
> + *                    timestamps from the system clock. The first readin=
g is
> + *                    made right before reading the lowest bits of the P=
HC
> + *                    timestamp and the second reading immediately follo=
ws that.
The descriptions for ts and sts here are identical to gettimex64.
Instead of duplicating this text, could we just refer back to the
gettimex64 documentation?
